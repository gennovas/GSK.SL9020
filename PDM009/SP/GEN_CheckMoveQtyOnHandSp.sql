 

CREATE PROCEDURE [dbo].[GEN_CheckMoveQtyOnHandSp] (
   @MoveNum			DocumentNumType
  ,@QtyError		Int Output
)
AS
BEGIN

DECLARE @Severity	INT
DECLARE
 @Infobar	InfobarType

--DECLARE @Site SiteType
--SELECT @Site = site FROM site
--EXEC dbo.SetSiteSp 
--  @Site = @Site
--, @Infobar = @Infobar OUTPUT

IF OBJECT_ID('tempdb..#TMP_CheckQtyOnHand', 'U') IS NOT NULL DROP TABLE #TMP_CheckQtyOnHand
IF OBJECT_ID('tempdb..#TMP_CheckQtyOnHand_il', 'U') IS NOT NULL DROP TABLE #TMP_CheckQtyOnHand_il
IF OBJECT_ID('tempdb..#TMP_CheckQtyOnHand_ll', 'U') IS NOT NULL DROP TABLE #TMP_CheckQtyOnHand_ll
	
--Declare @MoveNum Nvarchar(15)
--,@Move_Line Int

--SET @MoveNum = 'MOV-20000004'
--SET @Move_Line = 1

Update GEN_QtyMv_Dtl set State = null, message = null
from GEN_QtyMv_Dtl
where Move_num = @MoveNum

--select*from GEN_QtyMv_Dtl
--where Move_num = @MoveNum

select MVD.Move_num
,MVD.Item
,mvd.location_from loc
,SUM(ISNULL(MVD.qty,0)) Qty_Require
,SUM(ISNULL(MVD.qty_issuse,0)) Qty_Issue
,cast( 0 as numeric(18,8)) Qty_OnHand
,cast( 0 as numeric(18,8)) Qty_Select
Into #TMP_CheckQtyOnHand
from GEN_QtyMv_Dtl MVD
left join itemloc_mst itemloc on itemloc.item = MVD.item 
and itemloc.loc = MVD.location_from 
where mvd.move_num = @MoveNum
group by MVD.move_num
,MVD.item
,MVD.location_from

--select*from #TMP_CheckQtyOnHand

select dt.move_num
,dt.item
,il.loc
,sum(il.qty_on_hand - il.qty_rsvd) Qty_OnHand
,sum(dt.qty) Qty_Select
Into #TMP_CheckQtyOnHand_il
from GEN_QtyMv_Dtl dt
inner join #TMP_CheckQtyOnHand oh on oh.move_num = dt.move_num
and oh.item = dt.item
and dt.state = '1'
inner join itemloc il on il.item = dt.item
and il.loc = oh.loc
inner join item on dt.item = item.item
and item.lot_tracked = 0
group by dt.move_num
,dt.item
,il.loc

--select*from #TMP_CheckQtyOnHand_il

select ml.move_num
,ml.item
,ll.loc
,sum(ll.qty_on_hand - ll.qty_rsvd) Qty_OnHand
,sum(ml.qty_select) Qty_Select
Into #TMP_CheckQtyOnHand_ll
from GEN_QtyMv_Lot ml
inner join #TMP_CheckQtyOnHand oh on oh.move_num = ml.move_num
and oh.item = ml.item
and ml.state = '1'
inner join lot_loc_mst ll on ll.item = ml.item
and ll.lot = ml.lot
inner join item on ml.item = item.item
and item.lot_tracked = 1
group by ml.move_num
,ml.item
,ll.loc
	
				--select*from #TMP_CheckQtyOnHand_ll
	
update #TMP_CheckQtyOnHand 
set Qty_OnHand = cast( il.Qty_OnHand as numeric(18,8)) 
, Qty_Select = cast( il.Qty_Select as numeric(18,8))
from #TMP_CheckQtyOnHand oh
inner join #TMP_CheckQtyOnHand_il il on il.move_num = oh.move_num
and il.item = oh.item
and il.loc = oh.loc
inner join item on item.item = oh.item
and item.lot_tracked = 0

update #TMP_CheckQtyOnHand 
set Qty_OnHand = cast( ll.Qty_OnHand as numeric(18,8))  
, Qty_Select = cast( ll.Qty_Select as numeric(18,8))
from #TMP_CheckQtyOnHand oh
inner join #TMP_CheckQtyOnHand_ll ll on ll.move_num = oh.move_num
and ll.item = oh.item
and ll.loc = oh.loc
inner join item on item.item = oh.item
and item.lot_tracked = 1


--select*from #TMP_CheckQtyOnHand

Update GEN_QtyMv_Dtl 
set State = case when #TMP_CheckQtyOnHand.Qty_Require > #TMP_CheckQtyOnHand.Qty_OnHand then 'E' 
				 when #TMP_CheckQtyOnHand.Qty_Issue > #TMP_CheckQtyOnHand.Qty_OnHand then 'E' 
				 else null 
				 end
,GEN_QtyMv_Dtl.[Message] = case when #TMP_CheckQtyOnHand.Qty_Require > #TMP_CheckQtyOnHand.Qty_OnHand then 'Qty Require More Than Qty On Hand' 
								when #TMP_CheckQtyOnHand.Qty_Issue > #TMP_CheckQtyOnHand.Qty_OnHand then 'Qty Issue More Than Qty On Hand' 
								else null 
								end
from GEN_QtyMv_Dtl
inner join #TMP_CheckQtyOnHand on #TMP_CheckQtyOnHand.move_num = GEN_QtyMv_Dtl.move_num 
and #TMP_CheckQtyOnHand.item = GEN_QtyMv_Dtl.item 
and #TMP_CheckQtyOnHand.loc = GEN_QtyMv_Dtl.location_from


Select @QtyError = (Select Count([message]) From GEN_QtyMv_Dtl Where move_num = @MoveNum and isnull([message],'') <> '')

	
END


--select*from GEN_QtyMv_Dtl
--where move_num = @MoveNum

--select*from GEN_QtyMv_Lot
--where move_num = @Move_Num


GO



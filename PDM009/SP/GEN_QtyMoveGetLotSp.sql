 
CREATE PROCEDURE [dbo].[GEN_QtyMoveGetLotSp] (
  @MoveNum			DocumentNumType
,  @LineNumber         int

)
AS
BEGIN

DECLARE @BR NVARCHAR(8)
SET @BR = (SELECT SITE FROM PARMS_MST WHERE PARM_KEY = 0) --'SITENAME'
DECLARE @CONTEXT NVARCHAR(100)
SET @CONTEXT = @BR
DECLARE @BINVAR VARBINARY(128)
SET @BINVAR = CONVERT (VARBINARY(128), @CONTEXT)
SET CONTEXT_INFO @BINVAR


Declare	  @UserName			LongListType
		, @Whse				WhseType


--DELETE from  GEN_QtyMv_Lot 
--WHERE  move_num = @MoveNum and line_num = @LineNumber  
--	   AND ((ISNULL(state,'') = '' or state = '0'  ) OR  qty_onhand < 1)

DELETE FROM  GEN_QtyMv_Lot 
WHERE  move_num = @MoveNum and line_num = @LineNumber  
	   AND ((ISNULL(state,'') = '' or state = '0'  ) 
	   OR  qty_onhand <= 0)

DELETE FROM  GEN_QtyMv_Lot 
WHERE  move_num = @MoveNum and line_num = @LineNumber 
	   AND qty_select <= 0
	   AND (ISNULL(state,'') = '' or state = '1') 


SELECT @UserName =  dbo.UserNameSp()

SELECT @Whse = ( SELECT TOP 1  whse from GEN_QtyMv_Hdr where move_num = @MoveNum   )

INSERT INTO GEN_QtyMv_Lot
SELECT
  l.site_ref 
 ,d.move_num
 ,d.line_num
 ,l.lot
 ,d.item
 ,0
 --,dbo.MinQty(qty_on_hand, d.qty)
 ,'0'
 ,getdate()
 ,newid()
 ,@UserName
 ,l.qty_on_hand - l.qty_rsvd - ISNULL((SELECT sum(isnull(qty_select, 0)) 
										FROM GEN_QtyMv_Lot ql 
										inner join GEN_QtyMv_Hdr qh on ql.move_num = qh.move_num
										where ISNULL(qh.stat, '') <> 'C' and ql.item = d.item and ql.lot = l.lot), 0)

 FROM lot_loc_mst l 
 INNER JOIN GEN_QtyMv_Dtl d on l.item = d.item
				 AND  l.loc = d.location_from 
				 AND d.move_num = @MoveNum 
				 AND  d.line_num = @LineNumber
				 AND l.loc = d.location_from
				 AND l.whse = @Whse
				 AND ( l.lot not in (SELECT lot FROM GEN_QtyMv_Lot where move_num = @MoveNum and line_num = @LineNumber ))
				 AND ( l.lot not in (SELECT lot FROM GEN_QtyMv_Lot where ISNULL(qty_select, 0) > l.qty_on_hand and item = d.item and whse = @whse and state = '0' ))
				 AND l.qty_on_hand - l.qty_rsvd - ISNULL((SELECT sum(isnull(qty_select, 0)) 
															FROM GEN_QtyMv_Lot ql 
															inner join GEN_QtyMv_Hdr qh on ql.move_num = qh.move_num
															where ISNULL(qh.stat, '') <> 'C' and ql.item = d.item  and ql.lot = l.lot), 0) > 0
END

select * from GEN_QtyMv_Lot
GO



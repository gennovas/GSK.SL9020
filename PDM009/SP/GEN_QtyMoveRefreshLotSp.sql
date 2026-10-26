 

CREATE PROCEDURE [dbo].[GEN_QtyMoveRefreshLotSp] (
   @MoveNum			DocumentNumType
,  @LineNumber      int
)
AS
BEGIN

DECLARE @Severity	INT
DECLARE
 @Infobar	InfobarType

DECLARE @Site SiteType
SELECT @Site = site FROM site
EXEC dbo.SetSiteSp 
  @Site = @Site
, @Infobar = @Infobar OUTPUT

--DECLARE
-- @Lot			LotType
--,@QtyOnHand		QtyUnitType
--,@QtyRsvd		QtyUnitType
--,@QtyRequire	QtyUnitType


--DECLARE @RequireQty TABLE (
--    MoveNumber			InvNumType
--   ,Line				CoLineType
--   ,QtyRequire			QtyUnitType)

--SET @Severity	= 0

--INSERT INTO @RequireQty
--SELECT
--	move_num
--   ,line_num
--   ,qty - ISNULL((SELECT SUM(Qty_Select)
--						 FROM GEN_QtyMv_Lot
--						 Left join lot_loc_mst on lot_loc_mst.lot = GEN_QtyMv_Lot.lot
--						 WHERE GEN_QtyMv_Lot.move_num = GEN_QtyMv_Dtl.move_num
--						 AND GEN_QtyMv_Lot.line_num = GEN_QtyMv_Dtl.line_num
--						 AND lot_loc_mst.loc = GEN_QtyMv_Dtl.location_from
--						 AND GEN_QtyMv_Lot.state = 1), 0) 
--FROM GEN_QtyMv_Dtl
--WHERE GEN_QtyMv_Dtl.move_num = @MoveNum
--AND GEN_QtyMv_Dtl.line_num = @LineNumber

--Declare @Item ItemType
--select @Item = item
--FROM GEN_QtyMv_Dtl
--WHERE GEN_QtyMv_Dtl.move_num = @MoveNum
--AND GEN_QtyMv_Dtl.line_num = @LineNumber

--SELECT 
--	@QtyRequire = QtyRequire
--FROM @RequireQty

----select * from @RequireQty

--DECLARE LotLocCrs CURSOR LOCAL STATIC FOR

--SELECT lot, qty_on_hand - Qty_Select
--FROM
--	(
--		SELECT 
--			 lot_loc.lot
--			,lot_loc.loc
--			,lot_loc.qty_on_hand - lot_loc.qty_rsvd as qty_on_hand
--			,ISNULL((SELECT SUM(Qty_Select) 
--					 FROM GEN_QtyMv_Lot a 
--					 WHERE a.lot = lot_loc.lot 
--					 AND  GEN_QtyMv_Dtl.location_from = lot_loc.loc
--					 AND a.move_num = @MoveNum
--					 AND a.state = 1), 0) Qty_Select
--		FROM lot_loc
--		left join GEN_QtyMv_Dtl on GEN_QtyMv_Dtl.item = lot_loc.item and GEN_QtyMv_Dtl.location_from = lot_loc.loc
--		Inner join GEN_QtyMv_Hdr on GEN_QtyMv_Hdr.move_num = GEN_QtyMv_Dtl.move_num
--		WHERE 1=1
--		AND lot_loc.whse = GEN_QtyMv_Hdr.whse
--		AND lot_loc.item = GEN_QtyMv_Dtl.item
--		AND lot_loc.loc = GEN_QtyMv_Dtl.location_from
--		AND GEN_QtyMv_Dtl.move_num = @MoveNum

--	) AS T
--WHERE 1=1
--AND T.qty_on_hand - T.Qty_Select > 0 
--ORDER BY lot

--DECLARE @Counter INT = 0
--		,@CountLotSelect INT

--SELECT @CountLotSelect = Count(*) FROM GEN_QtyMv_Lot WHERE move_num = @MoveNum AND line_num = @LineNumber AND State = 1

--OPEN LotLocCrs
--WHILE @Severity = 0
--BEGIN
--   FETCH LotLocCrs INTO  @Lot,@QtyOnHand

--   SELECT @Lot LOT, @QtyRequire ReqStart,@QtyOnHand OHStart

--   IF @QtyRequire <= 0 
--		Or @QtyOnHand <= 0 
--		Or @Counter = @CountLotSelect
--      BREAK

--     --IF @Counter = @CountLotSelect
--     -- BREAK



--	Update GEN_QtyMv_Lot Set qty_select = CASE WHEN @QtyRequire <= 0 THEN 0
--											   WHEN @QtyOnHand > @QtyRequire THEN @QtyRequire 
--											   WHEN @QtyOnHand <= @QtyRequire THEN qty_onhand  
--											   ELSE dbo.MinQty(@QtyOnHand, @QtyRequire) END
--	from GEN_QtyMv_Lot
--	Where lot = @LOT AND state = 1 AND qty_select = 0

--	--select @LOT Lot,@QtyRequire STReq,@QtyOnHand STOH
	
--	UPDATE @RequireQty
--	SET QtyRequire = QtyRequire - dbo.MinQty(@QtyOnHand, @QtyRequire)
--	WHERE MoveNumber = @MoveNum
--	AND Line = @LineNumber

--	SELECT @QtyRequire = QtyRequire 
--	FROM @RequireQty

--	SET @QtyOnHand = @QtyOnHand - dbo.MinQty(@QtyOnHand, @QtyRequire)
--	SET @Counter = @Counter + 1

--	--select @Counter , @CountLotSelect

--	SELECT @lot Lot,@QtyRequire ReqEnd,@QtyOnHand OHEnd

--  --IF @QtyRequire <= 0 Or @QtyOnHand <= 0
--  --    BREAK

--  FETCH LotLocCrs INTO  @Lot,@QtyOnHand
--END
--CLOSE LotLocCrs
--DEALLOCATE LotLocCrs

--Update GEN_QtyMv_Lot SET qty_select = 0
--Where GEN_QtyMv_Lot.state = 1
--AND GEN_QtyMv_Lot.move_num = @MoveNum
--AND GEN_QtyMv_Lot.line_num = @LineNumber


	DECLARE   @QtyRequire	QtyUnitType
			, @Lot			LotType
			, @Item			ItemType
			, @QtyOnHand	QtyUnitType
			, @RowPointer	RowPointerType
			, @Whse			WhseType
			, @Loc			LocType

	SELECT    @QtyRequire	= ISNULL(qty, 0)
			, @Loc			= location_from
			, @Whse			= h.whse
	FROM GEN_QtyMv_Dtl d
	INNER JOIN GEN_QtyMv_Hdr h ON d.move_num = h.move_num
	WHERE d.move_num = @MoveNum
	AND d.line_num = @LineNumber

	DECLARE QtyMoveLotCrs CURSOR LOCAL STATIC FOR

	SELECT item, lot, RowPointer
	FROM GEN_QtyMv_Lot
	WHERE move_num = @MoveNum
	AND line_num = @LineNumber
	AND State = 1
	AND ISNULL(qty_select, 0) = 0
	ORDER BY item, lot

	OPEN QtyMoveLotCrs
	FETCH QtyMoveLotCrs INTO @Item, @Lot, @RowPointer

	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @QtyOnHand = 0

		SELECT @QtyOnHand = ISNULL(qty_on_hand - qty_rsvd - ISNULL((SELECT sum(isnull(qty_select, 0)) 
																		FROM GEN_QtyMv_Lot ql 
																		inner join GEN_QtyMv_Hdr qh on ql.move_num = qh.move_num
																		where ISNULL(qh.stat, '') <> 'C' 
																		and ql.item = @Item 
																		and ql.lot = @Lot 
																		and loc = @Loc), 0), 0)
		FROM lot_loc_mst
		WHERE lot = @Lot 
		AND item = @Item
		AND loc = @Loc
		AND whse = @Whse
		AND qty_on_hand - qty_rsvd - ISNULL((SELECT sum(isnull(qty_select, 0)) 
												FROM GEN_QtyMv_Lot ql 
												inner join GEN_QtyMv_Hdr qh on ql.move_num = qh.move_num
												where ISNULL(qh.stat, '') <> 'C' 
												and ql.item = @Item 
												and ql.lot = @Lot 
												and loc = @Loc), 0) > 0

		IF ISNULL(@QtyOnHand, 0) = 0
			CONTINUE

		IF @QtyRequire > @QtyOnHand
			BEGIN
				UPDATE GEN_QtyMv_Lot
				SET qty_select = @QtyOnHand
				WHERE RowPointer = @RowPointer
			
				SET @QtyRequire = @QtyRequire - @QtyOnHand
			END
		ELSE
			BEGIN
				UPDATE GEN_QtyMv_Lot
				SET qty_select = @QtyRequire
				WHERE RowPointer = @RowPointer

				SET @QtyRequire = 0
				BREAK
			END
	
		FETCH QtyMoveLotCrs INTO  @Item, @Lot, @RowPointer
	END
	CLOSE QtyMoveLotCrs
	DEALLOCATE QtyMoveLotCrs

END

GO



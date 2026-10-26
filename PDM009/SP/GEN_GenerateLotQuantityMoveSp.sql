 

CREATE PROCEDURE [dbo].[GEN_GenerateLotQuantityMoveSp](
		@MoveNum	DocumentNumType = NULL
	  , @Whse		WhseType		= NULL
	  , @pSite		SiteType		= NULL
	  , @Infobar	InfobarType		OUTPUT
)
AS

SET XACT_ABORT ON;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

DECLARE   @Severity				Int
		, @td_line_num			Smallint
		, @td_item				ItemType
		, @td_qty				QtyUnitType
		, @td_location_from		LocType
		, @td_qty_select_lot	QtyUnitType
		, @td_lot_tracked		TinyInt
		, @QtyRequied			QtyUnitType = 0
		, @QtyOnHand			QtyUnitType = 0

DELETE GEN_QtyMv_Lot 
WHERE move_num = @MoveNum

UPDATE GEN_QtyMv_Dtl
SET	  state = NULL
	, message = NULL
	, qty_select_lot = NULL
WHERE move_num = @MoveNum

	--- Detail
	DECLARE C_Detail CURSOR FOR
		SELECT d.line_num
			 , d.item
			 , ISNULL(d.qty, 0) AS qty 
			 , d.location_from
			 , ISNULL(d.qty_select_lot, 0) As qty_select_lot
			 , i.lot_tracked
		FROM GEN_QtyMv_Dtl AS d 
		INNER JOIN item AS i ON d.item = i.item
		WHERE d.move_num = @MoveNum
	
	OPEN C_Detail
	FETCH NEXT FROM C_Detail INTO 
		  @td_line_num		
		, @td_item			
		, @td_qty			
		, @td_location_from
		, @td_qty_select_lot
		, @td_lot_tracked

	WHILE @@FETCH_STATUS = 0
	BEGIN
		IF @td_lot_tracked = '1'
			BEGIN
				----INSERT LOT----
				SET @QtyRequied = @td_qty - @td_qty_select_lot

				EXEC @Severity = [dbo].[GEN_GenerateLotQuantityMoveLineSp]
							@MoveNum = @MoveNum
				 		  ,	@Line = @td_line_num
				 		  , @Item = @td_item
				 		  , @QtyRequied = @QtyRequied
				 		  , @Loc = @td_location_from
				 		  , @Whse = @Whse
						  , @pSite = @pSite

				UPDATE GEN_QtyMv_Dtl
				SET state = 'E', message = 'Qty more than qty on hand.'
				WHERE move_num = @MoveNum AND line_num = @td_line_num AND ISNULL(qty, 0) < ISNULL(qty_select_lot, 0)
			END

		IF @td_lot_tracked = '0'
			BEGIN
				SELECT @QtyOnHand = qty_on_hand - qty_rsvd 
				FROM itemloc 
				WHERE item = @td_item 
				AND loc = @td_location_from 
				AND whse = @Whse

				IF @td_qty > ISNULL(@QtyOnHand, 0)
					UPDATE GEN_QtyMv_Dtl
					SET state = 'E', message = 'Qty more than qty on hand.'
					WHERE move_num = @MoveNum AND line_num = @td_line_num
			END

		FETCH NEXT FROM C_Detail INTO 
			  @td_line_num		
			, @td_item			
			, @td_qty			
			, @td_location_from
			, @td_qty_select_lot
			, @td_lot_tracked
		
	END ---END PROCESS CURROR
		
CLOSE C_Detail
DEALLOCATE C_Detail
GO



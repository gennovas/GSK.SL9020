 
CREATE PROCEDURE [dbo].[GEN_GenerateLotQtyMoveSp](
		@MoveNum	DocumentNumType = NULL
	  , @Whse		WhseType		= NULL
	  , @pSite		SiteType		= NULL
	  , @Infobar		InfobarType  OUTPUT

)

AS
BEGIN
DECLARE @Severity	int
	DECLARE   @td_line_num		smallint
			, @td_item			ItemType
			, @td_qty			QtyUnitType
			, @td_location_from	LocType
			, @td_qty_select_lot QtyUnitType
	--- Detail
	DECLARE C_Detail CURSOR FOR
		SELECT d.line_num
			 , d.item
			 , ISNULL(d.qty,0) AS qty 
			 , d.location_from
			 , ISNULL(d.qty_select_lot,0) As qty_select_lot
		FROM GEN_QtyMv_Hdr h
		INNER JOIN GEN_QtyMv_Dtl d ON h.move_num = d.move_num
		WHERE h.move_num = @MoveNum
	
	OPEN C_Detail
	FETCH NEXT FROM C_Detail INTO 
		  @td_line_num		
		, @td_item			
		, @td_qty			
		, @td_location_from
		, @td_qty_select_lot

	WHILE @@FETCH_STATUS = 0
	BEGIN
		IF 	@td_qty_select_lot < @td_qty BEGIN
				----INSERT LOT----
			DECLARE @QtyRequied QtyUnitType
			SET @QtyRequied = @td_qty - @td_qty_select_lot

			EXEC @Severity = [dbo].[GEN_GenerateLotQtyMove2Sp]
						@MoveNum = @MoveNum
				 	  ,	@Line = @td_line_num
				 	  , @Item = @td_item
				 	  , @QtyRequied = @QtyRequied
				 	  , @Loc = @td_location_from
				 	  , @Whse = @Whse
					  , @pSite = @pSite

					  
				FETCH NEXT FROM C_Detail INTO 
					  @td_line_num		
					, @td_item			
					, @td_qty			
					, @td_location_from
					, @td_qty_select_lot
			END
		ELSE 
			FETCH NEXT FROM C_Detail INTO 
				  @td_line_num		
				, @td_item			
				, @td_qty			
				, @td_location_from
				, @td_qty_select_lot
			
	END ---END PROCESS CURROR
		
CLOSE C_Detail
DEALLOCATE C_Detail
SET @Infobar = @Severity
END -- END Main
GO



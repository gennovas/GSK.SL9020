 


CREATE PROCEDURE [dbo].[GEN_GenerateLotQuantityMoveLineSp](
			@MoveNum		DocumentNumType = NULL
		  , @Line			smallint		= NULL
		  , @Item			ItemType		= NULL
		  , @QtyRequied		QtyUnitType		= NULL
		  , @Loc			LocType			= NULL
		  , @Whse			WhseType		= NULL
		  , @pSite			SiteType 		= NULL	  
)
AS

SET XACT_ABORT ON;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

--- Lot
DECLARE  @Lot		LotType 
	   , @QtyOnHand	QtyUnitType
		   
DECLARE C_Lot CURSOR FOR

	SELECT    lot_loc.lot	  
			, qty_on_hand - qty_rsvd AS qty_on_hand
	FROM lot_loc
	WHERE lot_loc.item = @Item
	AND loc = @Loc
	AND whse = @Whse
	AND qty_on_hand - qty_rsvd > 0

	OPEN C_Lot
	FETCH NEXT FROM C_Lot INTO
			  @Lot		
			, @QtyOnHand

	WHILE @@FETCH_STATUS = 0
	BEGIN 
		IF @QtyRequied = 0 
			BREAK
			
		ELSE BEGIN	

			 DECLARE @QtySelect  QtyUnitType = 0
			 SET @QtySelect = dbo.MinQty(@QtyRequied,@QtyOnHand)  --àÍÒµÑÇ·Õè¹éÍÂ¡ÇèÒ
		
				INSERT INTO [dbo].[GEN_QtyMv_Lot]
			       ([site_ref]
			       ,[move_num]
			       ,[line_num]
			       ,[lot]
			       ,[item]
			       ,[qty_select]
			       ,[state]
			       ,[qty_onhand])
			    VALUES
			        (@pSite
			        , @MoveNum
			        , @Line
			        , @Lot
			        , @Item
			        , @QtySelect
			        , '1'
			        , @QtyOnHand)

					
			SET @QtyOnHand = @QtyOnHand -  @QtySelect  
			SET @QtyRequied = @QtyRequied - @QtySelect
			
			IF  @QtyOnHand = 0  BEGIN
					FETCH NEXT FROM C_Lot INTO
						  @Lot		
						, @QtyOnHand
			END
		 END
	END  -- END PROCESS CURROR
	UPDATE GEN_QtyMv_Dtl
	SET qty_select_lot = (SELECT SUM(qty_select) FROM GEN_QtyMv_Lot WHERE move_num = @MoveNum AND line_num = @Line AND state = '0')
	WHERE move_num = @MoveNum
	AND	  line_num = @Line
		
CLOSE C_Lot
DEALLOCATE C_Lot
GO



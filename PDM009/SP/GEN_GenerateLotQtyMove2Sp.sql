 
CREATE PROCEDURE [dbo].[GEN_GenerateLotQtyMove2Sp](
			@MoveNum		DocumentNumType = NULL
		  , @Line			smallint		= NULL
		  , @Item			ItemType		= NULL
		  , @QtyRequied		QtyUnitType		= NULL
		  , @Loc			LocType			= NULL
		  , @Whse			WhseType		= NULL
		  , @pSite			SiteType 		= NULL	  

)

AS
--- Lot
BEGIN
DECLARE  @Lot		LotType 
	   , @QtyOnHand	QtyUnitType
		   
DECLARE C_Lot CURSOR FOR

	SELECT lot, qty_on_hand FROM(
				select lot_loc.lot	  
					 , qty_on_hand - ISNULL(mv_lot.qty_select,0) as qty_on_hand
				FROM lot_loc_mst lot_loc
				OUTER Apply(SELECT SUM(qty_select)as qty_select FROM GEN_QtyMv_Lot   WHERE lot_loc.item = item
											   AND lot_loc.lot	= lot
											   AND state = '1'
							)mv_lot
				where lot_loc.item = @Item
				and loc = @Loc
				and qty_on_hand > 0
				and whse = @Whse
				 
	) AS T
	WHERE qty_on_hand > 0

	OPEN C_Lot
	FETCH NEXT FROM C_Lot INTO
			  @Lot		
			, @QtyOnHand
	WHILE @@FETCH_STATUS = 0
	BEGIN 
		IF @QtyRequied = 0 
			BREAK
			
		ELSE BEGIN	

			 DECLARE @QtySelect  QtyUnitType
			 SET @QtySelect = dbo.MinQty(@QtyRequied,@QtyOnHand)  --เอาตัวที่น้อยกว่า
		
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
			        , 1
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
			SET qty_select_lot =  (select SUM(qty_select) from GEN_QtyMv_Lot WHERE move_num = @MoveNum and state = '1' AND line_num = @Line GROUP BY move_num,line_num)
			WHERE move_num = @MoveNum
			AND	  line_num = @Line
		
CLOSE C_Lot
DEALLOCATE C_Lot
END
GO



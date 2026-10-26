CREATE PROCEDURE [dbo].[GEN_QtyMoveProcessSp]
(
	  @MoveNum	NVARCHAR(20)
	, @Infobar	InfobarType	OUTPUT
)
AS

SET XACT_ABORT ON;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

DECLARE   @Severity				INT
		, @PSite				SiteType
		, @PTransactionDate		DateType
		, @PItem				ItemType
		, @PQty					DECIMAL(23, 8)
		, @PFromWhse			NVARCHAR(10)
		, @PFromLoc				NVARCHAR(30)
		, @PToWhse				NVARCHAR(10)
		, @PToLoc				NVARCHAR(30)
		, @PLot					NVARCHAR(30)
		, @PFromSite			SiteType
		, @PToSite				SiteType
		, @PToSiteWhse			WhseType

IF NOT EXISTS (SELECT 1 FROM GEN_QtyMv_Dtl WHERE move_num = @MoveNum AND ISNULL(state, '') = 'E')
	BEGIN
		DECLARE @Cursor AS CURSOR
		SET @Cursor = CURSOR FOR

			SELECT	  qd.site_ref
					, qh.trans_date
					, qd.item
					, ISNULL(ql.qty_select, qd.qty)
					, qh.whse
					, qd.location_from
					, qh.whse
					, qh.location_to
					, ql.lot
					, qh.from_site
					, qh.to_site
					, qh.to_whse
			FROM GEN_QtyMv_Dtl AS qd
			LEFT JOIN GEN_QtyMv_Lot AS ql ON ql.move_num = qd.move_num AND ql.line_num = qd.line_num AND ql.state = '1'
			LEFT JOIN GEN_QtyMv_Hdr AS qh ON qd.move_num = qh.move_num
			WHERE qh.move_num = @MoveNum
		OPEN @Cursor;

		FETCH NEXT FROM @Cursor INTO @PSite, @PTransactionDate, @PItem, @PQty, @PFromWhse, @PFromLoc, @PToWhse, @PToLoc, @PLot, @PFromSite, @PToSite, @PToSiteWhse

		WHILE @@FETCH_STATUS = 0
			BEGIN
				DECLARE @QtyOnHand QtyUnitType = 0

				SELECT @QtyOnHand = qty_on_hand 
				FROM lot_loc 
				WHERE item = @PItem 
				AND loc = @PFromLoc 
				AND lot = @PLot 
				AND whse = @PFromWhse

				IF @QtyOnHand < @PQty 
					BEGIN
						SET @Infobar = 'Quantity more then Qty On Hand.'
						SET @Severity = 16
						GOTO Return_Error
					END

				EXEC	@Severity = dbo.MsmpSp
						  @PType = 'M'
						, @PDate = @PTransactionDate
						, @PQty = @PQty
						, @PItem = @PItem
						, @PFromSite = @PFromSite
						, @PFromWhse = @PFromWhse
						, @PFromLoc = @PFromLoc
						, @PFromLot = @PLot
						, @PToSite = @PToSite
						, @PToWhse = @PToSiteWhse
						, @PToLoc = @PToLoc
						, @PToLot = @PLot
						, @PZeroCost = NULL
						, @PTrnNum = NULL
						, @PTrnLine = 0
						, @PTransNum = 0
						, @PRsvdNum = 0
						, @PStat = 'I'
						, @PRefNum = @MoveNum
						, @PRefLineSuf = 0
						, @PRefRelease = 0
						, @RemoteSiteLot = NULL
						, @PReasonCode = NULL
						, @PUnitCost = 0
						, @PMatlCost = 0
						, @PLbrCost = 0
						, @PFovhdCost = 0
						, @PVovhdCost = 0
						, @POutCost = 0
						, @PTotCost = 0
						, @Infobar = @Infobar OUTPUT
						, @PImportDocId = NULL
						, @MoveZeroCostItem = NULL
						, @EmpNum = NULL
						, @CheckExternalWhseFlag = 3
						--, @DocumentNum = @MoveNum

				IF @Severity <> 0
					GOTO Return_Error

				FETCH NEXT FROM @Cursor INTO @PSite, @PTransactionDate, @PItem, @PQty, @PFromWhse, @PFromLoc, @PToWhse, @PToLoc, @PLot, @PFromSite, @PToSite, @PToSiteWhse
			END

		CLOSE @Cursor;
		DEALLOCATE @Cursor;

		--UPDATE GEN_QtyMv_Lot
		--SET state = '1'
		--WHERE move_num = @MoveNum

		UPDATE GEN_QtyMv_Dtl
		SET state = 'S'
		WHERE move_num = @MoveNum

		UPDATE GEN_QtyMv_Hdr
		SET stat = 'C'
		WHERE move_num = @MoveNum
	END
ELSE
	BEGIN
		SET @Infobar = 'There are some record has error message.'
		SET @Severity = 16
	END

Return_Error:

--IF @Severity = 0
--	COMMIT TRAN
--ELSE
--	ROLLBACK TRAN

RETURN @Severity
GO



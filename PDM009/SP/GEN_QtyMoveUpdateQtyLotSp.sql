 

CREATE PROCEDURE [dbo].[GEN_QtyMoveUpdateQtyLotSp] (
   @MoveNum			DocumentNumType
,  @LineNumber      int
)
AS
BEGIN

IF OBJECT_ID('TEMPDB..#TMP_GEN_QtyMv_Lot') IS NOT NULL DROP TABLE #TMP_GEN_QtyMv_Lot

DECLARE @Severity	INT
DECLARE
 @Infobar	InfobarType

DECLARE @Site SiteType
SELECT @Site = site FROM site
EXEC dbo.SetSiteSp 
  @Site = @Site
, @Infobar = @Infobar OUTPUT

SELECT	move_num
		,line_num
		,SUM(qty_select) QtyTotal
INTO #TMP_GEN_QtyMv_Lot
FROM GEN_QtyMv_Lot 
WHERE	move_num = @MoveNum
		AND line_num = @LineNumber 
		AND [State] = 1
GROUP BY move_num
		,line_num

	UPDATE GEN_QtyMv_Dtl SET qty_select_lot = QtyTotal
	FROM GEN_QtyMv_Dtl
	INNER JOIN #TMP_GEN_QtyMv_Lot on GEN_QtyMv_Dtl.move_num = #TMP_GEN_QtyMv_Lot.move_num
									 AND GEN_QtyMv_Dtl.line_num = #TMP_GEN_QtyMv_Lot.line_num

END


GO



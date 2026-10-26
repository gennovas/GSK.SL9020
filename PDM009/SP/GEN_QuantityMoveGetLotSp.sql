 

CREATE PROCEDURE [dbo].[GEN_QuantityMoveGetLotSp] 
(
      @MoveNum			DocumentNumType
	, @LineNumber		INT
	, @Whse				WhseType
	, @Infobar			InfobarType OUTPUT
)
AS

SET XACT_ABORT ON;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

DELETE GEN_QtyMv_Lot 
WHERE move_num = @MoveNum 
AND line_num = @LineNumber  
AND (ISNULL(state, '') = '' OR state = '0') 

INSERT INTO GEN_QtyMv_Lot ( move_num, line_num, lot, item, qty_select, state, qty_onhand)
SELECT
	  d.move_num
	 ,d.line_num
	 ,l.lot
	 ,d.item
	 ,0
	 ,'0'
	 ,l.qty_on_hand - l.qty_rsvd - ISNULL((SELECT SUM(ISNULL(qty_select, 0)) 
											FROM GEN_QtyMv_Lot ql 
											INNER JOIN GEN_QtyMv_Hdr qh ON ql.move_num = qh.move_num
											WHERE ISNULL(qh.stat, '') <> 'C' 
											AND ql.item = d.item 
											AND ql.lot = l.lot), 0)
 FROM lot_loc_mst l 
 INNER JOIN GEN_QtyMv_Dtl d ON l.item = d.item
	AND  l.loc = d.location_from 
	AND d.move_num = @MoveNum 
	AND  d.line_num = @LineNumber
	AND l.loc = d.location_from
	AND l.whse = @Whse
	AND ( l.lot NOT IN (SELECT lot FROM GEN_QtyMv_Lot where move_num = @MoveNum AND line_num = @LineNumber ))
	AND ( l.lot NOT IN (SELECT lot FROM GEN_QtyMv_Lot where ISNULL(qty_select, 0) > l.qty_on_hand AND item = d.item AND whse = @whse AND state = '0' ))
	AND l.qty_on_hand - l.qty_rsvd - ISNULL((SELECT SUM(ISNULL(qty_select, 0)) FROM GEN_QtyMv_Lot ql INNER JOIN GEN_QtyMv_Hdr qh ON ql.move_num = qh.move_num WHERE ISNULL(qh.stat, '') <> 'C' AND ql.item = d.item  AND ql.lot = l.lot), 0) > 0
GO



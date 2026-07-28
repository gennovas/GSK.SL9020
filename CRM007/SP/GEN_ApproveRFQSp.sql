
 
CREATE PROCEDURE [dbo].[GEN_ApproveRFQSp]
(
	@RFQNum nvarchar(15),
	@RfqRevision tinyint,
	@Approveby UsernameType,
	@Infobar InfobarType OUTPUT
)
AS

SET XACT_ABORT ON;

DECLARE @Severity INT = 0;


UPDATE ERPP_rfqitem SET status = 'A' WHERE rfq_num = @RFQNum and rfq_rev = @RfqRevision;
UPDATE ERPP_rfq SET Uf_Approved = 1, Uf_ApprovedBy = @Approveby, Uf_ApprovedDate = GETDATE(), status = 'A'
WHERE rfq_num = @RFQNum and rfq_rev = @RfqRevision;

SELECT rfq_num, rfq_rev, Uf_ApprovedBy, Uf_ApprovedDate
FROM ERPP_rfq 
WHERE rfq_num = @RFQNum and rfq_rev = @RfqRevision;

EXEC @Severity = dbo.MsgAppSp @Infobar OUTPUT, 'GEN_mApproveRFQCompleted', @RFQNum, @RfqRevision

EXEC dbo.DefineVariableSp
    'ApproveRFQ.Infobar',
    @Infobar,
    @Infobar;

RETURN @Severity;
GO



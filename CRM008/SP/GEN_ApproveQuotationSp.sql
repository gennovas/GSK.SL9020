 
CREATE PROCEDURE [dbo].[GEN_ApproveQuotationSp]
(
	@QuotationNum nvarchar(15),
	@RfqRevision tinyint,
	@Approveby UsernameType,
	@Infobar InfobarType OUTPUT
)
AS

SET XACT_ABORT ON;

DECLARE @Severity INT = 0;


UPDATE ERPP_SK_Quotation SET Uf_Approved = 1, Uf_ApprovedBy = @Approveby, Uf_ApprovedDate = GETDATE()
WHERE qt_num= @QuotationNum and rfq_revision = @RfqRevision;

SELECT qt_num, rfq_revision, Uf_ApprovedBy, Uf_ApprovedDate
FROM ERPP_SK_Quotation 
WHERE qt_num = @QuotationNum and rfq_revision = @RfqRevision;

EXEC @Severity = dbo.MsgAppSp @Infobar OUTPUT, 'GEN_mApproveQuatationCompleted', @QuotationNum, @RfqRevision

EXEC dbo.DefineVariableSp
    'ApproveQuotation.Infobar',
    @Infobar,
    @Infobar;

RETURN @Severity;
GO



 
CREATE PROCEDURE [dbo].[GEN_CopyQuatationSp]
(
    @Infobar InfobarType OUTPUT
)
AS

SET XACT_ABORT ON;

DECLARE @NewRev tinyint,
    @Revision tinyint,
    @QuotationNum nvarchar(15),
    @Severity INT = 0

EXEC @Severity = [dbo].[GetVariableSp] 'CopyQuatationSp.QuotationNum', NULL, 0, @QuotationNum OUTPUT, @Infobar OUTPUT;
EXEC @Severity = [dbo].[GetVariableSp] 'CopyQuatationSp.Revision', NULL, 0, @Revision OUTPUT, @Infobar OUTPUT;

SELECT @NewRev = max(rfq_revision) FROM ERPP_SK_Quotation 
WHERE qt_num = @QuotationNum

IF @NewRev IS NOT NULL AND @Revision <> @NewRev
BEGIN
	EXEC @Severity = dbo.MsgAppSp @Infobar OUTPUT, 'GEN_mEQuatationIsNotOriginal', @QuotationNum, @Revision
	RETURN @Severity;
END

SET @NewRev = CASE WHEN @NewRev IS NULL THEN 0 ELSE @NewRev + 1 END

INSERT INTO [dbo].[ERPP_SK_Quotation]
           ([qt_num]
           ,[rfq_revision]
           ,[qt_date]
           ,[qt_stat]
           ,[cust_num]
           ,[cust_seq]
           ,[cust_type]
           ,[curr_code]
           ,[qt_cc]
           ,[qt_from]
           ,[prices_base_on]
           ,[exch_rate]
           ,[packing]
           ,[payment_method]
           ,[term_products]
           ,[term_tooling]
           ,[remark]
           ,[eff_date]
           ,[name_from]
           ,[title_from]
           ,[Uf_ERPP_price_range]
           ,[Uf_ERPP_prices_base_on]
           ,[Uf_ERPP_descremark]
           ,[Uf_ERPP_PackingDes]
           ,[Uf_ERPP_Tooling]
           ,[Uf_ERPP_namefrom]
           ,[Uf_ERPP_titlefrom]
           ,[Uf_ERPP_Remark2Line]
           ,[Uf_AsOfDate]
           ,[Uf_DelDueDate]
           ,[Uf_Project]
           ,[Uf_UnitCode3])
SELECT [qt_num]
           ,@NewRev
           ,[qt_date]
           ,'N'
           ,[cust_num]
           ,[cust_seq]
           ,[cust_type]
           ,[curr_code]
           ,[qt_cc]
           ,[qt_from]
           ,[prices_base_on]
           ,[exch_rate]
           ,[packing]
           ,[payment_method]
           ,[term_products]
           ,[term_tooling]
           ,[remark]
           ,[eff_date]
           ,[name_from]
           ,[title_from]
           ,[Uf_ERPP_price_range]
           ,[Uf_ERPP_prices_base_on]
           ,[Uf_ERPP_descremark]
           ,[Uf_ERPP_PackingDes]
           ,[Uf_ERPP_Tooling]
           ,[Uf_ERPP_namefrom]
           ,[Uf_ERPP_titlefrom]
           ,[Uf_ERPP_Remark2Line]
           ,[Uf_AsOfDate]
           ,[Uf_DelDueDate]
           ,[Uf_Project]
           ,[Uf_UnitCode3]
FROM ERPP_SK_Quotation 
WHERE qt_num = @QuotationNum AND rfq_revision = @Revision

INSERT INTO [dbo].[ERPP_SK_QuotationLine]
           ([qt_num]
           ,[rfq_rev]
           ,[rfq_line]
           ,[rfq_line_rev]
           ,[part_name]
           ,[cust_part_num]
           ,[size]
           ,[hardness]
           ,[color]
           ,[material]
           ,[status]
           ,[volume]
           ,[vol1]
           ,[vol2]
           ,[vol3]
           ,[curr_rate]
           ,[unit_price]
           ,[tooling_price]
           ,[tooling_mat]
           ,[cavities]
           ,[LT_offtool_samp]
           ,[LT_mass_prod]
           ,[max_capacity]
           ,[test_topic1]
           ,[test_method1]
           ,[test_value1]
           ,[tested_by1]
           ,[test_cost1]
           ,[test_topic2]
           ,[test_method2]
           ,[test_value2]
           ,[tested_by2]
           ,[test_cost2]
           ,[test_topic3]
           ,[test_method3]
           ,[test_value3]
           ,[tested_by3]
           ,[test_cost3]
           ,[Uf_ERPP_No_of_Cavities1]
           ,[Uf_ERPP_No_of_Cavities2]
           ,[Uf_ERPP_No_of_Cavities3]
           ,[Uf_ERPP_Tooling_Price1]
           ,[Uf_ERPP_Tooling_Price2]
           ,[Uf_ERPP_Tooling_Price3]
           ,[Uf_ERPP_PunchDie]
           ,[Uf_ERPP_UmVolume]
           ,[Uf_ERPP_VolumeLot]
           ,[Uf_ERPP_Unit_Price1]
           ,[Uf_ERPP_Unit_Price2]
           ,[Uf_ERPP_Unit_Price3]
           ,[Uf_ERPP_AmountQ]
           ,[Uf_ToolingText1]
           ,[Uf_ToolingText2]
           ,[Uf_ToolingText3]
           ,[Uf_Image1])
SELECT [qt_num]
           ,@NewRev
           ,[rfq_line]
           ,[rfq_line_rev]
           ,[part_name]
           ,[cust_part_num]
           ,[size]
           ,[hardness]
           ,[color]
           ,[material]
           ,'N'
           ,[volume]
           ,[vol1]
           ,[vol2]
           ,[vol3]
           ,[curr_rate]
           ,[unit_price]
           ,[tooling_price]
           ,[tooling_mat]
           ,[cavities]
           ,[LT_offtool_samp]
           ,[LT_mass_prod]
           ,[max_capacity]
           ,[test_topic1]
           ,[test_method1]
           ,[test_value1]
           ,[tested_by1]
           ,[test_cost1]
           ,[test_topic2]
           ,[test_method2]
           ,[test_value2]
           ,[tested_by2]
           ,[test_cost2]
           ,[test_topic3]
           ,[test_method3]
           ,[test_value3]
           ,[tested_by3]
           ,[test_cost3]
           ,[Uf_ERPP_No_of_Cavities1]
           ,[Uf_ERPP_No_of_Cavities2]
           ,[Uf_ERPP_No_of_Cavities3]
           ,[Uf_ERPP_Tooling_Price1]
           ,[Uf_ERPP_Tooling_Price2]
           ,[Uf_ERPP_Tooling_Price3]
           ,[Uf_ERPP_PunchDie]
           ,[Uf_ERPP_UmVolume]
           ,[Uf_ERPP_VolumeLot]
           ,[Uf_ERPP_Unit_Price1]
           ,[Uf_ERPP_Unit_Price2]
           ,[Uf_ERPP_Unit_Price3]
           ,[Uf_ERPP_AmountQ]
           ,[Uf_ToolingText1]
           ,[Uf_ToolingText2]
           ,[Uf_ToolingText3]
           ,[Uf_Image1]
FROM ERPP_SK_QuotationLine
WHERE qt_num = @QuotationNum AND rfq_rev = @Revision
ORDER BY [rfq_line]

EXEC @Severity = dbo.MsgAppSp @Infobar OUTPUT, 'GEN_mQuatationCreated', @QuotationNum, @NewRev
RETURN @Severity;
GO



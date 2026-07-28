SET NOCOUNT ON
GO

-- Class
IF NOT EXISTS(SELECT * FROM user_class WHERE class_name = N'Uc_ERPP_SK_QuotationLine')
	INSERT INTO user_class ( class_name, class_label, class_desc, sys_has_fields, sys_has_tables, sys_apply, sys_delete ) 
	VALUES(N'Uc_ERPP_SK_QuotationLine', NULL, NULL, 0, 0, NULL,  0)

-- Class/Table
IF NOT EXISTS(SELECT * FROM table_class WHERE table_name = N'ERPP_SK_QuotationLine' AND class_name = N'Uc_ERPP_SK_QuotationLine')
	INSERT INTO table_class ( table_name, class_name, table_rule, extend_all_recs, sys_apply, sys_delete, allow_record_assoc, active ) 
	VALUES (N'ERPP_SK_QuotationLine', N'Uc_ERPP_SK_QuotationLine', NULL, 0, NULL, 0, 0, 1)
 
-- Fields
IF NOT EXISTS(SELECT * FROM user_fld WHERE fld_name = N'Uf_ToolingText1')
	INSERT INTO user_fld ( fld_name, fld_data_type, fld_initial, fld_decimals, fld_desc, sys_apply, sys_delete, fld_UDT, fld_prec ) 
	VALUES (N'Uf_ToolingText1', N'nvarchar', NULL, NULL, NULL, NULL, 0, NULL, 200)
IF NOT EXISTS(SELECT * FROM user_fld WHERE fld_name = N'Uf_ToolingText2')
	INSERT INTO user_fld ( fld_name, fld_data_type, fld_initial, fld_decimals, fld_desc, sys_apply, sys_delete, fld_UDT, fld_prec ) 
	VALUES (N'Uf_ToolingText2', N'nvarchar', NULL, NULL, NULL, NULL, 0, NULL, 200)
IF NOT EXISTS(SELECT * FROM user_fld WHERE fld_name = N'Uf_ToolingText3')
	INSERT INTO user_fld ( fld_name, fld_data_type, fld_initial, fld_decimals, fld_desc, sys_apply, sys_delete, fld_UDT, fld_prec ) 
	VALUES (N'Uf_ToolingText3', N'nvarchar', NULL, NULL, NULL, NULL, 0, NULL, 200)
IF NOT EXISTS(SELECT * FROM user_fld WHERE fld_name = N'Uf_Image1')
	INSERT INTO user_fld ( fld_name, fld_data_type, fld_initial, fld_decimals, fld_desc, sys_apply, sys_delete, fld_UDT, fld_prec ) 
	VALUES (N'Uf_Image1', N'varbinary', NULL, NULL, NULL, NULL, 0, 'ImageType', -1)
	 
-- Class/Fields
IF NOT EXISTS(SELECT * FROM user_class_fld WHERE class_name = N'Uc_ERPP_SK_QuotationLine' AND fld_name = N'Uf_ToolingText1')
	INSERT INTO user_class_fld ( class_name, fld_name, sys_apply, sys_delete ) 
	VALUES (N'Uc_ERPP_SK_QuotationLine', N'Uf_ToolingText1', NULL, 0)
IF NOT EXISTS(SELECT * FROM user_class_fld WHERE class_name = N'Uc_ERPP_SK_QuotationLine' AND fld_name = N'Uf_ToolingText2')
	INSERT INTO user_class_fld ( class_name, fld_name, sys_apply, sys_delete ) 
	VALUES (N'Uc_ERPP_SK_QuotationLine', N'Uf_ToolingText2', NULL, 0)
IF NOT EXISTS(SELECT * FROM user_class_fld WHERE class_name = N'Uc_ERPP_SK_QuotationLine' AND fld_name = N'Uf_ToolingText3')
	INSERT INTO user_class_fld ( class_name, fld_name, sys_apply, sys_delete ) 
	VALUES (N'Uc_ERPP_SK_QuotationLine', N'Uf_ToolingText3', NULL, 0)
IF NOT EXISTS(SELECT * FROM user_class_fld WHERE class_name = N'Uc_ERPP_SK_QuotationLine' AND fld_name = N'Uf_Image1')
	INSERT INTO user_class_fld ( class_name, fld_name, sys_apply, sys_delete ) 
	VALUES (N'Uc_ERPP_SK_QuotationLine', N'Uf_Image1', NULL, 0)

DECLARE @RC int
DECLARE @PCommit tinyint
DECLARE @PRollback tinyint
DECLARE @PImpact tinyint
DECLARE @Infobar nvarchar(2800)
DECLARE @RedoViews tinyint

-- Set parameter values
SET  @PCommit = 1
SET  @PRollback = 0
SET  @PImpact = 1
EXEC @RC = [dbo].[UETImpactWrapperSp] @PCommit, @PRollback, @PImpact,@RedoViews, @Infobar OUTPUT 

--SELECT @Infobar
GO

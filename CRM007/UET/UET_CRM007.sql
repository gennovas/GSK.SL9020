SET NOCOUNT ON
GO

-- Class
IF NOT EXISTS(SELECT * FROM user_class WHERE class_name = N'Uc_ERPP_rfq')
	INSERT INTO user_class ( class_name, class_label, class_desc, sys_has_fields, sys_has_tables, sys_apply, sys_delete ) 
	VALUES(N'Uc_ERPP_rfq', NULL, NULL, 0, 0, NULL,  0)

-- Class/Table
IF NOT EXISTS(SELECT * FROM table_class WHERE table_name = N'ERPP_rfq' AND class_name = N'Uc_ERPP_rfq')
	INSERT INTO table_class ( table_name, class_name, table_rule, extend_all_recs, sys_apply, sys_delete, allow_record_assoc, active ) 
	VALUES (N'ERPP_rfq', N'Uc_ERPP_rfq', NULL, 0, NULL, 0, 0, 1)

-- Fields
IF NOT EXISTS(SELECT * FROM user_fld WHERE fld_name = N'Uf_Approved')
	INSERT INTO user_fld ( fld_name, fld_data_type, fld_initial, fld_decimals, fld_desc, sys_apply, sys_delete, fld_UDT, fld_prec ) 
	VALUES (N'Uf_Approved', N'int', 0, NULL, NULL, NULL, 0, NULL, NULL)
IF NOT EXISTS(SELECT * FROM user_fld WHERE fld_name = N'Uf_ApprovedBy')
	INSERT INTO user_fld ( fld_name, fld_data_type, fld_initial, fld_decimals, fld_desc, sys_apply, sys_delete, fld_UDT, fld_prec ) 
	VALUES (N'Uf_ApprovedBy', N'nvarchar', NULL, NULL, NULL, NULL, 0, NULL, 200)
IF NOT EXISTS(SELECT * FROM user_fld WHERE fld_name = N'Uf_ApprovedDate')
	INSERT INTO user_fld ( fld_name, fld_data_type, fld_initial, fld_decimals, fld_desc, sys_apply, sys_delete, fld_UDT, fld_prec ) 
	VALUES (N'Uf_ApprovedDate', N'datetime', NULL, 0, NULL, NULL, 0, NULL, 0)

-- Class/Fields
IF NOT EXISTS(SELECT * FROM user_class_fld WHERE class_name = N'Uc_ERPP_rfq' AND fld_name = N'Uf_Approved')
	INSERT INTO user_class_fld ( class_name, fld_name, sys_apply, sys_delete )
	VALUES (N'Uc_ERPP_rfq', N'Uf_Approved', NULL, 0)
IF NOT EXISTS(SELECT * FROM user_class_fld WHERE class_name = N'Uc_ERPP_rfq' AND fld_name = N'Uf_ApprovedBy')
	INSERT INTO user_class_fld ( class_name, fld_name, sys_apply, sys_delete ) 
	VALUES (N'Uc_ERPP_rfq', N'Uf_ApprovedBy', NULL, 0)
IF NOT EXISTS(SELECT * FROM user_class_fld WHERE class_name = N'Uc_ERPP_rfq' AND fld_name = N'Uf_ApprovedDate')
	INSERT INTO user_class_fld ( class_name, fld_name, sys_apply, sys_delete ) 
	VALUES (N'Uc_ERPP_rfq', N'Uf_ApprovedDate', NULL, 0)

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

SET NOCOUNT ON
GO

-- Class
IF NOT EXISTS(SELECT * FROM user_class WHERE class_name = N'Uc_ERPP_SK_Quotation')
	INSERT INTO user_class ( class_name, class_label, class_desc, sys_has_fields, sys_has_tables, sys_apply, sys_delete ) 
	VALUES(N'Uc_ERPP_SK_Quotation', NULL, NULL, 0, 0, NULL,  0)
IF NOT EXISTS(SELECT * FROM user_class WHERE class_name = N'Uc_Employee')
	INSERT INTO user_class ( class_name, class_label, class_desc, sys_has_fields, sys_has_tables, sys_apply, sys_delete ) 
	VALUES(N'Uc_Employee', NULL, NULL, 0, 0, NULL,  0)
IF NOT EXISTS(SELECT * FROM user_class WHERE class_name = N'Uc_UserName')
	INSERT INTO user_class ( class_name, class_label, class_desc, sys_has_fields, sys_has_tables, sys_apply, sys_delete ) 
	VALUES(N'Uc_UserName', NULL, NULL, 0, 0, NULL,  0)	

-- Class/Table
IF NOT EXISTS(SELECT * FROM table_class WHERE table_name = N'ERPP_SK_Quotation' AND class_name = N'Uc_ERPP_SK_Quotation')
	INSERT INTO table_class ( table_name, class_name, table_rule, extend_all_recs, sys_apply, sys_delete, allow_record_assoc, active ) 
	VALUES (N'ERPP_SK_Quotation', N'Uc_ERPP_SK_Quotation', NULL, 0, NULL, 0, 0, 1)
IF NOT EXISTS(SELECT * FROM table_class WHERE table_name = N'employee_mst' AND class_name = N'Uc_Employee')
	INSERT INTO table_class ( table_name, class_name, table_rule, extend_all_recs, sys_apply, sys_delete, allow_record_assoc, active ) 
	VALUES (N'employee_mst', N'Uc_Employee', NULL, 0, NULL, 0, 0, 1)
IF NOT EXISTS(SELECT * FROM table_class WHERE table_name = N'UserNames' AND class_name = N'Uc_UserName')
	INSERT INTO table_class ( table_name, class_name, table_rule, extend_all_recs, sys_apply, sys_delete, allow_record_assoc, active ) 
	VALUES (N'UserNames', N'Uc_UserName', NULL, 0, NULL, 0, 0, 1)

-- Fields
IF NOT EXISTS(SELECT * FROM user_fld WHERE fld_name = N'Uf_UnitCode3')
	INSERT INTO user_fld ( fld_name, fld_data_type, fld_initial, fld_decimals, fld_desc, sys_apply, sys_delete, fld_UDT, fld_prec ) 
	VALUES (N'Uf_UnitCode3', N'nvarchar', NULL, NULL, NULL, NULL, 0, NULL, 4)
/*
IF NOT EXISTS(SELECT * FROM user_fld WHERE fld_name = N'Uf_CurrCode')
	INSERT INTO user_fld ( fld_name, fld_data_type, fld_initial, fld_decimals, fld_desc, sys_apply, sys_delete, fld_UDT, fld_prec ) 
	VALUES (N'Uf_CurrCode', N'nvarchar', NULL, NULL, NULL, NULL, 0, NULL, 3)
*/	
IF NOT EXISTS(SELECT * FROM user_fld WHERE fld_name = N'Uf_AsOfDate')
	INSERT INTO user_fld ( fld_name, fld_data_type, fld_initial, fld_decimals, fld_desc, sys_apply, sys_delete, fld_UDT, fld_prec ) 
	VALUES (N'Uf_AsOfDate', N'datetime', NULL, 0, NULL, NULL, 0, NULL, 0)
IF NOT EXISTS(SELECT * FROM user_fld WHERE fld_name = N'Uf_Project')
	INSERT INTO user_fld ( fld_name, fld_data_type, fld_initial, fld_decimals, fld_desc, sys_apply, sys_delete, fld_UDT, fld_prec ) 
	VALUES (N'Uf_Project', N'nvarchar', NULL, NULL, NULL, NULL, 0, NULL, 100)
IF NOT EXISTS(SELECT * FROM user_fld WHERE fld_name = N'Uf_DelDueDate')
	INSERT INTO user_fld ( fld_name, fld_data_type, fld_initial, fld_decimals, fld_desc, sys_apply, sys_delete, fld_UDT, fld_prec ) 
	VALUES (N'Uf_DelDueDate', N'nvarchar', NULL, NULL, NULL, NULL, 0, NULL, 200)
IF NOT EXISTS(SELECT * FROM user_fld WHERE fld_name = N'Uf_Approved')
	INSERT INTO user_fld ( fld_name, fld_data_type, fld_initial, fld_decimals, fld_desc, sys_apply, sys_delete, fld_UDT, fld_prec ) 
	VALUES (N'Uf_Approved', N'int', 0, NULL, NULL, NULL, 0, NULL, NULL)
IF NOT EXISTS(SELECT * FROM user_fld WHERE fld_name = N'Uf_ApprovedBy')
	INSERT INTO user_fld ( fld_name, fld_data_type, fld_initial, fld_decimals, fld_desc, sys_apply, sys_delete, fld_UDT, fld_prec ) 
	VALUES (N'Uf_ApprovedBy', N'nvarchar', NULL, NULL, NULL, NULL, 0, NULL, 200)
IF NOT EXISTS(SELECT * FROM user_fld WHERE fld_name = N'Uf_ApprovedDate')
	INSERT INTO user_fld ( fld_name, fld_data_type, fld_initial, fld_decimals, fld_desc, sys_apply, sys_delete, fld_UDT, fld_prec ) 
	VALUES (N'Uf_ApprovedDate', N'datetime', NULL, 0, NULL, NULL, 0, NULL, 0)
IF NOT EXISTS(SELECT * FROM user_fld WHERE fld_name = N'Uf_Signature')
	INSERT INTO user_fld ( fld_name, fld_data_type, fld_initial, fld_decimals, fld_desc, sys_apply, sys_delete, fld_UDT, fld_prec ) 
	VALUES (N'Uf_Signature', N'varbinary', NULL, NULL, NULL, NULL, 0, 'ImageType', -1)

IF NOT EXISTS(SELECT * FROM user_fld WHERE fld_name = N'Uf_Fname')
	INSERT INTO user_fld ( fld_name, fld_data_type, fld_initial, fld_decimals, fld_desc, sys_apply, sys_delete, fld_UDT, fld_prec ) 
	VALUES (N'Uf_Fname', N'nvarchar', NULL, NULL, NULL, NULL, 0, NULL, 50)
IF NOT EXISTS(SELECT * FROM user_fld WHERE fld_name = N'Uf_Lname')
	INSERT INTO user_fld ( fld_name, fld_data_type, fld_initial, fld_decimals, fld_desc, sys_apply, sys_delete, fld_UDT, fld_prec ) 
	VALUES (N'Uf_Lname', N'nvarchar', NULL, NULL, NULL, NULL, 0, NULL, 50)
IF NOT EXISTS(SELECT * FROM user_fld WHERE fld_name = N'Uf_Tooling_200')
	INSERT INTO user_fld ( fld_name, fld_data_type, fld_initial, fld_decimals, fld_desc, sys_apply, sys_delete, fld_UDT, fld_prec ) 
	VALUES (N'Uf_Tooling_200', N'nvarchar', NULL, NULL, NULL, NULL, 0, NULL, 200)

-- Class/Fields
IF NOT EXISTS(SELECT * FROM user_class_fld WHERE class_name = N'Uc_ERPP_SK_Quotation' AND fld_name = N'Uf_UnitCode3')
	INSERT INTO user_class_fld ( class_name, fld_name, sys_apply, sys_delete ) 
	VALUES (N'Uc_ERPP_SK_Quotation', N'Uf_UnitCode3', NULL, 0)
/*
IF NOT EXISTS(SELECT * FROM user_class_fld WHERE class_name = N'Uc_ERPP_SK_Quotation' AND fld_name = N'Uf_CurrCode')
	INSERT INTO user_class_fld ( class_name, fld_name, sys_apply, sys_delete ) 
	VALUES (N'Uc_ERPP_SK_Quotation', N'Uf_CurrCode', NULL, 0)
*/
IF NOT EXISTS(SELECT * FROM user_class_fld WHERE class_name = N'Uc_ERPP_SK_Quotation' AND fld_name = N'Uf_AsOfDate')
	INSERT INTO user_class_fld ( class_name, fld_name, sys_apply, sys_delete ) 
	VALUES (N'Uc_ERPP_SK_Quotation', N'Uf_AsOfDate', NULL, 0)
IF NOT EXISTS(SELECT * FROM user_class_fld WHERE class_name = N'Uc_ERPP_SK_Quotation' AND fld_name = N'Uf_Project')
	INSERT INTO user_class_fld ( class_name, fld_name, sys_apply, sys_delete ) 
	VALUES (N'Uc_ERPP_SK_Quotation', N'Uf_Project', NULL, 0)
IF NOT EXISTS(SELECT * FROM user_class_fld WHERE class_name = N'Uc_ERPP_SK_Quotation' AND fld_name = N'Uf_DelDueDate')
	INSERT INTO user_class_fld ( class_name, fld_name, sys_apply, sys_delete ) 
	VALUES (N'Uc_ERPP_SK_Quotation', N'Uf_DelDueDate', NULL, 0)
IF NOT EXISTS(SELECT * FROM user_class_fld WHERE class_name = N'Uc_ERPP_SK_Quotation' AND fld_name = N'Uf_Approved')
	INSERT INTO user_class_fld ( class_name, fld_name, sys_apply, sys_delete )
	VALUES (N'Uc_ERPP_SK_Quotation', N'Uf_Approved', NULL, 0)
IF NOT EXISTS(SELECT * FROM user_class_fld WHERE class_name = N'Uc_ERPP_SK_Quotation' AND fld_name = N'Uf_ApprovedBy')
	INSERT INTO user_class_fld ( class_name, fld_name, sys_apply, sys_delete ) 
	VALUES (N'Uc_ERPP_SK_Quotation', N'Uf_ApprovedBy', NULL, 0)
IF NOT EXISTS(SELECT * FROM user_class_fld WHERE class_name = N'Uc_ERPP_SK_Quotation' AND fld_name = N'Uf_ApprovedDate')
	INSERT INTO user_class_fld ( class_name, fld_name, sys_apply, sys_delete ) 
	VALUES (N'Uc_ERPP_SK_Quotation', N'Uf_ApprovedDate', NULL, 0)
IF NOT EXISTS(SELECT * FROM user_class_fld WHERE class_name = N'Uc_ERPP_SK_Quotation' AND fld_name = N'Uf_Signature')
	INSERT INTO user_class_fld ( class_name, fld_name, sys_apply, sys_delete ) 
	VALUES (N'Uc_ERPP_SK_Quotation', N'Uf_Signature', NULL, 0)

IF NOT EXISTS(SELECT * FROM user_class_fld WHERE class_name = N'Uc_ERPP_SK_Quotation' AND fld_name = N'Uf_Fname')
	INSERT INTO user_class_fld ( class_name, fld_name, sys_apply, sys_delete ) 
	VALUES (N'Uc_ERPP_SK_Quotation', N'Uf_Fname', NULL, 0)
IF NOT EXISTS(SELECT * FROM user_class_fld WHERE class_name = N'Uc_ERPP_SK_Quotation' AND fld_name = N'Uf_Lname')
	INSERT INTO user_class_fld ( class_name, fld_name, sys_apply, sys_delete ) 
	VALUES (N'Uc_ERPP_SK_Quotation', N'Uf_Lname', NULL, 0)
IF NOT EXISTS(SELECT * FROM user_class_fld WHERE class_name = N'Uc_ERPP_SK_Quotation' AND fld_name = N'Uf_Tooling_200')
	INSERT INTO user_class_fld ( class_name, fld_name, sys_apply, sys_delete ) 
	VALUES (N'Uc_ERPP_SK_Quotation', N'Uf_Tooling_200', NULL, 0)
/*	
IF NOT EXISTS(SELECT * FROM user_class_fld WHERE class_name = N'Uc_Employee' AND fld_name = N'Uf_Signature')
	INSERT INTO user_class_fld ( class_name, fld_name, sys_apply, sys_delete ) 
	VALUES (N'Uc_Employee', N'Uf_Signature', NULL, 0)
IF NOT EXISTS(SELECT * FROM user_class_fld WHERE class_name = N'Uc_UserName' AND fld_name = N'Uf_Signature')
	INSERT INTO user_class_fld ( class_name, fld_name, sys_apply, sys_delete ) 
	VALUES (N'Uc_UserName', N'Uf_Signature', NULL, 0)
*/

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

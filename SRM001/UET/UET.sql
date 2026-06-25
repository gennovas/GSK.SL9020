SET NOCOUNT ON
GO

-- Class
IF NOT EXISTS(SELECT * FROM user_class WHERE class_name = N'Uc_fs_oper_code')
	INSERT INTO user_class ( class_name, class_label, class_desc, sys_has_fields, sys_has_tables, sys_apply, sys_delete ) 
	VALUES(N'Uc_fs_oper_code', NULL, NULL, 0, 0, NULL,  0)
IF NOT EXISTS(SELECT * FROM user_class WHERE class_name = N'Uc_fs_sro_oper')
	INSERT INTO user_class ( class_name, class_label, class_desc, sys_has_fields, sys_has_tables, sys_apply, sys_delete ) 
	VALUES(N'Uc_fs_sro_oper', NULL, NULL, 0, 0, NULL,  0)	

-- Class/Table
IF NOT EXISTS(SELECT * FROM table_class WHERE table_name = N'fs_oper_code_mst' AND class_name = N'Uc_fs_oper_code')
	INSERT INTO table_class ( table_name, class_name, table_rule, extend_all_recs, sys_apply, sys_delete, allow_record_assoc, active ) 
	VALUES (N'fs_oper_code_mst', N'Uc_fs_oper_code', NULL, 0, NULL, 0, 0, 1)
IF NOT EXISTS(SELECT * FROM table_class WHERE table_name = N'fs_sro_oper_mst' AND class_name = N'Uc_fs_sro_oper')
	INSERT INTO table_class ( table_name, class_name, table_rule, extend_all_recs, sys_apply, sys_delete, allow_record_assoc, active ) 
	VALUES (N'fs_sro_oper_mst', N'Uc_fs_sro_oper', NULL, 0, NULL, 0, 0, 1)

-- Fields
IF NOT EXISTS(SELECT * FROM user_fld WHERE fld_name = N'Uf_Description')
	INSERT INTO user_fld ( fld_name, fld_data_type, fld_initial, fld_decimals, fld_desc, sys_apply, sys_delete, fld_UDT, fld_prec ) 
	VALUES (N'Uf_Description', N'nvarchar', NULL, NULL, NULL, NULL, 0, NULL, 200)

-- Class/Fields
IF NOT EXISTS(SELECT * FROM user_class_fld WHERE class_name = N'Uc_fs_oper_code' AND fld_name = N'Uf_Description')
	INSERT INTO user_class_fld ( class_name, fld_name, sys_apply, sys_delete ) 
	VALUES (N'Uc_fs_oper_code', N'Uf_Description', NULL, 0)
IF NOT EXISTS(SELECT * FROM user_class_fld WHERE class_name = N'Uc_fs_sro_oper' AND fld_name = N'Uf_Description')
	INSERT INTO user_class_fld ( class_name, fld_name, sys_apply, sys_delete ) 
	VALUES (N'Uc_fs_sro_oper', N'Uf_Description', NULL, 0)	

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

SELECT @Infobar
GO

DECLARE	@SessionID RowPointerType

EXEC	[dbo].[InitSessionContextSp]
		@ContextName = NULL,
		@SessionID = @SessionID OUTPUT,
		@Site = 'SKP_Dev'

UPDATE fs_oper_code SET Uf_Description = description;
UPDATE fs_sro_oper SET Uf_Description = description;
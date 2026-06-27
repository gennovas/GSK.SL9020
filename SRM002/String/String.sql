SET NOCOUNT ON
GO

/*
    Issues 
    AppDemo 9.00.20 - ไม่มีฟิลด์ Description
*/
if not exists (select 1 from strings where ScopeType = '1' and name = 'fServiceOrders')
    insert into strings values ('fServiceOrders', '1', '[NULL]', '(GSK) Service Orders', NULL, NULL, NULL
--, NULL
)
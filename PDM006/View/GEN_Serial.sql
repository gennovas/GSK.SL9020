 


ALTER VIEW [dbo].[GEN_Serial]
AS SELECT [document_num]
        ,[sequence]
      ,[job]
      ,[suffix]
      ,[oper_num]
      ,[qty]
      ,[print_flag]
      ,[received_qty]
      ,[doc_date]
      ,[RecordDate]
      ,[RowPointer]
      ,[serial]
  FROM [dbo].[GEN_Serial_mst]
            WHERE site_ref = CAST(CONTEXT_INFO() AS NVARCHAR(8))
GO



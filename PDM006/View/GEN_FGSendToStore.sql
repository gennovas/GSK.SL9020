 

ALTER VIEW [dbo].[GEN_FGSendToStore]
AS SELECT [trans_num]
      ,[sequence]
      ,[document_date]
      ,[job]
      ,[suffix]
      ,[oper_num]
      ,[posted_qty]
      ,[sent_qty]
      ,[received_qty]
      ,[cur_send_qty]
      ,[cur_received_qty]
      ,[print_flag]
      ,[document_num]
      ,[process_id]
      ,[RecordDate]
      ,[RowPointer]
       
  FROM [dbo].[GEN_FGSendToStore_mst]
            WHERE site_ref = CAST(CONTEXT_INFO() AS NVARCHAR(8))
GO



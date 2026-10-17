CREATE VIEW [dbo].[GEN_SerialDel]
AS SELECT [document_num]
      ,[job]
      ,[suffix]
      ,[oper_num]
      ,[qty]
      ,[print_flag]
      ,[received_qty]
      ,[doc_date]
      ,[RecordDate]
      ,[RowPointer]
  FROM [dbo].[GEN_SerialDel_mst]
            WHERE site_ref = CAST(CONTEXT_INFO() AS NVARCHAR(8))
GO

/****** Object:  View [dbo].[GEN_Serial]    Script Date: 17/10/2026 5:50:23 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[GEN_Serial]
AS SELECT [document_num]
      ,[job]
      ,[suffix]
      ,[oper_num]
      ,[qty]
      ,[print_flag]
      ,[received_qty]
      ,[doc_date]
      ,[RecordDate]
      ,[RowPointer]
  FROM [dbo].[GEN_Serial_mst]
            WHERE site_ref = CAST(CONTEXT_INFO() AS NVARCHAR(8))
GO

/****** Object:  View [dbo].[GEN_SendToStoreDocNumber]    Script Date: 17/10/2026 5:50:23 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[GEN_SendToStoreDocNumber]
AS SELECT [from_whse]
      ,[to_bu]
      ,[doc_name]
      ,[prefix_01]
      ,[prefix_02]
      ,[prefix_03]
      ,[yy]
      ,[MM]
      ,[nn]
      ,[RecordDate]
      ,[RowPointer]
  FROM [dbo].[GEN_SendToStoreDocNumber_mst]
            WHERE site_ref = CAST(CONTEXT_INFO() AS NVARCHAR(8))
GO

/****** Object:  View [dbo].[GEN_FGSendToStore]    Script Date: 17/10/2026 5:50:23 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[GEN_FGSendToStore]
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
      ,[RecordDate]
      ,[RowPointer]
       
  FROM [dbo].[GEN_FGSendToStore_mst]
            WHERE site_ref = CAST(CONTEXT_INFO() AS NVARCHAR(8))
GO



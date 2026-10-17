 
CREATE TABLE [dbo].[GEN_FGSendToStore_mst](
	[site_ref] [dbo].[SiteType] NOT NULL,
	[trans_num] [dbo].[HugeTransNumType] NOT NULL,
	[sequence] [dbo].[SequenceType] NOT NULL,
	[document_date] [dbo].[DateTimeType] NOT NULL,
	[job] [dbo].[JobType] NOT NULL,
	[suffix] [dbo].[SuffixType] NOT NULL,
	[oper_num] [dbo].[OperNumType] NOT NULL,
	[posted_qty] [dbo].[QtyUnitType] NOT NULL,
	[sent_qty] [dbo].[QtyUnitType] NULL,
	[received_qty] [dbo].[QtyUnitType] NULL,
	[cur_send_qty] [dbo].[QtyUnitType] NULL,
	[cur_received_qty] [dbo].[QtyUnitType] NULL,
	[print_flag] [tinyint] NULL,
	[document_num] [dbo].[DocumentNumType] NOT NULL,
	[RecordDate] [dbo].[CurrentDateType] NOT NULL,
	[RowPointer] [dbo].[RowPointerType] NOT NULL,
	[CreatedBy] [dbo].[UsernameType] NOT NULL,
	[UpdatedBy] [dbo].[UsernameType] NOT NULL,
	[CreateDate] [dbo].[CurrentDateType] NOT NULL,
 CONSTRAINT [PK_GEN_FGSendToStore_mst_1] PRIMARY KEY CLUSTERED 
(
	[site_ref] ASC,
	[sequence] ASC,
	[document_num] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[GEN_SerialDel_mst]    Script Date: 17/10/2026 5:49:32 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[GEN_SerialDel_mst](
	[site_ref] [dbo].[SiteType] NOT NULL,
	[document_num] [dbo].[DocumentNumType] NOT NULL,
	[job] [dbo].[JobType] NOT NULL,
	[suffix] [dbo].[SuffixType] NOT NULL,
	[oper_num] [dbo].[OperNumType] NOT NULL,
	[qty] [dbo].[QtyUnitType] NOT NULL,
	[print_flag] [dbo].[ListYesNoType] NULL,
	[received_qty] [dbo].[QtyUnitType] NULL,
	[doc_date] [dbo].[DateTimeType] NOT NULL,
	[RecordDate] [dbo].[CurrentDateType] NOT NULL,
	[RowPointer] [dbo].[RowPointerType] NOT NULL,
	[CreatedBy] [dbo].[UsernameType] NOT NULL,
	[UpdatedBy] [dbo].[UsernameType] NOT NULL,
	[CreateDate] [dbo].[CurrentDateType] NOT NULL,
 CONSTRAINT [PK_GEN_SerialDel_mst] PRIMARY KEY CLUSTERED 
(
	[site_ref] ASC,
	[document_num] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[GEN_Serial_mst]    Script Date: 17/10/2026 5:49:32 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[GEN_Serial_mst](
	[site_ref] [dbo].[SiteType] NOT NULL,
	[document_num] [dbo].[DocumentNumType] NOT NULL,
	[job] [dbo].[JobType] NOT NULL,
	[suffix] [dbo].[SuffixType] NOT NULL,
	[oper_num] [dbo].[OperNumType] NOT NULL,
	[qty] [dbo].[QtyUnitType] NOT NULL,
	[print_flag] [dbo].[ListYesNoType] NULL,
	[received_qty] [dbo].[QtyUnitType] NULL,
	[doc_date] [dbo].[DateTimeType] NOT NULL,
	[RecordDate] [dbo].[CurrentDateType] NOT NULL,
	[RowPointer] [dbo].[RowPointerType] NOT NULL,
	[CreatedBy] [dbo].[UsernameType] NOT NULL,
	[UpdatedBy] [dbo].[UsernameType] NOT NULL,
	[CreateDate] [dbo].[CurrentDateType] NOT NULL,
 CONSTRAINT [PK_GEN_Serial_mst] PRIMARY KEY CLUSTERED 
(
	[site_ref] ASC,
	[document_num] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[GEN_SendToStoreDocNumber_mst]    Script Date: 17/10/2026 5:49:32 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[GEN_SendToStoreDocNumber_mst](
	[site_ref] [dbo].[SiteType] NOT NULL,
	[from_whse] [dbo].[WhseType] NOT NULL,
	[to_bu] [nvarchar](10) NOT NULL,
	[doc_name] [nvarchar](50) NOT NULL,
	[prefix_01] [char](2) NOT NULL,
	[prefix_02] [char](1) NOT NULL,
	[prefix_03] [char](1) NOT NULL,
	[yy] [char](2) NOT NULL,
	[MM] [char](2) NOT NULL,
	[nn] [char](4) NULL,
	[RecordDate] [dbo].[CurrentDateType] NOT NULL,
	[RowPointer] [dbo].[RowPointerType] NOT NULL,
	[CreatedBy] [dbo].[UsernameType] NOT NULL,
	[UpdatedBy] [dbo].[UsernameType] NOT NULL,
	[CreateDate] [dbo].[CurrentDateType] NOT NULL,
 CONSTRAINT [PK_GEN_SendToStoreDocNumber_mst] PRIMARY KEY CLUSTERED 
(
	[site_ref] ASC,
	[from_whse] ASC,
	[to_bu] ASC,
	[yy] ASC,
	[MM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[GEN_FGSendToStore_mst] ADD  CONSTRAINT [DF_GEN_FGSendToStore_mst_site_ref]  DEFAULT (rtrim(CONVERT([nvarchar](8),context_info(),(0)))) FOR [site_ref]
GO

ALTER TABLE [dbo].[GEN_FGSendToStore_mst] ADD  CONSTRAINT [DF_GEN_FGSendToStore_mst_RecordDate]  DEFAULT (getdate()) FOR [RecordDate]
GO

ALTER TABLE [dbo].[GEN_FGSendToStore_mst] ADD  CONSTRAINT [DF_GEN_FGSendToStore_mst_RowPointer]  DEFAULT (newid()) FOR [RowPointer]
GO

ALTER TABLE [dbo].[GEN_FGSendToStore_mst] ADD  CONSTRAINT [DF_GEN_FGSendToStore_mst_CreatedBy]  DEFAULT (suser_sname()) FOR [CreatedBy]
GO

ALTER TABLE [dbo].[GEN_FGSendToStore_mst] ADD  CONSTRAINT [DF_GEN_FGSendToStore_mst_UpdatedBy]  DEFAULT (suser_sname()) FOR [UpdatedBy]
GO

ALTER TABLE [dbo].[GEN_FGSendToStore_mst] ADD  CONSTRAINT [DF_GEN_FGSendToStore_mst_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO

ALTER TABLE [dbo].[GEN_SerialDel_mst] ADD  CONSTRAINT [DF_GEN_SerialDel_mst_site_ref]  DEFAULT (rtrim(CONVERT([nvarchar](8),context_info(),(0)))) FOR [site_ref]
GO

ALTER TABLE [dbo].[GEN_SerialDel_mst] ADD  CONSTRAINT [DF_GEN_SerialDel_mst_RecordDate]  DEFAULT (getdate()) FOR [RecordDate]
GO

ALTER TABLE [dbo].[GEN_SerialDel_mst] ADD  CONSTRAINT [DF_GEN_SerialDel_mst_RowPointer]  DEFAULT (newid()) FOR [RowPointer]
GO

ALTER TABLE [dbo].[GEN_SerialDel_mst] ADD  CONSTRAINT [DF_GEN_SerialDel_mst_CreatedBy]  DEFAULT (suser_sname()) FOR [CreatedBy]
GO

ALTER TABLE [dbo].[GEN_SerialDel_mst] ADD  CONSTRAINT [DF_GEN_SerialDel_mst_UpdatedBy]  DEFAULT (suser_sname()) FOR [UpdatedBy]
GO

ALTER TABLE [dbo].[GEN_SerialDel_mst] ADD  CONSTRAINT [DF_GEN_SerialDel_mst_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO

ALTER TABLE [dbo].[GEN_Serial_mst] ADD  CONSTRAINT [DF_GEN_Serial_mst_site_ref]  DEFAULT (rtrim(CONVERT([nvarchar](8),context_info(),(0)))) FOR [site_ref]
GO

ALTER TABLE [dbo].[GEN_Serial_mst] ADD  CONSTRAINT [DF_GEN_Serial_mst_RecordDate]  DEFAULT (getdate()) FOR [RecordDate]
GO

ALTER TABLE [dbo].[GEN_Serial_mst] ADD  CONSTRAINT [DF_GEN_Serial_mst_RowPointer]  DEFAULT (newid()) FOR [RowPointer]
GO

ALTER TABLE [dbo].[GEN_Serial_mst] ADD  CONSTRAINT [DF_GEN_Serial_mst_CreatedBy]  DEFAULT (suser_sname()) FOR [CreatedBy]
GO

ALTER TABLE [dbo].[GEN_Serial_mst] ADD  CONSTRAINT [DF_GEN_Serial_mst_UpdatedBy]  DEFAULT (suser_sname()) FOR [UpdatedBy]
GO

ALTER TABLE [dbo].[GEN_Serial_mst] ADD  CONSTRAINT [DF_GEN_Serial_mst_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO

ALTER TABLE [dbo].[GEN_SendToStoreDocNumber_mst] ADD  CONSTRAINT [DF_GEN_SendToStoreDocNumber_mst_site_ref]  DEFAULT (rtrim(CONVERT([nvarchar](8),context_info(),(0)))) FOR [site_ref]
GO

ALTER TABLE [dbo].[GEN_SendToStoreDocNumber_mst] ADD  CONSTRAINT [DF_GEN_SendToStoreDocNumber_mst_RecordDate]  DEFAULT (getdate()) FOR [RecordDate]
GO

ALTER TABLE [dbo].[GEN_SendToStoreDocNumber_mst] ADD  CONSTRAINT [DF_GEN_SendToStoreDocNumber_mst_RowPointer]  DEFAULT (newid()) FOR [RowPointer]
GO

ALTER TABLE [dbo].[GEN_SendToStoreDocNumber_mst] ADD  CONSTRAINT [DF_GEN_SendToStoreDocNumber_mst_CreatedBy]  DEFAULT (suser_sname()) FOR [CreatedBy]
GO

ALTER TABLE [dbo].[GEN_SendToStoreDocNumber_mst] ADD  CONSTRAINT [DF_GEN_SendToStoreDocNumber_mst_UpdatedBy]  DEFAULT (suser_sname()) FOR [UpdatedBy]
GO

ALTER TABLE [dbo].[GEN_SendToStoreDocNumber_mst] ADD  CONSTRAINT [DF_GEN_SendToStoreDocNumber_mst_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO



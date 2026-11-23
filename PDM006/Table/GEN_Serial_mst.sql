 
ALTER TABLE [dbo].[GEN_Serial_mst] DROP CONSTRAINT [DF_GEN_Serial_mst_CreateDate]
GO

ALTER TABLE [dbo].[GEN_Serial_mst] DROP CONSTRAINT [DF_GEN_Serial_mst_UpdatedBy]
GO

ALTER TABLE [dbo].[GEN_Serial_mst] DROP CONSTRAINT [DF_GEN_Serial_mst_CreatedBy]
GO

ALTER TABLE [dbo].[GEN_Serial_mst] DROP CONSTRAINT [DF_GEN_Serial_mst_RowPointer]
GO

ALTER TABLE [dbo].[GEN_Serial_mst] DROP CONSTRAINT [DF_GEN_Serial_mst_RecordDate]
GO

ALTER TABLE [dbo].[GEN_Serial_mst] DROP CONSTRAINT [DF_GEN_Serial_mst_site_ref]
GO

/****** Object:  Table [dbo].[GEN_Serial_mst]    Script Date: 21/11/2026 7:38:47 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GEN_Serial_mst]') AND type in (N'U'))
DROP TABLE [dbo].[GEN_Serial_mst]
GO

/****** Object:  Table [dbo].[GEN_Serial_mst]    Script Date: 21/11/2026 7:38:47 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[GEN_Serial_mst](
	[site_ref] [dbo].[SiteType] NOT NULL,
	[document_num] [dbo].[DocumentNumType] NOT NULL,
	[sequence] [nvarchar](3) NOT NULL,
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
	[serial] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_GEN_Serial_mst] PRIMARY KEY CLUSTERED 
(
	[site_ref] ASC,
	[serial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
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



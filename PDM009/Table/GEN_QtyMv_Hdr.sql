CREATE TABLE [dbo].[GEN_QtyMv_Hdr](
	[site_ref] [dbo].[SiteType] NOT NULL,
	[move_num] [dbo].[DocumentNumType] NOT NULL,
	[type] [nvarchar](3) NULL,
	[location_to] [dbo].[LocType] NULL,
	[trans_date] [dbo].[DateType] NULL,
	[whse] [dbo].[WhseType] NOT NULL,
	[stat] [nchar](1) NULL,
	[cust_vend_flag] [nchar](1) NULL,
	[cust_num] [nvarchar](7) NULL,
	[vend_num] [nvarchar](7) NULL,
	[remark] [nvarchar](400) NULL,
	[RequestDate] [dbo].[CurrentDateType] NULL,
	[from_site] [dbo].[SiteType] NOT NULL,
	[to_site] [dbo].[SiteType] NOT NULL,
	[to_whse] [dbo].[WhseType] NOT NULL,
	[NoteExistsFlag] [dbo].[FlagNyType] NOT NULL,
	[RecordDate] [dbo].[CurrentDateType] NOT NULL,
	[RowPointer] [dbo].[RowPointerType] NOT NULL,
	[CreatedBy] [dbo].[UsernameType] NOT NULL,
	[UpdatedBy] [dbo].[UsernameType] NOT NULL,
	[CreateDate] [dbo].[CurrentDateType] NOT NULL,
	[InWorkflow] [dbo].[FlagNyType] NOT NULL,
	[request_for] [nvarchar](50) NULL,
	[part_group] [nvarchar](30) NULL,
 CONSTRAINT [PK_GEN_QtyMv_Hdr] PRIMARY KEY CLUSTERED 
(
	[move_num] ASC,
	[site_ref] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_GEN_QtyMv_Hdr_RowPointer] UNIQUE NONCLUSTERED 
(
	[RowPointer] ASC,
	[site_ref] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[GEN_QtyMv_Hdr] ADD  CONSTRAINT [DF_GEN_QtyMv_Hdr_site_ref]  DEFAULT (rtrim(CONVERT([nvarchar](8),context_info(),(0)))) FOR [site_ref]
GO

ALTER TABLE [dbo].[GEN_QtyMv_Hdr] ADD  CONSTRAINT [DF__GEN_QtyMv___stat__02775A02]  DEFAULT (N'P') FOR [stat]
GO

ALTER TABLE [dbo].[GEN_QtyMv_Hdr] ADD  CONSTRAINT [DF__GEN_QtyMv__cust___036B7E3B]  DEFAULT (N'N') FOR [cust_vend_flag]
GO

ALTER TABLE [dbo].[GEN_QtyMv_Hdr] ADD  CONSTRAINT [DF_GEN_QtyMv_Hdr_RecordDate1]  DEFAULT (getdate()) FOR [RequestDate]
GO

ALTER TABLE [dbo].[GEN_QtyMv_Hdr] ADD  CONSTRAINT [DF_GEN_QtyMv_Hdr_NoteExistsFlag]  DEFAULT ((0)) FOR [NoteExistsFlag]
GO

ALTER TABLE [dbo].[GEN_QtyMv_Hdr] ADD  CONSTRAINT [DF_GEN_QtyMv_Hdr_RecordDate]  DEFAULT (getdate()) FOR [RecordDate]
GO

ALTER TABLE [dbo].[GEN_QtyMv_Hdr] ADD  CONSTRAINT [DF_GEN_QtyMv_Hdr_RowPointer]  DEFAULT (newid()) FOR [RowPointer]
GO

ALTER TABLE [dbo].[GEN_QtyMv_Hdr] ADD  CONSTRAINT [DF_GEN_QtyMv_Hdr_CreatedBy]  DEFAULT (suser_sname()) FOR [CreatedBy]
GO

ALTER TABLE [dbo].[GEN_QtyMv_Hdr] ADD  CONSTRAINT [DF_GEN_QtyMv_Hdr_UpdatedBy]  DEFAULT (suser_sname()) FOR [UpdatedBy]
GO

ALTER TABLE [dbo].[GEN_QtyMv_Hdr] ADD  CONSTRAINT [DF_GEN_QtyMv_Hdr_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO

ALTER TABLE [dbo].[GEN_QtyMv_Hdr] ADD  CONSTRAINT [DF_GEN_QtyMv_Hdr_InWorkflow]  DEFAULT ((0)) FOR [InWorkflow]
GO



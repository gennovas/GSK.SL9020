 

CREATE TABLE [dbo].[GEN_QtyMv_Dtl](
	[site_ref] [dbo].[SiteType] NOT NULL,
	[move_num] [dbo].[DocumentNumType] NOT NULL,
	[line_num] [smallint] NOT NULL,
	[item] [dbo].[ItemType] NULL,
	[qty] [dbo].[QtyUnitType] NULL,
	[qty_unit] [dbo].[QtyUnitType] NULL,
	[qty_set] [dbo].[QtyUnitType] NULL,
	[location_from] [dbo].[LocType] NULL,
	[remark] [nvarchar](400) NULL,
	[trans_num_from] [dbo].[MatlTransNumType] NULL,
	[trans_num_to] [dbo].[MatlTransNumType] NULL,
	[NoteExistsFlag] [dbo].[FlagNyType] NOT NULL,
	[RecordDate] [dbo].[CurrentDateType] NOT NULL,
	[RowPointer] [dbo].[RowPointerType] NOT NULL,
	[CreatedBy] [dbo].[UsernameType] NOT NULL,
	[UpdatedBy] [dbo].[UsernameType] NOT NULL,
	[CreateDate] [dbo].[CurrentDateType] NOT NULL,
	[InWorkflow] [dbo].[FlagNyType] NOT NULL,
	[state] [nchar](1) NULL,
	[message] [nchar](200) NULL,
	[qty_issuse] [dbo].[QtyUnitType] NULL,
	[qty_select_lot] [dbo].[QtyUnitType] NULL,
	[qty_onHand] [dbo].[QtyUnitType] NULL,
 CONSTRAINT [PK_GEN_QtyMv_Dtl] PRIMARY KEY CLUSTERED 
(
	[move_num] ASC,
	[line_num] ASC,
	[site_ref] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_GEN_QtyMv_Dtl_RowPointer] UNIQUE NONCLUSTERED 
(
	[RowPointer] ASC,
	[site_ref] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[GEN_QtyMv_Dtl] ADD  CONSTRAINT [DF_GEN_QtyMv_Dtl_site_ref]  DEFAULT (rtrim(CONVERT([nvarchar](8),context_info(),(0)))) FOR [site_ref]
GO

ALTER TABLE [dbo].[GEN_QtyMv_Dtl] ADD  CONSTRAINT [DF_GEN_QtyMv_Dtl_NoteExistsFlag]  DEFAULT ((0)) FOR [NoteExistsFlag]
GO

ALTER TABLE [dbo].[GEN_QtyMv_Dtl] ADD  CONSTRAINT [DF_GEN_QtyMv_Dtl_RecordDate]  DEFAULT (getdate()) FOR [RecordDate]
GO

ALTER TABLE [dbo].[GEN_QtyMv_Dtl] ADD  CONSTRAINT [DF_GEN_QtyMv_Dtl_RowPointer]  DEFAULT (newid()) FOR [RowPointer]
GO

ALTER TABLE [dbo].[GEN_QtyMv_Dtl] ADD  CONSTRAINT [DF_GEN_QtyMv_Dtl_CreatedBy]  DEFAULT (suser_sname()) FOR [CreatedBy]
GO

ALTER TABLE [dbo].[GEN_QtyMv_Dtl] ADD  CONSTRAINT [DF_GEN_QtyMv_Dtl_UpdatedBy]  DEFAULT (suser_sname()) FOR [UpdatedBy]
GO

ALTER TABLE [dbo].[GEN_QtyMv_Dtl] ADD  CONSTRAINT [DF_GEN_QtyMv_Dtl_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO

ALTER TABLE [dbo].[GEN_QtyMv_Dtl] ADD  CONSTRAINT [DF_GEN_QtyMv_Dtl_InWorkflow]  DEFAULT ((0)) FOR [InWorkflow]
GO



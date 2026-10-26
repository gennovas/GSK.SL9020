 

CREATE TABLE [dbo].[GEN_MvType](
	[site_ref] [dbo].[SiteType] NOT NULL,
	[MvType] [dbo].[LTHWithholdingTaxType] NOT NULL,
	[description] [dbo].[DescriptionType] NULL,
	[NoteExistsFlag] [dbo].[FlagNyType] NOT NULL,
	[RecordDate] [dbo].[CurrentDateType] NOT NULL,
	[RowPointer] [dbo].[RowPointerType] NOT NULL,
	[CreatedBy] [dbo].[UsernameType] NOT NULL,
	[UpdatedBy] [dbo].[UsernameType] NOT NULL,
	[CreateDate] [dbo].[CurrentDateType] NOT NULL,
	[InWorkflow] [dbo].[FlagNyType] NOT NULL,
 CONSTRAINT [PK_GEN_MvType] PRIMARY KEY CLUSTERED 
(
	[MvType] ASC,
	[site_ref] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_GEN_MvType_RowPointer] UNIQUE NONCLUSTERED 
(
	[RowPointer] ASC,
	[site_ref] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[GEN_MvType] ADD  CONSTRAINT [DF_GEN_MvType_site_ref]  DEFAULT (rtrim(CONVERT([nvarchar](8),context_info(),(0)))) FOR [site_ref]
GO

ALTER TABLE [dbo].[GEN_MvType] ADD  CONSTRAINT [DF_GEN_MvType_NoteExistsFlag]  DEFAULT ((0)) FOR [NoteExistsFlag]
GO

ALTER TABLE [dbo].[GEN_MvType] ADD  CONSTRAINT [DF_GEN_MvType_RecordDate]  DEFAULT (getdate()) FOR [RecordDate]
GO

ALTER TABLE [dbo].[GEN_MvType] ADD  CONSTRAINT [DF_GEN_MvType_RowPointer]  DEFAULT (newid()) FOR [RowPointer]
GO

ALTER TABLE [dbo].[GEN_MvType] ADD  CONSTRAINT [DF_GEN_MvType_CreatedBy]  DEFAULT (suser_sname()) FOR [CreatedBy]
GO

ALTER TABLE [dbo].[GEN_MvType] ADD  CONSTRAINT [DF_GEN_MvType_UpdatedBy]  DEFAULT (suser_sname()) FOR [UpdatedBy]
GO

ALTER TABLE [dbo].[GEN_MvType] ADD  CONSTRAINT [DF_GEN_MvType_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO

ALTER TABLE [dbo].[GEN_MvType] ADD  CONSTRAINT [DF_GEN_MvType_InWorkflow]  DEFAULT ((0)) FOR [InWorkflow]
GO



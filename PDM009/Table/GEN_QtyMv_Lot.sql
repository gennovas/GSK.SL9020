 

CREATE TABLE [dbo].[GEN_QtyMv_Lot](
	[site_ref] [dbo].[SiteType] NOT NULL,
	[move_num] [dbo].[DocumentNumType] NOT NULL,
	[line_num] [smallint] NOT NULL,
	[lot] [dbo].[LotType] NOT NULL,
	[item] [dbo].[ItemType] NULL,
	[qty_select] [dbo].[QtyUnitType] NULL,
	[state] [nchar](1) NULL,
	[RecordDate] [dbo].[CurrentDateType] NOT NULL,
	[RowPointer] [dbo].[RowPointerType] NOT NULL,
	[UpdatedBy] [dbo].[UsernameType] NOT NULL,
	[qty_onhand] [dbo].[QtyUnitType] NULL,
 CONSTRAINT [PK_GEN_QtyMv_Lot_1] PRIMARY KEY CLUSTERED 
(
	[site_ref] ASC,
	[move_num] ASC,
	[line_num] ASC,
	[lot] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_GEN_QtyMv_Lot_RowPointer] UNIQUE NONCLUSTERED 
(
	[RowPointer] ASC,
	[site_ref] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[GEN_QtyMv_Lot] ADD  CONSTRAINT [DF_GEN_QtyMv_Lot_site_ref]  DEFAULT (rtrim(CONVERT([nvarchar](8),context_info(),(0)))) FOR [site_ref]
GO

ALTER TABLE [dbo].[GEN_QtyMv_Lot] ADD  CONSTRAINT [DF_GEN_QtyMv_Lot_RecordDate]  DEFAULT (getdate()) FOR [RecordDate]
GO

ALTER TABLE [dbo].[GEN_QtyMv_Lot] ADD  CONSTRAINT [DF_GEN_QtyMv_Lot_RowPointer]  DEFAULT (newid()) FOR [RowPointer]
GO

ALTER TABLE [dbo].[GEN_QtyMv_Lot] ADD  CONSTRAINT [DF_GEN_QtyMv_Lot_UpdatedBy]  DEFAULT (suser_sname()) FOR [UpdatedBy]
GO



 
CREATE TABLE [dbo].[GEN_QtyMoveGroupItem](
	[site_ref] [dbo].[SiteType] NOT NULL,
	[move_number] [dbo].[DocumentNumType] NOT NULL,
	[job] [dbo].[JobType] NOT NULL,
	[suffix] [dbo].[SuffixType] NOT NULL,
	[oper_num] [dbo].[OperNumType] NOT NULL,
	[seq] [int] NOT NULL,
	[item] [dbo].[ItemType] NOT NULL,
	[qty_set] [dbo].[QtyPerType] NULL,
	[matl_qty] [dbo].[QtyPerType] NULL,
	[cost] [dbo].[CostPrcType] NULL,
	[total_qty] [dbo].[CostPrcType] NULL,
	[u_m] [dbo].[UMType] NULL,
	[RowPointer] [dbo].[RowPointerType] NOT NULL,
	[CreatedBy] [dbo].[UsernameType] NOT NULL,
	[selected] [nchar](1) NULL,
 CONSTRAINT [PK_GEN_QtyMoveGroupItem_1] PRIMARY KEY CLUSTERED 
(
	[site_ref] ASC,
	[move_number] ASC,
	[job] ASC,
	[suffix] ASC,
	[oper_num] ASC,
	[seq] ASC,
	[item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[GEN_QtyMoveGroupItem] ADD  CONSTRAINT [DF_GEN_QtyMoveGroupItem_site_ref]  DEFAULT (rtrim(CONVERT([nvarchar](8),context_info(),(0)))) FOR [site_ref]
GO

ALTER TABLE [dbo].[GEN_QtyMoveGroupItem] ADD  CONSTRAINT [DF_GEN_QtyMoveGroupItem_suffix]  DEFAULT ((0)) FOR [suffix]
GO

ALTER TABLE [dbo].[GEN_QtyMoveGroupItem] ADD  CONSTRAINT [DF_GEN_QtyMoveGroupItem_oper_num]  DEFAULT ((0)) FOR [oper_num]
GO

ALTER TABLE [dbo].[GEN_QtyMoveGroupItem] ADD  CONSTRAINT [DF_Table_1_matl_qty1]  DEFAULT ((1)) FOR [qty_set]
GO

ALTER TABLE [dbo].[GEN_QtyMoveGroupItem] ADD  CONSTRAINT [DF_GEN_QtyMoveGroupItem_matl_qty]  DEFAULT ((1)) FOR [matl_qty]
GO

ALTER TABLE [dbo].[GEN_QtyMoveGroupItem] ADD  CONSTRAINT [DF_GEN_QtyMoveGroupItem_cost]  DEFAULT ((0)) FOR [cost]
GO

ALTER TABLE [dbo].[GEN_QtyMoveGroupItem] ADD  CONSTRAINT [DF_Table_1_cost1]  DEFAULT ((0)) FOR [total_qty]
GO

ALTER TABLE [dbo].[GEN_QtyMoveGroupItem] ADD  CONSTRAINT [DF_GEN_QtyMoveGroupItem_RowPointer]  DEFAULT (newid()) FOR [RowPointer]
GO

ALTER TABLE [dbo].[GEN_QtyMoveGroupItem] ADD  CONSTRAINT [DF_GEN_QtyMoveGroupItem_CreatedBy]  DEFAULT (suser_sname()) FOR [CreatedBy]
GO



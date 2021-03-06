CREATE TABLE [dbo].[item](
	[id] [decimal](18, 0) IDENTITY(50001,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[category] [nvarchar](50) NULL,
	[store_id] [decimal](18, 0) NULL,
	[reserve] [decimal](6, 0) NULL,
	[price] [decimal](10, 0) NULL,
	[detail] [nvarchar](1000) NULL,
	[coverImage] [varbinary](MAX) NULL,
	[fileName] [varchar](255) NULL,
 CONSTRAINT [PK_item] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

------------------------------------------------------

SET IDENTITY_INSERT [dbo].[item] ON 

INSERT [dbo].[item] ([id], [name], [category], [store_id], [reserve], [price], [detail], [coverImage], [fileName]) VALUES (CAST(50001 AS Decimal(18, 0)), N'澎湖大生蠔', N'團購美食', CAST(20002 AS Decimal(18, 0)), CAST(20 AS Decimal(6, 0)), CAST(250 AS Decimal(10, 0)), N'澎湖來的，野生生蠔，非養殖', Null, Null)
INSERT [dbo].[item] ([id], [name], [category], [store_id], [reserve], [price], [detail], [coverImage], [fileName]) VALUES (CAST(50002 AS Decimal(18, 0)), N'護唇膏', N'保養美妝', CAST(20002 AS Decimal(18, 0)), CAST(50 AS Decimal(6, 0)), CAST(120 AS Decimal(10, 0)), N'嘴唇永不乾燥', Null, Null)
INSERT [dbo].[item] ([id], [name], [category], [store_id], [reserve], [price], [detail], [coverImage], [fileName]) VALUES (CAST(50003 AS Decimal(18, 0)), N'珍珠項鍊', N'服飾配件', CAST(20002 AS Decimal(18, 0)), CAST(13 AS Decimal(6, 0)), CAST(150 AS Decimal(10, 0)), N'有夠他媽大顆的珍珠', Null, Null)
INSERT [dbo].[item] ([id], [name], [category], [store_id], [reserve], [price], [detail], [coverImage], [fileName]) VALUES (CAST(50004 AS Decimal(18, 0)), N'奶嘴', N'育兒親子', CAST(20001 AS Decimal(18, 0)), CAST(5 AS Decimal(6, 0)), CAST(600 AS Decimal(10, 0)), N'母豬母豬 夜裡哭哭 寶寶吸了都不哭', Null, Null)
INSERT [dbo].[item] ([id], [name], [category], [store_id], [reserve], [price], [detail], [coverImage], [fileName]) VALUES (CAST(50005 AS Decimal(18, 0)), N'檸檬塔', N'團購美食', CAST(20001 AS Decimal(18, 0)), CAST(15 AS Decimal(6, 0)), CAST(80 AS Decimal(10, 0)), N'檸檬的好滋味讓人難忘，搭配特製奶油製成的檸檬餡，讓人欲罷不能', Null, Null)
SET IDENTITY_INSERT [dbo].[item] OFF

USE [easybuy]
go
CREATE TABLE [dbo].[easybuy_user](
	[EU_USER_ID] [varchar](10) NOT NULL,
	[EU_USER_NAME] [varchar](20) NOT NULL,
	[EU_PASSWORD] [varchar](20) NOT NULL,
	[EU_SEX] [varchar](1) NOT NULL,
	[EU_BIRTHDAY] [date] NULL,
	[EU_IDENTITY_CODE] [varchar](60) NULL,
	[EU_EMAIL] [varchar](80) NULL,
	[EU_MOBILE] [varchar](11) NULL,
	[EU_ADDRESS] [varchar](200) NULL,
	[EU_STATUS] [int] NOT NULL,
	[EU_LOGIN] [real] NULL,
PRIMARY KEY CLUSTERED 
(
	[EU_USER_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[easybuy_user] ([EU_USER_ID], [EU_USER_NAME], [EU_PASSWORD], [EU_SEX], [EU_BIRTHDAY], [EU_IDENTITY_CODE], [EU_EMAIL], [EU_MOBILE], [EU_ADDRESS], [EU_STATUS], [EU_LOGIN]) VALUES (N'admin', N'管理员', N'admin', N'T', CAST(0xF20B0B00 AS Date), N'130406198302141869', N'hello@bdqn.com', N'15812345678', N'北京市海淀区成府路207号', 2, 1)
INSERT [dbo].[easybuy_user] ([EU_USER_ID], [EU_USER_NAME], [EU_PASSWORD], [EU_SEX], [EU_BIRTHDAY], [EU_IDENTITY_CODE], [EU_EMAIL], [EU_MOBILE], [EU_ADDRESS], [EU_STATUS], [EU_LOGIN]) VALUES (N'jack', N'杰克', N'jack', N'T', NULL, N'', N'hello@163.com', N'13040612354', N'河北省邯郸市和平路39号', 1, 0)
INSERT [dbo].[easybuy_user] ([EU_USER_ID], [EU_USER_NAME], [EU_PASSWORD], [EU_SEX], [EU_BIRTHDAY], [EU_IDENTITY_CODE], [EU_EMAIL], [EU_MOBILE], [EU_ADDRESS], [EU_STATUS], [EU_LOGIN]) VALUES (N'tim', N'汤姆', N'tom', N'T', NULL, N'', N'hello@163.com', N'18715971356', N'河南省安阳市和平路39号', 1, 0)
/****** Object:  Table [dbo].[easybuy_product_category]    Script Date: 12/18/2015 22:23:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[easybuy_product_category](
	[EPC_ID] [int] IDENTITY(1,1) NOT NULL,
	[EPC_NAME] [varchar](20) NOT NULL,
	[EPC_PARENT_ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EPC_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[easybuy_product_category] ON
INSERT [dbo].[easybuy_product_category] ([EPC_ID], [EPC_NAME], [EPC_PARENT_ID]) VALUES (542, N'图书', 542)
INSERT [dbo].[easybuy_product_category] ([EPC_ID], [EPC_NAME], [EPC_PARENT_ID]) VALUES (545, N'生活用品', 545)
INSERT [dbo].[easybuy_product_category] ([EPC_ID], [EPC_NAME], [EPC_PARENT_ID]) VALUES (546, N'少儿图书', 542)
INSERT [dbo].[easybuy_product_category] ([EPC_ID], [EPC_NAME], [EPC_PARENT_ID]) VALUES (548, N'化妆品', 545)
INSERT [dbo].[easybuy_product_category] ([EPC_ID], [EPC_NAME], [EPC_PARENT_ID]) VALUES (626, N'厨房用品', 545)
INSERT [dbo].[easybuy_product_category] ([EPC_ID], [EPC_NAME], [EPC_PARENT_ID]) VALUES (628, N'家用电器', 545)
INSERT [dbo].[easybuy_product_category] ([EPC_ID], [EPC_NAME], [EPC_PARENT_ID]) VALUES (631, N'青年图书', 542)
INSERT [dbo].[easybuy_product_category] ([EPC_ID], [EPC_NAME], [EPC_PARENT_ID]) VALUES (632, N'服饰', 632)
INSERT [dbo].[easybuy_product_category] ([EPC_ID], [EPC_NAME], [EPC_PARENT_ID]) VALUES (637, N'上装', 632)
INSERT [dbo].[easybuy_product_category] ([EPC_ID], [EPC_NAME], [EPC_PARENT_ID]) VALUES (638, N'下装', 632)
SET IDENTITY_INSERT [dbo].[easybuy_product_category] OFF
/****** Object:  Table [dbo].[easybuy_product]    Script Date: 12/18/2015 22:23:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[easybuy_product](
	[EP_ID] [int] IDENTITY(1,1) NOT NULL,
	[EP_NAME] [varchar](20) NOT NULL,
	[EP_DESCRIPTION] [varchar](100) NULL,
	[EP_PRICE] [float] NOT NULL,
	[EP_STOCK] [int] NOT NULL,
	[EPC_ID] [int] NULL,
	[EPC_CHILD_ID] [int] NULL,
	[EP_FILE_NAME] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[EP_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[easybuy_product] ON
INSERT [dbo].[easybuy_product] ([EP_ID], [EP_NAME], [EP_DESCRIPTION], [EP_PRICE], [EP_STOCK], [EPC_ID], [EPC_CHILD_ID], [EP_FILE_NAME]) VALUES (591, N'画册', N'画册', 100, 0, 542, 546, N'1.jpg')
INSERT [dbo].[easybuy_product] ([EP_ID], [EP_NAME], [EP_DESCRIPTION], [EP_PRICE], [EP_STOCK], [EPC_ID], [EPC_CHILD_ID], [EP_FILE_NAME]) VALUES (592, N'饭盒', N'韩国风格', 200, 1979, 626, 626, N'2.jpg')
INSERT [dbo].[easybuy_product] ([EP_ID], [EP_NAME], [EP_DESCRIPTION], [EP_PRICE], [EP_STOCK], [EPC_ID], [EPC_CHILD_ID], [EP_FILE_NAME]) VALUES (593, N'护肤王', N'女士专用', 300, 29984, 545, 548, N'596.jpg')
INSERT [dbo].[easybuy_product] ([EP_ID], [EP_NAME], [EP_DESCRIPTION], [EP_PRICE], [EP_STOCK], [EPC_ID], [EPC_CHILD_ID], [EP_FILE_NAME]) VALUES (601, N'奶粉', N'三元', 98, 189, 626, 626, N'601.jpg')
INSERT [dbo].[easybuy_product] ([EP_ID], [EP_NAME], [EP_DESCRIPTION], [EP_PRICE], [EP_STOCK], [EPC_ID], [EPC_CHILD_ID], [EP_FILE_NAME]) VALUES (639, N'旅行包', N'旅行包', 415, 7, 545, 628, N'639.jpg')
INSERT [dbo].[easybuy_product] ([EP_ID], [EP_NAME], [EP_DESCRIPTION], [EP_PRICE], [EP_STOCK], [EPC_ID], [EPC_CHILD_ID], [EP_FILE_NAME]) VALUES (643, N'项链', N'饰品', 300, 2990, 545, 548, N'643.jpg')
INSERT [dbo].[easybuy_product] ([EP_ID], [EP_NAME], [EP_DESCRIPTION], [EP_PRICE], [EP_STOCK], [EPC_ID], [EPC_CHILD_ID], [EP_FILE_NAME]) VALUES (645, N'丝袜', N'女士', 50, 500, 632, 638, N'645.jpg')
INSERT [dbo].[easybuy_product] ([EP_ID], [EP_NAME], [EP_DESCRIPTION], [EP_PRICE], [EP_STOCK], [EPC_ID], [EPC_CHILD_ID], [EP_FILE_NAME]) VALUES (660, N'显示器', N'三星', 1988, 1999, 628, 628, N'660.jpg')
INSERT [dbo].[easybuy_product] ([EP_ID], [EP_NAME], [EP_DESCRIPTION], [EP_PRICE], [EP_STOCK], [EPC_ID], [EPC_CHILD_ID], [EP_FILE_NAME]) VALUES (663, N'液晶屏', N'纯平液晶显示器', 590, 2, 628, 628, N'663.jpg')
INSERT [dbo].[easybuy_product] ([EP_ID], [EP_NAME], [EP_DESCRIPTION], [EP_PRICE], [EP_STOCK], [EPC_ID], [EPC_CHILD_ID], [EP_FILE_NAME]) VALUES (667, N'阿甘正传', N'阿甘正传', 50, 120, 542, 631, N'667.jpg')
INSERT [dbo].[easybuy_product] ([EP_ID], [EP_NAME], [EP_DESCRIPTION], [EP_PRICE], [EP_STOCK], [EPC_ID], [EPC_CHILD_ID], [EP_FILE_NAME]) VALUES (669, N'哈利波特', N'哈利波特', 78, 90, 542, 631, N'669.jpg')
INSERT [dbo].[easybuy_product] ([EP_ID], [EP_NAME], [EP_DESCRIPTION], [EP_PRICE], [EP_STOCK], [EPC_ID], [EPC_CHILD_ID], [EP_FILE_NAME]) VALUES (680, N'裤子', N'裤子', 45, 55, 632, 638, N'680.jpg')
INSERT [dbo].[easybuy_product] ([EP_ID], [EP_NAME], [EP_DESCRIPTION], [EP_PRICE], [EP_STOCK], [EPC_ID], [EPC_CHILD_ID], [EP_FILE_NAME]) VALUES (681, N'电饼铛', N'电饼铛', 78, 150, 545, 626, N'10.jpg')
INSERT [dbo].[easybuy_product] ([EP_ID], [EP_NAME], [EP_DESCRIPTION], [EP_PRICE], [EP_STOCK], [EPC_ID], [EPC_CHILD_ID], [EP_FILE_NAME]) VALUES (682, N'电饼盛', N'电饼盛', 124, 500, 545, 626, N'682.jpg')
INSERT [dbo].[easybuy_product] ([EP_ID], [EP_NAME], [EP_DESCRIPTION], [EP_PRICE], [EP_STOCK], [EPC_ID], [EPC_CHILD_ID], [EP_FILE_NAME]) VALUES (683, N'烤铛', N'烤铛', 340, 20, 545, 626, N'683.jpg')
INSERT [dbo].[easybuy_product] ([EP_ID], [EP_NAME], [EP_DESCRIPTION], [EP_PRICE], [EP_STOCK], [EPC_ID], [EPC_CHILD_ID], [EP_FILE_NAME]) VALUES (685, N'阿凡达', N'阿凡达', 34, 445, 542, NULL, N'685.jpg')
INSERT [dbo].[easybuy_product] ([EP_ID], [EP_NAME], [EP_DESCRIPTION], [EP_PRICE], [EP_STOCK], [EPC_ID], [EPC_CHILD_ID], [EP_FILE_NAME]) VALUES (693, N'化妆刷', N'Estee Lauder雅诗兰黛金色水晶化妆刷四件套刷 (限量特卖)支持货到付款', 58, 21, 545, 548, N'693.jpg')
INSERT [dbo].[easybuy_product] ([EP_ID], [EP_NAME], [EP_DESCRIPTION], [EP_PRICE], [EP_STOCK], [EPC_ID], [EPC_CHILD_ID], [EP_FILE_NAME]) VALUES (694, N'睫毛膏', N'Maybelline美宝莲 巨密睫毛膏9.2ml送睫毛夹超值装正规品牌授权', 71.2, 23, 545, 548, N'694.jpg')
INSERT [dbo].[easybuy_product] ([EP_ID], [EP_NAME], [EP_DESCRIPTION], [EP_PRICE], [EP_STOCK], [EPC_ID], [EPC_CHILD_ID], [EP_FILE_NAME]) VALUES (695, N'指甲套装', N'日美美容9件指甲套装（77005） 指甲钳刀口锋利、防锈能力强', 89.5, 24, 545, 548, N'695.jpg')
INSERT [dbo].[easybuy_product] ([EP_ID], [EP_NAME], [EP_DESCRIPTION], [EP_PRICE], [EP_STOCK], [EPC_ID], [EPC_CHILD_ID], [EP_FILE_NAME]) VALUES (696, N'梳子', N'Silky Beauty 丝妍 化妆梳子', 19.9, 25, 545, 548, N'696.jpg')
INSERT [dbo].[easybuy_product] ([EP_ID], [EP_NAME], [EP_DESCRIPTION], [EP_PRICE], [EP_STOCK], [EPC_ID], [EPC_CHILD_ID], [EP_FILE_NAME]) VALUES (697, N'粉扑', N'Silky Beauty 丝妍 化妆粉扑(耐油磨边2个装)', 9.9, 26, 545, 548, N'697.jpg')
INSERT [dbo].[easybuy_product] ([EP_ID], [EP_NAME], [EP_DESCRIPTION], [EP_PRICE], [EP_STOCK], [EPC_ID], [EPC_CHILD_ID], [EP_FILE_NAME]) VALUES (698, N'棉签', N'Silky Beauty 丝妍 美容棉签 ', 7.9, 27, 545, 548, N'698.jpg')
INSERT [dbo].[easybuy_product] ([EP_ID], [EP_NAME], [EP_DESCRIPTION], [EP_PRICE], [EP_STOCK], [EPC_ID], [EPC_CHILD_ID], [EP_FILE_NAME]) VALUES (699, N'随身镜', N'Anna Sui安娜苏魔幻随身镜', 165, 28, 5445, 548, N'699.jpg')
SET IDENTITY_INSERT [dbo].[easybuy_product] OFF
/****** Object:  Table [dbo].[easybuy_order_detail]    Script Date: 12/18/2015 22:23:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[easybuy_order_detail](
	[EOD_ID] [int] IDENTITY(1,1) NOT NULL,
	[EO_ID] [int] NOT NULL,
	[EP_ID] [int] NOT NULL,
	[EOD_QUANTITY] [int] NOT NULL,
	[EOD_COST] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EOD_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[easybuy_order_detail] ON
INSERT [dbo].[easybuy_order_detail] ([EOD_ID], [EO_ID], [EP_ID], [EOD_QUANTITY], [EOD_COST]) VALUES (800, 8, 591, 1, 100)
INSERT [dbo].[easybuy_order_detail] ([EOD_ID], [EO_ID], [EP_ID], [EOD_QUANTITY], [EOD_COST]) VALUES (801, 9, 592, 1, 200)
INSERT [dbo].[easybuy_order_detail] ([EOD_ID], [EO_ID], [EP_ID], [EOD_QUANTITY], [EOD_COST]) VALUES (802, 10, 593, 1, 300)
INSERT [dbo].[easybuy_order_detail] ([EOD_ID], [EO_ID], [EP_ID], [EOD_QUANTITY], [EOD_COST]) VALUES (803, 11, 639, 2, 830)
INSERT [dbo].[easybuy_order_detail] ([EOD_ID], [EO_ID], [EP_ID], [EOD_QUANTITY], [EOD_COST]) VALUES (804, 12, 643, 1, 300)
INSERT [dbo].[easybuy_order_detail] ([EOD_ID], [EO_ID], [EP_ID], [EOD_QUANTITY], [EOD_COST]) VALUES (805, 12, 660, 1, 1988)
SET IDENTITY_INSERT [dbo].[easybuy_order_detail] OFF
/****** Object:  Table [dbo].[easybuy_order]    Script Date: 12/18/2015 22:23:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[easybuy_order](
	[EO_ID] [int] IDENTITY(1,1) NOT NULL,
	[EO_USER_ID] [varchar](10) NOT NULL,
	[EO_USER_NAME] [varchar](20) NULL,
	[EO_USER_ADDRESS] [varchar](200) NULL,
	[EO_CREATE_TIME] [datetime] NOT NULL,
	[EO_COST] [float] NOT NULL,
	[EO_STATUS] [int] NOT NULL,
	[EO_TYPE] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EO_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[easybuy_order] ON
INSERT [dbo].[easybuy_order] ([EO_ID], [EO_USER_ID], [EO_USER_NAME], [EO_USER_ADDRESS], [EO_CREATE_TIME], [EO_COST], [EO_STATUS], [EO_TYPE]) VALUES (8, N'admin', N'管理员', N'北京市海淀区成府路207号', CAST(0x0000A1C700000000 AS DateTime), 100, 4, 1)
INSERT [dbo].[easybuy_order] ([EO_ID], [EO_USER_ID], [EO_USER_NAME], [EO_USER_ADDRESS], [EO_CREATE_TIME], [EO_COST], [EO_STATUS], [EO_TYPE]) VALUES (9, N'admin', N'管理员', N'北京市海淀区成府路207号', CAST(0x0000A1C700000000 AS DateTime), 200, 4, 1)
INSERT [dbo].[easybuy_order] ([EO_ID], [EO_USER_ID], [EO_USER_NAME], [EO_USER_ADDRESS], [EO_CREATE_TIME], [EO_COST], [EO_STATUS], [EO_TYPE]) VALUES (10, N'admin', N'管理员', N'北京市海淀区成府路207号', CAST(0x0000A1C700000000 AS DateTime), 300, 3, 1)
INSERT [dbo].[easybuy_order] ([EO_ID], [EO_USER_ID], [EO_USER_NAME], [EO_USER_ADDRESS], [EO_CREATE_TIME], [EO_COST], [EO_STATUS], [EO_TYPE]) VALUES (11, N'admin', N'管理员', N'北京市海淀区成府路207号', CAST(0x0000A1C800000000 AS DateTime), 830, 4, 1)
INSERT [dbo].[easybuy_order] ([EO_ID], [EO_USER_ID], [EO_USER_NAME], [EO_USER_ADDRESS], [EO_CREATE_TIME], [EO_COST], [EO_STATUS], [EO_TYPE]) VALUES (12, N'admin', N'管理员', N'河北', CAST(0x0000A1C8008D7E74 AS DateTime), 2288, 1, 1)
SET IDENTITY_INSERT [dbo].[easybuy_order] OFF
/****** Object:  Table [dbo].[easybuy_news]    Script Date: 12/18/2015 22:23:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[easybuy_news](
	[EN_ID] [int] IDENTITY(1,1) NOT NULL,
	[EN_TITLE] [varchar](40) NOT NULL,
	[EN_CONTENT] [varchar](1000) NOT NULL,
	[EN_CREATE_TIME] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EN_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[EN_TITLE] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[easybuy_news] ON
INSERT [dbo].[easybuy_news] ([EN_ID], [EN_TITLE], [EN_CONTENT], [EN_CREATE_TIME]) VALUES (531, N'会员特惠月开始了', N'会员特惠月开始了', CAST(0xAF330B00 AS Date))
INSERT [dbo].[easybuy_news] ([EN_ID], [EN_TITLE], [EN_CONTENT], [EN_CREATE_TIME]) VALUES (597, N'迎双旦促销大酬宾', N'迎双旦促销大酬宾', CAST(0xB1330B00 AS Date))
INSERT [dbo].[easybuy_news] ([EN_ID], [EN_TITLE], [EN_CONTENT], [EN_CREATE_TIME]) VALUES (649, N'加入会员，赢千万大礼包', N'加入会员，赢千万大礼包', CAST(0xAF330B00 AS Date))
INSERT [dbo].[easybuy_news] ([EN_ID], [EN_TITLE], [EN_CONTENT], [EN_CREATE_TIME]) VALUES (650, N'新年不夜天，通宵也是开张了', N'新年不夜天，通宵也是开张了', CAST(0x46340B00 AS Date))
INSERT [dbo].[easybuy_news] ([EN_ID], [EN_TITLE], [EN_CONTENT], [EN_CREATE_TIME]) VALUES (651, N'积分兑换开始了', N'积分兑换开始了', CAST(0xAF330B00 AS Date))
INSERT [dbo].[easybuy_news] ([EN_ID], [EN_TITLE], [EN_CONTENT], [EN_CREATE_TIME]) VALUES (653, N'团购阿迪1折起', N'团购阿迪1折起', CAST(0xAF330B00 AS Date))
INSERT [dbo].[easybuy_news] ([EN_ID], [EN_TITLE], [EN_CONTENT], [EN_CREATE_TIME]) VALUES (654, N'配货通知', N'配货通知', CAST(0xD9370B00 AS Date))
INSERT [dbo].[easybuy_news] ([EN_ID], [EN_TITLE], [EN_CONTENT], [EN_CREATE_TIME]) VALUES (664, N'最新酷睿笔记本', N'IBME系列全场促销中，最新酷睿双核处理器，保证CPU更高效的运转。', CAST(0x6C370B00 AS Date))
INSERT [dbo].[easybuy_news] ([EN_ID], [EN_TITLE], [EN_CONTENT], [EN_CREATE_TIME]) VALUES (675, N'aa', N'012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789', CAST(0x75370B00 AS Date))
SET IDENTITY_INSERT [dbo].[easybuy_news] OFF
/****** Object:  Table [dbo].[easybuy_comment]    Script Date: 12/18/2015 22:23:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[easybuy_comment](
	[EC_ID] [int] IDENTITY(1,1) NOT NULL,
	[EC_CONTENT] [varchar](200) NOT NULL,
	[EC_CREATE_TIME] [date] NOT NULL,
	[EC_REPLY] [varchar](200) NULL,
	[EC_REPLY_TIME] [date] NULL,
	[EC_NICK_NAME] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EC_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[easybuy_comment] ON
INSERT [dbo].[easybuy_comment] ([EC_ID], [EC_CONTENT], [EC_CREATE_TIME], [EC_REPLY], [EC_REPLY_TIME], [EC_NICK_NAME]) VALUES (655, N'刚订了台IPod，很是期待啊', CAST(0xE4360B00 AS Date), N'货已发出，请注意收货时开箱检查货物是否有问题!', CAST(0x1A370B00 AS Date), N'小乖')
INSERT [dbo].[easybuy_comment] ([EC_ID], [EC_CONTENT], [EC_CREATE_TIME], [EC_REPLY], [EC_REPLY_TIME], [EC_NICK_NAME]) VALUES (680, N'佳能D50现在可以多长时间发货呢', CAST(0x8C360B00 AS Date), N'一般在订单确认后的第3天发货', CAST(0x42370B00 AS Date), N'无极')
INSERT [dbo].[easybuy_comment] ([EC_ID], [EC_CONTENT], [EC_CREATE_TIME], [EC_REPLY], [EC_REPLY_TIME], [EC_NICK_NAME]) VALUES (1217, N'最近买的化妆品感觉很好用，谢谢卖家', CAST(0x20370B00 AS Date), N'不客气，欢迎下次光临', CAST(0x75370B00 AS Date), N'大家米')
INSERT [dbo].[easybuy_comment] ([EC_ID], [EC_CONTENT], [EC_CREATE_TIME], [EC_REPLY], [EC_REPLY_TIME], [EC_NICK_NAME]) VALUES (1222, N'aa', CAST(0x75370B00 AS Date), NULL, NULL, N'管理员')
INSERT [dbo].[easybuy_comment] ([EC_ID], [EC_CONTENT], [EC_CREATE_TIME], [EC_REPLY], [EC_REPLY_TIME], [EC_NICK_NAME]) VALUES (1223, N'012345678901234567890123456789', CAST(0x75370B00 AS Date), NULL, NULL, N'管理员')
SET IDENTITY_INSERT [dbo].[easybuy_comment] OFF
/****** Object:  Table [dbo].[Admin]    Script Date: 12/18/2015 22:23:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[UserName] [nvarchar](50) NULL,
	[UserPwd] [nvarchar](50) NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Admin] ON
INSERT [dbo].[Admin] ([UserName], [UserPwd], [Id]) VALUES (N'1', N'c4ca4238a0b923820dcc509a6f75849b', 1)
INSERT [dbo].[Admin] ([UserName], [UserPwd], [Id]) VALUES (N'2', N'c81e728d9d4c2f636f067f89cc14862c', 2)
SET IDENTITY_INSERT [dbo].[Admin] OFF
/****** Object:  StoredProcedure [dbo].[usp_product]    Script Date: 12/18/2015 22:23:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_product]
 @epcid int
as
select * from dbo.easybuy_product
where EPC_ID=@epcid
GO
/****** Object:  Table [dbo].[Student]    Script Date: 12/18/2015 22:23:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Sid] [int] IDENTITY(1,1) NOT NULL,
	[Sname] [nvarchar](50) NULL,
	[GradeId] [int] NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[Sid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Student] ON
INSERT [dbo].[Student] ([Sid], [Sname], [GradeId]) VALUES (1, N' admin', 1)
INSERT [dbo].[Student] ([Sid], [Sname], [GradeId]) VALUES (2, N'111111', 1)
INSERT [dbo].[Student] ([Sid], [Sname], [GradeId]) VALUES (5, N'lilianjie', 1)
INSERT [dbo].[Student] ([Sid], [Sname], [GradeId]) VALUES (6, N'sss', 1)
SET IDENTITY_INSERT [dbo].[Student] OFF
/****** Object:  Default [DF_EASYBUY_USER_EU_LOGIN]    Script Date: 12/18/2015 22:23:51 ******/
ALTER TABLE [dbo].[easybuy_user] ADD  CONSTRAINT [DF_EASYBUY_USER_EU_LOGIN]  DEFAULT ((0)) FOR [EU_LOGIN]
GO
/****** Object:  ForeignKey [FK_Grade_Student]    Script Date: 12/18/2015 22:23:52 ******/
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Grade_Student] FOREIGN KEY([GradeId])
REFERENCES [dbo].[Grade] ([GradeId])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Grade_Student]
GO

USE [CatamaransRental]
GO
/****** Object:  Table [dbo].[Catamarans]    Script Date: 05.05.2023 16:24:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catamarans](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Model] [nvarchar](50) NOT NULL,
	[Capacity] [int] NOT NULL,
	[PricePerHour] [decimal](18, 2) NOT NULL,
	[IsAvailable] [bit] NOT NULL,
	[Image] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseAttempts]    Script Date: 05.05.2023 16:24:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseAttempts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CatamaranId] [int] NULL,
	[PurchaseDate] [datetime] NOT NULL,
	[IsSuccessful] [bit] NOT NULL,
	[ErrorMessage] [nvarchar](500) NULL,
	[SuccessMessage] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Purchases]    Script Date: 05.05.2023 16:24:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchases](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TicketId] [int] NOT NULL,
	[PurchaseDate] [datetime] NOT NULL,
	[Price] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rentals]    Script Date: 05.05.2023 16:24:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rentals](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StartTime] [datetime2](7) NOT NULL,
	[EndTime] [datetime2](7) NULL,
	[TotalCost] [decimal](18, 2) NOT NULL,
	[CatamaranId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tickets]    Script Date: 05.05.2023 16:24:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tickets](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CatamaranId] [int] NOT NULL,
	[RentalId] [int] NOT NULL,
	[PurchaseDate] [datetime] NOT NULL,
	[DurationInHours] [int] NOT NULL,
	[TotalCost] [decimal](18, 2) NOT NULL,
	[IsUsed] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 05.05.2023 16:24:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Role] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Catamarans] ON 

INSERT [dbo].[Catamarans] ([Id], [Model], [Capacity], [PricePerHour], [IsAvailable], [Image]) VALUES (1, N'Grace', 8, CAST(10000.00 AS Decimal(18, 2)), 0, N'https://res.cloudinary.com/dulbupxa6/image/upload/v1682788734/russian_millionaires_khalilah_superyacht_is_over_the_top_a_unique_gold_masterpiece_176093_1_igezgs.jpg')
INSERT [dbo].[Catamarans] ([Id], [Model], [Capacity], [PricePerHour], [IsAvailable], [Image]) VALUES (2, N'Freedom ', 8, CAST(20000.00 AS Decimal(18, 2)), 1, N'https://res.cloudinary.com/dulbupxa6/image/upload/v1682788730/amerikanskie-yahty_a4gxr9.jpg')
INSERT [dbo].[Catamarans] ([Id], [Model], [Capacity], [PricePerHour], [IsAvailable], [Image]) VALUES (3, N'Therapy', 8, CAST(30000.00 AS Decimal(18, 2)), 1, N'https://res.cloudinary.com/dulbupxa6/image/upload/v1682788729/Double-Century-5_ecsb9g.jpg')
SET IDENTITY_INSERT [dbo].[Catamarans] OFF
GO
SET IDENTITY_INSERT [dbo].[PurchaseAttempts] ON 

INSERT [dbo].[PurchaseAttempts] ([Id], [CatamaranId], [PurchaseDate], [IsSuccessful], [ErrorMessage], [SuccessMessage]) VALUES (3, 1, CAST(N'2023-05-04T00:00:00.000' AS DateTime), 0, N'Данный катамаран занят билет не создан, выберете другой', NULL)
SET IDENTITY_INSERT [dbo].[PurchaseAttempts] OFF
GO
SET IDENTITY_INSERT [dbo].[Purchases] ON 

INSERT [dbo].[Purchases] ([Id], [TicketId], [PurchaseDate], [Price]) VALUES (2, 3, CAST(N'2023-05-03T00:00:00.000' AS DateTime), CAST(240000.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Purchases] OFF
GO
SET IDENTITY_INSERT [dbo].[Rentals] ON 

INSERT [dbo].[Rentals] ([Id], [StartTime], [EndTime], [TotalCost], [CatamaranId], [UserId]) VALUES (3, CAST(N'2023-05-03T00:00:00.0000000' AS DateTime2), CAST(N'2023-05-04T00:00:00.0000000' AS DateTime2), CAST(240000.00 AS Decimal(18, 2)), 1, 1)
SET IDENTITY_INSERT [dbo].[Rentals] OFF
GO
SET IDENTITY_INSERT [dbo].[Tickets] ON 

INSERT [dbo].[Tickets] ([Id], [CatamaranId], [RentalId], [PurchaseDate], [DurationInHours], [TotalCost], [IsUsed]) VALUES (3, 1, 3, CAST(N'2023-05-03T00:00:00.000' AS DateTime), 24, CAST(240000.00 AS Decimal(18, 2)), 1)
SET IDENTITY_INSERT [dbo].[Tickets] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Password], [Name], [Role]) VALUES (1, N'123456', N'Gaukhar', 0)
INSERT [dbo].[Users] ([Id], [Password], [Name], [Role]) VALUES (3, N'123456', N'Masud', 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[PurchaseAttempts]  WITH CHECK ADD FOREIGN KEY([CatamaranId])
REFERENCES [dbo].[Catamarans] ([Id])
GO
ALTER TABLE [dbo].[Purchases]  WITH CHECK ADD FOREIGN KEY([TicketId])
REFERENCES [dbo].[Tickets] ([Id])
GO
ALTER TABLE [dbo].[Rentals]  WITH CHECK ADD  CONSTRAINT [FK_Rentals_Catamarans] FOREIGN KEY([CatamaranId])
REFERENCES [dbo].[Catamarans] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Rentals] CHECK CONSTRAINT [FK_Rentals_Catamarans]
GO
ALTER TABLE [dbo].[Rentals]  WITH CHECK ADD  CONSTRAINT [FK_Rentals_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Rentals] CHECK CONSTRAINT [FK_Rentals_Users]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_Catamaran] FOREIGN KEY([CatamaranId])
REFERENCES [dbo].[Catamarans] ([Id])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Ticket_Catamaran]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_Rental] FOREIGN KEY([RentalId])
REFERENCES [dbo].[Rentals] ([Id])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Ticket_Rental]
GO
ALTER TABLE [dbo].[Catamarans]  WITH CHECK ADD  CONSTRAINT [CK_Catamarans_IsAvailable] CHECK  (([IsAvailable]=(1) OR [IsAvailable]=(0)))
GO
ALTER TABLE [dbo].[Catamarans] CHECK CONSTRAINT [CK_Catamarans_IsAvailable]
GO

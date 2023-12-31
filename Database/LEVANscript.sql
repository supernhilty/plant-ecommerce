USE [master]
GO
/****** Object:  Database [PlantHouseManagement]    Script Date: 7/2/2023 9:34:13 PM ******/
CREATE DATABASE [PlantHouseManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PlantHouseManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PlantHouseManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PlantHouseManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PlantHouseManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PlantHouseManagement] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PlantHouseManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PlantHouseManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PlantHouseManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PlantHouseManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PlantHouseManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PlantHouseManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [PlantHouseManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PlantHouseManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PlantHouseManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PlantHouseManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PlantHouseManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PlantHouseManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PlantHouseManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PlantHouseManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PlantHouseManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PlantHouseManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PlantHouseManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PlantHouseManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PlantHouseManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PlantHouseManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PlantHouseManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PlantHouseManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PlantHouseManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PlantHouseManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PlantHouseManagement] SET  MULTI_USER 
GO
ALTER DATABASE [PlantHouseManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PlantHouseManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PlantHouseManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PlantHouseManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PlantHouseManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PlantHouseManagement] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PlantHouseManagement] SET QUERY_STORE = OFF
GO
USE [PlantHouseManagement]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 7/2/2023 9:34:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[cid] [varchar](12) NOT NULL,
	[cname] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 7/2/2023 9:34:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[ShipDate] [datetime] NULL,
	[UserId] [varchar](10) NOT NULL,
	[Status] [bit] NOT NULL,
	[Total] [float] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderLine]    Script Date: 7/2/2023 9:34:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderLine](
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[OrderQuantity] [int] NOT NULL,
	[ProductOrderPrice] [float] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 7/2/2023 9:34:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[category] [varchar](12) NOT NULL,
	[Quantity] [int] NOT NULL,
	[ImgPath] [varchar](100) NOT NULL,
	[Price] [float] NOT NULL,
	[Adddate] [datetime] NOT NULL,
	[Describe] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sale]    Script Date: 7/2/2023 9:34:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sale](
	[ProductId] [varchar](10) NOT NULL,
	[quantity] [int] NOT NULL,
	[revenue] [float] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 7/2/2023 9:34:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [varchar](10) NOT NULL,
	[Role] [varchar](10) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[Phone] [varchar](12) NOT NULL,
	[Address] [nvarchar](100) NULL,
	[City] [nvarchar](30) NULL,
	[Point] [int] NULL,
	[RegisterDate] [date] NULL,
 CONSTRAINT [PK_dto.User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Categories] ([cid], [cname]) VALUES (N'flower', N'Flower')
INSERT [dbo].[Categories] ([cid], [cname]) VALUES (N'plant', N'Plant')
INSERT [dbo].[Categories] ([cid], [cname]) VALUES (N'seed', N'Seed')
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderId], [OrderDate], [ShipDate], [UserId], [Status], [Total]) VALUES (1, CAST(N'1905-06-26T00:00:00.000' AS DateTime), NULL, N'nhilty', 1, 345000)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [ShipDate], [UserId], [Status], [Total]) VALUES (2, CAST(N'2023-03-19T00:00:00.000' AS DateTime), NULL, N'nhilty', 0, 228927)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [ShipDate], [UserId], [Status], [Total]) VALUES (3, CAST(N'2023-03-19T00:00:00.000' AS DateTime), NULL, N'nhilty', 0, 455849)
INSERT [dbo].[Order] ([OrderId], [OrderDate], [ShipDate], [UserId], [Status], [Total]) VALUES (4, CAST(N'2023-03-19T00:00:00.000' AS DateTime), NULL, N'nhilty', 0, 80255)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderLine] ([OrderId], [ProductId], [OrderQuantity], [ProductOrderPrice]) VALUES (1, 3, 1, 5466576)
INSERT [dbo].[OrderLine] ([OrderId], [ProductId], [OrderQuantity], [ProductOrderPrice]) VALUES (2, 50, 1, 228927)
INSERT [dbo].[OrderLine] ([OrderId], [ProductId], [OrderQuantity], [ProductOrderPrice]) VALUES (3, 38, 6, 62599)
INSERT [dbo].[OrderLine] ([OrderId], [ProductId], [OrderQuantity], [ProductOrderPrice]) VALUES (3, 43, 1, 80255)
INSERT [dbo].[OrderLine] ([OrderId], [ProductId], [OrderQuantity], [ProductOrderPrice]) VALUES (4, 43, 1, 80255)
GO
INSERT [dbo].[Product] ([ID], [Name], [category], [Quantity], [ImgPath], [Price], [Adddate], [Describe]) VALUES (0, N'Taunting Geranium', N'plant', 91, N'images/plant_0.jpg', 257743, CAST(N'2023-02-11T00:00:00.000' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dapibus diam metus.')
INSERT [dbo].[Product] ([ID], [Name], [category], [Quantity], [ImgPath], [Price], [Adddate], [Describe]) VALUES (1, N'Ashen Laceflower', N'plant', 74, N'images/plant_1.jpg', 483853, CAST(N'2023-02-05T00:00:00.000' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dapibus diam metus.')
INSERT [dbo].[Product] ([ID], [Name], [category], [Quantity], [ImgPath], [Price], [Adddate], [Describe]) VALUES (2, N'Dlirkess', N'plant', 71, N'images/plant_2.jpg', 174721, CAST(N'2023-03-03T00:00:00.000' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dapibus diam metus.')
INSERT [dbo].[Product] ([ID], [Name], [category], [Quantity], [ImgPath], [Price], [Adddate], [Describe]) VALUES (3, N'Phoghtinque', N'plant', 92, N'images/plant_3.jpg', 188759, CAST(N'2023-01-26T00:00:00.000' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dapibus diam metus.')
INSERT [dbo].[Product] ([ID], [Name], [category], [Quantity], [ImgPath], [Price], [Adddate], [Describe]) VALUES (4, N'Hidden Gutweed', N'plant', 89, N'images/plant_4.jpg', 351020, CAST(N'2023-01-07T00:00:00.000' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dapibus diam metus.')
INSERT [dbo].[Product] ([ID], [Name], [category], [Quantity], [ImgPath], [Price], [Adddate], [Describe]) VALUES (5, N'Pixy Silkweed', N'plant', 97, N'images/plant_5.jpg', 301269, CAST(N'2023-01-02T00:00:00.000' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dapibus diam metus.')
INSERT [dbo].[Product] ([ID], [Name], [category], [Quantity], [ImgPath], [Price], [Adddate], [Describe]) VALUES (6, N'Ice Ambrosia', N'plant', 81, N'images/plant_6.jpg', 260526, CAST(N'2023-01-16T00:00:00.000' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dapibus diam metus.')
INSERT [dbo].[Product] ([ID], [Name], [category], [Quantity], [ImgPath], [Price], [Adddate], [Describe]) VALUES (7, N'Sneezing Felonwood', N'plant', 100, N'images/plant_7.jpg', 310056, CAST(N'2023-02-14T00:00:00.000' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dapibus diam metus.')
INSERT [dbo].[Product] ([ID], [Name], [category], [Quantity], [ImgPath], [Price], [Adddate], [Describe]) VALUES (8, N'Crimson Rose', N'plant', 82, N'images/plant_8.jpg', 436988, CAST(N'2023-02-09T00:00:00.000' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dapibus diam metus.')
INSERT [dbo].[Product] ([ID], [Name], [category], [Quantity], [ImgPath], [Price], [Adddate], [Describe]) VALUES (9, N'Ukreless', N'plant', 76, N'images/plant_9.jpg', 75039, CAST(N'2023-02-18T00:00:00.000' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dapibus diam metus.')
INSERT [dbo].[Product] ([ID], [Name], [category], [Quantity], [ImgPath], [Price], [Adddate], [Describe]) VALUES (10, N'Fatigue Woodbine', N'plant', 80, N'images/plant_10.jpg', 457111, CAST(N'2023-01-23T00:00:00.000' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dapibus diam metus.')
INSERT [dbo].[Product] ([ID], [Name], [category], [Quantity], [ImgPath], [Price], [Adddate], [Describe]) VALUES (11, N'Yalmedil', N'plant', 76, N'images/plant_11.jpg', 148936, CAST(N'2023-02-18T00:00:00.000' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dapibus diam metus.')
INSERT [dbo].[Product] ([ID], [Name], [category], [Quantity], [ImgPath], [Price], [Adddate], [Describe]) VALUES (12, N'Spirit Bearberry', N'plant', 82, N'images/plant_12.jpg', 349439, CAST(N'2023-01-04T00:00:00.000' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dapibus diam metus.')
INSERT [dbo].[Product] ([ID], [Name], [category], [Quantity], [ImgPath], [Price], [Adddate], [Describe]) VALUES (13, N'Eechrizove', N'plant', 76, N'images/plant_13.jpg', 223909, CAST(N'2023-02-02T00:00:00.000' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dapibus diam metus.')
INSERT [dbo].[Product] ([ID], [Name], [category], [Quantity], [ImgPath], [Price], [Adddate], [Describe]) VALUES (14, N'Clecire', N'plant', 81, N'images/plant_14.jpg', 480778, CAST(N'2023-01-12T00:00:00.000' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dapibus diam metus.')
INSERT [dbo].[Product] ([ID], [Name], [category], [Quantity], [ImgPath], [Price], [Adddate], [Describe]) VALUES (15, N'Iawacax', N'plant', 77, N'images/plant_15.jpg', 261324, CAST(N'2023-01-19T00:00:00.000' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dapibus diam metus.')
INSERT [dbo].[Product] ([ID], [Name], [category], [Quantity], [ImgPath], [Price], [Adddate], [Describe]) VALUES (16, N'Eloovina', N'plant', 80, N'images/plant_16.jpg', 484417, CAST(N'2023-02-16T00:00:00.000' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dapibus diam metus.')
INSERT [dbo].[Product] ([ID], [Name], [category], [Quantity], [ImgPath], [Price], [Adddate], [Describe]) VALUES (17, N'Bomdel', N'plant', 73, N'images/plant_17.jpg', 425129, CAST(N'2023-02-22T00:00:00.000' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dapibus diam metus.')
INSERT [dbo].[Product] ([ID], [Name], [category], [Quantity], [ImgPath], [Price], [Adddate], [Describe]) VALUES (18, N'Imperial Sunflower', N'plant', 94, N'images/plant_18.jpg', 156906, CAST(N'2023-02-08T00:00:00.000' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dapibus diam metus.')
INSERT [dbo].[Product] ([ID], [Name], [category], [Quantity], [ImgPath], [Price], [Adddate], [Describe]) VALUES (19, N'Glacier Weed', N'plant', 77, N'images/plant_19.jpg', 101851, CAST(N'2023-01-11T00:00:00.000' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dapibus diam metus.')
INSERT [dbo].[Product] ([ID], [Name], [category], [Quantity], [ImgPath], [Price], [Adddate], [Describe]) VALUES (20, N'Yandite', N'plant', 83, N'images/plant_20.jpg', 412657, CAST(N'2023-02-08T00:00:00.000' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dapibus diam metus.')
INSERT [dbo].[Product] ([ID], [Name], [category], [Quantity], [ImgPath], [Price], [Adddate], [Describe]) VALUES (21, N'Oshrifroo', N'plant', 77, N'images/plant_21.jpg', 452728, CAST(N'2023-02-20T00:00:00.000' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dapibus diam metus.')
INSERT [dbo].[Product] ([ID], [Name], [category], [Quantity], [ImgPath], [Price], [Adddate], [Describe]) VALUES (22, N'Sleepy Violet', N'plant', 96, N'images/plant_22.jpg', 248107, CAST(N'2023-02-13T00:00:00.000' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dapibus diam metus.')
INSERT [dbo].[Product] ([ID], [Name], [category], [Quantity], [ImgPath], [Price], [Adddate], [Describe]) VALUES (23, N'Ifeklane', N'plant', 75, N'images/plant_23.jpg', 205980, CAST(N'2023-01-24T00:00:00.000' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dapibus diam metus.')
INSERT [dbo].[Product] ([ID], [Name], [category], [Quantity], [ImgPath], [Price], [Adddate], [Describe]) VALUES (24, N'Iprindoil', N'plant', 93, N'images/plant_24.jpg', 179721, CAST(N'2023-02-15T00:00:00.000' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dapibus diam metus.')
INSERT [dbo].[Product] ([ID], [Name], [category], [Quantity], [ImgPath], [Price], [Adddate], [Describe]) VALUES (25, N'Void Fig', N'plant', 99, N'images/plant_25.jpg', 159726, CAST(N'2023-03-06T00:00:00.000' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dapibus diam metus.')
INSERT [dbo].[Product] ([ID], [Name], [category], [Quantity], [ImgPath], [Price], [Adddate], [Describe]) VALUES (26, N'Eedasie', N'plant', 85, N'images/plant_26.jpg', 232584, CAST(N'2023-03-25T00:00:00.000' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dapibus diam metus.')
INSERT [dbo].[Product] ([ID], [Name], [category], [Quantity], [ImgPath], [Price], [Adddate], [Describe]) VALUES (27, N'Pest Stammerwort', N'plant', 92, N'images/plant_27.jpg', 478565, CAST(N'2023-03-03T00:00:00.000' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dapibus diam metus.')
INSERT [dbo].[Product] ([ID], [Name], [category], [Quantity], [ImgPath], [Price], [Adddate], [Describe]) VALUES (28, N'Canis Hedge', N'plant', 76, N'images/plant_28.jpg', 468830, CAST(N'2023-01-09T00:00:00.000' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dapibus diam metus.')
INSERT [dbo].[Product] ([ID], [Name], [category], [Quantity], [ImgPath], [Price], [Adddate], [Describe]) VALUES (29, N'Eruasmit', N'plant', 91, N'images/plant_29.jpg', 179299, CAST(N'2023-03-09T00:00:00.000' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dapibus diam metus.')
INSERT [dbo].[Product] ([ID], [Name], [category], [Quantity], [ImgPath], [Price], [Adddate], [Describe]) VALUES (30, N'Bletilla', N'flower', 90, N'images/flower_30.jpg', 457688, CAST(N'2023-03-08T00:00:00.000' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dapibus diam metus.')
INSERT [dbo].[Product] ([ID], [Name], [category], [Quantity], [ImgPath], [Price], [Adddate], [Describe]) VALUES (31, N'Uva Ursi', N'flower', 99, N'images/flower_31.jpg', 213860, CAST(N'2023-02-18T00:00:00.000' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dapibus diam metus.')
INSERT [dbo].[Product] ([ID], [Name], [category], [Quantity], [ImgPath], [Price], [Adddate], [Describe]) VALUES (32, N'Eustoma', N'flower', 86, N'images/flower_32.jpg', 51383, CAST(N'2023-02-02T00:00:00.000' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dapibus diam metus.')
INSERT [dbo].[Product] ([ID], [Name], [category], [Quantity], [ImgPath], [Price], [Adddate], [Describe]) VALUES (33, N'Roses', N'flower', 89, N'images/flower_33.jpg', 419882, CAST(N'2023-03-16T00:00:00.000' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dapibus diam metus.')
INSERT [dbo].[Product] ([ID], [Name], [category], [Quantity], [ImgPath], [Price], [Adddate], [Describe]) VALUES (34, N'Nasturtium', N'flower', 71, N'images/flower_34.jpg', 343664, CAST(N'2023-01-09T00:00:00.000' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dapibus diam metus.')
INSERT [dbo].[Product] ([ID], [Name], [category], [Quantity], [ImgPath], [Price], [Adddate], [Describe]) VALUES (35, N'Whirling Butterflies', N'flower', 93, N'images/flower_35.jpg', 71979, CAST(N'2023-02-06T00:00:00.000' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dapibus diam metus.')
INSERT [dbo].[Product] ([ID], [Name], [category], [Quantity], [ImgPath], [Price], [Adddate], [Describe]) VALUES (36, N'Cape Leadwort', N'flower', 97, N'images/flower_36.jpg', 200194, CAST(N'2023-03-13T00:00:00.000' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dapibus diam metus.')
INSERT [dbo].[Product] ([ID], [Name], [category], [Quantity], [ImgPath], [Price], [Adddate], [Describe]) VALUES (37, N'Guzmania', N'flower', 90, N'images/flower_37.jpg', 179220, CAST(N'2023-02-08T00:00:00.000' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dapibus diam metus.')
INSERT [dbo].[Product] ([ID], [Name], [category], [Quantity], [ImgPath], [Price], [Adddate], [Describe]) VALUES (38, N'Xanthoceras sorbifolium', N'flower', 92, N'images/flower_38.jpg', 62599, CAST(N'2023-03-23T00:00:00.000' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dapibus diam metus.')
INSERT [dbo].[Product] ([ID], [Name], [category], [Quantity], [ImgPath], [Price], [Adddate], [Describe]) VALUES (39, N'Lady’s Slipper', N'flower', 97, N'images/flower_39.jpg', 386790, CAST(N'2023-03-04T00:00:00.000' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dapibus diam metus.')
INSERT [dbo].[Product] ([ID], [Name], [category], [Quantity], [ImgPath], [Price], [Adddate], [Describe]) VALUES (40, N'Jacob’s Ladder', N'flower', 82, N'images/flower_40.jpg', 90393, CAST(N'2023-01-25T00:00:00.000' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dapibus diam metus.')
INSERT [dbo].[Product] ([ID], [Name], [category], [Quantity], [ImgPath], [Price], [Adddate], [Describe]) VALUES (41, N'Water lilies', N'flower', 98, N'images/flower_41.jpg', 102372, CAST(N'2023-01-12T00:00:00.000' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dapibus diam metus.')
INSERT [dbo].[Product] ([ID], [Name], [category], [Quantity], [ImgPath], [Price], [Adddate], [Describe]) VALUES (42, N'Tithonia', N'flower', 94, N'images/flower_42.jpg', 67561, CAST(N'2023-01-01T00:00:00.000' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dapibus diam metus.')
INSERT [dbo].[Product] ([ID], [Name], [category], [Quantity], [ImgPath], [Price], [Adddate], [Describe]) VALUES (43, N'Calceolaria', N'flower', 92, N'images/flower_43.jpg', 80255, CAST(N'2023-03-16T00:00:00.000' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dapibus diam metus.')
INSERT [dbo].[Product] ([ID], [Name], [category], [Quantity], [ImgPath], [Price], [Adddate], [Describe]) VALUES (44, N'Camellia', N'flower', 83, N'images/flower_44.jpg', 63049, CAST(N'2023-01-03T00:00:00.000' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dapibus diam metus.')
INSERT [dbo].[Product] ([ID], [Name], [category], [Quantity], [ImgPath], [Price], [Adddate], [Describe]) VALUES (45, N'Marguerite Daisy', N'flower', 89, N'images/flower_45.jpg', 358646, CAST(N'2023-02-27T00:00:00.000' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dapibus diam metus.')
INSERT [dbo].[Product] ([ID], [Name], [category], [Quantity], [ImgPath], [Price], [Adddate], [Describe]) VALUES (46, N'Coneflower', N'flower', 78, N'images/flower_46.jpg', 496928, CAST(N'2023-02-04T00:00:00.000' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dapibus diam metus.')
INSERT [dbo].[Product] ([ID], [Name], [category], [Quantity], [ImgPath], [Price], [Adddate], [Describe]) VALUES (47, N'Starflower', N'flower', 92, N'images/flower_47.jpg', 458234, CAST(N'2023-03-01T00:00:00.000' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dapibus diam metus.')
INSERT [dbo].[Product] ([ID], [Name], [category], [Quantity], [ImgPath], [Price], [Adddate], [Describe]) VALUES (48, N'Freesia', N'flower', 98, N'images/flower_48.jpg', 376472, CAST(N'2023-03-07T00:00:00.000' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dapibus diam metus.')
INSERT [dbo].[Product] ([ID], [Name], [category], [Quantity], [ImgPath], [Price], [Adddate], [Describe]) VALUES (49, N'Daphne', N'flower', 89, N'images/flower_49.jpg', 212488, CAST(N'2023-03-13T00:00:00.000' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dapibus diam metus.')
INSERT [dbo].[Product] ([ID], [Name], [category], [Quantity], [ImgPath], [Price], [Adddate], [Describe]) VALUES (50, N'Bluebonnets', N'flower', 98, N'images/flower_50.jpg', 228927, CAST(N'2023-03-25T00:00:00.000' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dapibus diam metus.')
INSERT [dbo].[Product] ([ID], [Name], [category], [Quantity], [ImgPath], [Price], [Adddate], [Describe]) VALUES (51, N'Ipomoea Lobata', N'flower', 87, N'images/flower_51.jpg', 162707, CAST(N'2023-01-17T00:00:00.000' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dapibus diam metus.')
INSERT [dbo].[Product] ([ID], [Name], [category], [Quantity], [ImgPath], [Price], [Adddate], [Describe]) VALUES (52, N'Chrysanthemum', N'flower', 71, N'images/flower_52.jpg', 170218, CAST(N'2023-01-14T00:00:00.000' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dapibus diam metus.')
INSERT [dbo].[Product] ([ID], [Name], [category], [Quantity], [ImgPath], [Price], [Adddate], [Describe]) VALUES (53, N'Lavatera', N'flower', 98, N'images/flower_53.jpg', 113320, CAST(N'2023-03-23T00:00:00.000' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dapibus diam metus.')
INSERT [dbo].[Product] ([ID], [Name], [category], [Quantity], [ImgPath], [Price], [Adddate], [Describe]) VALUES (54, N'Johnny Jump Up', N'flower', 75, N'images/flower_54.jpg', 311354, CAST(N'2023-01-05T00:00:00.000' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dapibus diam metus.')
INSERT [dbo].[Product] ([ID], [Name], [category], [Quantity], [ImgPath], [Price], [Adddate], [Describe]) VALUES (55, N'Passion Flower', N'flower', 70, N'images/flower_55.jpg', 405463, CAST(N'2023-02-22T00:00:00.000' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dapibus diam metus.')
INSERT [dbo].[Product] ([ID], [Name], [category], [Quantity], [ImgPath], [Price], [Adddate], [Describe]) VALUES (56, N'Yellow-eyed Grass', N'flower', 77, N'images/flower_56.jpg', 466789, CAST(N'2023-02-19T00:00:00.000' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dapibus diam metus.')
INSERT [dbo].[Product] ([ID], [Name], [category], [Quantity], [ImgPath], [Price], [Adddate], [Describe]) VALUES (57, N'Heather', N'flower', 77, N'images/flower_57.jpg', 229314, CAST(N'2023-03-21T00:00:00.000' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dapibus diam metus.')
INSERT [dbo].[Product] ([ID], [Name], [category], [Quantity], [ImgPath], [Price], [Adddate], [Describe]) VALUES (58, N'Lewesia', N'flower', 73, N'images/flower_58.jpg', 291497, CAST(N'2023-01-03T00:00:00.000' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dapibus diam metus.')
INSERT [dbo].[Product] ([ID], [Name], [category], [Quantity], [ImgPath], [Price], [Adddate], [Describe]) VALUES (59, N'Dandelion', N'flower', 81, N'images/flower_59.jpg', 458222, CAST(N'2023-01-28T00:00:00.000' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dapibus diam metus.')
INSERT [dbo].[Product] ([ID], [Name], [category], [Quantity], [ImgPath], [Price], [Adddate], [Describe]) VALUES (60, N'Seed Oxalis Triangularis', N'seed', 100, N'images/seed_1.jpg', 456784, CAST(N'2023-02-11T00:00:00.000' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dapibus diam metus.')
INSERT [dbo].[Product] ([ID], [Name], [category], [Quantity], [ImgPath], [Price], [Adddate], [Describe]) VALUES (61, N'Seed Tulip', N'seed', 30, N'images/seed_2.jpg', 345321, CAST(N'2023-09-08T00:00:00.000' AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus dapibus diam metus.')
GO
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'0Dohp36NNJ', N'US', N'0Dohp36NNJ', N'Semyon Anisimov', N'0123-456-789', N'880 Le Loi', N'Hue', 56, CAST(N'2023-03-18' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'0KZwYirfnH', N'US', N'0KZwYirfnH', N'Zlata Kovalenko', N'0123-456-789', N'770 Le Lai', N'Nha Trang', 5, CAST(N'2023-01-20' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'18qaIwPWYG', N'US', N'18qaIwPWYG', N'Dmitry Naumova', N'0123-456-789', N'290 Le Van Viet', N'Nha Trang', 27, CAST(N'2023-03-18' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'1lutRqVZCm', N'US', N'1lutRqVZCm', N'Yevgeniy Tsvetkova', N'0123-456-789', N'65 Tran Nhat Duat', N'Da Nang', 45, CAST(N'2023-03-08' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'1mFe9duiFw', N'US', N'1mFe9duiFw', N'Mikhail Afanaseva', N'0123-456-789', N'526 Hai Ba Trung', N'Quy Nhon', 24, CAST(N'2023-01-06' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'2kmjcEknzp', N'US', N'2kmjcEknzp', N'Vladilen Orlova', N'0123-456-789', N'652 Thieu Tri', N'Nha Trang', 69, CAST(N'2023-01-05' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'2OSVwWOONW', N'US', N'2OSVwWOONW', N'Vladislav Vorobyova', N'0123-456-789', N'11 Nguyen Van Tang', N'Da Nang', 69, CAST(N'2023-03-20' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'3DILZATLb8', N'US', N'3DILZATLb8', N'Semyon Omarov', N'0123-456-789', N'255 Le Thanh Tong', N'Hue', 37, CAST(N'2023-02-27' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'4Ky19fV2sF', N'US', N'4Ky19fV2sF', N'Saveliy Yusupov', N'0123-456-789', N'783 Han Mac Tu', N'Da Nang', 35, CAST(N'2023-02-07' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'4U7DNUj9G6', N'US', N'4U7DNUj9G6', N'Valentina Krasnov', N'0123-456-789', N'339 Tran Hung Dao', N'Da Nang', 93, CAST(N'2023-03-03' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'4YbijafL26', N'US', N'4YbijafL26', N'Amir Ershova', N'0123-456-789', N'281 Quang Trung', N'Dong Hoi', 98, CAST(N'2023-02-15' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'5kjTi7QKm1', N'US', N'5kjTi7QKm1', N'Igor Galkina', N'0123-456-789', N'260 Ham Nghi', N'Ha Noi', 73, CAST(N'2023-02-15' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'5kzdiLR7mJ', N'US', N'5kzdiLR7mJ', N'Feodora Alexeeva', N'0123-456-789', N'822 Le Thanh Tong', N'Nha Trang', 30, CAST(N'2023-02-01' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'5MMD93xjPC', N'US', N'5MMD93xjPC', N'Viktor Voronina', N'0123-456-789', N'392 Xuan Dieu', N'Nha Trang', 19, CAST(N'2023-01-07' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'5uhKVjCzyw', N'US', N'5uhKVjCzyw', N'Veronika Rodionov', N'0123-456-789', N'612 Vo Van Kiet', N'Ha Noi', 4, CAST(N'2023-01-19' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'6lpK6VfpDu', N'US', N'6lpK6VfpDu', N'Valerian Lyubimova', N'0123-456-789', N'754 Le Van Viet', N'Dong Hoi', 92, CAST(N'2023-01-08' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'75kv4olQtp', N'US', N'75kv4olQtp', N'Ekaterina Sokolova', N'0123-456-789', N'872 Tran Hung Dao', N'Dong Ha', 85, CAST(N'2023-02-27' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'9RT0CO9fds', N'US', N'9RT0CO9fds', N'Zhenya Gadzhiev', N'0123-456-789', N'427 Thieu Tri', N'Hai Phong', 67, CAST(N'2023-03-24' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'9unIX5PKSs', N'US', N'9unIX5PKSs', N'Safiya Antonov', N'0123-456-789', N'1 Tran Nhat Duat', N'Dong Hoi', 72, CAST(N'2023-01-23' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'acDsDETSXm', N'US', N'acDsDETSXm', N'Anton Lukyanova', N'0123-456-789', N'694 Tran Hung Dao', N'Nha Trang', 75, CAST(N'2023-01-27' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'admin', N'AD', N'123', N'admin', N'0', N'0', N'0', 0, NULL)
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'aRFm20MiYH', N'US', N'aRFm20MiYH', N'Yury Simonov', N'0123-456-789', N'740 Hai Ba Trung', N'Hai Phong', 65, CAST(N'2023-01-20' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'azSW36Tg5g', N'US', N'azSW36Tg5g', N'Aleksey Naumov', N'0123-456-789', N'415 Thieu Tri', N'Bien Hoa', 34, CAST(N'2023-02-03' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'bBVfRC3mcJ', N'US', N'bBVfRC3mcJ', N'Valeri Ershov', N'0123-456-789', N'205 Le Lai', N'Dong Ha', 61, CAST(N'2023-02-06' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'BJUylnxfAB', N'US', N'BJUylnxfAB', N'Ustin Evdokimov', N'0123-456-789', N'622 To Huu', N'Da Nang', 46, CAST(N'2023-03-19' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'bpbW6SQIbY', N'US', N'bpbW6SQIbY', N'Kristina Koroleva', N'0123-456-789', N'332 To Hien Thanh', N'Da Nang', 32, CAST(N'2023-03-27' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'c1R5glVDk5', N'US', N'c1R5glVDk5', N'Marina Bykov', N'0123-456-789', N'379 Xuan Quynh', N'Dong Ha', 91, CAST(N'2023-03-16' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'CkHzcyfbZl', N'US', N'CkHzcyfbZl', N'Kiska Panov', N'0123-456-789', N'554 Vo Van Kiet', N'Vung Tau', 79, CAST(N'2023-01-01' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'CNybGZDaph', N'US', N'CNybGZDaph', N'Pavel Vladimirovich', N'0123-456-789', N'617 Xuan Quynh', N'Ha Noi', 64, CAST(N'2023-02-27' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'CUEot0nCLc', N'US', N'CUEot0nCLc', N'Miya Ershova', N'0123-456-789', N'476 Le Loi', N'Quy Nhon', 35, CAST(N'2023-02-26' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'CyfBbwim0O', N'US', N'CyfBbwim0O', N'Viktor Klimenko', N'0123-456-789', N'2 Ba Trieu', N'Bien Hoa', 65, CAST(N'2023-03-06' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'dGAjSOemO9', N'US', N'dGAjSOemO9', N'Yerik Kuznetsov', N'0123-456-789', N'696 To Hien Thanh', N'Ha Noi', 59, CAST(N'2023-02-23' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'DqIsA7gwzx', N'US', N'DqIsA7gwzx', N'Yana Kurbanov', N'0123-456-789', N'669 Le Loi', N'Dong Hoi', 8, CAST(N'2023-02-18' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'ds9xM7yc7d', N'US', N'ds9xM7yc7d', N'Wassily Kalinin', N'0123-456-789', N'395 Ham Nghi', N'Vung Tau', 97, CAST(N'2023-03-19' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'E6S6M5mESB', N'US', N'E6S6M5mESB', N'Boris Maltsev', N'0123-456-789', N'361 Le Loi', N'Dong Hoi', 61, CAST(N'2023-02-19' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'efxZt5uWs2', N'US', N'efxZt5uWs2', N'Sofya Efremov', N'0123-456-789', N'891 Nguyen Van Tang', N'Dong Hoi', 59, CAST(N'2023-03-04' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'EmmPYky976', N'US', N'EmmPYky976', N'Agata Davydova', N'0123-456-789', N'150 Nguyen Van Tang', N'Ho Chi Minh', 85, CAST(N'2023-01-09' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'G2SkmFg7hm', N'US', N'G2SkmFg7hm', N'Valerian Volkov', N'0123-456-789', N'231 Nguyen Van Tang', N'Da Nang', 1, CAST(N'2023-01-07' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'g4BysG0Bg3', N'US', N'g4BysG0Bg3', N'Kira Shishkin', N'0123-456-789', N'581 To Hien Thanh', N'Ha Noi', 62, CAST(N'2023-03-06' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'gdIgRkQ5DS', N'US', N'gdIgRkQ5DS', N'Sacha Kuzmin', N'0123-456-789', N'53 To Huu', N'Vung Tau', 10, CAST(N'2023-02-26' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'gdJEYQvOWI', N'US', N'gdJEYQvOWI', N'Timur Omarov', N'0123-456-789', N'120 Le Thanh Tong', N'Quy Nhon', 91, CAST(N'2023-01-01' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'H7S84rLCfi', N'US', N'H7S84rLCfi', N'Yelena Kudryavtsev', N'0123-456-789', N'607 Ly Thai To', N'Dong Hoi', 100, CAST(N'2023-01-10' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'JkWGkL3Eji', N'US', N'JkWGkL3Eji', N'Olga Potapova', N'0123-456-789', N'552 Ham Nghi', N'Vung Tau', 82, CAST(N'2023-03-17' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'Jl6YJedttY', N'US', N'Jl6YJedttY', N'Mika Vorobeva', N'0123-456-789', N'413 Xuan Quynh', N'Ha Noi', 60, CAST(N'2023-02-25' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'jlifQiQBKQ', N'US', N'jlifQiQBKQ', N'Vladimir Putin', N'0123-456-789', N'355 Le Van Viet', N'Hue', 47, CAST(N'2023-03-14' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'joMbvtZLZA', N'US', N'joMbvtZLZA', N'Miroslava Gordeev', N'0123-456-789', N'234 Le Loi', N'Dong Ha', 39, CAST(N'2023-03-15' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'jrvnVYhuul', N'US', N'jrvnVYhuul', N'Viktoria Pavlov', N'0123-456-789', N'167 Tran Hung Dao', N'Ho Chi Minh', 94, CAST(N'2023-02-08' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'JwJwFMHf35', N'US', N'JwJwFMHf35', N'Xenik Maksimova', N'0123-456-789', N'639 Ly Thai To', N'Ho Chi Minh', 90, CAST(N'2023-01-10' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'KEbR2AlWrE', N'US', N'KEbR2AlWrE', N'Artur Solovyov', N'0123-456-789', N'126 Xuan Dieu', N'Vung Tau', 52, CAST(N'2023-01-18' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'KFIJTXwXgc', N'US', N'KFIJTXwXgc', N'Ivan Zotova', N'0123-456-789', N'713 Tran Nhan Tong', N'Bien Hoa', 70, CAST(N'2023-02-10' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'KhXl5bFvT2', N'US', N'KhXl5bFvT2', N'Arsen Vorobeva', N'0123-456-789', N'21 Le Lai', N'Nha Trang', 21, CAST(N'2023-02-18' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'KIsOsIezLl', N'US', N'KIsOsIezLl', N'Arina Ershov', N'0123-456-789', N'146 Ham Nghi', N'Quy Nhon', 89, CAST(N'2023-03-03' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'KQr3Vjzlxb', N'US', N'KQr3Vjzlxb', N'Leena Alekseeva', N'0123-456-789', N'578 Tran Nhat Duat', N'Da Nang', 12, CAST(N'2023-01-15' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'krPRd1Rz7M', N'US', N'krPRd1Rz7M', N'Lev Karpova', N'0123-456-789', N'570 Tran Hung Dao', N'Bien Hoa', 70, CAST(N'2023-01-26' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'LCEwEC1kBd', N'US', N'LCEwEC1kBd', N'Mila Zakharova', N'0123-456-789', N'763 Hai Ba Trung', N'Da Nang', 86, CAST(N'2023-01-20' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'lEVGkpzYgi', N'US', N'lEVGkpzYgi', N'Luba Zakharova', N'0123-456-789', N'820 Xuan Quynh', N'Bien Hoa', 49, CAST(N'2023-03-03' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'LidRJ0VTh4', N'US', N'LidRJ0VTh4', N'Lenya Savin', N'0123-456-789', N'629 Ham Nghi', N'Nha Trang', 54, CAST(N'2023-03-18' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'LirXZxOiJj', N'US', N'LirXZxOiJj', N'Boris Kudryavtsev', N'0123-456-789', N'357 Ba Trieu', N'Quy Nhon', 86, CAST(N'2023-02-28' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'LMTRNA6Obo', N'US', N'LMTRNA6Obo', N'Olien Titova', N'0123-456-789', N'473 Xuan Dieu', N'Quy Nhon', 63, CAST(N'2023-01-08' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'lXndDmbdtO', N'US', N'lXndDmbdtO', N'Irina Stepanova', N'0123-456-789', N'114 Ham Nghi', N'Hue', 67, CAST(N'2023-01-09' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'lyltc', N'US', N'123', N'Le Thi Cam Ly', N'0987654321', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'lylth', N'US', N'123', N'Le Thi Hieu Ly', N'0987123456', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'NEze1HVINs', N'US', N'NEze1HVINs', N'Savina Voronin', N'0123-456-789', N'150 Xuan Quynh', N'Dong Ha', 7, CAST(N'2023-03-13' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'nhilty', N'US', N'123', N'Le Thi Yen Nhi', N'0987123407', N'Thu Duc', N'Ho Chi Minh, Viet Nam', NULL, NULL)
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'nhinn', N'US', N'123', N'Le Thi Yen Nhi', N'0987123456', N'Thu Duc', N'HCM', NULL, NULL)
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'Noy0ONMfxP', N'US', N'Noy0ONMfxP', N'Danila Komarova', N'0123-456-789', N'649 Xuan Quynh', N'Hue', 49, CAST(N'2023-01-13' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'nXxdxWEgxw', N'US', N'nXxdxWEgxw', N'Viktoriya Yakovlev', N'0123-456-789', N'614 Le Van Viet', N'Hue', 49, CAST(N'2023-03-04' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'odMadKiE34', N'US', N'odMadKiE34', N'Vlas Savina', N'0123-456-789', N'94 Ham Nghi', N'Dong Hoi', 2, CAST(N'2023-01-27' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'OxbM65F3Pi', N'US', N'OxbM65F3Pi', N'Aleksandra Maslova', N'0123-456-789', N'701 Ba Trieu', N'Ho Chi Minh', 54, CAST(N'2023-02-14' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'plKBi5SFeD', N'US', N'plKBi5SFeD', N'Vanka Soloveva', N'0123-456-789', N'116 Xuan Quynh', N'Quy Nhon', 5, CAST(N'2023-03-15' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'PMdVHiR1o1', N'US', N'PMdVHiR1o1', N'Timur Korolev', N'0123-456-789', N'788 Xuan Quynh', N'Quy Nhon', 30, CAST(N'2023-01-03' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'PO1wNqU3SG', N'US', N'PO1wNqU3SG', N'Elena Ramazanov', N'0123-456-789', N'364 Ham Nghi', N'Nha Trang', 85, CAST(N'2023-02-16' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'PtdQ4Rg0Oo', N'US', N'PtdQ4Rg0Oo', N'Yula Kim', N'0123-456-789', N'155 Tran Hung Dao', N'Dong Ha', 10, CAST(N'2023-01-07' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'qJQ9Bjp909', N'US', N'qJQ9Bjp909', N'Tatiana Efimova', N'0123-456-789', N'284 Tran Hung Dao', N'Bien Hoa', 48, CAST(N'2023-02-13' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'QrjDHRII9h', N'US', N'QrjDHRII9h', N'Gleb Lysenko', N'0123-456-789', N'580 Le Loi', N'Ha Noi', 71, CAST(N'2023-03-08' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'QU9VW6XyZy', N'US', N'QU9VW6XyZy', N'Nika Alexeeva', N'0123-456-789', N'33 Vo Van Kiet', N'Quy Nhon', 22, CAST(N'2023-02-19' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'quanva', N'US', N'1', N'Van Anh Quan', N'0987654321', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'rii8mFrujF', N'US', N'rii8mFrujF', N'Svetlana Vasilyev', N'0123-456-789', N'480 To Huu', N'Ha Noi', 56, CAST(N'2023-01-04' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N's9AMATv62z', N'US', N's9AMATv62z', N'Sergey Biryukova', N'0123-456-789', N'546 Nguyen Van Tang', N'Dong Hoi', 43, CAST(N'2023-02-18' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'SCMAHe9pee', N'US', N'SCMAHe9pee', N'Nikol Fyodorova', N'0123-456-789', N'895 Hai Ba Trung', N'Ha Noi', 58, CAST(N'2023-03-28' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'SKNslEsU5S', N'US', N'SKNslEsU5S', N'David Matveev', N'0123-456-789', N'619 Xuan Quynh', N'Ha Noi', 79, CAST(N'2023-01-15' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'sSDnHxKSiB', N'US', N'sSDnHxKSiB', N'Sacha Zhdanova', N'0123-456-789', N'886 To Hien Thanh', N'Dong Ha', 61, CAST(N'2023-01-10' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'ssTL2kjNpb', N'US', N'ssTL2kjNpb', N'Oxana Kuzmin', N'0123-456-789', N'686 Xuan Quynh', N'Nha Trang', 69, CAST(N'2023-02-12' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'starry', N'US', N'123', N'LÃª Thá» Yáº¿n Nhi', N'0941163575', N'Thá»§ Äá»©c', N'Há» ', 0, NULL)
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N't0b73EHuK0', N'US', N't0b73EHuK0', N'Matvey Filatov', N'0123-456-789', N'199 Ly Thai To', N'Quy Nhon', 69, CAST(N'2023-03-02' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'tcns7TKa4C', N'US', N'tcns7TKa4C', N'Nikol Gerasimov', N'0123-456-789', N'442 Le Van Viet', N'Dong Hoi', 88, CAST(N'2023-02-19' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'Tde9dFs4YW', N'US', N'Tde9dFs4YW', N'Maya Dmitriev', N'0123-456-789', N'869 Tran Nhan Tong', N'Dong Hoi', 57, CAST(N'2023-03-22' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'txmeHMFFZ4', N'US', N'txmeHMFFZ4', N'Dmitriy Solovev', N'0123-456-789', N'573 Ham Nghi', N'Ha Noi', 94, CAST(N'2023-03-16' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'tzyNEZtSq4', N'US', N'tzyNEZtSq4', N'Yevgeniya Sergeevna', N'0123-456-789', N'172 To Hien Thanh', N'Bien Hoa', 90, CAST(N'2023-02-02' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'u8PpAiY9Cw', N'US', N'u8PpAiY9Cw', N'Dusana Semyonova', N'0123-456-789', N'98 Ba Trieu', N'Hai Phong', 36, CAST(N'2023-03-28' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'UsDrMWnLUY', N'US', N'UsDrMWnLUY', N'Anya Ismailov', N'0123-456-789', N'520 Tran Nhan Tong', N'Quy Nhon', 95, CAST(N'2023-02-25' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'UsZwQdzr9J', N'US', N'UsZwQdzr9J', N'Gleb Kazakova', N'0123-456-789', N'246 Thieu Tri', N'Vung Tau', 17, CAST(N'2023-01-17' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'vObtrl6LNJ', N'US', N'vObtrl6LNJ', N'Feodore Arkhipova', N'0123-456-789', N'403 Xuan Dieu', N'Dong Hoi', 62, CAST(N'2023-01-28' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'VSecTdm4t2', N'US', N'VSecTdm4t2', N'Vanya Danilov', N'0123-456-789', N'874 Xuan Dieu', N'Quy Nhon', 46, CAST(N'2023-03-02' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'w618zvbJZ7', N'US', N'w618zvbJZ7', N'Georgy Kholod', N'0123-456-789', N'534 Ba Trieu', N'Da Nang', 90, CAST(N'2023-01-04' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'waf09WiXEh', N'US', N'waf09WiXEh', N'Maya Panova', N'0123-456-789', N'886 Quang Trung', N'Dong Ha', 61, CAST(N'2023-01-19' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'WS3HL9C5qu', N'US', N'WS3HL9C5qu', N'Oksana Belyaev', N'0123-456-789', N'201 Le Van Viet', N'Da Nang', 53, CAST(N'2023-01-15' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'wW437FA8dD', N'US', N'wW437FA8dD', N'Feodore Korolyova', N'0123-456-789', N'770 Xuan Dieu', N'Dong Ha', 38, CAST(N'2023-01-21' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'xhEOjMeKyH', N'US', N'xhEOjMeKyH', N'Vitaly Belova', N'0123-456-789', N'42 Tran Nhan Tong', N'Vung Tau', 74, CAST(N'2023-02-17' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'xHJedZ2oDL', N'US', N'xHJedZ2oDL', N'Konstantin Semyonova', N'0123-456-789', N'12 To Hien Thanh', N'Dong Ha', 70, CAST(N'2023-01-19' AS Date))
GO
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'XjX41uLbhz', N'US', N'XjX41uLbhz', N'Ustin Maksimova', N'0123-456-789', N'223 Vo Van Kiet', N'Dong Hoi', 72, CAST(N'2023-01-14' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'XVhZtgoA7s', N'US', N'XVhZtgoA7s', N'Zasha Omarov', N'0123-456-789', N'777 Le Van Viet', N'Ho Chi Minh', 5, CAST(N'2023-01-28' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'XwZuoLqYha', N'US', N'XwZuoLqYha', N'Olga Zhdanova', N'0123-456-789', N'472 Quang Trung', N'Bien Hoa', 86, CAST(N'2023-03-08' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'Y1FKzZcIjF', N'US', N'Y1FKzZcIjF', N'Maria Matveeva', N'0123-456-789', N'540 Xuan Dieu', N'Hai Phong', 35, CAST(N'2023-03-24' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'yHL7fe2kR6', N'US', N'yHL7fe2kR6', N'Vasily Simonov', N'0123-456-789', N'714 Hai Ba Trung', N'Dong Hoi', 76, CAST(N'2023-02-07' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'YmBngJlgd5', N'US', N'YmBngJlgd5', N'Vitaly Gerasimova', N'0123-456-789', N'710 Tran Nhan Tong', N'Vung Tau', 96, CAST(N'2023-01-28' AS Date))
INSERT [dbo].[User] ([UserID], [Role], [Password], [FullName], [Phone], [Address], [City], [Point], [RegisterDate]) VALUES (N'yvfyZMz3QP', N'US', N'yvfyZMz3QP', N'Vera Petrova', N'0123-456-789', N'167 Hai Ba Trung', N'Nha Trang', 98, CAST(N'2023-02-28' AS Date))
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[OrderLine]  WITH CHECK ADD  CONSTRAINT [FK_OrderProductDetail_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
GO
ALTER TABLE [dbo].[OrderLine] CHECK CONSTRAINT [FK_OrderProductDetail_Order]
GO
ALTER TABLE [dbo].[OrderLine]  WITH CHECK ADD  CONSTRAINT [FK_OrderProductDetail_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[OrderLine] CHECK CONSTRAINT [FK_OrderProductDetail_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Categories] FOREIGN KEY([category])
REFERENCES [dbo].[Categories] ([cid])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Categories]
GO
USE [master]
GO
ALTER DATABASE [PlantHouseManagement] SET  READ_WRITE 
GO

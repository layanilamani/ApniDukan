USE [master]
GO
/****** Object:  Database [ApniDukaan]    Script Date: 7/2/2018 1:08:01 PM ******/
CREATE DATABASE [ApniDukaan]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ApniDukaan', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\ApniDukaan.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ApniDukaan_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\ApniDukaan_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ApniDukaan] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ApniDukaan].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ApniDukaan] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ApniDukaan] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ApniDukaan] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ApniDukaan] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ApniDukaan] SET ARITHABORT OFF 
GO
ALTER DATABASE [ApniDukaan] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ApniDukaan] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [ApniDukaan] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ApniDukaan] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ApniDukaan] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ApniDukaan] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ApniDukaan] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ApniDukaan] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ApniDukaan] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ApniDukaan] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ApniDukaan] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ApniDukaan] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ApniDukaan] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ApniDukaan] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ApniDukaan] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ApniDukaan] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ApniDukaan] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ApniDukaan] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ApniDukaan] SET RECOVERY FULL 
GO
ALTER DATABASE [ApniDukaan] SET  MULTI_USER 
GO
ALTER DATABASE [ApniDukaan] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ApniDukaan] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ApniDukaan] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ApniDukaan] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ApniDukaan', N'ON'
GO
USE [ApniDukaan]
GO
/****** Object:  Table [dbo].[CashRegister]    Script Date: 7/2/2018 1:08:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CashRegister](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StartingBalance] [numeric](18, 2) NULL,
	[ClosingDate] [datetime] NULL,
	[OpeningDate] [datetime] NULL,
	[EndingBalance] [numeric](18, 2) NULL,
 CONSTRAINT [PK_CashRegister] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Categories]    Script Date: 7/2/2018 1:08:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[ParentId] [int] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Expenses]    Script Date: 7/2/2018 1:08:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Expenses](
	[Id] [int] NULL,
	[Title] [varchar](50) NULL,
	[Amount] [float] NULL,
	[AddedDate] [datetime] NULL,
	[ExpenseDate] [date] NULL,
	[ExpenseTypeId] [int] NULL,
	[IsDeleted] [bit] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExpenseTypes]    Script Date: 7/2/2018 1:08:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExpenseTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_ExpenseTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ItemPurchaseDetails]    Script Date: 7/2/2018 1:08:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemPurchaseDetails](
	[Id] [int] NULL,
	[ItemPurchaseId] [int] NULL,
	[Amount] [float] NULL,
	[AddedDate] [datetime] NULL,
	[Discount] [float] NULL,
	[ItemId] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ItemPurchases]    Script Date: 7/2/2018 1:08:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ItemPurchases](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NULL,
	[Detail] [varchar](max) NULL,
	[PurchaseDate] [date] NULL,
	[AddedDate] [datetime] NULL,
	[SupplierId] [int] NULL,
	[SupplyRequestId] [int] NULL,
 CONSTRAINT [PK_ItemPurchases] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sales]    Script Date: 7/2/2018 1:08:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sales](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SellingItemId] [int] NULL,
	[Amount] [float] NULL,
	[Discount] [float] NULL,
	[AddedDate] [datetime] NULL,
	[OperatorId] [int] NULL,
	[SaleDate] [datetime] NULL,
	[CardId] [varchar](50) NULL,
	[CardHolderName] [varchar](50) NULL,
	[CardExpiry] [date] NULL,
 CONSTRAINT [PK_Sales] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SellingItems]    Script Date: 7/2/2018 1:08:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SellingItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[CurrentPrice] [float] NULL,
	[IsDeleted] [bit] NULL,
	[CategoryId] [int] NULL,
 CONSTRAINT [PK_SellingItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Stock]    Script Date: 7/2/2018 1:08:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock](
	[Id] [int] NOT NULL,
	[SellingItemId] [int] NULL,
	[Quantity] [int] NULL,
	[UnitPrice] [float] NULL,
	[SupplierId] [int] NULL,
	[UnitTypeId] [int] NULL,
	[SupplyRequestId] [int] NULL,
	[AddedDate] [datetime] NULL,
 CONSTRAINT [PK_Stock] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SupplyRequests]    Script Date: 7/2/2018 1:08:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupplyRequests](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SupplierId] [int] NULL,
	[Quantity] [int] NULL,
	[UnitTypeId] [int] NULL,
	[AddedDate] [datetime] NULL,
	[SellingItemId] [int] NULL,
 CONSTRAINT [PK_SupplyRequests] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UnitTypes]    Script Date: 7/2/2018 1:08:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UnitTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_UnitTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/2/2018 1:08:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[UserTypeId] [int] NULL,
	[IsActive] [bit] NULL,
	[Address] [varchar](max) NULL,
	[MobileNo1] [varchar](12) NULL,
	[MobileNo2] [varchar](12) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserTypes]    Script Date: 7/2/2018 1:08:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_UserTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [ParentId]) VALUES (1, N'General', NULL)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId]) VALUES (2, N'Cosmetics', NULL)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId]) VALUES (3, N'Cloth', NULL)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId]) VALUES (4, N'Cloth Man', 3)
INSERT [dbo].[Categories] ([Id], [Name], [ParentId]) VALUES (5, N'Cloth Kids', 3)
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[ExpenseTypes] ON 

INSERT [dbo].[ExpenseTypes] ([Id], [Name]) VALUES (1, N'KE Bill')
INSERT [dbo].[ExpenseTypes] ([Id], [Name]) VALUES (2, N'Worker Salary')
SET IDENTITY_INSERT [dbo].[ExpenseTypes] OFF
SET IDENTITY_INSERT [dbo].[UnitTypes] ON 

INSERT [dbo].[UnitTypes] ([Id], [Name]) VALUES (1, N'Bori')
INSERT [dbo].[UnitTypes] ([Id], [Name]) VALUES (2, N'Box')
INSERT [dbo].[UnitTypes] ([Id], [Name]) VALUES (3, N'KG')
INSERT [dbo].[UnitTypes] ([Id], [Name]) VALUES (4, N'Gallon')
SET IDENTITY_INSERT [dbo].[UnitTypes] OFF
SET IDENTITY_INSERT [dbo].[UserTypes] ON 

INSERT [dbo].[UserTypes] ([Id], [Name]) VALUES (1, N'Admin')
INSERT [dbo].[UserTypes] ([Id], [Name]) VALUES (2, N'Supplier')
INSERT [dbo].[UserTypes] ([Id], [Name]) VALUES (3, N'Operator')
SET IDENTITY_INSERT [dbo].[UserTypes] OFF
ALTER TABLE [dbo].[Categories]  WITH CHECK ADD  CONSTRAINT [FK_Categories_Categories] FOREIGN KEY([ParentId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Categories] CHECK CONSTRAINT [FK_Categories_Categories]
GO
ALTER TABLE [dbo].[Expenses]  WITH CHECK ADD  CONSTRAINT [FK_Expenses_ExpenseTypes] FOREIGN KEY([ExpenseTypeId])
REFERENCES [dbo].[ExpenseTypes] ([Id])
GO
ALTER TABLE [dbo].[Expenses] CHECK CONSTRAINT [FK_Expenses_ExpenseTypes]
GO
ALTER TABLE [dbo].[ItemPurchaseDetails]  WITH CHECK ADD  CONSTRAINT [FK_ItemPurchaseDetails_ItemPurchases] FOREIGN KEY([ItemPurchaseId])
REFERENCES [dbo].[ItemPurchases] ([Id])
GO
ALTER TABLE [dbo].[ItemPurchaseDetails] CHECK CONSTRAINT [FK_ItemPurchaseDetails_ItemPurchases]
GO
ALTER TABLE [dbo].[ItemPurchaseDetails]  WITH CHECK ADD  CONSTRAINT [FK_ItemPurchaseDetails_SellingItems] FOREIGN KEY([ItemId])
REFERENCES [dbo].[SellingItems] ([Id])
GO
ALTER TABLE [dbo].[ItemPurchaseDetails] CHECK CONSTRAINT [FK_ItemPurchaseDetails_SellingItems]
GO
ALTER TABLE [dbo].[ItemPurchases]  WITH CHECK ADD  CONSTRAINT [FK_ItemPurchases_SupplyRequests] FOREIGN KEY([SupplyRequestId])
REFERENCES [dbo].[SupplyRequests] ([Id])
GO
ALTER TABLE [dbo].[ItemPurchases] CHECK CONSTRAINT [FK_ItemPurchases_SupplyRequests]
GO
ALTER TABLE [dbo].[ItemPurchases]  WITH CHECK ADD  CONSTRAINT [FK_ItemPurchases_Users] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[ItemPurchases] CHECK CONSTRAINT [FK_ItemPurchases_Users]
GO
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD  CONSTRAINT [FK_Sales_SellingItems] FOREIGN KEY([SellingItemId])
REFERENCES [dbo].[SellingItems] ([Id])
GO
ALTER TABLE [dbo].[Sales] CHECK CONSTRAINT [FK_Sales_SellingItems]
GO
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Users] FOREIGN KEY([OperatorId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Sales] CHECK CONSTRAINT [FK_Sales_Users]
GO
ALTER TABLE [dbo].[SellingItems]  WITH CHECK ADD  CONSTRAINT [FK_SellingItems_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[SellingItems] CHECK CONSTRAINT [FK_SellingItems_Categories]
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD  CONSTRAINT [FK_Stock_SellingItems] FOREIGN KEY([SellingItemId])
REFERENCES [dbo].[SellingItems] ([Id])
GO
ALTER TABLE [dbo].[Stock] CHECK CONSTRAINT [FK_Stock_SellingItems]
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD  CONSTRAINT [FK_Stock_UnitTypes] FOREIGN KEY([UnitTypeId])
REFERENCES [dbo].[UnitTypes] ([Id])
GO
ALTER TABLE [dbo].[Stock] CHECK CONSTRAINT [FK_Stock_UnitTypes]
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD  CONSTRAINT [FK_Stock_Users] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Stock] CHECK CONSTRAINT [FK_Stock_Users]
GO
ALTER TABLE [dbo].[SupplyRequests]  WITH CHECK ADD  CONSTRAINT [FK_SupplyRequests_SellingItems] FOREIGN KEY([SellingItemId])
REFERENCES [dbo].[SellingItems] ([Id])
GO
ALTER TABLE [dbo].[SupplyRequests] CHECK CONSTRAINT [FK_SupplyRequests_SellingItems]
GO
ALTER TABLE [dbo].[SupplyRequests]  WITH CHECK ADD  CONSTRAINT [FK_SupplyRequests_UnitTypes] FOREIGN KEY([UnitTypeId])
REFERENCES [dbo].[UnitTypes] ([Id])
GO
ALTER TABLE [dbo].[SupplyRequests] CHECK CONSTRAINT [FK_SupplyRequests_UnitTypes]
GO
ALTER TABLE [dbo].[SupplyRequests]  WITH CHECK ADD  CONSTRAINT [FK_SupplyRequests_Users] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[SupplyRequests] CHECK CONSTRAINT [FK_SupplyRequests_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_UserTypes] FOREIGN KEY([UserTypeId])
REFERENCES [dbo].[UserTypes] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_UserTypes]
GO
USE [master]
GO
ALTER DATABASE [ApniDukaan] SET  READ_WRITE 
GO

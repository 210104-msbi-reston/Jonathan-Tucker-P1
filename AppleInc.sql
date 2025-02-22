USE [master]
GO
/****** Object:  Database [AppleInc]    Script Date: 2/3/2021 1:08:47 PM ******/
CREATE DATABASE [AppleInc]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AppleInc', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.REVATUREJT\MSSQL\DATA\AppleInc.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AppleInc_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.REVATUREJT\MSSQL\DATA\AppleInc_log.ldf' , SIZE = 860160KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [AppleInc] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AppleInc].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AppleInc] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AppleInc] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AppleInc] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AppleInc] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AppleInc] SET ARITHABORT OFF 
GO
ALTER DATABASE [AppleInc] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AppleInc] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AppleInc] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AppleInc] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AppleInc] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AppleInc] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AppleInc] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AppleInc] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AppleInc] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AppleInc] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AppleInc] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AppleInc] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AppleInc] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AppleInc] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AppleInc] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AppleInc] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AppleInc] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AppleInc] SET RECOVERY FULL 
GO
ALTER DATABASE [AppleInc] SET  MULTI_USER 
GO
ALTER DATABASE [AppleInc] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AppleInc] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AppleInc] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AppleInc] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AppleInc] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AppleInc] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'AppleInc', N'ON'
GO
ALTER DATABASE [AppleInc] SET QUERY_STORE = OFF
GO
USE [AppleInc]
GO
/****** Object:  Table [dbo].[ProductionInventory]    Script Date: 2/3/2021 1:08:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductionInventory](
	[serialNumber] [bigint] IDENTITY(1000000,1) NOT NULL,
	[productId] [int] NULL,
	[warehouseId] [int] NULL,
	[productionPrice] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[serialNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[DisplayProductionInventory]    Script Date: 2/3/2021 1:08:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[DisplayProductionInventory]
as
select serialNumber as [Serial Number],
		productId as [Item Number],
		warehouseId as [Warehouse],
		productionPrice as [Price]
from ProductionInventory
GO
/****** Object:  Table [dbo].[GeneralDistributorInventory]    Script Date: 2/3/2021 1:08:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GeneralDistributorInventory](
	[serialNumber] [bigint] NOT NULL,
	[generalDistributorId] [int] NULL,
	[generalDistributorPrice] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[serialNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[DisplayGeneralDistributorInventory]    Script Date: 2/3/2021 1:08:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[DisplayGeneralDistributorInventory]
as
select serialNumber as [Serial Number],
		generalDistributorId as [General Distributor],
		generalDistributorPrice as [Price]
from GeneralDistributorInventory
GO
/****** Object:  Table [dbo].[ProductionLog]    Script Date: 2/3/2021 1:08:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductionLog](
	[productionLogId] [int] IDENTITY(1,1) NOT NULL,
	[productionHouseId] [int] NULL,
	[productId] [int] NULL,
	[serialNumber] [bigint] NULL,
	[dateOfProduction] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[productionLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[serialNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[DisplayProductionLog]    Script Date: 2/3/2021 1:08:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[DisplayProductionLog] as
select 
		ProductionLog.productionLogId as [Log Number],
		ProductionLog.serialNumber as [Serial Number],
		ProductionLog.productId as [Item Number],
		ProductionLog.productionHouseId as [Production House],
		ProductionLog.dateOfProduction as [Date Produced]
from ProductionLog
GO
/****** Object:  Table [dbo].[SubDistributorInventory]    Script Date: 2/3/2021 1:08:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubDistributorInventory](
	[serialNumber] [bigint] NOT NULL,
	[subDistributorId] [int] NULL,
	[price] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[serialNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[DisplaySubDistributorInventory]    Script Date: 2/3/2021 1:08:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[DisplaySubDistributorInventory]
as
select serialNumber as [Serial Number],
		subDistributorId as [Sub Distributor],
		price as [Price]
from SubDistributorInventory
GO
/****** Object:  Table [dbo].[StoreInventory]    Script Date: 2/3/2021 1:08:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StoreInventory](
	[serialNumber] [bigint] NOT NULL,
	[storeId] [int] NULL,
	[storePrice] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[serialNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[DisplayStoreInventory]    Script Date: 2/3/2021 1:08:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[DisplayStoreInventory]
as
select serialNumber as [Serial Number],
		storeId as [Store Number],
		storePrice [Retail Price]
from StoreInventory
GO
/****** Object:  Table [dbo].[GeneralDistributor]    Script Date: 2/3/2021 1:08:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GeneralDistributor](
	[generalDistributorId] [int] IDENTITY(200,1) NOT NULL,
	[countryId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[generalDistributorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubDistributor]    Script Date: 2/3/2021 1:08:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubDistributor](
	[subDistributorId] [int] IDENTITY(300,1) NOT NULL,
	[generalDistributorId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[subDistributorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChannelPartner]    Script Date: 2/3/2021 1:08:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChannelPartner](
	[channelPartnerId] [int] IDENTITY(400,1) NOT NULL,
	[subDistributorId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[channelPartnerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zone]    Script Date: 2/3/2021 1:08:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zone](
	[zoneId] [int] IDENTITY(1,1) NOT NULL,
	[channelPartnerId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[zoneId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Store]    Script Date: 2/3/2021 1:08:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Store](
	[storeId] [int] IDENTITY(1,1) NOT NULL,
	[zoneId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[storeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 2/3/2021 1:08:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[countryId] [int] IDENTITY(1,1) NOT NULL,
	[countryName] [nvarchar](50) NULL,
	[continentId] [char](2) NULL,
	[manufacturingTax] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[countryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[DisplayStoreLocations]    Script Date: 2/3/2021 1:08:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[DisplayStoreLocations]
as
select 
	Store.storeId as [Store Number],
	Store.zoneId as [Zone],
	Zone.channelPartnerId as [Channel Partner],
	ChannelPartner.subDistributorId as [Sub Distributor],
	SubDistributor.generalDistributorId as [General Distributor],
	Country.countryName as [Country]
from Store
join Zone on Store.zoneId = Zone.zoneId
join ChannelPartner on Zone.channelPartnerId = ChannelPartner.channelPartnerId
join SubDistributor on ChannelPartner.subDistributorId = SubDistributor.subDistributorId
join GeneralDistributor on SubDistributor.generalDistributorId = GeneralDistributor.generalDistributorId
join Country on GeneralDistributor.countryId = Country.countryId
GO
/****** Object:  Table [dbo].[Continent]    Script Date: 2/3/2021 1:08:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Continent](
	[continentId] [char](2) NOT NULL,
	[continentName] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[continentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductionHouse]    Script Date: 2/3/2021 1:08:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductionHouse](
	[productionHouseId] [int] IDENTITY(1,1) NOT NULL,
	[continentId] [char](2) NULL,
PRIMARY KEY CLUSTERED 
(
	[productionHouseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ProductionHouseLocations]    Script Date: 2/3/2021 1:08:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[ProductionHouseLocations] as
select ProductionHouse.productionHouseId as [Production House], 
		Continent.continentName as [Continent]
from ProductionHouse
join Continent on ProductionHouse.continentId = Continent.continentId
GO
/****** Object:  Table [dbo].[GeneralDistributorPurchases]    Script Date: 2/3/2021 1:08:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GeneralDistributorPurchases](
	[purchaseId] [int] IDENTITY(1,1) NOT NULL,
	[generalDistributorId] [int] NULL,
	[warehouseId] [int] NULL,
	[serialnumber] [bigint] NULL,
	[dateofPurchase] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[purchaseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[serialnumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChannelZoneStoreTransactions]    Script Date: 2/3/2021 1:08:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChannelZoneStoreTransactions](
	[transactionId] [int] IDENTITY(1,1) NOT NULL,
	[subDistributorId] [int] NULL,
	[channelPartnerId] [int] NULL,
	[zoneId] [int] NULL,
	[storeId] [int] NULL,
	[serialNumber] [bigint] NULL,
	[dateOfTransaction] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[transactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[serialNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StoreTransaction]    Script Date: 2/3/2021 1:08:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StoreTransaction](
	[transactionId] [int] IDENTITY(1,1) NOT NULL,
	[storeId] [int] NULL,
	[customerId] [int] NULL,
	[serialNumber] [bigint] NULL,
	[dateOfTransaction] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[transactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[serialNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[DisplayProductHistory]    Script Date: 2/3/2021 1:08:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[DisplayProductHistory]
as
select
	plog.serialNumber as [Serial Number],
	plog.productId as [Item Number],
	productionHouseId as [Production House],
	gdp.warehouseId as [Warehouse Number],
	gdp.generalDistributorId as [General Distributor],
	czst.subDistributorId as [Sub Distributor],
	czst.channelPartnerId as [Channel Partner],
	czst.storeId as [Store Number],
	st.customerId as [Customer]
from ProductionLog as plog
full join GeneralDistributorPurchases as gdp on plog.serialNumber = gdp.serialNumber
full join ChannelZoneStoreTransactions as czst on plog.serialNumber = czst.serialNumber
full join StoreTransaction as st on plog.serialNumber = st.serialNumber
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 2/3/2021 1:08:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[citizenId] [int] IDENTITY(2000000,1) NOT NULL,
	[firstName] [nvarchar](25) NULL,
	[lastName] [nvarchar](25) NULL,
	[emailAddress] [nvarchar](75) NULL,
	[countryId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[citizenId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[CustomerLocation]    Script Date: 2/3/2021 1:08:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[CustomerLocation]
as
select 
	concat(cu.firstName, ' ', cu.lastName) as [Customer],
	cu.citizenId as [Citizen ID Number],
	cn.countryName as [Country],
	ct.continentName as [Continent]
from Customer as cu
join Country as cn on cu.countryId = cn.countryId
join Continent as ct on cn.continentId = ct.continentId
GO
/****** Object:  Table [dbo].[ProductList]    Script Date: 2/3/2021 1:08:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductList](
	[productId] [int] IDENTITY(100,1) NOT NULL,
	[productName] [nvarchar](100) NULL,
	[productType] [nvarchar](25) NULL,
	[productCategory] [nvarchar](25) NULL,
	[basePrice] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[productId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[DetailProductInformation]    Script Date: 2/3/2021 1:08:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[DetailProductInformation]
as
select 
	plog.serialNumber as [Serial Number],
	plist.productName as [Name],
	plist.productType as [Type],
	plist.productCategory as [Category]
from ProductionLog as plog
join ProductList as plist on plog.productId = plist.productId
GO
/****** Object:  Table [dbo].[Queries]    Script Date: 2/3/2021 1:08:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Queries](
	[queryId] [int] IDENTITY(1,1) NOT NULL,
	[queryType] [nvarchar](30) NULL,
	[queryContent] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[queryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubDistributorPurchases]    Script Date: 2/3/2021 1:08:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubDistributorPurchases](
	[purchaseId] [int] IDENTITY(1,1) NOT NULL,
	[subDistributorId] [int] NULL,
	[generalDistributorId] [int] NULL,
	[serialNumber] [bigint] NULL,
	[dateOfPurchase] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[purchaseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[serialNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Warehouse]    Script Date: 2/3/2021 1:08:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Warehouse](
	[warehouseId] [int] IDENTITY(1,1) NOT NULL,
	[countryId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[warehouseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ChannelPartner]  WITH CHECK ADD FOREIGN KEY([subDistributorId])
REFERENCES [dbo].[SubDistributor] ([subDistributorId])
GO
ALTER TABLE [dbo].[ChannelZoneStoreTransactions]  WITH CHECK ADD FOREIGN KEY([channelPartnerId])
REFERENCES [dbo].[ChannelPartner] ([channelPartnerId])
GO
ALTER TABLE [dbo].[ChannelZoneStoreTransactions]  WITH CHECK ADD FOREIGN KEY([storeId])
REFERENCES [dbo].[Store] ([storeId])
GO
ALTER TABLE [dbo].[ChannelZoneStoreTransactions]  WITH CHECK ADD FOREIGN KEY([subDistributorId])
REFERENCES [dbo].[SubDistributor] ([subDistributorId])
GO
ALTER TABLE [dbo].[ChannelZoneStoreTransactions]  WITH CHECK ADD FOREIGN KEY([zoneId])
REFERENCES [dbo].[Zone] ([zoneId])
GO
ALTER TABLE [dbo].[Country]  WITH CHECK ADD FOREIGN KEY([continentId])
REFERENCES [dbo].[Continent] ([continentId])
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD FOREIGN KEY([countryId])
REFERENCES [dbo].[Country] ([countryId])
GO
ALTER TABLE [dbo].[GeneralDistributor]  WITH CHECK ADD FOREIGN KEY([countryId])
REFERENCES [dbo].[Country] ([countryId])
GO
ALTER TABLE [dbo].[GeneralDistributorInventory]  WITH CHECK ADD FOREIGN KEY([generalDistributorId])
REFERENCES [dbo].[GeneralDistributor] ([generalDistributorId])
GO
ALTER TABLE [dbo].[GeneralDistributorInventory]  WITH CHECK ADD FOREIGN KEY([serialNumber])
REFERENCES [dbo].[ProductionLog] ([serialNumber])
GO
ALTER TABLE [dbo].[GeneralDistributorPurchases]  WITH CHECK ADD FOREIGN KEY([generalDistributorId])
REFERENCES [dbo].[GeneralDistributor] ([generalDistributorId])
GO
ALTER TABLE [dbo].[GeneralDistributorPurchases]  WITH CHECK ADD FOREIGN KEY([warehouseId])
REFERENCES [dbo].[Warehouse] ([warehouseId])
GO
ALTER TABLE [dbo].[ProductionHouse]  WITH CHECK ADD FOREIGN KEY([continentId])
REFERENCES [dbo].[Continent] ([continentId])
GO
ALTER TABLE [dbo].[ProductionInventory]  WITH CHECK ADD FOREIGN KEY([productId])
REFERENCES [dbo].[ProductList] ([productId])
GO
ALTER TABLE [dbo].[ProductionInventory]  WITH CHECK ADD FOREIGN KEY([warehouseId])
REFERENCES [dbo].[Warehouse] ([warehouseId])
GO
ALTER TABLE [dbo].[ProductionLog]  WITH CHECK ADD FOREIGN KEY([productionHouseId])
REFERENCES [dbo].[ProductionHouse] ([productionHouseId])
GO
ALTER TABLE [dbo].[ProductionLog]  WITH CHECK ADD FOREIGN KEY([productId])
REFERENCES [dbo].[ProductList] ([productId])
GO
ALTER TABLE [dbo].[Store]  WITH CHECK ADD FOREIGN KEY([zoneId])
REFERENCES [dbo].[Zone] ([zoneId])
GO
ALTER TABLE [dbo].[StoreInventory]  WITH CHECK ADD FOREIGN KEY([serialNumber])
REFERENCES [dbo].[ProductionLog] ([serialNumber])
GO
ALTER TABLE [dbo].[StoreInventory]  WITH CHECK ADD FOREIGN KEY([storeId])
REFERENCES [dbo].[Store] ([storeId])
GO
ALTER TABLE [dbo].[StoreTransaction]  WITH CHECK ADD FOREIGN KEY([customerId])
REFERENCES [dbo].[Customer] ([citizenId])
GO
ALTER TABLE [dbo].[StoreTransaction]  WITH CHECK ADD FOREIGN KEY([storeId])
REFERENCES [dbo].[Store] ([storeId])
GO
ALTER TABLE [dbo].[SubDistributor]  WITH CHECK ADD FOREIGN KEY([generalDistributorId])
REFERENCES [dbo].[GeneralDistributor] ([generalDistributorId])
GO
ALTER TABLE [dbo].[SubDistributorInventory]  WITH CHECK ADD FOREIGN KEY([serialNumber])
REFERENCES [dbo].[ProductionLog] ([serialNumber])
GO
ALTER TABLE [dbo].[SubDistributorInventory]  WITH CHECK ADD FOREIGN KEY([subDistributorId])
REFERENCES [dbo].[SubDistributor] ([subDistributorId])
GO
ALTER TABLE [dbo].[SubDistributorPurchases]  WITH CHECK ADD FOREIGN KEY([generalDistributorId])
REFERENCES [dbo].[GeneralDistributor] ([generalDistributorId])
GO
ALTER TABLE [dbo].[SubDistributorPurchases]  WITH CHECK ADD FOREIGN KEY([subDistributorId])
REFERENCES [dbo].[SubDistributor] ([subDistributorId])
GO
ALTER TABLE [dbo].[Warehouse]  WITH CHECK ADD FOREIGN KEY([countryId])
REFERENCES [dbo].[Country] ([countryId])
GO
ALTER TABLE [dbo].[Zone]  WITH CHECK ADD FOREIGN KEY([channelPartnerId])
REFERENCES [dbo].[ChannelPartner] ([channelPartnerId])
GO
ALTER TABLE [dbo].[ProductList]  WITH CHECK ADD CHECK  (([productType]='Accessory' OR [productType]='Peripheral' OR [productType]='Hardware'))
GO
ALTER TABLE [dbo].[Queries]  WITH CHECK ADD CHECK  (([queryType]='Procedure' OR [queryType]='View'))
GO
/****** Object:  StoredProcedure [dbo].[proc_CustomerPurchaseProduct]    Script Date: 2/3/2021 1:08:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[proc_CustomerPurchaseProduct] @serialNum bigint, @customer int
as
	declare @store int = (select storeId from StoreInventory where serialNumber = @serialNum)
	
	insert into StoreTransaction values(@store, @customer, @serialNum, getdate())
	delete from StoreInventory where serialNumber = @serialNum
GO
/****** Object:  StoredProcedure [dbo].[proc_GeneralDistributorToSubDistributor]    Script Date: 2/3/2021 1:08:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[proc_GeneralDistributorToSubDistributor] @serialNum bigint
as
	declare @generalDistributor int
	declare @subDistributor int
	declare @price money

	set @generalDistributor = (select generalDistributorId from GeneralDistributorInventory where serialNumber = @serialNum)
	set @subDistributor = (select top 1 subDistributorId from SubDistributor where generalDistributorId = @generalDistributor order by newid())
	set @price = (select generalDistributorPrice from GeneralDistributorInventory where serialNumber = @serialNum) * 1.08

	insert into SubDistributorInventory values(@serialNum, @subDistributor, @price)
GO
/****** Object:  StoredProcedure [dbo].[proc_GenerateChannelPartners]    Script Date: 2/3/2021 1:08:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[proc_GenerateChannelPartners]
as
	declare @count int
	declare @totalSubDistributors int
	declare @numChannels int
	declare @idNum int

	set @totalSubDistributors = (select count(*) from SubDistributor)
	set @count = 0
	set @idNum = 300

	while(@count < @totalSubDistributors)
	begin
		set @numChannels = 0
		set @count += 1
		set @idNum += 1
		while(@numChannels < 3)
		begin
			insert into ChannelPartner values(@idNum)
			set @numChannels += 1
		end
	end
GO
/****** Object:  StoredProcedure [dbo].[proc_GenerateCustomer]    Script Date: 2/3/2021 1:08:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[proc_GenerateCustomer] @name nvarchar(50), @country int=null
as
	declare @id int
	declare @email nvarchar(50)
	declare @firstName nvarchar(25)
	declare @lastName nvarchar(25)
	declare @customerCountry int
	if @country is null
		set @customerCountry = (select top 1 countryId from Country order by newid())
	else
		set @customerCountry = @country

	set @firstName = (select SUBSTRING(@name, 1, CHARINDEX(' ', @name) - 1))
	set @lastName = (select SUBSTRING(@name, CHARINDEX(' ', @name) + 1, LEN(@name)))
	set @email = NULL

	insert into Customer values(@firstName, @lastName, @email, @customerCountry);
	set @id = (select top 1 citizenId from Customer where firstName = @firstName and lastname = @lastName order by citizenId desc)
	set @email = concat(@firstName, '.', @lastName, (@id % 100), '@apple.com')
	update Customer set emailAddress = lower(@email) where citizenId = @id
	
GO
/****** Object:  StoredProcedure [dbo].[proc_GenerateGeneralDistributors]    Script Date: 2/3/2021 1:08:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[proc_GenerateGeneralDistributors]
as
	declare @totalCountries int
	declare @count int

	set @totalCountries = (select count(*) from Country);
	set @count = 0

	while (@count < @totalCountries)
	begin
		set @count += 1;
		insert into GeneralDistributor values(@count);
	end
GO
/****** Object:  StoredProcedure [dbo].[proc_GenerateOneProduct]    Script Date: 2/3/2021 1:08:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[proc_GenerateOneProduct] @productToProduce int
as
	declare @storageWarehouse int
	declare @country int
	declare @productionPrice money

	set @storageWarehouse = (select top 1 warehouseId from Warehouse order by newid())
	set @country = (select countryId from Warehouse where warehouseId = @storageWarehouse)
	set @productionPrice = (select basePrice from ProductList where productId = @productToProduce) * (select manufacturingTax from Country where countryId = @country)

	insert into ProductionInventory values(@productToProduce, @storageWarehouse, @productionPrice)
GO
/****** Object:  StoredProcedure [dbo].[proc_GenerateOneProductFromQuantity]    Script Date: 2/3/2021 1:08:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[proc_GenerateOneProductFromQuantity] @productNum int, @quantity int
as
	declare @count int = 0

	while (@count < @quantity)
	begin
		exec proc_GenerateOneProduct @productNum
		set @count += 1
	end
GO
/****** Object:  StoredProcedure [dbo].[proc_GenerateProductsFromCategory]    Script Date: 2/3/2021 1:08:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[proc_GenerateProductsFromCategory] @quantity int, @category nvarchar(20)
as
	declare @count int
	declare @enum table (id int)

	insert into @enum select productId from ProductList where productCategory = @category
	declare @id int

	while exists (select 1 from @enum)
	begin
		set @count = 0
		select top 1 @id = id from @enum
		while (@count < @quantity)
		begin
			exec proc_GenerateOneProduct @id
			set @count += 1
		end
		delete from @enum where id = @id
	end
GO
/****** Object:  StoredProcedure [dbo].[proc_GenerateProductsFromQuantity]    Script Date: 2/3/2021 1:08:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[proc_GenerateProductsFromQuantity] @quantity int
as
	declare @count int
	declare @enum table (id int)

	insert into @enum select productId from ProductList
	declare @id int

	while exists (select 1 from @enum)
	begin
		set @count = 0
		select top 1 @id = id from @enum
		while (@count < @quantity)
		begin
			exec proc_GenerateOneProduct @id
			set @count += 1
		end
		delete from @enum where id = @id
	end

GO
/****** Object:  StoredProcedure [dbo].[proc_GenerateProductsFromType]    Script Date: 2/3/2021 1:08:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[proc_GenerateProductsFromType] @quantity int, @type nvarchar(20)
as
	declare @count int
	declare @enum table (id int)

	insert into @enum select productId from ProductList where productType = @type
	declare @id int

	while exists (select 1 from @enum)
	begin
		set @count = 0
		select top 1 @id = id from @enum
		while (@count < @quantity)
		begin
			exec proc_GenerateOneProduct @id
			set @count += 1
		end
		delete from @enum where id = @id
	end
GO
/****** Object:  StoredProcedure [dbo].[proc_GenerateProductsFromTypeCategory]    Script Date: 2/3/2021 1:08:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[proc_GenerateProductsFromTypeCategory] @quantity int, @type int, @category nvarchar(20)
as
	declare @count int
	declare @enum table (id int)

	insert into @enum select productId from ProductList where productCategory = @category and productType = @type
	declare @id int

	while exists (select 1 from @enum)
	begin
		set @count = 0
		select top 1 @id = id from @enum
		while (@count < @quantity)
		begin
			exec proc_GenerateOneProduct @id
			set @count += 1
		end
		delete from @enum where id = @id
	end

GO
/****** Object:  StoredProcedure [dbo].[proc_GenerateStores]    Script Date: 2/3/2021 1:08:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[proc_GenerateStores]
as
	declare @count int
	declare @totalZones int
	declare @numStores int
	declare @idNum int

	set @totalZones = (select count(*) from Zone);
	set @count = 0
	set @idNum = 0

	while(@count < @totalZones)
	begin
		set @numStores = 0
		set @count += 1
		set @idNum += 1
		while(@numStores < 6)
		begin
			insert into Store values(@idNum)
			set @numStores += 1
		end
	end
GO
/****** Object:  StoredProcedure [dbo].[proc_GenerateSubDistributors]    Script Date: 2/3/2021 1:08:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[proc_GenerateSubDistributors]
as
	declare @totalGenDistributors int
	declare @count int
	declare @numSubDistributor int
	declare @idNum int

	set @totalGenDistributors = (select count(*) from GeneralDistributor)
	set @count = 0
	set @idNum = 200

	while(@count < @totalGenDistributors)
	begin
		set @numSubDistributor = 0
		set @count += 1
		set @idNum += 1
		while(@numSubDistributor < 2)
		begin
			insert into SubDistributor values(@idNum)
			set @numSubDistributor += 1
		end
	end
GO
/****** Object:  StoredProcedure [dbo].[proc_GenerateZones]    Script Date: 2/3/2021 1:08:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[proc_GenerateZones]
as
	declare @count int
	declare @totalChannels int
	declare @numZones int
	declare @idNum int

	set @totalChannels = (select count(*) from ChannelPartner)
	set @count = 0
	set @idNum = 399

	while(@count < @totalChannels)
	begin
		set @numZones = 0
		set @count += 1
		set @idNum += 1
		while(@numZones < 2)
		begin
			insert into Zone values(@idNum)
			set @numZones += 1
		end
	end
GO
/****** Object:  StoredProcedure [dbo].[proc_InitializeWarehouse]    Script Date: 2/3/2021 1:08:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[proc_InitializeWarehouse]
as
	declare @count int
	declare @totalCountries int
	declare @numWarehouses int

	set @totalCountries = (select max(countryId) from Country)
	set @count = 0;
	

	while (@count < @totalCountries)
	begin
		set @numWarehouses = 0;
		set @count += 1
		while (@numWarehouses < 4)
		begin
			insert into Warehouse values(@count)
			set @numWarehouses += 1
		end
	end
GO
/****** Object:  StoredProcedure [dbo].[proc_ProductionToGeneralDistributor]    Script Date: 2/3/2021 1:08:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[proc_ProductionToGeneralDistributor] @serialNumber bigint
as
	declare @warehouse int
	declare @country int
	declare @distributor int
	declare @price money

	set @warehouse = (select warehouseId from ProductionInventory where serialNumber = @serialNumber)
	set @country = (select countryId from Warehouse where warehouseId = @warehouse)

	set @distributor = (select generalDistributorId from GeneralDistributor where countryId = @country)
	set @price = (select productionPrice from ProductionInventory where serialNumber = @serialNumber) * 1.08

	insert into GeneralDistributorInventory values(@serialNumber, @distributor, @price);
GO
/****** Object:  StoredProcedure [dbo].[proc_ProductionToStore]    Script Date: 2/3/2021 1:08:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[proc_ProductionToStore] @serialNum int
as
		exec proc_ProductionToGeneralDistributor @serialNum
		exec proc_GeneralDistributorToSubDistributor @serialNum
		exec proc_SubDistributorToStore @serialnum
GO
/****** Object:  StoredProcedure [dbo].[proc_StockWarehouse]    Script Date: 2/3/2021 1:08:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[proc_StockWarehouse] @productNum int
as
	declare @numWarehouses int = 1
	declare @totalWarehouses int = (select count(warehouseId) from Warehouse)
	declare @basePrice money = (select basePrice from ProductList where productId = @productNum)
	declare @tax money

	while(@numWarehouses <= @totalWarehouses)
	begin
		set @tax = (select manufacturingTax from Country where countryId = 
			(select countryId from Warehouse where warehouseId = @numWarehouses))

		while((select count(@productNum) from ProductionInventory where productId = @productNum and warehouseId = @numWarehouses) < 40)
		begin
			insert into ProductionInventory values(@productNum, @numWarehouses, (@basePrice * @tax))
		end
		set @numWarehouses += 1
	end
GO
/****** Object:  StoredProcedure [dbo].[proc_StockWarehouseController]    Script Date: 2/3/2021 1:08:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[proc_StockWarehouseController]
as
	declare @totalProducts int = (select count(productId) from ProductList) + 100
	declare @count int = 100

	while (@count <= @totalProducts)
	begin
		exec proc_StockWarehouse @count
		set @count += 1
	end
GO
/****** Object:  StoredProcedure [dbo].[proc_SubDistributorToStore]    Script Date: 2/3/2021 1:08:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[proc_SubDistributorToStore] @serialNum bigint
as
	declare @subDistributor int
	declare @channelPartner int
	declare @zone int
	declare @store int
	declare @price money

	set @subDistributor = (select subDistributorId from SubDistributorInventory where serialNumber = @serialNum)
	set @channelPartner = (select top 1 channelPartnerId from ChannelPartner where subDistributorId = @subDistributor order by newid())
	set @zone = (select top 1 zoneId from Zone where channelPartnerId = @channelPartner)
	set @store = (select top 1 storeId from Store where zoneId = @zone order by newid())
	set @price = (select price from SubDistributorInventory where serialNumber = @serialNum) * 1.08

	insert into StoreInventory values(@serialnum, @store, @price)
GO
USE [master]
GO
ALTER DATABASE [AppleInc] SET  READ_WRITE 
GO

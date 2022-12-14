USE [master]
GO
/****** Object:  Database [KiKiMart]    Script Date: 6/18/2022 8:29:27 PM ******/
CREATE DATABASE [KiKiMart]
 CONTAINMENT = NONE
 ON  PRIMARY 
 /****** Đổi địa chỉ về ổ C:\ nếu cài sql server trong ổ C:\ *****/
( NAME = N'MultiShop', FILENAME = N'D:\SQL sever\root\MSSQL14.SQLEXPRESS\MSSQL\DATA\MultiShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MultiShop_log', FILENAME = N'D:\SQL sever\root\MSSQL14.SQLEXPRESS\MSSQL\DATA\MultiShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [KiKiMart] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KiKiMart].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KiKiMart] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KiKiMart] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KiKiMart] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KiKiMart] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KiKiMart] SET ARITHABORT OFF 
GO
ALTER DATABASE [KiKiMart] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [KiKiMart] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KiKiMart] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KiKiMart] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KiKiMart] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KiKiMart] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KiKiMart] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KiKiMart] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KiKiMart] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KiKiMart] SET  ENABLE_BROKER 
GO
ALTER DATABASE [KiKiMart] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KiKiMart] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KiKiMart] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KiKiMart] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KiKiMart] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KiKiMart] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [KiKiMart] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KiKiMart] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [KiKiMart] SET  MULTI_USER 
GO
ALTER DATABASE [KiKiMart] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KiKiMart] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KiKiMart] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KiKiMart] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [KiKiMart] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [KiKiMart] SET QUERY_STORE = OFF
GO
USE [KiKiMart]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 6/18/2022 8:29:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Firstname] [nvarchar](20) NOT NULL,
	[Lastname] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Phone] [varchar](13) NOT NULL,
	[Provincial] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[User_Id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 6/18/2022 8:29:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Image] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Colors]    Script Date: 6/18/2022 8:29:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Colors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 6/18/2022 8:29:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Position] [nvarchar](50) NULL,
	[StartDay] [date] NULL,
	[User_Id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Favorites]    Script Date: 6/18/2022 8:29:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favorites](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[User_Id] [int] NOT NULL,
	[Product_Id] [int] NOT NULL,
	[Date] [date] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufactures]    Script Date: 6/18/2022 8:29:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufactures](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Image] [nvarchar](100) NOT NULL,
	[Information] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 6/18/2022 8:29:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Product_Id] [int] NOT NULL,
	[Address_Id] [int] NOT NULL,
	[Color_Id] [int] NULL,
	[Size_Id] [int] NULL,
	[Quality] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Method] [bit] NOT NULL,
	[Name] [varchar](6) NULL,
	[Status] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Cate]    Script Date: 6/18/2022 8:29:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Cate](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Product_Id] [int] NOT NULL,
	[Cate_Id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 6/18/2022 8:29:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Image] [nvarchar](100) NOT NULL,
	[Price] [int] NOT NULL,
	[Origin] [nvarchar](100) NOT NULL,
	[Material] [nvarchar](100) NOT NULL,
	[Status] [bit] NULL,
	[Describe] [nvarchar](max) NOT NULL,
	[Review] [nvarchar](max) NULL,
	[Manu_Id] [int] NOT NULL,
	[Views] [int] NULL,
	[ManuDay] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 6/18/2022 8:29:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sizes]    Script Date: 6/18/2022 8:29:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sizes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Role]    Script Date: 6/18/2022 8:29:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[User_Id] [int] NOT NULL,
	[Role_Id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/18/2022 8:29:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](36) NOT NULL,
	[Password] [varchar](125) NOT NULL,
	[Fullname] [nvarchar](125) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Address] ON 

INSERT [dbo].[Address] ([Id], [Firstname], [Lastname], [Email], [Phone], [Provincial], [Address], [User_Id]) VALUES (1, N'Nguyễn', N'Tấn Khang', N'khangtan123@gmail.com', N'0922223321', N'Hồ Chí Minh', N'320/11 Xa lộ Hà Nội, Phường Nguyễn Thi Phương, Quận 12, Tp.HCM', 9)
INSERT [dbo].[Address] ([Id], [Firstname], [Lastname], [Email], [Phone], [Provincial], [Address], [User_Id]) VALUES (2, N'Khoa', N'Pham', N'khoahoanghh@gmail.com', N'+84832977767', N'Ho Chi Minh', N'Thu Duc, Tp. HCM', 12)
INSERT [dbo].[Address] ([Id], [Firstname], [Lastname], [Email], [Phone], [Provincial], [Address], [User_Id]) VALUES (3, N'Phạm', N'Hoàng Khoa', N'khoaphps12540@fpt.edu.vn', N'0122223332', N'Bình Phước', N'520/3/1 quốc lộ 13, phường Hiệp Bình Phước, Thủ Đức, Tp.HCM', 11)
INSERT [dbo].[Address] ([Id], [Firstname], [Lastname], [Email], [Phone], [Provincial], [Address], [User_Id]) VALUES (4, N'Vuong', N'Trung', N'trungvuong528@gmail.com', N'0358570211', N'Quận 12', N'131 Tân Thới Hiệp 21', 23)
SET IDENTITY_INSERT [dbo].[Address] OFF
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [Image]) VALUES (14, N'Chú 7 trái cây', N'1.jpg')
INSERT [dbo].[Categories] ([Id], [Name], [Image]) VALUES (21, N'Cô Chaeng bán rau', N'Rose.jpg')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Colors] ON 

INSERT [dbo].[Colors] ([Id], [Name]) VALUES (1, N'Đỏ')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (2, N'Xanh')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (4, N'Hồng')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (5, N'Tím')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (6, N'Trắng')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (7, N'Xanh đen')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (8, N'Xanh Than')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (10, N'Vàng Be')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (11, N'Đen')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (15, N'kem')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (16, N'Nâu')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (17, N'Xanh Lá')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (18, N'Vàng Đậm')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (19, N'Bạc')
SET IDENTITY_INSERT [dbo].[Colors] OFF
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([Id], [Position], [StartDay], [User_Id]) VALUES (8, N'Kỹ sư phần mềm', CAST(N'2022-06-14' AS Date), 16)
INSERT [dbo].[Employees] ([Id], [Position], [StartDay], [User_Id]) VALUES (10, N'Kỹ sư phần mềm', CAST(N'2022-06-14' AS Date), 11)
SET IDENTITY_INSERT [dbo].[Employees] OFF
SET IDENTITY_INSERT [dbo].[Favorites] ON 

INSERT [dbo].[Favorites] ([Id], [User_Id], [Product_Id], [Date]) VALUES (18, 23, 1, CAST(N'2022-06-18' AS Date))
INSERT [dbo].[Favorites] ([Id], [User_Id], [Product_Id], [Date]) VALUES (19, 23, 3, CAST(N'2022-06-18' AS Date))
SET IDENTITY_INSERT [dbo].[Favorites] OFF
SET IDENTITY_INSERT [dbo].[Manufactures] ON 

INSERT [dbo].[Manufactures] ([Id], [Name], [Image], [Information]) VALUES (1, N'Rau củ quả', N'Traicay.jpg', N'Rau củ quả giúp làm giảm hàm lượng cholesterol xấu trong máu. Cholesterol thực chất là chất mỡ mà cơ thể cần để thực hiện các hoạt động, tốt cho hệ xương khớp, bảo vệ và phòng bệnh tim mạch, giúp kiểm soát cân nặng, phòng chống bệnh ung thư, một số lợi ích tuyệt vời khác...')
INSERT [dbo].[Manufactures] ([Id], [Name], [Image], [Information]) VALUES (2, N'Thực phẩm khô', N'thuc-pham-kho.jpg', N'Thực phẩm khô giúp tăng cường hệ thống miễn dịch. Trái cây sấy khô giàu kali, sắt, folate, canxi và magiê, đây là những chất dinh dưỡng thiết yếu giúp tăng cường khả năng miễn dịch, hỗ trợ giảm cân, tốt cho tim mạch, giúp duy trì lượng đường trong máu. ...')
INSERT [dbo].[Manufactures] ([Id], [Name], [Image], [Information]) VALUES (3, N'Thực phẩm bổ sung dinh dưỡng', N'thucphamboduong.jpg', N'Thực phẩm bổ sung dinh dưỡng hỗ trợ sức khỏe toàn diện và tiếp thêm năng lượng cho cơ thể, hỗ trợ hệ thống miễn dịch và giảm nguy cơ mắc các bệnh liên quan đến tuổi tác, cải thiện hiệu suất trong các hoạt động thể thao và trí tuệ, hỗ trợ hấp thụ chất dinh dưỡng trong thời gian giảm tiêu thụ thức ăn, hỗ trợ bổ sung dinh dưỡng đều đặn...')
SET IDENTITY_INSERT [dbo].[Manufactures] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [Product_Id], [Address_Id], [Color_Id], [Size_Id], [Quality], [Date], [Method], [Name], [Status]) VALUES (46, 8, 4, NULL, NULL, 2, CAST(N'2022-06-14' AS Date), 1, N'973798', 1)
INSERT [dbo].[Orders] ([Id], [Product_Id], [Address_Id], [Color_Id], [Size_Id], [Quality], [Date], [Method], [Name], [Status]) VALUES (47, 3, 4, NULL, NULL, 5, CAST(N'2022-06-14' AS Date), 1, N'642780', 1)
INSERT [dbo].[Orders] ([Id], [Product_Id], [Address_Id], [Color_Id], [Size_Id], [Quality], [Date], [Method], [Name], [Status]) VALUES (48, 1, 4, NULL, NULL, 1, CAST(N'2022-06-16' AS Date), 1, N'475214', 1)
INSERT [dbo].[Orders] ([Id], [Product_Id], [Address_Id], [Color_Id], [Size_Id], [Quality], [Date], [Method], [Name], [Status]) VALUES (49, 1, 4, NULL, NULL, 1, CAST(N'2022-06-16' AS Date), 1, N'348559', 1)
INSERT [dbo].[Orders] ([Id], [Product_Id], [Address_Id], [Color_Id], [Size_Id], [Quality], [Date], [Method], [Name], [Status]) VALUES (53, 1, 4, NULL, NULL, 1, CAST(N'2022-06-17' AS Date), 0, N'279291', 1)
INSERT [dbo].[Orders] ([Id], [Product_Id], [Address_Id], [Color_Id], [Size_Id], [Quality], [Date], [Method], [Name], [Status]) VALUES (51, 1, 4, NULL, NULL, 2, CAST(N'2022-06-17' AS Date), 1, N'645129', 1)
INSERT [dbo].[Orders] ([Id], [Product_Id], [Address_Id], [Color_Id], [Size_Id], [Quality], [Date], [Method], [Name], [Status]) VALUES (52, 1, 4, NULL, NULL, 1, CAST(N'2022-06-17' AS Date), 1, N'228712', 1)
INSERT [dbo].[Orders] ([Id], [Product_Id], [Address_Id], [Color_Id], [Size_Id], [Quality], [Date], [Method], [Name], [Status]) VALUES (54, 34, 4, NULL, NULL, 5, CAST(N'2022-06-18' AS Date), 0, N'965283', 1)
INSERT [dbo].[Orders] ([Id], [Product_Id], [Address_Id], [Color_Id], [Size_Id], [Quality], [Date], [Method], [Name], [Status]) VALUES (55, 1, 4, NULL, NULL, 3, CAST(N'2022-06-18' AS Date), 0, N'251478', 1)
INSERT [dbo].[Orders] ([Id], [Product_Id], [Address_Id], [Color_Id], [Size_Id], [Quality], [Date], [Method], [Name], [Status]) VALUES (57, 9, 4, NULL, NULL, 1, CAST(N'2022-06-18' AS Date), 0, N'562026', 1)
INSERT [dbo].[Orders] ([Id], [Product_Id], [Address_Id], [Color_Id], [Size_Id], [Quality], [Date], [Method], [Name], [Status]) VALUES (58, 1, 4, NULL, NULL, 3, CAST(N'2022-06-18' AS Date), 0, N'563413', 1)
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[Product_Cate] ON 

INSERT [dbo].[Product_Cate] ([id], [Product_Id], [Cate_Id]) VALUES (31, 1, 14)
INSERT [dbo].[Product_Cate] ([id], [Product_Id], [Cate_Id]) VALUES (32, 31, 14)
INSERT [dbo].[Product_Cate] ([id], [Product_Id], [Cate_Id]) VALUES (33, 3, 14)
INSERT [dbo].[Product_Cate] ([id], [Product_Id], [Cate_Id]) VALUES (34, 4, 14)
INSERT [dbo].[Product_Cate] ([id], [Product_Id], [Cate_Id]) VALUES (35, 5, 14)
INSERT [dbo].[Product_Cate] ([id], [Product_Id], [Cate_Id]) VALUES (36, 6, 14)
INSERT [dbo].[Product_Cate] ([id], [Product_Id], [Cate_Id]) VALUES (37, 7, 14)
INSERT [dbo].[Product_Cate] ([id], [Product_Id], [Cate_Id]) VALUES (38, 8, 14)
INSERT [dbo].[Product_Cate] ([id], [Product_Id], [Cate_Id]) VALUES (39, 9, 14)
INSERT [dbo].[Product_Cate] ([id], [Product_Id], [Cate_Id]) VALUES (41, 25, 21)
INSERT [dbo].[Product_Cate] ([id], [Product_Id], [Cate_Id]) VALUES (42, 29, 21)
INSERT [dbo].[Product_Cate] ([id], [Product_Id], [Cate_Id]) VALUES (44, 32, 21)
INSERT [dbo].[Product_Cate] ([id], [Product_Id], [Cate_Id]) VALUES (45, 33, 21)
INSERT [dbo].[Product_Cate] ([id], [Product_Id], [Cate_Id]) VALUES (46, 35, 21)
INSERT [dbo].[Product_Cate] ([id], [Product_Id], [Cate_Id]) VALUES (47, 34, 21)
SET IDENTITY_INSERT [dbo].[Product_Cate] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Origin], [Material], [Status], [Describe], [Review], [Manu_Id], [Views], [ManuDay]) VALUES (1, N'Xoài cát Hòa Lộc KG', N'xoai1.jpg', 80000, N'Việt Nam', N'Tốt', 1, N'Xoài cát Hòa Lộc là một loại xoài đặc sản của miền tây, có nguồn gốc từ xã Hòa Hưng, huyện Cái Bè, tỉnh Tiền Giang.

Đây là loại xoài có kích thước khá to, khối lượng khoảng 450 - 700gr/quả. Quả có phần thịt khá chắc, thớ thịt mịn và thơm. Phần vỏ có màu xanh nhạt, bóng loáng và chuyển sang màu vàng đẹp mắt khi chín.

Xoài cát Hòa Lộc khi ăn sống có vị cực chua, nhưng khi chín lại có vị cực ngọt và mùi thơm rất đặc trưng. Tùy thuộc thời vụ trong năm mà giá thành của xoài có thể thay đổi, trung bình dao động khoảng 60.000 - 80.000 VND/kg.', N'Xoài cát Hòa Lộc là một loại xoài đặc sản của miền tây, có nguồn gốc từ xã Hòa Hưng, huyện Cái Bè, tỉnh Tiền Giang.

Đây là loại xoài có kích thước khá to, khối lượng khoảng 450 - 700gr/quả. Quả có phần thịt khá chắc, thớ thịt mịn và thơm. Phần vỏ có màu xanh nhạt, bóng loáng và chuyển sang màu vàng đẹp mắt khi chín.

Xoài cát Hòa Lộc khi ăn sống có vị cực chua, nhưng khi chín lại có vị cực ngọt và mùi thơm rất đặc trưng. Tùy thuộc thời vụ trong năm mà giá thành của xoài có thể thay đổi, trung bình dao động khoảng 60.000 - 80.000 VND/kg.', 1, 0, CAST(N'2022-06-05' AS Date))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Origin], [Material], [Status], [Describe], [Review], [Manu_Id], [Views], [ManuDay]) VALUES (3, N'Thăng long ruột đỏ', N'thanhlongruotdo8.jpg', 39000, N'Việt Nam', N'Tốt', 1, N'Thanh long ruột đỏ là loại trái cây không chỉ tốt cho sức khỏe mà còn chứa nhiều dưỡng chất có lợi trong việc làm đẹp. Điểm qua các lợi ích làm đẹp từ thanh long ruột đỏ trong bài viết dưới đây.

Giúp giảm cân

Nếu bạn muốn ăn nhẹ nhưng lo sợ bị tăng cân thì có thể thử ăn thanh long ruột đỏ. Bởi loại quả này chứa nhiều chất xơ, sẽ tạo cảm giác no bụng và thỏa mãn cơn đói. Đồng thời, giúp bạn không bị đói quá sớm và giảm tế bào mỡ trong cơ thể.

Giúp tóc chắc khỏe

Nước ép thanh long ruột đỏ có tác dụng tăng cường vẻ đẹp cho mái tóc. Bạn chỉ cần ép một ít nước từ loại quả này hoặc xay nhuyễn làm mặt nạ cho tóc, sau đó bôi lên da đầu và thân tóc. Cách làm này sẽ tăng cường màu sắc cho tóc và làm tóc mềm mượt, óng ả nhờ hàm lượng chất chống oxy hóa cao và nhiều chất dinh dưỡng có trong thanh long ruột đỏ.

Ngăn ngừa mụn

Mụn trứng cá chủ yếu xuất hiện trên mặt và nguyên nhân là do nhiễm vi khuẩn P.acnes. May mắn thay, thanh long ruột đỏ có chứa chất chống oxy hóa và chống viêm nên có thể chống lại sự lây nhiễm vi khuẩn và làm sạch lỗ chân lông bị tắc nghẽn trên da. Vì vậy, hãy đắp mặt nạ từ thanh long ruột đỏ để ngăn ngừa và điều trị mụn trứng cá.

Duy trì làn da khỏe mạnh

Uống nước ép thanh long ruột đỏ hàng ngày không chỉ hỗ trợ cơ thể khỏe mạnh mà còn giúp làn da trắng sáng và săn chắc. Hàm lượng chất chống oxy hóa cao trong loại trái cây này có tác dụng ngăn chặn tác động của các gốc tự do trên da, vốn có thể gây ra nếp nhăn. Ngoài ra, vitamin C trong thanh long ruột đỏ sẽ làm sáng da và loại bỏ tình trạng xỉn màu.

Trị cháy nắng

Thanh long ruột đỏ chứa vitamin B3 có thể giúp giữ ẩm cho da và giảm rát da do cháy nắng. Nếu bạn đang bị cháy nắng và cảm thấy đau rát, chỉ cần trộn nước ép thanh long ruột đỏ với một ít dưa chuột hoặc lô hội, sau đó đắp hỗn hợp này lên da để làm dịu cơn đau.

Làm vết thương mau lành

Thanh long ruột đỏ rất có lợi trong việc chữa lành vết thương một cách nhanh chóng. Trong trường hợp bạn bị đứt tay hoặc có vết thương, hãy thoa một ít nước ép thanh long ruột đỏ lên da để đẩy nhanh quá trình phục hồi. Đồng thời, uống nước ép thanh long ruột đỏ cũng có thể giúp làm lành vết thương nhanh hơn từ bên trong.', N'Thanh long ruột đỏ là loại trái cây không chỉ tốt cho sức khỏe mà còn chứa nhiều dưỡng chất có lợi trong việc làm đẹp. Điểm qua các lợi ích làm đẹp từ thanh long ruột đỏ trong bài viết dưới đây.

Giúp giảm cân

Nếu bạn muốn ăn nhẹ nhưng lo sợ bị tăng cân thì có thể thử ăn thanh long ruột đỏ. Bởi loại quả này chứa nhiều chất xơ, sẽ tạo cảm giác no bụng và thỏa mãn cơn đói. Đồng thời, giúp bạn không bị đói quá sớm và giảm tế bào mỡ trong cơ thể.

Giúp tóc chắc khỏe

Nước ép thanh long ruột đỏ có tác dụng tăng cường vẻ đẹp cho mái tóc. Bạn chỉ cần ép một ít nước từ loại quả này hoặc xay nhuyễn làm mặt nạ cho tóc, sau đó bôi lên da đầu và thân tóc. Cách làm này sẽ tăng cường màu sắc cho tóc và làm tóc mềm mượt, óng ả nhờ hàm lượng chất chống oxy hóa cao và nhiều chất dinh dưỡng có trong thanh long ruột đỏ.

Ngăn ngừa mụn

Mụn trứng cá chủ yếu xuất hiện trên mặt và nguyên nhân là do nhiễm vi khuẩn P.acnes. May mắn thay, thanh long ruột đỏ có chứa chất chống oxy hóa và chống viêm nên có thể chống lại sự lây nhiễm vi khuẩn và làm sạch lỗ chân lông bị tắc nghẽn trên da. Vì vậy, hãy đắp mặt nạ từ thanh long ruột đỏ để ngăn ngừa và điều trị mụn trứng cá.

Duy trì làn da khỏe mạnh

Uống nước ép thanh long ruột đỏ hàng ngày không chỉ hỗ trợ cơ thể khỏe mạnh mà còn giúp làn da trắng sáng và săn chắc. Hàm lượng chất chống oxy hóa cao trong loại trái cây này có tác dụng ngăn chặn tác động của các gốc tự do trên da, vốn có thể gây ra nếp nhăn. Ngoài ra, vitamin C trong thanh long ruột đỏ sẽ làm sáng da và loại bỏ tình trạng xỉn màu.

Trị cháy nắng

Thanh long ruột đỏ chứa vitamin B3 có thể giúp giữ ẩm cho da và giảm rát da do cháy nắng. Nếu bạn đang bị cháy nắng và cảm thấy đau rát, chỉ cần trộn nước ép thanh long ruột đỏ với một ít dưa chuột hoặc lô hội, sau đó đắp hỗn hợp này lên da để làm dịu cơn đau.

Làm vết thương mau lành

Thanh long ruột đỏ rất có lợi trong việc chữa lành vết thương một cách nhanh chóng. Trong trường hợp bạn bị đứt tay hoặc có vết thương, hãy thoa một ít nước ép thanh long ruột đỏ lên da để đẩy nhanh quá trình phục hồi. Đồng thời, uống nước ép thanh long ruột đỏ cũng có thể giúp làm lành vết thương nhanh hơn từ bên trong.', 1, 0, CAST(N'2022-06-02' AS Date))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Origin], [Material], [Status], [Describe], [Review], [Manu_Id], [Views], [ManuDay]) VALUES (4, N'Chuối xanh', N'chuoi-xanh.jpg', 25000, N'Việt Nam', N'Tốt', 1, N'', N'', 1, 0, CAST(N'2021-06-09' AS Date))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Origin], [Material], [Status], [Describe], [Review], [Manu_Id], [Views], [ManuDay]) VALUES (5, N'Cà rốt đà lạt', N'carotdalat1.jpg', 45000, N'Việt Nam', N'Tốt', 1, N'', N'', 1, 0, CAST(N'2021-06-09' AS Date))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Origin], [Material], [Status], [Describe], [Review], [Manu_Id], [Views], [ManuDay]) VALUES (6, N'Chôm chôm Thái', N'chomchomthai.jpg', 65000, N'Thái Lan', N'Tốt', 1, N'', N'', 1, 0, CAST(N'2021-06-09' AS Date))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Origin], [Material], [Status], [Describe], [Review], [Manu_Id], [Views], [ManuDay]) VALUES (7, N'Nhãn xuồng cơm vàng', N'nhanxuong.jpg', 43000, N'Việt Nam', N'Tốt', 1, N'', N'', 1, 0, CAST(N'2021-06-09' AS Date))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Origin], [Material], [Status], [Describe], [Review], [Manu_Id], [Views], [ManuDay]) VALUES (8, N'Măng cụt lái thiêu Bình Dương', N'mangcutlaithieu.jpg', 53000, N'Việt Nam', N'Tốt', 1, N'', N'', 1, 0, CAST(N'2021-06-09' AS Date))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Origin], [Material], [Status], [Describe], [Review], [Manu_Id], [Views], [ManuDay]) VALUES (9, N'Cóc vàng chín miền tây', N'cocvangchin.jpg', 73000, N'Việt Nam', N'Tốt', 1, N'', N'', 1, 0, CAST(N'2021-06-09' AS Date))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Origin], [Material], [Status], [Describe], [Review], [Manu_Id], [Views], [ManuDay]) VALUES (25, N'Rau xà lách xoắn', N'xalachxoan1.jpg', 15000, N'Việt Nam', N'Tốt', 1, N'   ', NULL, 1, 0, CAST(N'2022-01-09' AS Date))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Origin], [Material], [Status], [Describe], [Review], [Manu_Id], [Views], [ManuDay]) VALUES (29, N'Súp lơ xanh 1kg', N'suploxanh.jpg', 62700, N'Việt Nam', N'Tốt', 1, N' ', NULL, 1, 0, CAST(N'2022-06-14' AS Date))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Origin], [Material], [Status], [Describe], [Review], [Manu_Id], [Views], [ManuDay]) VALUES (31, N'Xoài keo', N'xoai-keo.jpg', 30000, N'Việt Nam', N'Tốt', 1, N'Xoài keo có nguồn gốc từ vùng núi Tà Keo của Campuchia, được trồng tại các tỉnh biên giới và được trồng ở nhiều khu vực miền Nam vì chúng khá dễ thích nghi.

Xoài keo có hình dáng hơi tròn, có phần eo ở giữa và nhỏ dần về phần đuôi. Đặc trưng của loại xoài này là vỏ xanh nhưng đôi khi bên trong đã chín vàng.

Chúng có khối lượng trung bình từ 250 - 400gr/quả, phần thịt dày, hạt nhỏ, dẹp và có vị chua chua ngọt ngọt khá đặc biệt.

Khi còn sống xoài keo có vị chua nhẹ, khi chín xoài có vị ngọt thanh. Tuy nhiên, xoài keo thường dùng để ăn sống hoặc sử dụng khi còn cứng vì khi chín thịt sẽ không còn ngon nữa.', N'Xoài keo có nguồn gốc từ vùng núi Tà Keo của Campuchia, được trồng tại các tỉnh biên giới và được trồng ở nhiều khu vực miền Nam vì chúng khá dễ thích nghi.

Xoài keo có hình dáng hơi tròn, có phần eo ở giữa và nhỏ dần về phần đuôi. Đặc trưng của loại xoài này là vỏ xanh nhưng đôi khi bên trong đã chín vàng.

Chúng có khối lượng trung bình từ 250 - 400gr/quả, phần thịt dày, hạt nhỏ, dẹp và có vị chua chua ngọt ngọt khá đặc biệt.

Khi còn sống xoài keo có vị chua nhẹ, khi chín xoài có vị ngọt thanh. Tuy nhiên, xoài keo thường dùng để ăn sống hoặc sử dụng khi còn cứng vì khi chín thịt sẽ không còn ngon nữa.', 1, 0, CAST(N'2022-06-17' AS Date))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Origin], [Material], [Status], [Describe], [Review], [Manu_Id], [Views], [ManuDay]) VALUES (32, N'Bắp cải thảo túi 500gr (1 bắp)', N'bap-cai-thao-tui-500gr-1-bap-202206041514339145.jpg', 10000, N'Việt Nam', N'Tốt', 1, N'Giá trị dinh dưỡng của bắp cải thảo
Các nghiên cứu khoa học cho thấy, trong cải thảo là loại rau giàu vitamin như: vitamin  A, vitamin B,  vitamin C, vitamin E. Ngoài ra, trong cải thảo còn chứa một số khoáng chất tốt cho cơ thể như: calcium, sắt, mangan, natri, kali , lipit,….
Trong 100g bắp cải thảo có khoảng 24.6 Kcal.
Tác dụng của bắp cải thảo đối với sức khỏe
Cải thảo là một loại rau tốt cho sức khoẻ, một số lợi ích có thể kể đến như: giúp lợi tiểu, ngăn ngừa ung thư, chữa viêm họng, giảm chứng giảm trí nhớ,....', N'Bắp cải thảo là loại rau có bẹ lá to, giòn, ngọt thường được dùng để nấu canh, xào chung với rau củ hoặc để muối kim chi. Bắp cải thảo của Bách hóa Xanh được trồng tại Lâm Đồng và đóng gói theo những tiêu chuẩn nghiêm ngặt, bảo đảm các tiêu chuẩn xanh - sach, chất lượng và an toàn với người dùng.', 1, 0, CAST(N'2021-12-09' AS Date))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Origin], [Material], [Status], [Describe], [Review], [Manu_Id], [Views], [ManuDay]) VALUES (33, N'Cải ngọt baby gói 300g', N'caingotbaby.jpg', 13500, N'Việt Nam', N'Tốt', 1, N'Rau cải ngọt có vị ngọt thanh, phù hợp với việc chế biến nhiều món ăn khác nhau. Cải ngọt baby của Bách Hóa Xanh được sử dụng phổ biến trong các bữa ăn của người Việt. Chứa hàm lượng dinh dưỡng cao nên cải ngọt giúp phòng ngừa ung thư, hỗ trợ trị bệnh gout,...
Tác dụng của rau cải ngọt baby đối với sức khỏe
Cũng như nhiều loại rau khác, cải ngọt baby chứa hàm lượng calories rất thấp nhưng lại có nhiều chất dinh dưỡng cần thiết cho cơ thể như Vitamin A, B, C, K, Axit lactic, Albumin, Caroten…, Do hàm lượng dinh dưỡng cao, cải ngọt baby có các tác dụng chữa bệnh tuyệt vời, ăn nhiều cải xanh bổ sung vitamin K rất cần thiết cho cơ thể, giúp tăng cường hệ miễn dịch, bảo vệ sức khỏe tim mạch và có thể ngăn ngừa các biểu hiện ung thư, ăn cải xanh nhiều còn giúp mắt sáng khỏe, giúp da ngăn ngừa lão hóa, chắc khỏe hỗ trợ chị em phụ nữ trong việc chăm sóc sắc đẹp.
Các món ăn ngon từ rau cải ngọt baby
Cải ngọt có vị ngọt thanh tự nhiên, vì thế chúng thường được chế biến thành các món canh để tạo ra vị thanh đạm như canh cải ngọt thịt bằm, canh cải ngọt hến,...
Khi kết hợp cải ngọt với các loại nấm, thịt heo, thịt bò, hải sản,... sẽ tạo ra những món xào đơn giản như rất thơm ngon và bổ dưỡng như cải ngọt xào tỏi, cải ngọt xào nấm bào ngư,...
Đặc biệt, cải ngọt là một trong những nguyên liệu không thể thiếu để tạo ra những món mì xào giòn hải sản, mì xào thịt bò,... thơm ngon.
Cách bảo quản rau cải ngọt baby tươi ngon
Khi rau còn ẩm không nên đóng gói kín sẽ khiến rau bị úng. Rửa sạch rau, để ráo nước, lót thêm miếng giấy dưới túi nilon hoặc hộp đựng thực phẩm để rau được tươi lâu trong ngăn mát tủ lạnh.
Lưu ý: Sản phẩm nhận được có thể khác với hình ảnh về màu sắc và số lượng nhưng vẫn đảm bảo về mặt khối lượng và chất lượng.', N'Rau cải ngọt có vị ngọt thanh, phù hợp với việc chế biến nhiều món ăn khác nhau. Cải ngọt baby của Bách Hóa Xanh được sử dụng phổ biến trong các bữa ăn của người Việt. Chứa hàm lượng dinh dưỡng cao nên cải ngọt giúp phòng ngừa ung thư, hỗ trợ trị bệnh gout,...
Tác dụng của rau cải ngọt baby đối với sức khỏe
Cũng như nhiều loại rau khác, cải ngọt baby chứa hàm lượng calories rất thấp nhưng lại có nhiều chất dinh dưỡng cần thiết cho cơ thể như Vitamin A, B, C, K, Axit lactic, Albumin, Caroten…, Do hàm lượng dinh dưỡng cao, cải ngọt baby có các tác dụng chữa bệnh tuyệt vời, ăn nhiều cải xanh bổ sung vitamin K rất cần thiết cho cơ thể, giúp tăng cường hệ miễn dịch, bảo vệ sức khỏe tim mạch và có thể ngăn ngừa các biểu hiện ung thư, ăn cải xanh nhiều còn giúp mắt sáng khỏe, giúp da ngăn ngừa lão hóa, chắc khỏe hỗ trợ chị em phụ nữ trong việc chăm sóc sắc đẹp.
Các món ăn ngon từ rau cải ngọt baby
Cải ngọt có vị ngọt thanh tự nhiên, vì thế chúng thường được chế biến thành các món canh để tạo ra vị thanh đạm như canh cải ngọt thịt bằm, canh cải ngọt hến,...
Khi kết hợp cải ngọt với các loại nấm, thịt heo, thịt bò, hải sản,... sẽ tạo ra những món xào đơn giản như rất thơm ngon và bổ dưỡng như cải ngọt xào tỏi, cải ngọt xào nấm bào ngư,...
Đặc biệt, cải ngọt là một trong những nguyên liệu không thể thiếu để tạo ra những món mì xào giòn hải sản, mì xào thịt bò,... thơm ngon.
Cách bảo quản rau cải ngọt baby tươi ngon
Khi rau còn ẩm không nên đóng gói kín sẽ khiến rau bị úng. Rửa sạch rau, để ráo nước, lót thêm miếng giấy dưới túi nilon hoặc hộp đựng thực phẩm để rau được tươi lâu trong ngăn mát tủ lạnh.
Lưu ý: Sản phẩm nhận được có thể khác với hình ảnh về màu sắc và số lượng nhưng vẫn đảm bảo về mặt khối lượng và chất lượng.', 1, 0, CAST(N'2021-02-04' AS Date))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Origin], [Material], [Status], [Describe], [Review], [Manu_Id], [Views], [ManuDay]) VALUES (34, N'Rau thơm các loại gói 200g', N'rauthon.jpg', 14500, N'Việt Nam', N'Tốt', 1, N'Các món ăn ngon từ rau thơm
Rau thường được dùng cho hai mục đích chính
Ăn sống, rau thơm có tinh dầu cay nên hay được phối trộn với các loại rau mát khác như giá đỗ, bắp chuối thái mỏng, xà lách, rau má.
Gia vị cho các món ăn: nhiều loại rau thơm được gia vào các món ăn như một thứ gia vị, tùy theo nguyên liệu chính để chế biến món ăn mà người nội trợ thường có kinh nghiệm riêng cho các loại rau thơm khác nhau như: bún đậu mắm tôm, hoặc bún ốc, bún riêu cua, bún chả, lòng lợn, phở cuốn,...
Cách bảo quản rau thơm tươi ngon
Rau thơm nên được bảo quản trong ngăn mát tủ lạnh để giúp rau tươi lâu hơn.
Lưu ý: Sản phẩm nhận được có thể khác với hình ảnh về màu sắc và số lượng nhưng vẫn đảm bảo về mặt khối lượng và chất lượng.', N'Rau thơm các loại tại Bách hoá XANH bao gồm rau kinh giới, rau húng, rau diếp cá,... Đây là loại rau thơm không thể thiếu giúp tạo thêm hương vị cho các món ăn như bánh xèo, bánh khọt, bánh ướt,... Rau thơm tại Bách hoá XANH tươi ngon, xanh mơn mởn.', 1, 0, CAST(N'2022-12-06' AS Date))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Origin], [Material], [Status], [Describe], [Review], [Manu_Id], [Views], [ManuDay]) VALUES (35, N'Ớt hiểm trái túi 50g', N'ot-hiem-trai-tui-50g-202205181710099604.jpg', 6000, N'Việt Nam', N'Tốt', 1, N'Giá trị dinh dưỡng của ớt hiểm
+ Trong ớt hiểm có chứa nhiều vitamin C, các vitamin nhóm B, các khoáng chất như sắt, canxi, phốt pho,...
+ Trong 100g ớt hiểm có khoảng 101 Kcal.
Tác dụng của ớt hiểm đối với sức khỏe:
      Ớt là thực phẩm có nhiều công dụng mà bạn không thể ngờ đến như thúc đẩy sự thèm ăn và tiêu hóa. Ớt có thể thúc đẩy tiết dịch tiêu hóa, tăng sự thèm ăn; chống đỡ lạnh. Ớt có thể làm ấm dạ dày, thúc đẩy lưu thông máu, làm đẹp da, hạ lipid trong chế độ ăn uống, chống viêm mạnh, khả năng chống ung thư, bảo vệ tim,...', N'Ớt hiểm có vị cay nồng, thơm, kích thích vị giác của người ăn, ớt là một trong những gia vị không thể thiếu trong nấu ăn cũng như mâm cơm của người Việt. Ớt hiểm luôn giữ được độ tươi mỗi ngày, được nuôi trồng theo quy trình nghiêm ngặt, bảo đảm các chỉ tiêu về an toàn và chất lượng.', 1, 0, CAST(N'2022-06-17' AS Date))
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [Origin], [Material], [Status], [Describe], [Review], [Manu_Id], [Views], [ManuDay]) VALUES (37, N'Trung', N'1.jpg', 10000, N'Việt Nam', N'Tốt', 1, N'123', N'123', 1, 0, CAST(N'2022-06-19' AS Date))
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [Name]) VALUES (1, N'ROLE_ADMIN')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (2, N'ROLE_USER')
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[User_Role] ON 

INSERT [dbo].[User_Role] ([Id], [User_Id], [Role_Id]) VALUES (3, 11, 1)
INSERT [dbo].[User_Role] ([Id], [User_Id], [Role_Id]) VALUES (4, 12, 2)
INSERT [dbo].[User_Role] ([Id], [User_Id], [Role_Id]) VALUES (5, 9, 2)
INSERT [dbo].[User_Role] ([Id], [User_Id], [Role_Id]) VALUES (10, 16, 1)
INSERT [dbo].[User_Role] ([Id], [User_Id], [Role_Id]) VALUES (12, 18, 2)
INSERT [dbo].[User_Role] ([Id], [User_Id], [Role_Id]) VALUES (13, 19, 2)
INSERT [dbo].[User_Role] ([Id], [User_Id], [Role_Id]) VALUES (14, 20, 2)
INSERT [dbo].[User_Role] ([Id], [User_Id], [Role_Id]) VALUES (15, 21, 2)
INSERT [dbo].[User_Role] ([Id], [User_Id], [Role_Id]) VALUES (16, 23, 1)
SET IDENTITY_INSERT [dbo].[User_Role] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Email], [Password], [Fullname]) VALUES (9, N'khoahoangyahoo@gmail.com', N'123456', N'Nguyên Trung')
INSERT [dbo].[Users] ([Id], [Email], [Password], [Fullname]) VALUES (11, N'khoaphps12540@fpt.edu.vn', N'$2a$10$/pSOMXPoZysoe42dJSfXZ.DLY93Hj0mno4FVsfEKPNVphHdONqAKW', N'Khoa Pham')
INSERT [dbo].[Users] ([Id], [Email], [Password], [Fullname]) VALUES (12, N'khoahoanghh@gmail.com', N'$2a$10$ZIBEKiTgopozCsLWnunvKuOiodzOc0ypSEi/5E9fnmVSnc6MDNm.q', N'Khoa Pham')
INSERT [dbo].[Users] ([Id], [Email], [Password], [Fullname]) VALUES (16, N'thientxps12536@fpt.edu.vn', N'$2a$10$vh/ojb8cW2qJSTDpsC1Wv.DF6L05k0xPO9rHA3YSQw8DBEo9Gm5Za', N'Trần Xuân Thiện')
INSERT [dbo].[Users] ([Id], [Email], [Password], [Fullname]) VALUES (18, N'cuonglvps15433@gmail.com', N'$2a$10$.kl4MdX/04ip8g1DY2.E0OJZKjpxRoPJFaHKQI1rXjyogLmtRTw6W', N'Lê Văn Cường')
INSERT [dbo].[Users] ([Id], [Email], [Password], [Fullname]) VALUES (19, N'sangnguyen123@gmail.com', N'$2a$10$ENENh61.X1Y/g4WmiOfuVeuqjEIInVGii3brJFiDo/45rxi8clpXK', N'Nguyễn Quang Sáng')
INSERT [dbo].[Users] ([Id], [Email], [Password], [Fullname]) VALUES (20, N'trucntps12554@gmail.com', N'$2a$10$ndBkXv3WS.PRf3oSFImyb.uawe/eRFmhcv/sLYW76uDvzyRIwwslq', N'Nguyễn Thanh Trúc')
INSERT [dbo].[Users] ([Id], [Email], [Password], [Fullname]) VALUES (21, N'hoanttps124002@fpt.edu.vn', N'$2a$10$k3zsOFEPHRvOklKg4Uj76OQVrU6kVgZiDQmGh74X75W9qN1aWxlwa', N'Trần Hồ Hoàn')
INSERT [dbo].[Users] ([Id], [Email], [Password], [Fullname]) VALUES (22, N'Trung@gmail.com', N'1234567', N'Nguyên Trung')
INSERT [dbo].[Users] ([Id], [Email], [Password], [Fullname]) VALUES (23, N'trungvuong528@gmail.com', N'$2a$10$aHjyAxsO7O.uSUbrsyqU0.pXXBtdQoxbZsuHk/iS.M.trbzK2q56a', N'Trung')
SET IDENTITY_INSERT [dbo].[Users] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__A9D10534FFD5B45C]    Script Date: 6/18/2022 8:29:28 PM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Employees] ADD  DEFAULT (NULL) FOR [Position]
GO
ALTER TABLE [dbo].[Employees] ADD  DEFAULT (NULL) FOR [StartDay]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (NULL) FOR [Color_Id]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (NULL) FOR [Size_Id]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (NULL) FOR [Review]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Views]  DEFAULT ((0)) FOR [Views]
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD FOREIGN KEY([User_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD FOREIGN KEY([User_Id])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Favorites]  WITH CHECK ADD FOREIGN KEY([Product_Id])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Favorites]  WITH CHECK ADD FOREIGN KEY([User_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([Address_Id])
REFERENCES [dbo].[Address] ([Id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([Color_Id])
REFERENCES [dbo].[Colors] ([Id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([Product_Id])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([Size_Id])
REFERENCES [dbo].[Sizes] ([Id])
GO
ALTER TABLE [dbo].[Product_Cate]  WITH CHECK ADD FOREIGN KEY([Cate_Id])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product_Cate]  WITH CHECK ADD FOREIGN KEY([Product_Id])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([Manu_Id])
REFERENCES [dbo].[Manufactures] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[User_Role]  WITH CHECK ADD FOREIGN KEY([Role_Id])
REFERENCES [dbo].[Roles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[User_Role]  WITH CHECK ADD FOREIGN KEY([User_Id])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
USE [master]
GO
ALTER DATABASE [KiKiMart] SET  READ_WRITE 
GO

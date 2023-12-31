USE [master]
GO
/****** Object:  Database [My_Product_Website]    Script Date: 9/11/2023 2:09:48 PM ******/
CREATE DATABASE [My_Product_Website]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'My_Product_Website', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS05\MSSQL\DATA\My_Product_Website.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'My_Product_Website_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS05\MSSQL\DATA\My_Product_Website_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [My_Product_Website] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [My_Product_Website].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [My_Product_Website] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [My_Product_Website] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [My_Product_Website] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [My_Product_Website] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [My_Product_Website] SET ARITHABORT OFF 
GO
ALTER DATABASE [My_Product_Website] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [My_Product_Website] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [My_Product_Website] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [My_Product_Website] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [My_Product_Website] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [My_Product_Website] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [My_Product_Website] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [My_Product_Website] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [My_Product_Website] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [My_Product_Website] SET  DISABLE_BROKER 
GO
ALTER DATABASE [My_Product_Website] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [My_Product_Website] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [My_Product_Website] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [My_Product_Website] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [My_Product_Website] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [My_Product_Website] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [My_Product_Website] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [My_Product_Website] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [My_Product_Website] SET  MULTI_USER 
GO
ALTER DATABASE [My_Product_Website] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [My_Product_Website] SET DB_CHAINING OFF 
GO
ALTER DATABASE [My_Product_Website] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [My_Product_Website] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [My_Product_Website] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [My_Product_Website] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [My_Product_Website] SET QUERY_STORE = OFF
GO
USE [My_Product_Website]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 9/11/2023 2:09:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[account_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[phone_number] [varchar](20) NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[isSell] [int] NOT NULL,
	[isAdmin] [int] NOT NULL,
	[fullname] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[account_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 9/11/2023 2:09:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[category_id] [int] NOT NULL,
	[category_name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 9/11/2023 2:09:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[comment_id] [int] IDENTITY(1,1) NOT NULL,
	[comment_text] [nvarchar](max) NOT NULL,
	[comment_date] [date] NOT NULL,
	[username] [varchar](50) NOT NULL,
	[product_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[comment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 9/11/2023 2:09:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[customer_id] [int] IDENTITY(1,1) NOT NULL,
	[customer_name] [nvarchar](255) NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[phone_number] [varchar](20) NOT NULL,
	[address] [nvarchar](max) NOT NULL,
	[account_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 9/11/2023 2:09:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[account_id] [int] NULL,
	[order_date] [date] NULL,
	[order_total] [money] NOT NULL,
	[customer_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 9/11/2023 2:09:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[order_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[unit_price] [money] NOT NULL,
	[quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 9/11/2023 2:09:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[product_name] [nvarchar](max) NOT NULL,
	[product_pic] [nvarchar](max) NULL,
	[product_color] [nvarchar](100) NULL,
	[price] [money] NOT NULL,
	[stock_quantity] [int] NOT NULL,
	[des] [nvarchar](max) NULL,
	[category_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([account_id], [username], [password], [phone_number], [email], [isSell], [isAdmin], [fullname]) VALUES (1, N'nva', N'202cb962ac59075b964b07152d234b70', N'0787662211', N'thovpce161117@fpt.edu.vn', 0, 1, N'Nguyen Van A')
INSERT [dbo].[Account] ([account_id], [username], [password], [phone_number], [email], [isSell], [isAdmin], [fullname]) VALUES (2, N'nvb', N'81dc9bdb52d04dc20036dbd8313ed055', N'0912312312', N'khuyetdanhso1234@gmail.com', 0, 0, N'Nguyen Van B')
INSERT [dbo].[Account] ([account_id], [username], [password], [phone_number], [email], [isSell], [isAdmin], [fullname]) VALUES (3, N'nvc', N'827ccb0eea8a706c4c34a16891f84e7b', N'0756564438', N'khuyetdanhso1234@gmail.com', 1, 0, N'Nguyen Van C')
INSERT [dbo].[Account] ([account_id], [username], [password], [phone_number], [email], [isSell], [isAdmin], [fullname]) VALUES (4, N'nvd', N'e10adc3949ba59abbe56e057f20f883e', N'0345678122', N'khuyetdanhso1234@gmail.com', 0, 1, N'Nguyen Van D')
INSERT [dbo].[Account] ([account_id], [username], [password], [phone_number], [email], [isSell], [isAdmin], [fullname]) VALUES (11, N'KH', N'202cb962ac59075b964b07152d234b70', N'0909897812', N'khuyetdanhso1234', 0, 0, N'Khach Hang')
INSERT [dbo].[Account] ([account_id], [username], [password], [phone_number], [email], [isSell], [isAdmin], [fullname]) VALUES (1080, N'qqq', N'202cb962ac59075b964b07152d234b70', N'0787662211', N'khuyetdanhso1234@gmail.com', 0, 0, N'Nguyen')
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (1, N'GIÀY ADIDAS')
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (2, N'GIÀY NIKE')
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (3, N'GIÀY BALENCIAGA')
INSERT [dbo].[Category] ([category_id], [category_name]) VALUES (4, N'GIÀY CONVERSE')
GO
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([comment_id], [comment_text], [comment_date], [username], [product_id]) VALUES (8, N'Đẹp khỏi chê nha.', CAST(N'2023-07-16' AS Date), N'nva', 22)
INSERT [dbo].[Comment] ([comment_id], [comment_text], [comment_date], [username], [product_id]) VALUES (9, N'Hàng chất lượng lắm.', CAST(N'2023-07-16' AS Date), N'nva', 1003)
INSERT [dbo].[Comment] ([comment_id], [comment_text], [comment_date], [username], [product_id]) VALUES (12, N'Wow Màu sắc rực rỡ', CAST(N'2023-07-16' AS Date), N'nva', 19)
INSERT [dbo].[Comment] ([comment_id], [comment_text], [comment_date], [username], [product_id]) VALUES (13, N'Mê Luôn', CAST(N'2023-07-16' AS Date), N'nva', 22)
INSERT [dbo].[Comment] ([comment_id], [comment_text], [comment_date], [username], [product_id]) VALUES (14, N'Còn hàng không shop ơi', CAST(N'2023-07-16' AS Date), N'nva', 23)
INSERT [dbo].[Comment] ([comment_id], [comment_text], [comment_date], [username], [product_id]) VALUES (15, N'Quá Đẹp
', CAST(N'2023-07-16' AS Date), N'nva', 23)
INSERT [dbo].[Comment] ([comment_id], [comment_text], [comment_date], [username], [product_id]) VALUES (21, N'Quá Đẹp luôn', CAST(N'2023-07-19' AS Date), N'nva', 1003)
SET IDENTITY_INSERT [dbo].[Comment] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (16, N'nguyen7777', N'thovpce161117@fpt.edu.vn', N'0787662211', N'888', 1)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (18, N'nguyen544', N'thovpce161117@fpt.edu.vn', N'0787662211', N'bbbbb', 1)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (19, N'new', N'new', N'new ', N'new', 1)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (20, N'Trần Văn Bình', N'thovpce161117@fpt.edu.vn', N'0787662211', N'Cần Thơ', 11)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (21, N'testmail', N'thovpce161117@fpt.edu.vn', N'123', N'cantho', 11)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (22, N'againt', N'thovpce161117@fpt.edu.vn', N'0787662211', N'123', 11)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (23, N'zxc5675675', N'thovpce161117@fpt.edu.vn', N'0787662211', N'24', 11)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (24, N'nguyen', N'zxc', N'zxc', N'zxc', 11)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (25, N'nguyen', N'thovpce161117@fpt.edu.vn', N'0787662211', N'áđá', 11)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (26, N'cuoicung', N'thovpce161117@fpt.edu.vn', N'0787662211', N'ákl', 11)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (27, N'nguyen544', N'thovpce161117@fpt.edu.vn', N'0787662211', N'ác', 11)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (28, N'123vg', N'thovpce161117@fpt.edu.vn', N'0787662211', N'123', 11)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (29, N'tyty', N'xxxx', N'xxxx', N'xxxx', 11)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (30, N'bbbb', N'bbbb', N'bbbb', N'bbbbb', 1)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (31, N'nguyen', N'thovpce161117@fpt.edu.vn', N'0787662211', N'ttt', 11)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (32, N'aa', N'aa', N'0787662211', N'á', 11)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (33, N'nguyen', N'thovpce161117@fpt.edu.vn', N'0787662211', N'vvvvv', 11)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (34, N'nguyen544', N'thovpce161117@fpt.edu.vn', N'0787662211', N'dddd', 11)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (35, N'nguyen', N'thovpce161117@fpt.edu.vn', N'0787662211', N'c', 1)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (36, N'a', N'thovpce161117@fpt.edu.vn', N'0787662211', N'a', 11)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (37, N'd', N'd', N'd', N'd', 1)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (38, N's', N's', N's', N's', 1)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (39, N'a', N'thovpce161117@fpt.edu.vn', N'0787662211', N'vvvv', 11)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (40, N'Trần Văn Bình', N'thovpce161117@fpt.edu.vn', N'0787662211', N'Cần Thơ', 11)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (41, N'Trần Văn Bình', N'thovpce161117@fpt.edu.vn', N'0787662211', N'Cần Thơ
', 11)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (42, N'Trần Văn Bình', N'thovpce161117@fpt.edu.vn', N'0787662211', N'Cần thơ', 11)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1002, N'Trần Văn Bình', N'thovpce161117@fpt.edu.vn', N'0787662211', N'ád', 11)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1003, N'Trần Văn Bình', N'thovpce161117@fpt.edu.vn', N'0787662211', N'ád', 11)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1004, N'Trần Văn Bình', N'thovpce161117@fpt.edu.vn', N'0787662211', N'fffff', 11)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1005, N'Trần Văn Bình', N'thovpce161117@fpt.edu.vn', N'0787662211', N'fffff', 11)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1006, N'nguyen', N'thovpce161117@fpt.edu.vn', N'0787662211', N'g', 11)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1007, N'nguyen', N'thovpce161117@fpt.edu.vn', N'0787662211', N'g', 11)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1008, N'nguyen', N'thovpce161117@fpt.edu.vn', N'0787662211', N'f', 11)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1009, N'Trần Văn Bình', N'thovpce161117@fpt.edu.vn', N'0787662211', N'gh', 11)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1010, N'Trần Văn Bình', N'thovpce161117@fpt.edu.vn', N'0787662211', N'vv', 11)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1011, N'nguyen', N'thovpce161117@fpt.edu.vn', N'0787662211', N'h', 11)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1012, N'nguyen', N'thovpce161117@fpt.edu.vn', N'0787662211', N'g', 11)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1013, N'nguyen', N'thovpce161117@fpt.edu.vn', N'0787662211', N'g', 11)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1014, N'nguyen', N'thovpce161117@fpt.edu.vn', N'0787662211', N'g', 11)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1015, N'nguyen', N'thovpce161117@fpt.edu.vn', N'0787662211', N'g', 11)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1016, N'nguyen', N'thovpce161117@fpt.edu.vn', N'0787662211', N'g', 11)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1017, N'nguyen', N'thovpce161117@fpt.edu.vn', N'0787662211', N'g', 11)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1018, N'nguyen', N'thovpce161117@fpt.edu.vn', N'0787662211', N'g', 11)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1019, N'nguyen', N'thovpce161117@fpt.edu.vn', N'0787662211', N'f', 11)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1020, N'nguyen', N'thovpce161117@fpt.edu.vn', N'0787662211', N'vv', 11)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1021, N'Trần Văn Bình', N'thovpce161117@fpt.edu.vn', N'0787662211', N'Thành Phố Hồ Chí Minh', 11)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1022, N'Trần Văn Bình', N'thovpce161117@fpt.edu.vn', N'0787662211', N'gg', 11)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1023, N'Trần Văn Bình', N'thovpce161117@fpt.edu.vn', N'0787662211', N'bb', 11)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1024, N'Trần Văn Bình', N'thovpce161117@fpt.edu.vn', N'0787662211', N't', 11)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1025, N'Trần Văn Bình', N'thovpce161117@fpt.edu.vn', N'0787662211', N'v', 11)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1026, N'nguyen', N'thovpce161117@fpt.edu.vn', N'0787662211', N'vvv', 11)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1027, N'Trần Văn Bình', N'thovpce161117@fpt.edu.vn', N'0787662211', N'CANTHO', 1)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1028, N'nvb', N'thovpce161117@fpt.edu.vn', N'0787662211', N'123', 2)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1029, N'nvc', N'abc@meiaksdj', N'0787662211', N'123', 3)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1030, N'nvc', N'abc@meiaksdj', N'0787662211', N'123', 3)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1031, N'nvd', N'abc@meiaksdj', N'0787662211', N'123', 4)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1032, N'nvd', N'abc@meiaksdj', N'0787662211', N'123', 4)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1033, N'nvd', N'abc@meiaksdj', N'0787662211', N'123', 4)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1034, N'Trần Văn Bình', N'thovpce161117@fpt.edu.vn', N'0787662211', N'Cần Thơ', 1033)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1035, N'Trần Văn Bình', N'thovpce161117@fpt.edu.vn', N'0787662211', N'fff', 1036)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1036, N'Phan Khánh Linh', N'linhpkce171528@fpt.edu.vn', N'0787662211', N'Cần Thơ', 11)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1037, N'Văn Dũng', N'dunglvce171832@fpt.edu.vn', N'097866552', N'Cần Thơ', 1)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1038, N'Nguyen Van D', N'thovpce161117@fpt.edu.vn', N'0787662211', N'Cần Thơ', 4)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1039, N'Nguyen Van D', N'abc@meiaksdj', N'0787662211', N'Cần Thơ', 4)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1040, N'Nguyen Van D', N'abc@meiaksdj', N'0787662211', N'Cần Thơ', 4)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1041, N'Trương Mạnh Hưng', N'hungtmce171981@fpt.edu.vn', N'0787662211', N'Cần Thơ', 4)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1042, N'Nguyen Van C', N'abc@meiaksdj', N'0787662211', N'Cần Thơ', 3)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1043, N'NMA', N'nguyen@gmail.com', N'0787662211', N'123', 1042)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1044, N'Trần Văn Bình', N'abc@meiaksdj', N'0787662211', N'abc', 1)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1045, N'Trần Văn Bình', N'abc@meiaksdj', N'0787662211', N'123', 1)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1046, N'Trần Văn Bình', N'abc@meiaksdj', N'0787662211', N'123', 1)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1047, N'Trần Văn Bình', N'abc@meiaksdj', N'0787662211', N'123', 1)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1048, N'nguyen', N'abc@meiaksdj', N'0787662211', N'123', 1)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1049, N'Nguyen Van D', N'thovpce161117@fpt.edu.vn', N'0787662211', N'123', 1)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1050, N'Trần Văn Bình', N'thovpce161117@fpt.edu.vn', N'0787662211', N'123', 11)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1051, N'tyty', N'thovpce161117@fpt.edu.vn', N'0787662211', N'123', 11)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1052, N'tyty', N'thovpce161117@fpt.edu.vn', N'0787662211', N'123', 11)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1053, N'nguyen544', N'thovpce161117@fpt.edu.vn', N'0787662211', N'123', 11)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1054, N'nguyen544', N'thovpce161117@fpt.edu.vn', N'0787662211', N'123', 11)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1055, N'nguyen544', N'thovpce161117@fpt.edu.vn', N'0787662211', N'123', 11)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1056, N'nguyen544', N'thovpce161117@fpt.edu.vn', N'0787662211', N'123', 11)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1057, N'Trần Văn Bình', N'thovpce161117@fpt.edu.vn', N'0787662211', N'123', 11)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1058, N'tyty', N'thovpce161117@fpt.edu.vn', N'0787662211', N'123', 11)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1059, N'Trần Văn Bình', N'thovpce161117@fpt.edu.vn', N'0787662211', N'123', 11)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1060, N'Trần Văn Bình', N'thovpce161117@fpt.edu.vn', N'09090909', N'123123', 11)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1061, N'Nguyen Van D', N'thovpce161117@fpt.edu.vn', N'123', N'123', 11)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1062, N'nguyen', N'thovpce161117@fpt.edu.vn', N'123', N'123', 11)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1063, N'nguyen544', N'thovpce161117@fpt.edu.vn', N'123', N'123', 11)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1064, N'Trần Văn Bình', N'thovpce161117@fpt.edu.vn', N'123', N'123', 11)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1065, N'Nguyen Van D', N'thovpce161117@fpt.edu.vn', N'123123', N'123', 11)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1066, N'Trần Văn Bình', N'thovpce161117@fpt.edu.vn', N'123', N'123', 11)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1067, N'Trần Văn Bình', N'thovpce161117@fpt.edu.vn', N'0787662211', N'123', 11)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1068, N'nguyen', N'thovpce161117@fpt.edu.vn', N'123', N'123', 11)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1069, N'Trần Văn Bình', N'khuyetdanhso1234@gmail.com', N'0787662211', N'123', 1051)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1070, N'nguyen', N'khuyetnhso@gmail.com', N'0909090909', N'123', 11)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1071, N'Trần Văn Bình', N'thovpce161117@fpt.edu.vn', N'0787662211', N'Cần Thơ', 1)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1072, N'Nguyễn Văn Minh', N'minhnguyen@gmail.com', N'0787662211', N'Cần Thơ', 1049)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1073, N'Trần Văn Bình', N'thovpce161117@fpt.edu.vn', N'0787662211', N'Thành Phố Cần Thơ', 1)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1074, N'Trần Văn Bình', N'thovpce161117@fpt.edu.vn', N'0787662211', N'Cần Thơ', 11)
GO
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1075, N'Trần Văn Bình', N'abc@meiaksdj', N'0787662211', N'Cần Thơ', 11)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1076, N'Trần Văn Bình', N'thovpce161117@fpt.edu.vn', N'0787662211', N'Cần Thơ', 1)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1077, N'Trần Văn Bình', N'thovpce161117@fpt.edu.vn', N'0787662211', N'Cần Thơ', 1)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1078, N'Trần Văn Bình', N'thovpce161117@fpt.edu.vn', N'0787662211', N'123', 1)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1079, N'Trần Văn Bình', N'thovpce161117@fpt.edu.vn', N'0787662211', N'Cần Thơ', 1)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1080, N'Trần Văn Bình', N'thovpce161117@fpt.edu.vn', N'0787662211', N'Cần thơ', 1)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1081, N'Trần Văn Bình', N'thovpce161117@fpt.edu.vn', N'0787662211', N'Cần Thơ', 1)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1082, N'Trần Văn Bình', N'thovpce161117@fpt.edu.vn', N'0787662211', N'Thành Phố Cần Thơ', 1)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1083, N'Trần Văn Bình', N'thovpce161117@fpt.edu.vn', N'0787662211', N'123', 2)
INSERT [dbo].[Customer] ([customer_id], [customer_name], [email], [phone_number], [address], [account_id]) VALUES (1084, N'Trần Văn Bình', N'minhnguyen@gmail.com', N'0787662211', N'123', 2)
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (23, 1, CAST(N'2023-07-07' AS Date), 300.0000, 16)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (24, 1, CAST(N'2023-07-07' AS Date), 850.0000, 18)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (25, 1, CAST(N'2023-07-07' AS Date), 2660.0000, 19)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (27, 11, CAST(N'2023-07-07' AS Date), 150.0000, 21)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (28, 11, CAST(N'2023-07-07' AS Date), 610.0000, 22)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (29, 11, CAST(N'2023-07-07' AS Date), 150.0000, 23)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (30, 11, CAST(N'2023-07-07' AS Date), 860.0000, 24)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (31, 11, CAST(N'2023-07-07' AS Date), 700.0000, 25)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (32, 11, CAST(N'2023-07-07' AS Date), 800.0000, 26)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (33, 11, CAST(N'2023-07-07' AS Date), 600.0000, 27)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (34, 11, CAST(N'2023-07-07' AS Date), 800.0000, 28)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (35, 11, CAST(N'2023-07-07' AS Date), 700.0000, 29)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (36, 1, CAST(N'2023-07-07' AS Date), 2200.0000, 30)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (37, 11, CAST(N'2023-07-07' AS Date), 150.0000, 31)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (38, 11, CAST(N'2023-07-07' AS Date), 160.0000, 34)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (39, 1, CAST(N'2023-07-07' AS Date), 150.0000, 35)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (40, 11, CAST(N'2023-07-07' AS Date), 700.0000, 36)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (41, 1, CAST(N'2023-07-07' AS Date), 800.0000, 37)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (42, 1, CAST(N'2023-07-07' AS Date), 320.0000, 38)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (43, 11, CAST(N'2023-07-07' AS Date), 700.0000, 39)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (44, 11, CAST(N'2023-07-08' AS Date), 2700.0000, 40)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (45, 11, CAST(N'2023-07-08' AS Date), 3300.0000, 41)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (46, 11, CAST(N'2023-07-08' AS Date), 3900.0000, 42)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1002, 11, CAST(N'2023-07-08' AS Date), 3900.0000, 1002)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1003, 11, CAST(N'2023-07-08' AS Date), 0.0000, 1003)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1004, 11, CAST(N'2023-07-08' AS Date), 600.0000, 1004)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1005, 11, CAST(N'2023-07-08' AS Date), 600.0000, 1005)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1006, 11, CAST(N'2023-07-08' AS Date), 600.0000, 1006)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1007, 11, CAST(N'2023-07-08' AS Date), 600.0000, 1007)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1008, 11, CAST(N'2023-07-08' AS Date), 730.0000, 1008)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1009, 11, CAST(N'2023-07-08' AS Date), 730.0000, 1009)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1010, 11, CAST(N'2023-07-08' AS Date), 1300.0000, 1010)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1011, 11, CAST(N'2023-07-08' AS Date), 1300.0000, 1011)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1012, 11, CAST(N'2023-07-08' AS Date), 1300.0000, 1012)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1013, 11, CAST(N'2023-07-08' AS Date), 1300.0000, 1013)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1014, 11, CAST(N'2023-07-08' AS Date), 1300.0000, 1014)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1015, 11, CAST(N'2023-07-08' AS Date), 1300.0000, 1015)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1016, 11, CAST(N'2023-07-08' AS Date), 1300.0000, 1016)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1017, 11, CAST(N'2023-07-08' AS Date), 1300.0000, 1017)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1018, 11, CAST(N'2023-07-08' AS Date), 1300.0000, 1018)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1019, 11, CAST(N'2023-07-08' AS Date), 1300.0000, 1019)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1020, 11, CAST(N'2023-07-08' AS Date), 850.0000, 1020)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1021, 11, CAST(N'2023-07-08' AS Date), 1420.0000, 1021)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1022, 11, CAST(N'2023-07-08' AS Date), 1300.0000, 1022)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1023, 11, CAST(N'2023-07-08' AS Date), 1300.0000, 1023)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1024, 11, CAST(N'2023-07-08' AS Date), 1660.0000, 1024)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1025, 11, CAST(N'2023-07-08' AS Date), 750.0000, 1025)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1026, 11, CAST(N'2023-07-08' AS Date), 1740.0000, 1026)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1027, 1, CAST(N'2023-07-09' AS Date), 2400.0000, 1027)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1028, 2, CAST(N'2023-07-10' AS Date), 1300.0000, 1028)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1029, 3, CAST(N'2023-07-10' AS Date), 2000.0000, 1029)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1036, 11, CAST(N'2023-07-11' AS Date), 2000.0000, 1036)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1037, 1, CAST(N'2023-07-12' AS Date), 2000.0000, 1037)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1038, 4, CAST(N'2023-07-16' AS Date), 4300.0000, 1038)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1039, 4, CAST(N'2023-07-16' AS Date), 800.0000, 1039)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1040, 4, CAST(N'2023-07-16' AS Date), 700.0000, 1040)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1041, 4, CAST(N'2023-07-16' AS Date), 750.0000, 1041)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1042, 3, CAST(N'2023-07-16' AS Date), 1600.0000, 1042)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1044, 1, CAST(N'2023-07-16' AS Date), 492.0000, 1044)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1045, 1, CAST(N'2023-07-16' AS Date), 800.0000, 1045)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1046, 1, CAST(N'2023-07-16' AS Date), 800.0000, 1046)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1047, 1, CAST(N'2023-07-16' AS Date), 0.0000, 1047)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1048, 1, CAST(N'2023-07-16' AS Date), 0.0000, 1048)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1050, 11, CAST(N'2023-07-16' AS Date), 123.0000, 1050)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1051, 11, CAST(N'2023-07-16' AS Date), 800.0000, 1051)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1052, 11, CAST(N'2023-07-16' AS Date), 800.0000, 1052)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1053, 11, CAST(N'2023-07-16' AS Date), 800.0000, 1053)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1054, 11, CAST(N'2023-07-16' AS Date), 800.0000, 1054)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1055, 11, CAST(N'2023-07-16' AS Date), 700.0000, 1055)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1056, 11, CAST(N'2023-07-16' AS Date), 1746.0000, 1056)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1057, 11, CAST(N'2023-07-16' AS Date), 2423.0000, 1057)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1058, 11, CAST(N'2023-07-16' AS Date), 1500.0000, 1058)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1059, 11, CAST(N'2023-07-16' AS Date), 246.0000, 1059)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1060, 11, CAST(N'2023-07-16' AS Date), 1046.0000, 1060)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1061, 11, CAST(N'2023-07-16' AS Date), 943.0000, 1061)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1062, 11, CAST(N'2023-07-16' AS Date), 1420.0000, 1062)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1063, 11, CAST(N'2023-07-16' AS Date), 1723.0000, 1063)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1064, 11, CAST(N'2023-07-16' AS Date), 1623.0000, 1064)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1065, 11, CAST(N'2023-07-16' AS Date), 843.0000, 1065)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1066, 11, CAST(N'2023-07-16' AS Date), 1723.0000, 1066)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1067, 11, CAST(N'2023-07-16' AS Date), 1623.0000, 1067)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1068, 11, CAST(N'2023-07-16' AS Date), 923.0000, 1068)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1070, 11, CAST(N'2023-06-01' AS Date), 17865.0000, 1070)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1071, 1, CAST(N'2023-07-17' AS Date), 2900.0000, 1071)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1073, 1, CAST(N'2023-07-18' AS Date), 2700.0000, 1073)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1074, 11, CAST(N'2023-07-18' AS Date), 800.0000, 1074)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1075, 11, CAST(N'2023-07-18' AS Date), 800.0000, 1075)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1076, 1, CAST(N'2023-07-18' AS Date), 800.0000, 1076)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1077, 1, CAST(N'2023-07-18' AS Date), 800.0000, 1077)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1078, 1, CAST(N'2023-07-18' AS Date), 800.0000, 1078)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1079, 1, CAST(N'2023-07-18' AS Date), 2700.0000, 1079)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1080, 1, CAST(N'2023-07-18' AS Date), 2900.0000, 1080)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1081, 1, CAST(N'2023-07-18' AS Date), 2700.0000, 1081)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1082, 1, CAST(N'2023-07-19' AS Date), 2800.0000, 1082)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1083, 2, CAST(N'2023-07-19' AS Date), 8000.0000, 1083)
INSERT [dbo].[Order] ([order_id], [account_id], [order_date], [order_total], [customer_id]) VALUES (1084, 2, CAST(N'2023-07-19' AS Date), 8000.0000, 1084)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (23, 18, 150.0000, 2)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (24, 18, 150.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (24, 22, 700.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (25, 20, 120.0000, 3)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (25, 21, 800.0000, 2)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (25, 22, 700.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (27, 18, 150.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (28, 16, 450.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (28, 17, 160.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (29, 18, 150.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (30, 17, 160.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (30, 22, 700.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (31, 22, 700.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (32, 21, 800.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (33, 23, 600.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (34, 21, 800.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (35, 22, 700.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (36, 21, 800.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (36, 22, 700.0000, 2)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (37, 18, 150.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (38, 17, 160.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (39, 18, 150.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (40, 22, 700.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (41, 21, 800.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (42, 17, 160.0000, 2)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (43, 22, 700.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (44, 21, 800.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (44, 22, 700.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (44, 23, 600.0000, 2)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (45, 21, 800.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (45, 22, 700.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (45, 23, 600.0000, 3)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (46, 21, 800.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (46, 22, 700.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (46, 23, 600.0000, 4)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1002, 21, 800.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1002, 22, 700.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1002, 23, 600.0000, 4)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1004, 23, 600.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1005, 23, 600.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1006, 23, 600.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1007, 23, 600.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1008, 19, 130.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1008, 23, 600.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1009, 19, 130.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1009, 23, 600.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1010, 22, 700.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1010, 23, 600.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1011, 22, 700.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1011, 23, 600.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1012, 22, 700.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1012, 23, 600.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1013, 22, 700.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1013, 23, 600.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1014, 22, 700.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1014, 23, 600.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1015, 22, 700.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1015, 23, 600.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1016, 22, 700.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1016, 23, 600.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1017, 22, 700.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1017, 23, 600.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1018, 22, 700.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1018, 23, 600.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1019, 22, 700.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1019, 23, 600.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1020, 18, 150.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1020, 22, 700.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1021, 20, 120.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1021, 22, 700.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1021, 23, 600.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1022, 22, 700.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1022, 23, 600.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1023, 22, 700.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1023, 23, 600.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1024, 17, 160.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1024, 21, 800.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1024, 22, 700.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1025, 18, 150.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1025, 23, 600.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1026, 18, 150.0000, 2)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1026, 20, 120.0000, 2)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1026, 23, 600.0000, 2)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1027, 21, 800.0000, 2)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1028, 23, 600.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1028, 1003, 700.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1029, 22, 700.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1029, 23, 600.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1029, 1003, 700.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1036, 22, 700.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1036, 23, 600.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1036, 1003, 700.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1037, 23, 600.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1037, 1003, 700.0000, 2)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1038, 22, 700.0000, 2)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1038, 23, 600.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1038, 1003, 700.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1040, 22, 700.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1041, 18, 150.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1041, 23, 600.0000, 1)
GO
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1055, 22, 700.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1056, 1003, 700.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1057, 21, 800.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1057, 22, 700.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1058, 1003, 700.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1061, 20, 120.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1061, 1003, 700.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1062, 20, 120.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1062, 23, 600.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1062, 1003, 700.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1063, 21, 800.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1064, 1003, 700.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1065, 20, 120.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1065, 23, 600.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1066, 21, 800.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1067, 1003, 700.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1071, 1003, 700.0000, 3)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1073, 23, 600.0000, 2)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1073, 1003, 700.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1079, 23, 600.0000, 2)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1079, 1003, 700.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1080, 23, 600.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1080, 1003, 700.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1081, 22, 700.0000, 2)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1081, 23, 600.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1081, 1003, 700.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1082, 21, 800.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1082, 23, 600.0000, 1)
INSERT [dbo].[OrderDetail] ([order_id], [product_id], [unit_price], [quantity]) VALUES (1082, 1003, 700.0000, 2)
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([product_id], [product_name], [product_pic], [product_color], [price], [stock_quantity], [des], [category_id]) VALUES (2, N'Giày Adidas Chính Hãng - ULTRABOOST 21', N'https://bizweb.dktcdn.net/thumb/1024x1024/100/347/092/products/adidas-gz3194-01.jpg', N'white', 300.0000, 12, N'Hàng loạt bản mẫu. Hàng loạt cải tiến. Hàng loạt thử nghiệm. Đồng hành cùng chúng tôi trên hành trình tìm kiếm sự hòa hợp đỉnh cao giữa trọng lượng, sự êm ái và độ đàn hồi. Ultraboost 21', 1)
INSERT [dbo].[Product] ([product_id], [product_name], [product_pic], [product_color], [price], [stock_quantity], [des], [category_id]) VALUES (3, N'Giày chạy Bộ Adidas', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/032a85ad404f4adaa069af3500c2abb6_9366/Giay_Ultrabounce_DJo_HP5775_01_standard.jpg', N'red', 120.0000, 12, N'Giày thể thao Adidas Advantage Clean sử dụng chất liệu cao cấp, thoáng khí cả mặt trong và mặt ngoài giúp bạn luôn dễ chịu và thoải mái dù mang trong thời gian dài. Giày Adidas VS Advantage có bộ đế êm ái giúp người đi tận hưởng cảm giác thoải mái cho cả ngày dài vận động. Thời trang vốn là sự quay vòng, và thiết kế đơn giản, cổ điển đại diện cho xu hướng thời trang hoài cổ đang quay trở lại và được giới trẻ đón nhận nồng nhiệt hơn bao giờ hết. Không giống như những loại giày thể thao thông thường, mẫu giày adidas Advantage có kiểu dáng "thon thả" hơn, khiến cho đôi chân không bị trở nên lạc lõng so với đôi giày thể thao vốn bị "mang tiếng" là thô kệch, không đẹp mắt. Thêm nữa, đế của loại giày này được thiết kế theo kiểu đế xuồng 3cm vừa tạo tính đàn hồi cho từng bước đi mà cũng "tiện tay" giúp cho người đi "ăn gian" chiều cao khá đáng kể. Và tất nhiên, điểm cộng tuyệt vời nhất chính là sự phối hợp tuyệt vời từ kiểu dáng đến màu sắc của các nhà thiết kế tài hoa đã làm cho đôi giày phù hợp với mọi giới tính, mọi lứa tuổi, mix được với rất nhiều phong cách khác nhau', 1)
INSERT [dbo].[Product] ([product_id], [product_name], [product_pic], [product_color], [price], [stock_quantity], [des], [category_id]) VALUES (4, N'Giày THỂ THAO ADIDAS OZWEEGO', N'https://admin.thegioigiay.com/upload/product/2023/06/giay-the-thao-adidas-ozweego-shoes-ee6465-mau-cam-648a735b1f0b7-15062023091139.jpg', N'orange', 130.0000, 10, N'Giày Thể Thao Adidas Ozweego Shoes EE6465 Màu Cam với thiết kế ôm chân đến từ thương hiệu nổi tiếng Adidas. Giày Adidas Duramo SL sở hữu phối màu đen mang phong cách năng động, sử dụng chất liệu nhẹ và thoáng khí, mang lại trải nghiệm tốt nhất khi lên chân', 1)
INSERT [dbo].[Product] ([product_id], [product_name], [product_pic], [product_color], [price], [stock_quantity], [des], [category_id]) VALUES (5, N'Giày THỂ THAO GIÀY ADIDAS SUPERNOVA', N'https://admin.thegioigiay.com/upload/product/2023/06/giay-the-thao-giay-adidas-supernova-fx6700-mau-trang-hong-647fe23118c55-07062023084937.jpg', N'white', 160.0000, 12, N'Giày Thể Thao Giày Adidas Supernova FX6700 Màu Trắng Hồng với thiết kế ôm chân đến từ thương hiệu nổi tiếng Adidas. Giày Adidas Supernova FX6700 sở hữu phối màu đen mang phong cách năng động, sử dụng chất liệu nhẹ và thoáng khí, mang lại trải nghiệm tốt nhất khi lên chân.', 1)
INSERT [dbo].[Product] ([product_id], [product_name], [product_pic], [product_color], [price], [stock_quantity], [des], [category_id]) VALUES (6, N'Giày THỂ THAO NỮ ADIDAS BY STELLA MCCARTNEY SOLARGLIDE', N'https://admin.thegioigiay.com/upload/product/2023/05/giay-the-thao-nu-adidas-by-stella-mccartney-solarglide-hq8616-mau-xanh-36-5-64658d0d289b8-18052023092725.jpg', N'blue', 600.0000, 12, N'Giày Thể Thao Giày Adidas Supernova FX6700 Màu Trắng Hồng với thiết kế ôm chân đến từ thương hiệu nổi tiếng Adidas. Giày Adidas Supernova FX6700 sở hữu phối màu đen mang phong cách năng động, sử dụng chất liệu nhẹ và thoáng khí, mang lại trải nghiệm tốt nhất khi lên chân.', 1)
INSERT [dbo].[Product] ([product_id], [product_name], [product_pic], [product_color], [price], [stock_quantity], [des], [category_id]) VALUES (7, N'Giày BÓNG RỔ NIKE GIANNIS', N'https://admin.thegioigiay.com/upload/product/2023/05/giay-bong-ro-nike-giannis-immortality-black-volt-cz4099-010-den-trang-42-646c830d0f11e-23052023161037.jpg', N'black', 180.0000, 12, N'Giày Bóng Rổ Nike Giannis Immortality Black Volt CZ4099-010 Đen Trắng là sản phẩm đến từ thương hiệu Nike nổi tiếng của Mỹ. Với thiết kế đẹp mắt, kiểu dáng hiện đại, đôi giày bóng rổ này sẽ giúp bạn trở nên mạnh mẽ và năng động hơn trong các hoạt động thể chất hàng ngày.', 2)
INSERT [dbo].[Product] ([product_id], [product_name], [product_pic], [product_color], [price], [stock_quantity], [des], [category_id]) VALUES (8, N'Giày THỂ THAO NIKE PEGASUS TRAIL 4', N'https://admin.thegioigiay.com/upload/product/2023/06/giay-the-thao-nike-pegasus-trail-4-gore-tex-dj7926-200-mau-do-nau-6487df2468605-13062023101444.jpg', N'brown', 180.0000, 12, N'Giày Thể Thao Nike Pegasus Trail 4 Gore-Tex DJ7926-200 Màu Đỏ Nâu là sản phẩm đến từ thương hiệu Nike nổi tiếng của Mỹ. Với thiết kế đẹp mắt, kiểu dáng hiện đại, đôi giày bóng rổ này sẽ giúp bạn trở nên mạnh mẽ và năng động hơn trong các hoạt động thể chất hàng ngày.', 2)
INSERT [dbo].[Product] ([product_id], [product_name], [product_pic], [product_color], [price], [stock_quantity], [des], [category_id]) VALUES (9, N'Giày Thể Thao Nike Air Zoom', N'https://cdn.vuahanghieu.com/unsafe/0x500/left/top/smart/filters:quality(90)/https://admin.vuahanghieu.com/upload/product/2022/07/giay-the-thao-nike-air-zoom-pegasus-38-white-blue-cw7356-009-mau-trang-xanh-size-40-62be761561f00-01072022112037.jpg', N'white', 200.0000, 12, N'Nike là hãng thời trang thể thao nổi tiếng nước Mỹ được thành lập từ năm 1964 với tên gọi là Blue Ribbon Sports. Về sau cho đến năm 1971 thì Nike mới
chính thức.', 2)
INSERT [dbo].[Product] ([product_id], [product_name], [product_pic], [product_color], [price], [stock_quantity], [des], [category_id]) VALUES (10, N'Giày THỂ THAO NIKE LEBRON LEBRON SOLDIER 14', N'https://admin.thegioigiay.com/upload/product/2023/05/giay-the-thao-nike-lebron-lebron-soldier-14-usa-ck6024-100-40-6455af685d4cd-06052023083744.jpg', N'red', 320.0000, 12, N'Giày Thể Thao Nike Lebron Lebron Soldier 14 ''USA'' CK6024-100  thiết kế đẹp mắt, kiểu dáng hiện đại. Với đôi giày thời trang này chắc chắn bạn sẽ trở nên nổi bật và cuốn hút hơn.', 2)
INSERT [dbo].[Product] ([product_id], [product_name], [product_pic], [product_color], [price], [stock_quantity], [des], [category_id]) VALUES (11, N'Giày Balenciaga Triple S Clear Sole ‘Light Pink’', N'https://authentic-shoes.com/wp-content/uploads/2023/06/eCom-544351W2GA15760_F-600x313.png', N'pink', 700.0000, 12, N'Vừa qua hãng này cho ra mắt mẫu giày Balenciaga Track Trainers – đôi giày ra đời đã phá vỡ những tiêu chuẩn về thời trang; có thiết kế phần đế khá to, cao và uốn lượn đầy nghệ thuật cùng với phần upper được kết hợp giữa chất liệu vải và da rất năng động.', 3)
INSERT [dbo].[Product] ([product_id], [product_name], [product_pic], [product_color], [price], [stock_quantity], [des], [category_id]) VALUES (12, N'Giày Balenciaga Speed ‘Black’ ', N'https://authentic-shoes.com/wp-content/uploads/2023/04/ecom-645056w2dbp1013_f_8c02598d4daa4b4fb91f4cbd16834146-600x354.png', N'black', 230.0000, 12, N'Balenciaga là thương hiệu thời trang lâu đời nổi tiếng thế giới được xếp vào hàng Luxury, Balenciaga khiến cả thế giới ngỡ ngàng với thiết kế sáng tạo.', 3)
INSERT [dbo].[Product] ([product_id], [product_name], [product_pic], [product_color], [price], [stock_quantity], [des], [category_id]) VALUES (13, N'Giày Balenciaga Track Trainers Màu Yellow', N'https://zippy.vn/wp-content/uploads/2021/02/DSC09075-600x600.jpg', N'yellow', 140.0000, 12, N'Balenciaga Track Trainers – đôi giày ra đời đã phá vỡ những tiêu chuẩn về thời trang; có thiết kế phần đế khá to, cao và uốn lượn đầy nghệ thuật cùng với phần upper được kết hợp giữa chất liệu vải và da rất năng động.', 3)
INSERT [dbo].[Product] ([product_id], [product_name], [product_pic], [product_color], [price], [stock_quantity], [des], [category_id]) VALUES (14, N'Giày Balenciaga x Adidas Speed ‘Black White’', N'https://authentic-shoes.com/wp-content/uploads/2023/05/Gia%CC%80y-Balenciaga-x-Adidas-Speed-Black-White-711189WBDV11090.webp', N'black', 800.0000, 12, N'Tại Việt Nam có rất nhiều bạn trẻ cũng như người nổi tiếng đang đi Balenciaga, có thể nói Balenciaga đang là trend không những ở thế giới mà ngay tại Việt Nam.', 3)
INSERT [dbo].[Product] ([product_id], [product_name], [product_pic], [product_color], [price], [stock_quantity], [des], [category_id]) VALUES (15, N'Giày Balenciaga x Adidas Runner Graffiti ‘White’ ', N'https://authentic-shoes.com/wp-content/uploads/2023/04/e-677403-w3rbq-9010__1__-_copy_6d1c26ebd39c4455b525563fa607985b_master_cfd34477b1474ec89b13ca7a7127a8fd-600x305.png', N'white', 340.0000, 12, N'Tại Việt Nam có rất nhiều bạn trẻ cũng như người nổi tiếng đang đi Balenciaga, có thể nói Balenciaga đang là trend không những ở thế giới mà ngay tại Việt Nam.', 3)
INSERT [dbo].[Product] ([product_id], [product_name], [product_pic], [product_color], [price], [stock_quantity], [des], [category_id]) VALUES (16, N'Giày Balenciaga x Adidas 3xl Trainers ‘Multicolor', N'https://authentic-shoes.com/wp-content/uploads/2023/04/ticolor_-734734-w3xl5-9645__1__9dff880741fb44f1bf14e4b35dc548d8_master_2727f39b9eb7439a8f708364ebcfc3a5-600x304.png', N'white', 450.0000, 12, N'đôi giày ra đời đã phá vỡ những tiêu chuẩn về thời trang; có thiết kế phần đế khá to, cao và uốn lượn đầy nghệ thuật cùng với phần upper được kết hợp giữa chất liệu vải và da rất năng động.', 3)
INSERT [dbo].[Product] ([product_id], [product_name], [product_pic], [product_color], [price], [stock_quantity], [des], [category_id]) VALUES (17, N'Giày CONVERSE CHUCK TAYLOR ALL STAR 1970S RENEW', N'https://admin.thegioigiay.com/upload/product/2022/11/giay-converse-chuck-taylor-all-star-1970s-renew-168615c-mau-vang-6380647dcfd11-25112022134517.jpg', N'orange', 160.0000, 12, N'Giày Converse Chuck Taylor All Star 1970s Renew - 168615C Màu Vàng đến từ thương hiệu Converse nổi tiếng. Với thiết kế cao cổ hiện đại, màu sắc bắt mắt, mẫu giày Converse Chuck Taylor All Star 1970s Renew - 168615C Màu Vàng sẽ mang lại sự thu hút cho bộ trang phục của bạn. ', 4)
INSERT [dbo].[Product] ([product_id], [product_name], [product_pic], [product_color], [price], [stock_quantity], [des], [category_id]) VALUES (18, N'Giày CONVERSE CHUCK TAYLOR ALL STAR RENEW ', N'https://admin.thegioigiay.com/upload/product/2022/11/giay-converse-chuck-taylor-all-star-renew-168595v-mau-den-trang-638069a52c92a-25112022140717.jpg', N'black', 150.0000, 12, N'Giày Converse Chuck Taylor All Star Renew - 168595V Màu Đen Trắng với phối màu lạ mắt đến từ thương hiệu Converse nổi tiếng. Sở hữu chất liệu cải tiến, kiểu dáng basic dễ đi, mẫu giày Converse Chuck Taylor All Star Renew - 168595V Màu Đen Trắng sẽ mang đến cho bạn trải nghiệm tốt nhất khi lên chân. ', 4)
INSERT [dbo].[Product] ([product_id], [product_name], [product_pic], [product_color], [price], [stock_quantity], [des], [category_id]) VALUES (19, N'Giày CONVERSE CHUCK TAYLOR ALL STAR', N'https://admin.thegioigiay.com/upload/product/2022/11/giay-converse-chuck-taylor-all-star-cx-168570c-mau-vang-size-40-63805d75a3c27-25112022131517.jpg', N'yellow', 130.0000, 12, N'Giày Converse Chuck Taylor All Star CX - 168570C Màu Vàng Size 40 là sản phẩm đến từ thương hiệu Converse nổi tiếng của Mỹ. Với thiết kế thời trang cùng màu sắc nổi bật đôi giày đang nhận được sự yêu thích của rất nhiều bạn trẻ.', 4)
INSERT [dbo].[Product] ([product_id], [product_name], [product_pic], [product_color], [price], [stock_quantity], [des], [category_id]) VALUES (20, N'Giày CONVERSE CHUCK 1970S', N'https://admin.thegioigiay.com/upload/product/2022/11/giay-converse-chuck-1970s-high-all-white-mau-trang-638078efbb829-25112022151231.jpg', N'white', 120.0000, 12, N'Giày Converse Chuck 1970s High All White Màu Trắng là best seller đến từ thương hiệu Converse nổi tiếng. Với thiết kế cùng phối màu basic, mẫu giày Converse Chuck 1970s High All White Màu Trắng sẽ mang đến cho bạn trải nghiệm tốt nhất khi lên chân.', 4)
INSERT [dbo].[Product] ([product_id], [product_name], [product_pic], [product_color], [price], [stock_quantity], [des], [category_id]) VALUES (21, N'WOMEN''S TRACK SNEAKER', N'https://balenciaga.dam.kering.com/m/5d0d7977338156dc/Large-542436W1GB19059_F.jpg?v=5', N'white', 800.0000, 12, N'Đường chạy được làm bằng nylon và lưới cho Giày thể thao không bằng da 100%
• Kích thước chữ viết ở rìa ngón chân
• Đường vân nổi phía sau gót
• BB dập nổi phía trước đế ngoài
• Balenciaga in bên ngoài
• Balenciaga dập nổi trên lưỡi gà', 3)
INSERT [dbo].[Product] ([product_id], [product_name], [product_pic], [product_color], [price], [stock_quantity], [des], [category_id]) VALUES (22, N'Giày Nike Zoom G.T.', N'https://sneakerdaily.vn/wp-content/uploads/2023/04/giay-nike-zoom-g-t-cut-2-ep-leap-high-fd4321-101-11.png.webp', N'white', 700.0000, 12, N'Giày Nike Zoom G.T. Cut 2 EP ‘Leap High’ FD4321-101 là một sản phẩm mới nhất trong bộ sưu tập của Nike và được thiết kế đặc biệt cho các vận động viên bóng rổ chuyên nghiệp.', 2)
INSERT [dbo].[Product] ([product_id], [product_name], [product_pic], [product_color], [price], [stock_quantity], [des], [category_id]) VALUES (23, N'Giày adidas Superstar ', N'https://sneakerdaily.vn/wp-content/uploads/2022/11/giay-adidas-superstar-ivory-white-black-gx6025.jpg.webp', N'white', 600.0000, 12, N'Phần trên (upper) bằng da thật và chất liệu tổng hợp tăng thêm độ bền và kiểu dáng sắc nét gợi nhớ đến sân bóng rổ trường học cũ.
Cấu trúc lưu hóa hợp nhất đế với phần trên để tạo cảm giác linh hoạt, đột phá.', 1)
INSERT [dbo].[Product] ([product_id], [product_name], [product_pic], [product_color], [price], [stock_quantity], [des], [category_id]) VALUES (1003, N'GIÀY ADIZERO BOSTON 12', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/3d2b554822964b9781e84feabe266fd0_9366/Giay_Adizero_Boston_12_DJen_ID4234_01_standard.jpg', N'black', 700.0000, 12, N'VẢI LƯỚI KỸ THUẬT
Chinh phục những buổi tập chạy tempo cùng cảm giác thoáng khí. Trải nghiệm độ nâng đỡ tập trung tại các vị trí quan trọng mang lại cảm giác cố định ở giữa bàn chân cũng như linh hoạt ở mũi chân.

ENERGYROD 2.0
Cảm nhận độ cứng của đế giữa chuyên dụng đến từ các thanh ENERGYROD 2.0 bằng sợi thủy tinh. Một hệ thống toàn diện cho chuyển động mượt mà từ gót giày tới mũi giày, mang phong độ hệt như ngày thi đấu đến cho các buổi chạy rèn luyện tốc độ.

LIGHTSTRIKE PRO + LIGHTSTRIKE 2.0
Kết cấu đế giữa nhiều lớp bao gồm mút foam chuyên dụng LIGHTSTRIKE PRO và đệm LIGHTSTRIKE 2.0 hoàn toàn mới nhằm mang lại sải bước êm ái và linh hoạt. Đế ngoài Continental™ cho độ bám vượt trội trong những điều kiện thời tiết khó nhằn nhất.

CÓ SỬ DỤNG CHẤT LIỆU TÁI CHẾ
Với thân giày làm từ tối thiểu 50% chất liệu tái chế, sản phẩm này đại diện cho một trong số rất nhiều các giải pháp của chúng tôi hướng tới chấm dứt rác thải nhựa.', 1)
INSERT [dbo].[Product] ([product_id], [product_name], [product_pic], [product_color], [price], [stock_quantity], [des], [category_id]) VALUES (1037, N'Giày Speed Run', N'/PRJProject/images/DR2615-100-1_900x.webp', N'red', 120.0000, 12, N'Mang lại nhiều trải nghiệm mới mẽ cho người dùng', 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [unique_username]    Script Date: 9/11/2023 2:09:49 PM ******/
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [unique_username] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([account_id])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customer] ([customer_id])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[Order] ([order_id])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([category_id])
GO
USE [master]
GO
ALTER DATABASE [My_Product_Website] SET  READ_WRITE 
GO

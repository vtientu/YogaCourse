USE [master]
GO
/****** Object:  Database [YogaCenter]    Script Date: 5/27/2023 8:00:07 AM ******/
DROP DATABASE IF EXISTS [YogaCenter]
GO
Create DATABASE [YogaCenter]
GO 

USE [YogaCenter]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 5/27/2023 8:00:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[Firstname] [nvarchar](50) NULL,
	[Lastname] [nvarchar](50) NULL,
	[Avatar] [text] NULL,
	[Gender] int Default -1,
	[Phone] [varchar](20) NULL,
	[Email] [varchar](255) NOT NULL,
	[Address] [nvarchar](255) NULL,
	[Password] [varchar](255) NOT NULL,
	[Active] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 5/27/2023 8:00:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[BlogID] [int] IDENTITY(1,1) NOT NULL,
	[CreateBy] [int] NOT NULL,
	[Date] [date] NULL,
	[Title] [nvarchar](255) NULL,
	[Content] [text] NULL,
	[Status] [int] NULL,
	[Image] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[BlogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 5/27/2023 8:00:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] Date NULL,
	[status] [bit] NULL,
	[AccountId] [int] NULL,
	[CourseId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Class]    Script Date: 5/27/2023 8:00:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [varchar](20) NULL,
	[TrainerId] [int] NULL,
	[CourseId] [int] NULL,
	[Room] [varchar](10) NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[Finished] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClassDetail]    Script Date: 5/27/2023 8:00:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ClassId] [int] NULL,
	[TraineeId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 5/27/2023 8:00:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[CourseName] [nvarchar](50) NULL,
	[Price] [float] NULL,
	[Discount] [float] NULL,
	[LevelId] [int] NULL,
	[Description] [text] NULL,
	[Img] [text] NULL,
	[Deleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 5/27/2023 8:00:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TraineeId] [int] NULL,
	[CourseId] [int] NULL,
	[Rating] [int] NULL,
	[Status] [int] NULL,
	[Description] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Level]    Script Date: 5/27/2023 8:00:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Level](
	[id] [int] NOT NULL,
	[LevelName] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 5/27/2023 8:00:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slot]    Script Date: 5/27/2023 8:00:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slot](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TimetableId] [int] NULL,
	[DayOfWeek] [nvarchar](255) NULL,
	[TimeFrameId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeFrame]    Script Date: 5/27/2023 8:00:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeFrame](
	[id] [int] IDENTITY(1,1) NOT NULL,
	timeStart time NOT NULL,
	timeEnd time NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Timetable]    Script Date: 5/27/2023 8:00:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Timetable](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[totalDay] int NOT NULL,
	[ClassId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([id], [RoleId], [Firstname], [Lastname], [Gender], [PhoneNumber], [Email], [Address], [Password], [ValidationCode], [Deleted], [Img]) VALUES (1, 1, N'Trần', N'Nam', 1, N'0912356782', N'ad1@gmail.com', N'District 5, Ho Chi Minh City', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, 0, N'male')
INSERT [dbo].[Account] ([id], [RoleId], [Firstname], [Lastname], [Gender], [PhoneNumber], [Email], [Address], [Password], [ValidationCode], [Deleted], [Img]) VALUES (2, 1, N'Nguyễn', N'Thảo', 0, N'0912356793', N'ad2@gmail.com', N'District 5, Ho Chi Minh City', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, 0, N'female')
INSERT [dbo].[Account] ([id], [RoleId], [Firstname], [Lastname], [Gender], [PhoneNumber], [Email], [Address], [Password], [ValidationCode], [Deleted], [Img]) VALUES (3, 1, N'Trần', N'Nam', 1, N'0912345678', N'ad3@gmail.com', N'District 5, Ho Chi Minh City', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, 0, N'male')
INSERT [dbo].[Account] ([id], [RoleId], [Firstname], [Lastname], [Gender], [PhoneNumber], [Email], [Address], [Password], [ValidationCode], [Deleted], [Img]) VALUES (4, 1, N'Nguyễn', N'Thảo', 0, N'0912345679', N'ad4@gmail.com', N'District 5, Ho Chi Minh City', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, 0, N'female')
INSERT [dbo].[Account] ([id], [RoleId], [Firstname], [Lastname], [Gender], [PhoneNumber], [Email], [Address], [Password], [ValidationCode], [Deleted], [Img]) VALUES (5, 2, N'Lê', N'Long', 1, N'0912345680', N'quanqhse170057@fpt.edu.vn', N'District 5, Ho Chi Minh City', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, 0, N'male')
INSERT [dbo].[Account] ([id], [RoleId], [Firstname], [Lastname], [Gender], [PhoneNumber], [Email], [Address], [Password], [ValidationCode], [Deleted], [Img]) VALUES (6, 2, N'Võ', N'Hương', 0, N'0912345681', N'st2@gmail.com', N'District 4, Ho Chi Minh City', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, 0, N'female')
INSERT [dbo].[Account] ([id], [RoleId], [Firstname], [Lastname], [Gender], [PhoneNumber], [Email], [Address], [Password], [ValidationCode], [Deleted], [Img]) VALUES (7, 2, N'Hoàng', N'Thịnh', 1, N'0912345682', N'st3@gmail.com', N'District 3, Ho Chi Minh City', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, 0, N'male')
INSERT [dbo].[Account] ([id], [RoleId], [Firstname], [Lastname], [Gender], [PhoneNumber], [Email], [Address], [Password], [ValidationCode], [Deleted], [Img]) VALUES (8, 2, N'Đỗ', N'Thúy', 1, N'0912345683', N'st4@gmail.com', N'District 2, Ho Chi Minh City', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, 1, N'male')
INSERT [dbo].[Account] ([id], [RoleId], [Firstname], [Lastname], [Gender], [PhoneNumber], [Email], [Address], [Password], [ValidationCode], [Deleted], [Img]) VALUES (9, 2, N'Thái', N'Huỳnh', 1, N'0123456725', N'st5@gmail.com', N'District 1, Ho Chi Minh City', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, 0, N'male')
INSERT [dbo].[Account] ([id], [RoleId], [Firstname], [Lastname], [Gender], [PhoneNumber], [Email], [Address], [Password], [ValidationCode], [Deleted], [Img]) VALUES (10, 3, N'trainer1', N'trainer1', 0, N'0123456731', N'tr1@gmail.com', N'District 9, Ho Chi Minh City', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, 0, N'female')
INSERT [dbo].[Account] ([id], [RoleId], [Firstname], [Lastname], [Gender], [PhoneNumber], [Email], [Address], [Password], [ValidationCode], [Deleted], [Img]) VALUES (11, 3, N'Xuân', N'Trần', 1, N'0123456732', N'tr2@gmail.com', N'District 3, Ho Chi Minh City', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, 0, N'male')
INSERT [dbo].[Account] ([id], [RoleId], [Firstname], [Lastname], [Gender], [PhoneNumber], [Email], [Address], [Password], [ValidationCode], [Deleted], [Img]) VALUES (12, 3, N'Hoa', N'Tô', 0, N'0123456733', N'tr3@gmail.com', N'District 3, Ho Chi Minh City', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, 0, N'female')
INSERT [dbo].[Account] ([id], [RoleId], [Firstname], [Lastname], [Gender], [PhoneNumber], [Email], [Address], [Password], [ValidationCode], [Deleted], [Img]) VALUES (13, 3, N'Như', N'Hồ', 1, N'0123456734', N'tr4@gmail.com', N'District 3, Ho Chi Minh City', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, 1, N'male')
INSERT [dbo].[Account] ([id], [RoleId], [Firstname], [Lastname], [Gender], [PhoneNumber], [Email], [Address], [Password], [ValidationCode], [Deleted], [Img]) VALUES (14, 3, N'Đăng', N'Nguyễn', 0, N'0123456735', N'tr5@gmail.com', N'District 9, Ho Chi Minh City', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, 0, N'female')
INSERT [dbo].[Account] ([id], [RoleId], [Firstname], [Lastname], [Gender], [PhoneNumber], [Email], [Address], [Password], [ValidationCode], [Deleted], [Img]) VALUES (15, 3, N'Kiệt', N'Lê', 1, N'0123456736', N'tr6@gmail.com', N'District 3, Ho Chi Minh City', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, 0, N'male')
INSERT [dbo].[Account] ([id], [RoleId], [Firstname], [Lastname], [Gender], [PhoneNumber], [Email], [Address], [Password], [ValidationCode], [Deleted], [Img]) VALUES (16, 3, N'Huy', N'Nguyễn', 1, N'0123456737', N'tr7@gmail.com', N'District 3, Ho Chi Minh City', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, 0, N'male')
INSERT [dbo].[Account] ([id], [RoleId], [Firstname], [Lastname], [Gender], [PhoneNumber], [Email], [Address], [Password], [ValidationCode], [Deleted], [Img]) VALUES (17, 3, N'Anh', N'Lê', 0, N'0123456738', N'tr8@gmail.com', N'District 9, Ho Chi Minh City', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, 0, N'female')
INSERT [dbo].[Account] ([id], [RoleId], [Firstname], [Lastname], [Gender], [PhoneNumber], [Email], [Address], [Password], [ValidationCode], [Deleted], [Img]) VALUES (18, 4, N'Quỳnh', N'Lê', 1, N'0123456741', N'te1@gmail.com', N'District 3, Ho Chi Minh City', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, 0, N'male')
INSERT [dbo].[Account] ([id], [RoleId], [Firstname], [Lastname], [Gender], [PhoneNumber], [Email], [Address], [Password], [ValidationCode], [Deleted], [Img]) VALUES (19, 4, N'Ngọc', N'Lê', 0, N'0123456742', N'te2@gmail.com', N'District 3, Ho Chi Minh City', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, 1, N'female')
INSERT [dbo].[Account] ([id], [RoleId], [Firstname], [Lastname], [Gender], [PhoneNumber], [Email], [Address], [Password], [ValidationCode], [Deleted], [Img]) VALUES (20, 4, N'Vivian', N'Nguyễn', 1, N'0123456743', N'te3@gmail.com', N'District 9, Ho Chi Minh City', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, 0, N'male')
INSERT [dbo].[Account] ([id], [RoleId], [Firstname], [Lastname], [Gender], [PhoneNumber], [Email], [Address], [Password], [ValidationCode], [Deleted], [Img]) VALUES (21, 4, N'Dương', N'Lê', 0, N'0123456744', N'te4@gmail.com', N'District 9, Ho Chi Minh City', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, 0, N'female')
INSERT [dbo].[Account] ([id], [RoleId], [Firstname], [Lastname], [Gender], [PhoneNumber], [Email], [Address], [Password], [ValidationCode], [Deleted], [Img]) VALUES (22, 4, N'Quyên', N'Nguyễn', 1, N'0123456745', N'phamkhang12378@gmail.com', N'District 9, Ho Chi Minh City', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, 0, N'male')
INSERT [dbo].[Account] ([id], [RoleId], [Firstname], [Lastname], [Gender], [PhoneNumber], [Email], [Address], [Password], [ValidationCode], [Deleted], [Img]) VALUES (23, 4, N'Quốc', N'Lê', 0, N'0123456746', N'khangpbmse170122@fpt.edu.vn', N'District 8, Ho Chi Minh City', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, 0, N'female')
INSERT [dbo].[Account] ([id], [RoleId], [Firstname], [Lastname], [Gender], [PhoneNumber], [Email], [Address], [Password], [ValidationCode], [Deleted], [Img]) VALUES (24, 4, N'Giang', N'Lê', 1, N'0123456747', N'te7@gmail.com', N'District 7, Ho Chi Minh City', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, 0, N'male')
INSERT [dbo].[Account] ([id], [RoleId], [Firstname], [Lastname], [Gender], [PhoneNumber], [Email], [Address], [Password], [ValidationCode], [Deleted], [Img]) VALUES (25, 4, N'Giang', N'Nguyễn', 0, N'0123456748', N't8@gmail.com', N'District 7, Ho Chi Minh City', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, 0, N'female')
INSERT [dbo].[Account] ([id], [RoleId], [Firstname], [Lastname], [Gender], [PhoneNumber], [Email], [Address], [Password], [ValidationCode], [Deleted], [Img]) VALUES (26, 4, N'Linh', N'Nguyễn', 1, N'0123456749', N'te9@gmail.com', N'District 7, Ho Chi Minh City', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, 0, N'male')
INSERT [dbo].[Account] ([id], [RoleId], [Firstname], [Lastname], [Gender], [PhoneNumber], [Email], [Address], [Password], [ValidationCode], [Deleted], [Img]) VALUES (27, 4, N'Thuận', N'Lê', 0, N'0123456750', N'te10@gmail.com', N'District 7, Ho Chi Minh City', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, 0, N'female')
INSERT [dbo].[Account] ([id], [RoleId], [Firstname], [Lastname], [Gender], [PhoneNumber], [Email], [Address], [Password], [ValidationCode], [Deleted], [Img]) VALUES (28, 4, N'Trâm', N'Nguyễn', 1, N'0123456751', N'te11@gmail.com', N'District 9, Ho Chi Minh City', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, 0, N'male')
INSERT [dbo].[Account] ([id], [RoleId], [Firstname], [Lastname], [Gender], [PhoneNumber], [Email], [Address], [Password], [ValidationCode], [Deleted], [Img]) VALUES (30, 4, N'Giao', N'Phạm', 0, N'0123456752', N'tè@gmail.com', N'District 9, Ho Chi Minh City', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, 0, N'female')
INSERT [dbo].[Account] ([id], [RoleId], [Firstname], [Lastname], [Gender], [PhoneNumber], [Email], [Address], [Password], [ValidationCode], [Deleted], [Img]) VALUES (31, 4, N'Hoàng', N'Nguyễn', 1, N'0123456753', N'te14@gmail.com', N'District 9, Ho Chi Minh City', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, 0, N'male')
INSERT [dbo].[Account] ([id], [RoleId], [Firstname], [Lastname], [Gender], [PhoneNumber], [Email], [Address], [Password], [ValidationCode], [Deleted], [Img]) VALUES (32, 4, N'Tam', N'Phạm', 0, N'0123456754', N'te15@gmail.com', N'District 4, Ho Chi Minh City', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, 0, N'female')
INSERT [dbo].[Account] ([id], [RoleId], [Firstname], [Lastname], [Gender], [PhoneNumber], [Email], [Address], [Password], [ValidationCode], [Deleted], [Img]) VALUES (34, 4, N'Lợi', N'Nguyễn', 0, N'01234567211', N'te25@gmail.com', N'District 4, Ho Chi Minh City', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, 0, N'female')
INSERT [dbo].[Account] ([id], [RoleId], [Firstname], [Lastname], [Gender], [PhoneNumber], [Email], [Address], [Password], [ValidationCode], [Deleted], [Img]) VALUES (35, 4, N'Thuỷ', N'Phạm', 0, N'01234567231', N'te26@gmail.com', N'District 4, Ho Chi Minh City', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, 0, N'female')
INSERT [dbo].[Account] ([id], [RoleId], [Firstname], [Lastname], [Gender], [PhoneNumber], [Email], [Address], [Password], [ValidationCode], [Deleted], [Img]) VALUES (36, 4, N'Thiên', N'Nguyễn', 0, N'01234567241', N'te27@gmail.com', N'District 9, Ho Chi Minh City', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, 0, N'female')
INSERT [dbo].[Account] ([id], [RoleId], [Firstname], [Lastname], [Gender], [PhoneNumber], [Email], [Address], [Password], [ValidationCode], [Deleted], [Img]) VALUES (37, 4, N'Thái', N'Phạm', 0, N'01234567251', N'te28@gmail.com', N'District 9, Ho Chi Minh City', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, 0, N'female')
INSERT [dbo].[Account] ([id], [RoleId], [Firstname], [Lastname], [Gender], [PhoneNumber], [Email], [Address], [Password], [ValidationCode], [Deleted], [Img]) VALUES (38, 4, N'Chí', N'Nguyễn', 0, N'01234567261', N'te29@gmail.com', N'District 12, Ho Chi Minh City', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, 0, N'female')
INSERT [dbo].[Account] ([id], [RoleId], [Firstname], [Lastname], [Gender], [PhoneNumber], [Email], [Address], [Password], [ValidationCode], [Deleted], [Img]) VALUES (39, 4, N'Tra', N'Phạm', 0, N'01234567271', N'te30@gmail.com', N'District 9, Ho Chi Minh City', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, 0, N'female')
INSERT [dbo].[Account] ([id], [RoleId], [Firstname], [Lastname], [Gender], [PhoneNumber], [Email], [Address], [Password], [ValidationCode], [Deleted], [Img]) VALUES (40, 4, N'Tùng', N'Phạm', 0, N'01234567281', N'te31@gmail.com', N'District 4, Ho Chi Minh City', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, 0, N'female')
INSERT [dbo].[Account] ([id], [RoleId], [Firstname], [Lastname], [Gender], [PhoneNumber], [Email], [Address], [Password], [ValidationCode], [Deleted], [Img]) VALUES (41, 4, N'Lam', N'Nguyễn', 0, N'01234567291', N'te32@gmail.com', N'District 2, Ho Chi Minh City', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, 0, N'female')
INSERT [dbo].[Account] ([id], [RoleId], [Firstname], [Lastname], [Gender], [PhoneNumber], [Email], [Address], [Password], [ValidationCode], [Deleted], [Img]) VALUES (42, 4, N'Thảo', N'Phạm', 0, N'01234567301', N'te33@gmail.com', N'District 1, Ho Chi Minh City', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, 0, N'female')
INSERT [dbo].[Account] ([id], [RoleId], [Firstname], [Lastname], [Gender], [PhoneNumber], [Email], [Address], [Password], [ValidationCode], [Deleted], [Img]) VALUES (43, 4, N'Vy', N'Nguyễn', 0, N'01234567311', N'te34@gmail.com', N'District 1, Ho Chi Minh City', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, 0, N'female')
INSERT [dbo].[Account] ([id], [RoleId], [Firstname], [Lastname], [Gender], [PhoneNumber], [Email], [Address], [Password], [ValidationCode], [Deleted], [Img]) VALUES (44, 4, N'Quân', N'Phạm', 1, N'01234567321', N'te35@gmail.com', N'District 6, Ho Chi Minh City', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, 0, N'male')
INSERT [dbo].[Account] ([id], [RoleId], [Firstname], [Lastname], [Gender], [PhoneNumber], [Email], [Address], [Password], [ValidationCode], [Deleted], [Img]) VALUES (45, 4, N'Khang', N'Phạm', 1, N'01234567331', N'te36@gmail.com', N'District 9, Ho Chi Minh City', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, 0, N'male')
INSERT [dbo].[Account] ([id], [RoleId], [Firstname], [Lastname], [Gender], [PhoneNumber], [Email], [Address], [Password], [ValidationCode], [Deleted], [Img]) VALUES (46, 4, N'Mai', N'Phạm', 1, N'01234567341', N'te37@gmail.com', N'District 9, Ho Chi Minh City', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, 0, N'male')
INSERT [dbo].[Account] ([id], [RoleId], [Firstname], [Lastname], [Gender], [PhoneNumber], [Email], [Address], [Password], [ValidationCode], [Deleted], [Img]) VALUES (47, 4, N'Chi', N'Phạm', 1, N'01234567351', N'te38@gmail.com', N'District 7, Ho Chi Minh City', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, 0, N'male')
INSERT [dbo].[Account] ([id], [RoleId], [Firstname], [Lastname], [Gender], [PhoneNumber], [Email], [Address], [Password], [ValidationCode], [Deleted], [Img]) VALUES (48, 4, N'Bảo', N'Phạm', 1, N'01234567361', N'te39@gmail.com', N'District 9, Ho Chi Minh City', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, 0, N'male')
INSERT [dbo].[Account] ([id], [RoleId], [Firstname], [Lastname], [Gender], [PhoneNumber], [Email], [Address], [Password], [ValidationCode], [Deleted], [Img]) VALUES (49, 4, N'Hà', N'Phạm', 1, N'01234567371', N'te40@gmail.com', N'District 9, Ho Chi Minh City', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, 0, N'male')
INSERT [dbo].[Account] ([id], [RoleId], [Firstname], [Lastname], [Gender], [PhoneNumber], [Email], [Address], [Password], [ValidationCode], [Deleted], [Img]) VALUES (50, 4, N'Thanh', N'Phạm', 1, N'01234567381', N'te41@gmail.com', N'District 5, Ho Chi Minh City', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, 0, N'male')
INSERT [dbo].[Account] ([id], [RoleId], [Firstname], [Lastname], [Gender], [PhoneNumber], [Email], [Address], [Password], [ValidationCode], [Deleted], [Img]) VALUES (51, 4, N'Tôn', N'Phạm', 1, N'01234567391', N'te42@gmail.com', N'District 9, Ho Chi Minh City', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, 0, N'male')
INSERT [dbo].[Account] ([id], [RoleId], [Firstname], [Lastname], [Gender], [PhoneNumber], [Email], [Address], [Password], [ValidationCode], [Deleted], [Img]) VALUES (52, 4, N'Dũng', N'Phạm', 1, N'01234567401', N'te43@gmail.com', N'District 11, Ho Chi Minh City', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, 0, N'male')
INSERT [dbo].[Account] ([id], [RoleId], [Firstname], [Lastname], [Gender], [PhoneNumber], [Email], [Address], [Password], [ValidationCode], [Deleted], [Img]) VALUES (53, 4, N'Tiến', N'Lê', 1, N'01234567411', N'te44@gmail.com', N'District 9, Ho Chi Minh City', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, 0, N'male')
INSERT [dbo].[Account] ([id], [RoleId], [Firstname], [Lastname], [Gender], [PhoneNumber], [Email], [Address], [Password], [ValidationCode], [Deleted], [Img]) VALUES (54, 4, N'Thành', N'Lê', 1, N'01234567421', N'te45@gmail.com', N'District 6, Ho Chi Minh City', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, 0, N'male')
INSERT [dbo].[Account] ([id], [RoleId], [Firstname], [Lastname], [Gender], [PhoneNumber], [Email], [Address], [Password], [ValidationCode], [Deleted], [Img]) VALUES (55, 4, N'Nam', N'Phạm', 1, N'01234567431', N'te46@gmail.com', N'District 3, Ho Chi Minh City', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, 0, N'male')
INSERT [dbo].[Account] ([id], [RoleId], [Firstname], [Lastname], [Gender], [PhoneNumber], [Email], [Address], [Password], [ValidationCode], [Deleted], [Img]) VALUES (56, 4, N'Hoàng', N'Lê', 1, N'01234567441', N'te47@gmail.com', N'District 9, Ho Chi Minh City', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', NULL, 0, N'male')
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Blog] ON 

INSERT [dbo].[Blog] ([id], [UserId], [Date], [Header], [Content], [Status], [img]) VALUES (1, 5, CAST(N'2023-04-03' AS Date), N'5 Essential Yoga Poses for Beginners: A Step-by-Step Guide', N'Are you new to yoga and looking to get started? Incorporating yoga into your routine can have numerous benefits for both your physical and mental well-being. In this post, we''ll guide you through five essential yoga poses for beginners.
1. Mountain Pose (Tadasana): Start by standing tall with your feet together and arms at your sides. This pose improves posture, balance, and focus.
2. Downward Facing Dog (Adho Mukha Svanasana): Begin on your hands and knees, then lift your hips upward, creating an inverted V shape. Downward Facing Dog stretches the entire body, strengthens the arms and legs, and calms the mind.
3. Warrior II (Virabhadrasana II): Step your feet wide apart, extend your arms parallel to the floor, and bend your front knee. This pose increases strength, stamina, and stability while stretching the hips and thighs.
4. Tree Pose (Vrikshasana): Stand on one leg, place the sole of your opposite foot on the inner thigh or calf, and balance. Tree Pose improves balance, focus, and leg strength while promoting a sense of grounding.
5. Child''s Pose (Balasana): Kneel on the floor, touch your big toes together, and sit on your heels. Extend your torso forward, resting it between your thighs and forehead on the mat. Child''s Pose is a relaxing posture that releases tension in the back, neck, and shoulders.
Remember to listen to your body, take it slow, and focus on your breath throughout your practice. These five poses are excellent starting points to build strength, flexibility, and body awareness.', 0, N'https://post.healthline.com/wp-content/uploads/2020/08/Females_Yoga_732x549-thumbnail-732x549.jpg')
INSERT [dbo].[Blog] ([id], [UserId], [Date], [Header], [Content], [Status], [img]) VALUES (2, 5, CAST(N'2023-03-03' AS Date), N'The Art of Mindful Breathing: Harnessing the Power of Pranayama', N'Pranayama, the practice of mindful breathing, is an integral part of yoga. By incorporating conscious breathing techniques into your practice, you can experience a wide range of benefits for your body and mind. In this blog post, we''ll explore the art of mindful breathing and its transformative power.
Pranayama techniques involve regulating and extending the breath to influence the flow of energy within the body. Here are a few simple yet effective techniques to get you started:
1. Deep Belly Breathing: Sit or lie down in a comfortable position. Place one hand on your belly and the other on your chest. Inhale deeply through your nose, allowing your belly to rise as you fill your lungs with air. Exhale slowly, feeling your belly fall. Focus on the sensation of your breath and repeat for several cycles.
2. Alternate Nostril Breathing (Nadi Shodhana): Sit comfortably and bring your right hand to your face. Use your right thumb to close your right nostril and inhale through your left nostril. Then, close your left nostril with your right ring finger and exhale through your right nostril. Continue this pattern, alternating nostrils with each breath.
3. 4-7-8 Breathing: This technique is helpful for relaxation and stress reduction. Inhale deeply through your nose for a count of 4, hold your breath for a count of 7, and exhale slowly through your mouth for a count of 8. Repeat this cycle several times.
Mindful breathing practices can help reduce stress, increase focus, improve digestion, and promote a sense of calm and well-being. Explore these techniques, find the ones that resonate with you, and make mindful breathing a part of your daily routine.', 1, N'https://static01.nyt.com/images/2017/04/11/science/physed-breathing/physed-breathing-superJumbo.jpg')
INSERT [dbo].[Blog] ([id], [UserId], [Date], [Header], [Content], [Status], [img]) VALUES (3, 5, CAST(N'2023-04-04' AS Date), N'The Yoga Philosophy: Exploring the Eight Limbs of Yoga', N'Yoga is not just about physical postures; it is a holistic practice that encompasses various aspects of life. The eight limbs of yoga, as outlined by the sage Patanjali in the Yoga Sutras, serve as a guide for a meaningful and purposeful life. In this blog post, we delve into the philosophy of yoga and explore the eight limbs.
Yamas (Restraints): The yamas are ethical principles that guide our interactions with others and the world. They include non-violence (ahimsa), truthfulness (satya), non-stealing (asteya), non-excess (brahmacharya), and non-possessiveness (aparigraha).
Niyamas (Observances): The niyamas focus on personal observances and self-discipline. They include cleanliness (saucha), contentment (santosha), self-discipline (tapas), self-study (svadhyaya), and surrender to a higher power (ishvara pranidhana).
Asanas (Physical Postures): Asanas refer to the practice of physical postures that promote strength, flexibility, and balance. They prepare the body for meditation and cultivate awareness.
Pranayama (Breath Control): Pranayama involves breath control techniques to regulate the flow of energy in the body. It enhances vitality, calms the mind, and deepens the connection between body and breath.
Pratyahara (Withdrawal of Senses): Pratyahara is the practice of withdrawing the senses from external distractions and turning inward. It allows us to cultivate introspection and focus.
Dharana (Concentration): Dharana is the practice of concentration, focusing the mind on a single point or object. It cultivates mental clarity and prepares the mind for meditation.
Dhyana (Meditation): Dhyana is the state of meditation, where the mind is calm, focused, and deeply absorbed. It leads to a profound sense of peace, insight, and self-realization.
Samadhi (Union with the Divine): Samadhi is the ultimate goal of yoga, a state of blissful union with the higher self or divine consciousness. It is a state of pure awareness and transcendence.
By exploring and incorporating these eight limbs into our lives, we can cultivate a harmonious balance between body, mind, and spirit, and ultimately experience the true essence of yoga.', 1, N'https://res.cloudinary.com/dgerdfai4/image/upload/q_auto,ar_1.5,r_10,c_fill,g_face,f_auto/v1572073938/blog/posts/ckn82svwg5yc60b71lx48j6l9.png')
INSERT [dbo].[Blog] ([id], [UserId], [Date], [Header], [Content], [Status], [img]) VALUES (4, 6, CAST(N'2023-04-05' AS Date), N'Yoga for Strength and Flexibility: Balancing Power and Grace', N'Yoga is a unique practice that combines strength and flexibility, allowing us to cultivate both power and grace in our bodies and minds. In this blog post, we explore how yoga can help enhance strength and flexibility and find a harmonious balance between the two.
Building Strength: Yoga poses like Plank, Warrior poses, and Chaturanga Dandasana (Four-Limbed Staff Pose) can help build upper body, core, and leg strength. Engage your muscles mindfully during these poses, focusing on stability and alignment.
Developing Flexibility: Yoga is renowned for its ability to improve flexibility. Poses like Forward Folds, Standing and Seated Twists, and hip openers like Pigeon Pose can enhance range of motion and promote suppleness in the body.
Balancing Strength and Flexibility: It''s important to strike a balance between strength and flexibility in your practice. Incorporate both strengthening and stretching poses into your routine, ensuring that you challenge your muscles while maintaining mobility.
Mind-Body Awareness: Yoga is not just about physicality; it''s about cultivating a deep connection between the body and mind. Practice moving with awareness, focusing on the sensations in your muscles and the breath. This integration of mind and body enhances both strength and flexibility.
Modifications and Progressions: Modify poses to suit your current level of strength and flexibility. Use props like blocks and straps to assist you in achieving proper alignment and gradually work towards more advanced variations of poses as your practice evolves.
Remember that strength and flexibility are not mutually exclusive. They complement each other and are essential for a well-rounded yoga practice. Embrace the journey of finding balance between power and grace, and enjoy the transformative effects it has on your body and mind.', 2, N'https://i0.wp.com/www.yogabasics.com/yogabasics2017/wp-content/uploads/2020/06/yoga-pose-balance.jpeg')
INSERT [dbo].[Blog] ([id], [UserId], [Date], [Header], [Content], [Status], [img]) VALUES (5, 6, CAST(N'2023-04-06' AS Date), N'Yoga for Improved Sleep: Restorative Practices for a Restful Night', N'Sleep is crucial for overall well-being, yet many struggle with achieving quality sleep. In this blog post, we explore how yoga can be a valuable tool for improving sleep quality. We delve into restorative yoga practices, calming breathwork, and mindful techniques that can help you unwind, relax, and prepare for a restful night''s sleep. Discover soothing poses, guided relaxation exercises, and lifestyle tips that promote a peaceful and rejuvenating sleep routine.', 1, N'https://previews.123rf.com/images/popunderlight/popunderlight1704/popunderlight170400104/76158814-asian-cute-woman-deep-sleep-on-bed-in-the-morning-model-is-a-asian-beauty.jpg')
INSERT [dbo].[Blog] ([id], [UserId], [Date], [Header], [Content], [Status], [img]) VALUES (6, 7, CAST(N'2023-04-07' AS Date), N'Yoga and Self-Care: Nurturing Your Mind, Body, and Sou', N'Self-care is essential for maintaining balance and overall wellness. In this blog post, we explore how yoga can be an integral part of your self-care routine. We delve into practices that nourish the mind, body, and soul, such as gentle movement, meditation, self-reflection, and self-compassion exercises. Discover the power of carving out dedicated time for self-care through yoga, allowing you to cultivate a deeper connection with yourself, reduce stress, and enhance your overall well-being.

Remember to tailor each blog post to your target audience and provide specific examples, tips, and guidance within each topic to make them engaging and informative.', 0, N'https://cdn.campuslivingvillages.com/public/ArticlePage/23/Image/how-to-take-care-of-your-mind-body-and-soul__FillMaxWzEyMDAsNjI3XQ.jpg')
SET IDENTITY_INSERT [dbo].[Blog] OFF
GO
SET IDENTITY_INSERT [dbo].[Class] ON 

INSERT [dbo].[Class] ([id], [ClassName], [TrainerId], [CourseId], [Room], [StartDate], [EndDate], [Finished]) VALUES (1, N'C1101', 9, 1, N'YG1', CAST(N'2023-04-03' AS Date), CAST(N'2023-06-03' AS Date), 0)
INSERT [dbo].[Class] ([id], [ClassName], [TrainerId], [CourseId], [Room], [StartDate], [EndDate], [Finished]) VALUES (2, N'C1102', 10, 1, N'YG2', CAST(N'2023-04-03' AS Date), CAST(N'2023-06-03' AS Date), 0)
INSERT [dbo].[Class] ([id], [ClassName], [TrainerId], [CourseId], [Room], [StartDate], [EndDate], [Finished]) VALUES (3, N'C1201', 12, 4, N'YG3', CAST(N'2023-04-03' AS Date), CAST(N'2023-06-03' AS Date), 0)
INSERT [dbo].[Class] ([id], [ClassName], [TrainerId], [CourseId], [Room], [StartDate], [EndDate], [Finished]) VALUES (4, N'C1202', 13, 4, N'YG1', CAST(N'2023-04-03' AS Date), CAST(N'2023-06-03' AS Date), 0)
INSERT [dbo].[Class] ([id], [ClassName], [TrainerId], [CourseId], [Room], [StartDate], [EndDate], [Finished]) VALUES (5, N'C2101', 14, 2, N'YG2', CAST(N'2023-04-03' AS Date), CAST(N'2023-06-03' AS Date), 0)
INSERT [dbo].[Class] ([id], [ClassName], [TrainerId], [CourseId], [Room], [StartDate], [EndDate], [Finished]) VALUES (6, N'C2102', 15, 2, N'YG3', CAST(N'2023-04-03' AS Date), CAST(N'2023-06-03' AS Date), 0)
INSERT [dbo].[Class] ([id], [ClassName], [TrainerId], [CourseId], [Room], [StartDate], [EndDate], [Finished]) VALUES (7, N'C2201', 14, 6, N'YG1', CAST(N'2023-04-03' AS Date), CAST(N'2023-06-03' AS Date), 1)
INSERT [dbo].[Class] ([id], [ClassName], [TrainerId], [CourseId], [Room], [StartDate], [EndDate], [Finished]) VALUES (8, N'C2202', 9, 6, N'YG2', CAST(N'2023-04-03' AS Date), CAST(N'2023-06-03' AS Date), 0)
INSERT [dbo].[Class] ([id], [ClassName], [TrainerId], [CourseId], [Room], [StartDate], [EndDate], [Finished]) VALUES (9, N'C3101', 11, 3, N'YG3', CAST(N'2022-05-03' AS Date), CAST(N'2022-07-03' AS Date), 0)
INSERT [dbo].[Class] ([id], [ClassName], [TrainerId], [CourseId], [Room], [StartDate], [EndDate], [Finished]) VALUES (10, N'C3201', 11, 8, N'YG1', CAST(N'2022-05-03' AS Date), CAST(N'2022-07-03' AS Date), 0)
SET IDENTITY_INSERT [dbo].[Class] OFF
GO
SET IDENTITY_INSERT [dbo].[ClassDetail] ON 

INSERT [dbo].[ClassDetail] ([id], [ClassId], [TraineeId]) VALUES (1, 1, 39)
INSERT [dbo].[ClassDetail] ([id], [ClassId], [TraineeId]) VALUES (2, 1, 18)
INSERT [dbo].[ClassDetail] ([id], [ClassId], [TraineeId]) VALUES (3, 2, 19)
INSERT [dbo].[ClassDetail] ([id], [ClassId], [TraineeId]) VALUES (4, 2, 20)
INSERT [dbo].[ClassDetail] ([id], [ClassId], [TraineeId]) VALUES (5, 3, 21)
INSERT [dbo].[ClassDetail] ([id], [ClassId], [TraineeId]) VALUES (6, 3, 22)
INSERT [dbo].[ClassDetail] ([id], [ClassId], [TraineeId]) VALUES (8, 4, 23)
INSERT [dbo].[ClassDetail] ([id], [ClassId], [TraineeId]) VALUES (9, 4, 24)
INSERT [dbo].[ClassDetail] ([id], [ClassId], [TraineeId]) VALUES (10, 5, 25)
INSERT [dbo].[ClassDetail] ([id], [ClassId], [TraineeId]) VALUES (11, 5, 26)
INSERT [dbo].[ClassDetail] ([id], [ClassId], [TraineeId]) VALUES (12, 6, 27)
INSERT [dbo].[ClassDetail] ([id], [ClassId], [TraineeId]) VALUES (13, 6, 28)
INSERT [dbo].[ClassDetail] ([id], [ClassId], [TraineeId]) VALUES (15, 7, 30)
INSERT [dbo].[ClassDetail] ([id], [ClassId], [TraineeId]) VALUES (16, 7, 31)
INSERT [dbo].[ClassDetail] ([id], [ClassId], [TraineeId]) VALUES (17, 8, 32)
INSERT [dbo].[ClassDetail] ([id], [ClassId], [TraineeId]) VALUES (19, 8, 34)
INSERT [dbo].[ClassDetail] ([id], [ClassId], [TraineeId]) VALUES (20, 9, 35)
INSERT [dbo].[ClassDetail] ([id], [ClassId], [TraineeId]) VALUES (21, 9, 36)
INSERT [dbo].[ClassDetail] ([id], [ClassId], [TraineeId]) VALUES (22, 10, 37)
INSERT [dbo].[ClassDetail] ([id], [ClassId], [TraineeId]) VALUES (23, 10, 38)
SET IDENTITY_INSERT [dbo].[ClassDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([id], [CourseName], [Price], [Discount], [LevelId], [Description], [Img], [Deleted]) VALUES (1, N'Yoga For Beginner', 1000000, 10, 1, N'If you have never do Yoga, you should enrol in this course for basic knowledge and postures.', N'https://pmrxcontent.com/wp-content/uploads/Back-Pain-Relief-through-Yoga.jpg', 0)
INSERT [dbo].[Course] ([id], [CourseName], [Price], [Discount], [LevelId], [Description], [Img], [Deleted]) VALUES (2, N'Hatha Yoga', 1300000, 10, 2, N'This is a general term that refers to any type of yoga that focuses on physical postures (asanas) and breath control (pranayama). It is a gentle form of yoga suitable for beginners.', N'https://i0.wp.com/thatnhucuocsong.com.vn/wp-content/uploads/2022/02/hinh-nen-yoga-dep-full-hd.jpg?ssl=1', 0)
INSERT [dbo].[Course] ([id], [CourseName], [Price], [Discount], [LevelId], [Description], [Img], [Deleted]) VALUES (3, N'Iyengar Course', 1600000, 10, 3, N'Developed by B.K.S. Iyengar, this style of yoga focuses on alignment and precision in each posture. It utilizes props such as blocks, straps, and bolsters to help practitioners achieve proper alignment and find balance.', N'https://rare-gallery.com/uploads/posts/571845-yoga-4k-high.jpg', 0)
INSERT [dbo].[Course] ([id], [CourseName], [Price], [Discount], [LevelId], [Description], [Img], [Deleted]) VALUES (4, N'Yoga For Beginner 2', 1150000, 10, 1, N'Foundation course that provides wide range knowledge of Yoga and how to breathe properly', N'https://1.bp.blogspot.com/-dlTw0eTrog4/XuImY0wAfnI/AAAAAAAABNE/KOU3GYGtaqgvItQsIxxYaxXazOLm11eWgCPcBGAsYHg/s1600/image.png', 0)
INSERT [dbo].[Course] ([id], [CourseName], [Price], [Discount], [LevelId], [Description], [Img], [Deleted]) VALUES (5, N'Restorative Yoga', 1150000, 10, 1, N'Restorative yoga involves gentle and supported poses held for extended periods, typically using props like blankets, bolsters, and straps. It promotes deep relaxation and rejuvenation of the body and mind.', N'https://bizweb.dktcdn.net/thumb/grande/100/262/937/articles/ban-nga-trong-yoga64.jpg?v=1584161796227', 0)
INSERT [dbo].[Course] ([id], [CourseName], [Price], [Discount], [LevelId], [Description], [Img], [Deleted]) VALUES (6, N'Yin Yoga', 1350000, 10, 2, N'Yin yoga is a slow-paced style where poses are held for longer durations, typically three to five minutes or more. It targets the connective tissues and aims to improve flexibility, circulation, and joint mobility.', N'https://sohanews.sohacdn.com/k:thumb_w/640/2014/img-7637-1400633247297/tra-ngoc-hang-tap-yoga-cung-chau-gai-mum-mim.jpg', 0)
INSERT [dbo].[Course] ([id], [CourseName], [Price], [Discount], [LevelId], [Description], [Img], [Deleted]) VALUES (7, N'Yoga Nidra', 550000, 10, 1, N'Yoga Nidra, also known as "yogic sleep," is a practice of deep relaxation and guided meditation. It aims to induce a state of conscious relaxation and restore mental, emotional, and physical well-being.', N'https://misskick.vn/wp-content/uploads/2022/03/tu-the-yoga-co-ban-1.jpg', 1)
INSERT [dbo].[Course] ([id], [CourseName], [Price], [Discount], [LevelId], [Description], [Img], [Deleted]) VALUES (8, N'Power Yoga', 1950000, 10, 3, N'Power yoga is a dynamic and physically challenging style that draws inspiration from Ashtanga yoga. It emphasizes strength, stamina, and flexibility and often incorporates elements of cardiovascular exercise.', N'https://kenhphunu.com/images/032018/files/tapyoga(1).jpg', 0)
INSERT [dbo].[Course] ([id], [CourseName], [Price], [Discount], [LevelId], [Description], [Img], [Deleted]) VALUES (9, N'Vinyasa Yoga', 1850000, 10, 3, N'Also known as flow yoga, Vinyasa yoga is characterized by continuous movement and fluid transitions between poses. It synchronizes breath with movement and is often described as a dynamic and energetic practice.', N'https://storage.googleapis.com/leep_app_website/2020/09/tap-yoga-co-loi-ich-gi-cho-cac-van-dong-vien.jpg', 0)
SET IDENTITY_INSERT [dbo].[Course] OFF
GO
SET IDENTITY_INSERT [dbo].[Feedback] ON 

INSERT [dbo].[Feedback] ([id], [TraineeId], [CourseId], [Rating], [Status], [Description]) VALUES (1, 17, 1, 4, 0, N'The Yoga course was a transformative experience for me. The instructors guidance and expertise created a serene and supportive atmosphere, allowing me to deepen my practice and find inner peace.')
INSERT [dbo].[Feedback] ([id], [TraineeId], [CourseId], [Rating], [Status], [Description]) VALUES (2, 18, 1, 5, 1, N'I loved the variety of yoga styles incorporated in the course. It kept things interesting and allowed me to explore different techniques, enhancing my flexibility and strength.')
INSERT [dbo].[Feedback] ([id], [TraineeId], [CourseId], [Rating], [Status], [Description]) VALUES (3, 22, 2, 5, 1, N'The instructors attention to detail and alignment cues were exceptional. I felt safe and confident in my poses, and it greatly improved my overall yoga practice.')
INSERT [dbo].[Feedback] ([id], [TraineeId], [CourseId], [Rating], [Status], [Description]) VALUES (4, 26, 3, 2, 2, N'I was disappointed with the lack of individualized attention in the Yoga course. The instructor seemed more focused on the general class rather than addressing specific needs and concerns.')
INSERT [dbo].[Feedback] ([id], [TraineeId], [CourseId], [Rating], [Status], [Description]) VALUES (5, 27, 2, 4, 1, N'The Yoga course introduced me to different meditation techniques that helped calm my mind and reduce stress. I now have practical tools to use in my daily life.')
INSERT [dbo].[Feedback] ([id], [TraineeId], [CourseId], [Rating], [Status], [Description]) VALUES (6, 28, 2, 5, 1, N'The yoga community formed during the course was inspiring and supportive. Sharing experiences and challenges with fellow participants created a sense of belonging and motivation.')
INSERT [dbo].[Feedback] ([id], [TraineeId], [CourseId], [Rating], [Status], [Description]) VALUES (7, 30, 6, 2, 1, N'I don''t like it, postures were way to hard')
INSERT [dbo].[Feedback] ([id], [TraineeId], [CourseId], [Rating], [Status], [Description]) VALUES (8, 31, 6, 4, 1, N'I appreciated the regular check-ins and progress assessments conducted throughout the course. It helped me stay motivated and track my improvements.')
INSERT [dbo].[Feedback] ([id], [TraineeId], [CourseId], [Rating], [Status], [Description]) VALUES (9, 35, 3, 2, 1, N'I was disappointed by the limited variety of yoga styles explored in the course. It became monotonous, and I wished for more exposure to different techniques and traditions.')
INSERT [dbo].[Feedback] ([id], [TraineeId], [CourseId], [Rating], [Status], [Description]) VALUES (10, 37, 8, 2, 1, N'The course scheduling was inconvenient and inflexible. It was difficult to fit into my busy routine, and there were no alternatives or make-up options provided.')
INSERT [dbo].[Feedback] ([id], [TraineeId], [CourseId], [Rating], [Status], [Description]) VALUES (11, 38, 8, 5, 1, N'The Yoga course had a strong emphasis on self-care and self-love. It taught me to prioritize my well-being and provided a nurturing space to reconnect with myself.t')
SET IDENTITY_INSERT [dbo].[Feedback] OFF
GO
INSERT [dbo].[Level] ([id], [LevelName]) VALUES (1, N'Beginner')
INSERT [dbo].[Level] ([id], [LevelName]) VALUES (2, N'Intermediate')
INSERT [dbo].[Level] ([id], [LevelName]) VALUES (3, N'Advanced')
GO
INSERT [dbo].[Role] ([id], [name]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([id], [name]) VALUES (2, N'Staff')
INSERT [dbo].[Role] ([id], [name]) VALUES (3, N'Trainer')
INSERT [dbo].[Role] ([id], [name]) VALUES (4, N'Trainee')
GO
SET IDENTITY_INSERT [dbo].[Slot] ON 

INSERT [dbo].[Slot] ([id], [TimetableId], [DayOfWeek], [TimeFrameId]) VALUES (1, 1, N'Monday', 1)
INSERT [dbo].[Slot] ([id], [TimetableId], [DayOfWeek], [TimeFrameId]) VALUES (2, 1, N'Wednesday', 1)
INSERT [dbo].[Slot] ([id], [TimetableId], [DayOfWeek], [TimeFrameId]) VALUES (3, 1, N'Friday', 1)
INSERT [dbo].[Slot] ([id], [TimetableId], [DayOfWeek], [TimeFrameId]) VALUES (4, 2, N'Monday', 2)
INSERT [dbo].[Slot] ([id], [TimetableId], [DayOfWeek], [TimeFrameId]) VALUES (5, 2, N'Wednesday', 2)
INSERT [dbo].[Slot] ([id], [TimetableId], [DayOfWeek], [TimeFrameId]) VALUES (6, 2, N'Friday', 2)
INSERT [dbo].[Slot] ([id], [TimetableId], [DayOfWeek], [TimeFrameId]) VALUES (7, 3, N'Tuesday', 1)
INSERT [dbo].[Slot] ([id], [TimetableId], [DayOfWeek], [TimeFrameId]) VALUES (8, 3, N'Thursday', 1)
INSERT [dbo].[Slot] ([id], [TimetableId], [DayOfWeek], [TimeFrameId]) VALUES (9, 3, N'Saturday', 1)
INSERT [dbo].[Slot] ([id], [TimetableId], [DayOfWeek], [TimeFrameId]) VALUES (10, 4, N'Tuesday', 2)
INSERT [dbo].[Slot] ([id], [TimetableId], [DayOfWeek], [TimeFrameId]) VALUES (11, 4, N'Thursday', 2)
INSERT [dbo].[Slot] ([id], [TimetableId], [DayOfWeek], [TimeFrameId]) VALUES (12, 4, N'Saturday', 2)
INSERT [dbo].[Slot] ([id], [TimetableId], [DayOfWeek], [TimeFrameId]) VALUES (13, 5, N'Tuesday', 3)
INSERT [dbo].[Slot] ([id], [TimetableId], [DayOfWeek], [TimeFrameId]) VALUES (14, 5, N'Thursday', 3)
INSERT [dbo].[Slot] ([id], [TimetableId], [DayOfWeek], [TimeFrameId]) VALUES (15, 5, N'Saturday', 3)
INSERT [dbo].[Slot] ([id], [TimetableId], [DayOfWeek], [TimeFrameId]) VALUES (16, 6, N'Monday', 3)
INSERT [dbo].[Slot] ([id], [TimetableId], [DayOfWeek], [TimeFrameId]) VALUES (17, 6, N'Wednesday', 3)
INSERT [dbo].[Slot] ([id], [TimetableId], [DayOfWeek], [TimeFrameId]) VALUES (18, 6, N'Friday', 3)
INSERT [dbo].[Slot] ([id], [TimetableId], [DayOfWeek], [TimeFrameId]) VALUES (19, 7, N'Tuesday', 4)
INSERT [dbo].[Slot] ([id], [TimetableId], [DayOfWeek], [TimeFrameId]) VALUES (20, 7, N'Thursday', 4)
INSERT [dbo].[Slot] ([id], [TimetableId], [DayOfWeek], [TimeFrameId]) VALUES (21, 7, N'Saturday', 4)
INSERT [dbo].[Slot] ([id], [TimetableId], [DayOfWeek], [TimeFrameId]) VALUES (22, 8, N'Monday', 4)
INSERT [dbo].[Slot] ([id], [TimetableId], [DayOfWeek], [TimeFrameId]) VALUES (23, 8, N'Wednesday', 4)
INSERT [dbo].[Slot] ([id], [TimetableId], [DayOfWeek], [TimeFrameId]) VALUES (24, 8, N'Friday', 4)
INSERT [dbo].[Slot] ([id], [TimetableId], [DayOfWeek], [TimeFrameId]) VALUES (25, 9, N'Tuesday', 1)
INSERT [dbo].[Slot] ([id], [TimetableId], [DayOfWeek], [TimeFrameId]) VALUES (26, 9, N'Thursday', 1)
INSERT [dbo].[Slot] ([id], [TimetableId], [DayOfWeek], [TimeFrameId]) VALUES (27, 9, N'Saturday', 1)
INSERT [dbo].[Slot] ([id], [TimetableId], [DayOfWeek], [TimeFrameId]) VALUES (28, 10, N'Tuesday', 2)
INSERT [dbo].[Slot] ([id], [TimetableId], [DayOfWeek], [TimeFrameId]) VALUES (29, 10, N'Thursday', 2)
INSERT [dbo].[Slot] ([id], [TimetableId], [DayOfWeek], [TimeFrameId]) VALUES (30, 10, N'Saturday', 2)
SET IDENTITY_INSERT [dbo].[Slot] OFF
GO
INSERT [dbo].[TimeFrame] ([id], [timeFrame]) VALUES (1, N'5:00-6:30')
INSERT [dbo].[TimeFrame] ([id], [timeFrame]) VALUES (2, N'7:00-8:30')
INSERT [dbo].[TimeFrame] ([id], [timeFrame]) VALUES (3, N'18:00-19:30')
INSERT [dbo].[TimeFrame] ([id], [timeFrame]) VALUES (4, N'20:00-21:30')
GO
SET IDENTITY_INSERT [dbo].[Timetable] ON 

INSERT [dbo].[Timetable] ([id], [ClassId]) VALUES (1, 1)
INSERT [dbo].[Timetable] ([id], [ClassId]) VALUES (2, 2)
INSERT [dbo].[Timetable] ([id], [ClassId]) VALUES (3, 3)
INSERT [dbo].[Timetable] ([id], [ClassId]) VALUES (4, 4)
INSERT [dbo].[Timetable] ([id], [ClassId]) VALUES (5, 5)
INSERT [dbo].[Timetable] ([id], [ClassId]) VALUES (6, 6)
INSERT [dbo].[Timetable] ([id], [ClassId]) VALUES (7, 7)
INSERT [dbo].[Timetable] ([id], [ClassId]) VALUES (8, 8)
INSERT [dbo].[Timetable] ([id], [ClassId]) VALUES (9, 9)
INSERT [dbo].[Timetable] ([id], [ClassId]) VALUES (10, 10)
SET IDENTITY_INSERT [dbo].[Timetable] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Account__85FB4E381711572C]    Script Date: 5/27/2023 8:00:08 AM ******/
ALTER TABLE [dbo].[Account] ADD UNIQUE NONCLUSTERED 
(
	[PhoneNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Account__85FB4E38501178CE]    Script Date: 5/27/2023 8:00:08 AM ******/
ALTER TABLE [dbo].[Account] ADD UNIQUE NONCLUSTERED 
(
	[PhoneNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Account__A9D10534053CC25F]    Script Date: 5/27/2023 8:00:08 AM ******/
ALTER TABLE [dbo].[Account] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Account__A9D105349B6AABA5]    Script Date: 5/27/2023 8:00:08 AM ******/
ALTER TABLE [dbo].[Account] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Timetabl__CB1927C15611C656]    Script Date: 5/27/2023 8:00:08 AM ******/
ALTER TABLE [dbo].[Timetable] ADD UNIQUE NONCLUSTERED 
(
	[ClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Blog] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Booking] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[Class] ADD  DEFAULT ((0)) FOR [Finished]
GO
ALTER TABLE [dbo].[Course] ADD  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Feedback] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([id])
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD FOREIGN KEY([AccountId])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([id])
GO
ALTER TABLE [dbo].[Class]  WITH CHECK ADD FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([id])
GO
ALTER TABLE [dbo].[Class]  WITH CHECK ADD FOREIGN KEY([TrainerId])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[ClassDetail]  WITH CHECK ADD FOREIGN KEY([ClassId])
REFERENCES [dbo].[Class] ([id])
GO
ALTER TABLE [dbo].[ClassDetail]  WITH CHECK ADD FOREIGN KEY([TraineeId])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD FOREIGN KEY([LevelId])
REFERENCES [dbo].[Level] ([id])
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([id])
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD FOREIGN KEY([TraineeId])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Slot]  WITH CHECK ADD FOREIGN KEY([TimeFrameId])
REFERENCES [dbo].[TimeFrame] ([id])
GO
ALTER TABLE [dbo].[Slot]  WITH CHECK ADD FOREIGN KEY([TimetableId])
REFERENCES [dbo].[Timetable] ([id])
GO
ALTER TABLE [dbo].[Timetable]  WITH CHECK ADD FOREIGN KEY([ClassId])
REFERENCES [dbo].[Class] ([id])
GO
USE [master]
GO
ALTER DATABASE [YogaCenter] SET  READ_WRITE 
GO
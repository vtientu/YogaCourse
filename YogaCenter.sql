USE [master]
GO

/*******************************************************************************
   Drop database if it exists
********************************************************************************/
IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'YogaCenter')
BEGIN
	ALTER DATABASE [YogaCenter] SET OFFLINE WITH ROLLBACK IMMEDIATE;
	ALTER DATABASE [YogaCenter] SET ONLINE;
	DROP DATABASE [YogaCenter];
END

GO

CREATE DATABASE [YogaCenter]
GO


USE [YogaCenter]
GO

/*******************************************************************************
	Drop tables if they exist
*******************************************************************************/
DECLARE @sql NVARCHAR(MAX) = N''

SELECT @sql = @sql + N'DROP TABLE ' + QUOTENAME(TABLE_SCHEMA) + N'.' + QUOTENAME(TABLE_NAME) + N';' + CHAR(13) + CHAR(10)
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'

EXEC sp_executesql @sql 
GO



CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1),
	[RoleName] [nvarchar](20) NOT NULL,
	PRIMARY KEY (RoleID)
)
GO

CREATE TABLE [dbo].[Account](
	[AccountID] [int] IDENTITY(1,1),
	[RoleId] [int] DEFAULT 1,
	[Firstname] [nvarchar](50) NULL,
	[Lastname] [nvarchar](50) NULL,
	[Avatar] [text] NULL,
	[Gender] int Default -1,
	[Phone] [varchar](20) NULL,
	[Email] [varchar](255) NOT NULL UNIQUE,
	[Address] [nvarchar](255) NULL,
	[Password] [varchar](255) NOT NULL,
	[Active] [bit] DEFAULT 1,
	PRIMARY KEY (AccountID),
	FOREIGN KEY(RoleID) REFERENCES Role(RoleID)
)
GO


CREATE TABLE [dbo].[Blog](
	[BlogID] [int] IDENTITY(1,1),
	[CreateBy] [int] NOT NULL,
	[PublishedDate] [date] NULL,
	[Title] [nvarchar](255) NULL,
	[Content] [text] NULL,
	[Status] [int] NULL,
	[Image] [text] NULL,
	PRIMARY KEY (BlogID),
	FOREIGN KEY(CreateBy) REFERENCES Account(AccountID)
)
GO


CREATE TABLE Category (
	CategoryID INT IDENTITY(1,1),
	CategoryName NVARCHAR(255) NOT NULL,
	Active bit DEFAULT 1,
	PRIMARY KEY(CategoryID)
)



CREATE TABLE [dbo].[Course](
	[CourseID] [int] IDENTITY(1,1),
	[CategoryID] [int] NOT NULL,
	[CreateBy] int NOT NULL,
	[CourseName] [nvarchar](50) NULL,
	[Price] money NULL,
	[Discount] [float] NULL,
	[Description] [text] NULL,
	[TotalDay] int NULL,
	[Image] [text] NULL,
	[Active] [bit] Default 1,
	PRIMARY KEY (CourseID),
	FOREIGN KEY(CategoryID) REFERENCES Category(CategoryID),
	FOREIGN KEY(CreateBy) REFERENCES Account(AccountID)
)
GO


CREATE TABLE [dbo].[Class](
	[ClassID] [int] IDENTITY(1,1),
	[TrainerID] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
	[ClassName] [varchar](20) NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	PRIMARY KEY (ClassID),
	FOREIGN KEY(TrainerID) REFERENCES Account(AccountID),
	FOREIGN KEY(CourseID) REFERENCES Course(CourseID)
)
GO


CREATE TABLE [dbo].[Enroll](
	[EnrollID] [int] IDENTITY(1,1),
	[EnrollDate] Date NULL,
	[status] [bit] NULL,
	[AccountID] [int] NOT NULL,
	[ClassID] [int] NOT NULL,
	PRIMARY KEY (EnrollID),
	FOREIGN KEY(AccountID) REFERENCES Account(AccountID),
	FOREIGN KEY(ClassID) REFERENCES Class(ClassID)
)
GO


CREATE TABLE [dbo].[ClassMember](
	[ClassMemberID] [int] IDENTITY(1,1) NOT NULL,
	[ClassID] [int] NOT NULL,
	[MemberID] [int] NOT NULL,
	PRIMARY KEY (ClassMemberID),
	FOREIGN KEY(ClassID) REFERENCES Class(ClassID),
	FOREIGN KEY(MemberID) REFERENCES Account(AccountID)
)
GO


CREATE TABLE [dbo].[Feedback](
	[FeedbackID] [int] IDENTITY(1,1),
	[MemberID] [int] NOT NULL,
	[CourseID] [int] NULL,
	[Rating] [int] NULL,
	[Description] [text] NULL,
	PRIMARY KEY (FeedbackID),
	FOREIGN KEY(MemberID) REFERENCES Account(AccountID),
	FOREIGN KEY(CourseID) REFERENCES Course(CourseID)
)
GO


CREATE TABLE Room (
	RoomID int IDENTITY(1,1),
	RoomName nvarchar(20),
	RoomFloor nvarchar(20),
	PRIMARY KEY(RoomID)
)
GO


CREATE TABLE [dbo].[Lession](
	[LessionID] [int] IDENTITY(1,1),
	[RoomID] INT NOT NULL,
	timeStart time NULL,
	timeEnd time NULL,
	[DayOfWeek] int Null,
	PRIMARY KEY (LessionID),
	FOREIGN KEY(RoomID) REFERENCES Room(RoomID)
)
GO


CREATE TABLE [dbo].[Timetable](
	[TimetableID] [int] IDENTITY(1,1),
	[ClassID] [int] NOT NULL,
	[LessionID] [int] NOT NULL,
	PRIMARY KEY(TimetableID),
	FOREIGN KEY(ClassID) REFERENCES Class(ClassID),
	FOREIGN KEY(LessionID) REFERENCES Lession(LessionID)
)
GO


INSERT INTO Role(RoleName) VALUES('Guest'), ('Trainer'), ('Staff'), ('Admin')
GO


INSERT INTO [dbo].[Account]
    ([RoleId], [Firstname], [Lastname], [Avatar], [Gender], [Phone], [Email], [Address], [Password], [Active])
VALUES
    (1, 'Firstname1', 'Lastname1', 'Avatar1', 1, 'Phone1', 'guest@gmail.com', 'Address1', '202CB962AC59075B964B07152D234B70', 1),
    (2, 'Trainer', '1', 'Avatar2', 2, 'Phone2', 'trainer@gmail.com', 'Address2', '202CB962AC59075B964B07152D234B70', 1),
    (3, 'Firstname3', 'Lastname3', 'Avatar3', 1, 'Phone3', 'staff@gmail.com', 'Address3', '202CB962AC59075B964B07152D234B70', 1),
    (4, 'Account', 'Admin', 'Avatar4', 2, 'Phone4', 'admin@gmail.com', 'Address4', '202CB962AC59075B964B07152D234B70', 1),
    (1, 'Firstname5', 'Lastname5', 'Avatar5', 1, 'Phone5', 'Email5@example.com', 'Address5', 'Password5', 1),
    (2, 'Firstname6', 'Lastname6', 'Avatar6', 2, 'Phone6', 'Email6@example.com', 'Address6', 'Password6', 0),
    (3, 'Firstname7', 'Lastname7', 'Avatar7', 1, 'Phone7', 'Email7@example.com', 'Address7', 'Password7', 1),
    (4, 'Firstname8', 'Lastname8', 'Avatar8', 2, 'Phone8', 'Email8@example.com', 'Address8', 'Password8', 1),
    (1, 'Firstname9', 'Lastname9', 'Avatar9', 1, 'Phone9', 'Email9@example.com', 'Address9', 'Password9', 0),
    (2, 'Firstname10', 'Lastname10', 'Avatar10', 2, 'Phone10', 'Email10@example.com', 'Address10', 'Password10', 1),
    (3, 'Firstname11', 'Lastname11', 'Avatar11', 1, 'Phone11', 'Email11@example.com', 'Address11', 'Password11', 1),
    (4, 'Firstname12', 'Lastname12', 'Avatar12', 2, 'Phone12', 'Email12@example.com', 'Address12', 'Password12', 1),
    (1, 'Firstname13', 'Lastname13', 'Avatar13', 1, 'Phone13', 'Email13@example.com', 'Address13', 'Password13', 0),
    (2, 'Firstname14', 'Lastname14', 'Avatar14', 2, 'Phone14', 'Email14@example.com', 'Address14', 'Password14', 1),
    (3, 'Firstname15', 'Lastname15', 'Avatar15', 1, 'Phone15', 'Email15@example.com', 'Address15', 'Password15', 1),
    (2, 'Firstname16', 'Lastname16', 'Avatar10', 2, 'Phone16', 'Email16@example.com', 'Address10', 'Password10', 1),
    (3, 'Firstname17', 'Lastname17', 'Avatar11', 1, 'Phone17', 'Email17@example.com', 'Address11', 'Password11', 1),
    (4, 'Firstname18', 'Lastname18', 'Avatar12', 2, 'Phone18', 'Email18@example.com', 'Address12', 'Password12', 1),
    (1, 'Firstname19', 'Lastname19', 'Avatar13', 1, 'Phone19', 'Email19@example.com', 'Address13', 'Password13', 0),
    (2, 'Firstname20', 'Lastname20', 'Avatar14', 2, 'Phone20', 'Email20@example.com', 'Address14', 'Password14', 1),
    (3, 'Firstname21', 'Lastname21', 'Avatar15', 1, 'Phone21', 'Email21@example.com', 'Address15', 'Password15', 1);
GO


INSERT INTO [dbo].[Category]
           ([CategoryName]
           ,[Active])
     VALUES
           ('Body Balance', 1),
		   ('Hatha Yoga', 1),
		   ('Children Yoga', 1),
		   ('Yoga Dance', 1)
GO


INSERT INTO [dbo].[Course]
           ([CategoryID]
           ,[CreateBy]
           ,[CourseName]
           ,[Price]
           ,[Discount]
           ,[Description]
           ,[TotalDay]
           ,[Image]
           ,[Active])
     VALUES
           (1, 4, 'Yoga Course 1', 9.99, 0.2, 'Yoga Course description', 30, 'yoga_image1.jpg', 1),
           (2, 4, 'Yoga Course 2', 19.99, 0.1, 'Yoga Course description', 20, 'yoga_image2.jpg', 1),
           (3, 4, 'Yoga Course 3', 14.99, 0.15, 'Yoga Course description', 25, 'yoga_image3.jpg', 1),
           (4, 4, 'Yoga Course 4', 24.99, 0.25, 'Yoga Course description', 35, 'yoga_image40.jpg', 1),
           (1, 4, 'Yoga Course 5', 9.99, 0.2, 'Yoga Course description', 30, 'yoga_image1.jpg', 1),
           (2, 4, 'Yoga Course 6', 19.99, 0.1, 'Yoga Course description', 20, 'yoga_image2.jpg', 1),
           (3, 4, 'Yoga Course 7', 14.99, 0.15, 'Yoga Course description', 25, 'yoga_image3.jpg', 1),
           (4, 4, 'Yoga Course 8', 24.99, 0.25, 'Yoga Course description', 35, 'yoga_image40.jpg', 1),
           (1, 4, 'Yoga Course 9', 9.99, 0.2, 'Yoga Course description', 30, 'yoga_image1.jpg', 1),
           (2, 4, 'Yoga Course 10', 19.99, 0.1, 'Yoga Course description', 20, 'yoga_image2.jpg', 1),
           (3, 4, 'Yoga Course 11', 14.99, 0.15, 'Yoga Course description', 25, 'yoga_image3.jpg', 1),
           (4, 4, 'Yoga Course 12', 24.99, 0.25, 'Yoga Course description', 35, 'yoga_image40.jpg', 1),
           (1, 8, 'Yoga Course 13', 9.99, 0.2, 'Yoga Course description', 30, 'yoga_image1.jpg', 1),
           (2, 8, 'Yoga Course 14', 19.99, 0.1, 'Yoga Course description', 20, 'yoga_image2.jpg', 1),
           (3, 8, 'Yoga Course 15', 14.99, 0.15, 'Yoga Course description', 25, 'yoga_image3.jpg', 1),
           (4, 8, 'Yoga Course 16', 24.99, 0.25, 'Yoga Course description', 35, 'yoga_image40.jpg', 1),
           (1, 8, 'Yoga Course 17', 9.99, 0.2, 'Yoga Course description', 30, 'yoga_image1.jpg', 1),
           (2, 8, 'Yoga Course 18', 19.99, 0.1, 'Yoga Course description', 20, 'yoga_image2.jpg', 1),
           (3, 8, 'Yoga Course 19', 14.99, 0.15, 'Yoga Course description', 25, 'yoga_image3.jpg', 1),
           (4, 8, 'Yoga Course 20', 24.99, 0.25, 'Yoga Course description', 35, 'yoga_image40.jpg', 1),
           (1, 8, 'Yoga Course 21', 9.99, 0.2, 'Yoga Course description', 30, 'yoga_image1.jpg', 1),
           (2, 8, 'Yoga Course 22', 19.99, 0.1, 'Yoga Course description', 20, 'yoga_image2.jpg', 1),
           (3, 12, 'Yoga Course 23', 14.99, 0.15, 'Yoga Course description', 25, 'yoga_image3.jpg', 1),
           (4, 12, 'Yoga Course 24', 24.99, 0.25, 'Yoga Course description', 35, 'yoga_image40.jpg', 1),
           (1, 12, 'Yoga Course 25', 9.99, 0.2, 'Yoga Course description', 30, 'yoga_image1.jpg', 1),
           (2, 12, 'Yoga Course 26', 19.99, 0.1, 'Yoga Course description', 20, 'yoga_image2.jpg', 1),
           (3, 12, 'Yoga Course 27', 14.99, 0.15, 'Yoga Course description', 25, 'yoga_image3.jpg', 1),
           (4, 12, 'Yoga Course 28', 24.99, 0.25, 'Yoga Course description', 35, 'yoga_image40.jpg', 1),
           (1, 12, 'Yoga Course 29', 9.99, 0.2, 'Yoga Course description', 30, 'yoga_image1.jpg', 1),
           (2, 12, 'Yoga Course 30', 19.99, 0.1, 'Yoga Course description', 20, 'yoga_image2.jpg', 1),
           (3, 12, 'Yoga Course 31', 14.99, 0.15, 'Yoga Course description', 25, 'yoga_image3.jpg', 1),
           (4, 12, 'Yoga Course 32', 24.99, 0.25, 'Yoga Course description', 35, 'yoga_image40.jpg', 1);
GO


INSERT INTO [dbo].[Room]
           ([RoomName]
           ,[RoomFloor])
     VALUES
           ('C101', 1),
		   ('C102', 1),
		   ('C103', 1),
		   ('C104', 1),
		   ('C105', 1),
		   ('C106', 1)
GO


INSERT INTO [dbo].[Lession]
           ([RoomID]
           ,[timeStart]
           ,[timeEnd]
           ,[DayOfWeek])
     VALUES
           (1, '13:30', '15:30', 2),
		   (1, '15:30', '17:30', 2),
		   (1, '08:30', '10:30', 2),
		   (1, '17:30', '19:30', 2),
		   (1, '13:30', '15:30', 3),
		   (1, '15:30', '17:30', 3),
		   (1, '08:30', '10:30', 3),
		   (1, '17:30', '19:30', 3),
		   (1, '13:30', '15:30', 4),
		   (1, '15:30', '17:30', 4),
		   (1, '08:30', '10:30', 4),
		   (1, '17:30', '19:30', 4),
		   (1, '13:30', '15:30', 5),
		   (1, '15:30', '17:30', 5),
		   (1, '08:30', '10:30', 5),
		   (1, '17:30', '19:30', 5),
		   (1, '13:30', '15:30', 6),
		   (1, '15:30', '17:30', 6),
		   (1, '08:30', '10:30', 6),
		   (1, '17:30', '19:30', 6)
GO


INSERT INTO [dbo].[Class]
           ([TrainerID]
           ,[CourseID]
           ,[ClassName]
           ,[StartDate]
           ,[EndDate])
     VALUES
           (2, 1, 'Yaga Class 1', '6-5-2023', '6-6-2023'),
		   (2, 1, 'Yaga Class 2', '6-5-2023', '6-6-2023'),
		   (2, 1, 'Yaga Class 3', '6-5-2023', '6-6-2023'),
		   (2, 1, 'Yaga Class 4', '6-5-2023', '6-6-2023'),
		   (2, 1, 'Yaga Class 5', '6-5-2023', '6-6-2023'),
		   (2, 1, 'Yaga Class 6', '6-5-2023', '6-6-2023'),
		   (2, 1, 'Yaga Class 7', '6-5-2023', '6-6-2023'),
		   (2, 1, 'Yaga Class 8', '6-5-2023', '6-6-2023'),
		   (2, 1, 'Yaga Class 9', '6-5-2023', '6-6-2023'),
		   (2, 2, 'Yaga Class 10', '6-5-2023', '6-6-2023'),
		   (2, 2, 'Yaga Class 11', '6-5-2023', '6-6-2023'),
		   (2, 2, 'Yaga Class 12', '6-5-2023', '6-6-2023'),
		   (2, 2, 'Yaga Class 13', '6-5-2023', '6-6-2023'),
		   (2, 2, 'Yaga Class 14', '6-5-2023', '6-6-2023')
GO




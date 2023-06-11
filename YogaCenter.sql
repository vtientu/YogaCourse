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


CREATE TABLE [dbo].[Lession](
	[LessionID] [int] IDENTITY(1,1),
	[LessionName] NVARCHAR(255),
	[StartTime] Time,
	[EndTime] Time,
	[LessionDescription] NVARCHAR(max),
	[LessionContent] NVARCHAR(max),
	PRIMARY KEY (LessionID)
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


CREATE TABLE Attend(
	[AttendID] INT IDENTITY(1,1),
	[AccountID] INT,
	[LessionID] INT,
	Attent bit,
	PRIMARY KEY(AttendID),
	FOREIGN KEY(AccountID) REFERENCES Account(AccountID),
	FOREIGN KEY(LessionID) REFERENCES Lession(LessionID)
)


INSERT INTO Role(RoleName) VALUES('Guest'), ('Trainer'), ('Staff'), ('Admin')
GO


INSERT INTO [dbo].[Account]
    ([RoleId], [Firstname], [Lastname], [Avatar], [Gender], [Phone], [Email], [Address], [Password], [Active])
VALUES
    (1, 'Firstname1', 'Lastname1', 'user/assets/img/team-1.jpg', 1, 'Phone1', 'guest@gmail.com', 'Address1', '202CB962AC59075B964B07152D234B70', 1),
    (2, 'Trainer', '1', 'user/assets/img/team-2.jpg', 2, 'Phone2', 'trainer@gmail.com', 'Address2', '202CB962AC59075B964B07152D234B70', 1),
    (3, 'Firstname3', 'Lastname3', 'user/assets/img/team-3.jpg', 1, 'Phone3', 'staff@gmail.com', 'Address3', '202CB962AC59075B964B07152D234B70', 1),
    (4, 'Account', 'Admin', 'user/assets/img/team-4.jpg', 2, 'Phone4', 'admin@gmail.com', 'Address4', '202CB962AC59075B964B07152D234B70', 1),
    (2, 'Firstname5', 'Lastname5', 'user/assets/img/team-1.jpg', 1, 'Phone5', 'Email5@example.com', 'Address5', 'Password5', 1),
    (2, 'Firstname6', 'Lastname6', 'user/assets/img/team-2.jpg', 2, 'Phone6', 'Email6@example.com', 'Address6', 'Password6', 0),
    (2, 'Firstname7', 'Lastname7', 'user/assets/img/team-3.jpg', 1, 'Phone7', 'Email7@example.com', 'Address7', 'Password7', 1),
    (2, 'Firstname8', 'Lastname8', 'user/assets/img/team-4.jpg', 2, 'Phone8', 'Email8@example.com', 'Address8', 'Password8', 1),
    (2, 'Firstname9', 'Lastname9', 'user/assets/img/team-1.jpg', 1, 'Phone9', 'Email9@example.com', 'Address9', 'Password9', 0),
    (2, 'Firstname10', 'Lastname10', 'user/assets/img/team-2.jpg', 2, 'Phone10', 'Email10@example.com', 'Address10', 'Password10', 1),
    (2, 'Firstname11', 'Lastname11', 'user/assets/img/team-3.jpg', 1, 'Phone11', 'Email11@example.com', 'Address11', 'Password11', 1),
    (2, 'Firstname12', 'Lastname12', 'user/assets/img/team-4.jpg', 2, 'Phone12', 'Email12@example.com', 'Address12', 'Password12', 1),
    (2, 'Firstname13', 'Lastname13', 'user/assets/img/team-1.jpg', 1, 'Phone13', 'Email13@example.com', 'Address13', 'Password13', 0),
    (2, 'Firstname14', 'Lastname14', 'user/assets/img/team-2.jpg', 2, 'Phone14', 'Email14@example.com', 'Address14', 'Password14', 1),
    (3, 'Firstname15', 'Lastname15', 'user/assets/img/team-3.jpg', 1, 'Phone15', 'Email15@example.com', 'Address15', 'Password15', 1),
    (2, 'Firstname16', 'Lastname16', 'user/assets/img/team-4.jpg', 2, 'Phone16', 'Email16@example.com', 'Address10', 'Password10', 1),
    (3, 'Firstname17', 'Lastname17', 'user/assets/img/team-1.jpg', 1, 'Phone17', 'Email17@example.com', 'Address11', 'Password11', 1),
    (4, 'Firstname18', 'Lastname18', 'user/assets/img/team-2.jpg', 2, 'Phone18', 'Email18@example.com', 'Address12', 'Password12', 1),
    (1, 'Firstname19', 'Lastname19', 'user/assets/img/team-3.jpg', 1, 'Phone19', 'Email19@example.com', 'Address13', 'Password13', 0),
    (2, 'Firstname20', 'Lastname20', 'user/assets/img/team-4.jpg', 2, 'Phone20', 'Email20@example.com', 'Address14', 'Password14', 1),
    (3, 'Firstname21', 'Lastname21', 'user/assets/img/team-1.jpg', 1, 'Phone21', 'Email21@example.com', 'Address15', 'Password15', 1);
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




INSERT INTO [dbo].[Class]
           ([TrainerID]
           ,[CourseID]
           ,[ClassName])
     VALUES
           (2, 1, 'Yaga Class 1'),
		   (2, 1, 'Yaga Class 2'),
		   (2, 1, 'Yaga Class 3'),
		   (2, 1, 'Yaga Class 4'),
		   (2, 1, 'Yaga Class 5'),
		   (2, 1, 'Yaga Class 6'),
		   (2, 1, 'Yaga Class 7'),
		   (2, 1, 'Yaga Class 8'),
		   (2, 1, 'Yaga Class 9'),
		   (2, 2, 'Yaga Class 10'),
		   (2, 2, 'Yaga Class 11'),
		   (2, 2, 'Yaga Class 12'),
		   (2, 2, 'Yaga Class 13'),
		   (2, 2, 'Yaga Class 14')
GO


INSERT INTO [dbo].[Blog]
           ([CreateBy]
           ,[PublishedDate]
           ,[Title]
           ,[Content]
           ,[Status]
           ,[Image])
     VALUES
           (4, GETDATE(), 'Internationally Accredited Diploma in Yoga Training', 'Most of us spend the majority of our time regretting the past or worrying about the future, but forget to live in the present. Ever wondered why it’s called ‘the pre-sent”? Because it is indeed a ‘present’ from God himself, and when one is mindful, they have the true luxury of opening it.
Yoga, when practised regularly, have the potential to help you become more mindful so that your life in the present, most of the time, which leads to increased happiness and optimal health and thereby reducing anxiety and stress. 
Besides this, there are concrete studies which prove that Yoga when practised regularly can:
Help with flexibility, improve your posture, protect your spine and strengthens your lower back. Its amazing for your bone health increase blood flow to all body parts boost immunity, optimizes your hormones, makes you happy, tremendously increase your focus and makes you more productive. 
Yoga tones your nervous system, helps you sleep deeper, helps detoxify toxins through deep breathing, helps with digestive issues and so forth. 
It also boosts self-esteem, increases confidence, helps you get in touch with your divine self, helps you with your relationships and makes you a better person. 
Yoga is not just about doing handstands or wearing an orange rob and sit in Sukhasana. It’s much more than that and based on your preference, goals, abilities Yoga can be anything you want to be. 
Just remember anyone can practice Yoga and you don’t need to turn vegan to practice it:)
This Diploma in Yoga Training will be of great interest to all learners and healthcare professional who would like to learn the fundamentals of Yoga Training. It provides an in-depth look into Patanjali Eight Limb Ashtanga Yoga and not only provides an in-depth overview of Yogic Philosophy but also have videos of Akash (your instructor) teaching you how to master over 60 asanas and pranayamas with detailed instructions, difficulty level and benefits that accrue to your body when you practice them regularly. ',
1, 'user/assets/img/blog-1.jpg'),
	(4, GETDATE(), 'Yin Yoga Teacher Training Course (Yoga Alliance Certificate)', 'If you want to have the most Comprehensive Guide to Yin Yoga and want to guide students through powerful and healing yin yoga classes then this course is for you. It is also WORLD FIRST Course that talks about the true History of Yin Yoga!
Bodspheres Yin Yoga Teacher Training Certificate Course includes:
250+ Pages Yin Yoga Teacher Training Manual
30+ Yin Yoga Poses - including step by step instructions, pose variations, benefits, associated Chakras and Meridians and contraindications
10+ Professional Guided Practical Classes
Tons of Lectures on Theory
What exactly is Yin Yoga
History, Principles and Benefits of yin yoga
Yin VS Yang
Anatomy of Yin Yoga
Comparative VS Functional Approach
Detailed information on Chakras and Meridians
Sequencing of Yin Yoga Sessions
How to Teach Yin Yoga
Class environment
Class structure
Safety considerations
You will also receive wonderful resources with this course:
250+ Pages Yin Yoga Teacher Training Manual
Study Guide
Exercise PDFs
Language Development Chart
Asana Families
Meridian System
Postures for Each Meridian
Target Areas for Yin Yoga Poses
All of our resources are exclusive to Bodsphere! This course will provide you with all of the skills, tools and knowledge you need to confidently and safely teach yin yoga classes.
Happy learning and continue growing on this beautiful path of Yoga!',
1, 'user/assets/img/blog-2.jpg'),
	(4, GETDATE(), 'Yin Yoga Teacher Training Certificate Course', 'Welcome to the Anjali Yin Yoga Teacher Training Course!
If you want to learn every aspect of yin yoga so that you can guide students through powerful and healing yin yoga classes then you are in the right place!
Our course is a Yoga Alliance approved continuing education course.
The Anjali Yin Yoga Teacher Training Course will cover:
What exactly is yin yoga
History, principles and benefits of yin yoga
Concept of yin and yang
Anatomy as it refers to yin yoga - including muscles and connective tissue
Chakras and Meridians
Breakdown of 25 yin yoga poses - including step by step instructions, pose variations, benefits, associated Chakras and Meridians and contraindications
Sequencing
Two professional, guided yin yoga practices
Yin yoga for the elderly and pregnancy
Teaching tips
Class environment
Class structure
Safety considerations
You will also receive wonderful resources with this course including two student workbooks with over 35 pages of information to assist your learning and a fully illustrated, 25 page yin yoga pose guide with pose instructions, benefits, contraindications, variations and Chakras and Meridians, you will also receive a chakra cleanse meditation script to use in your classes and two professional yin yoga sequences to get you classes started.
All of our resources are exclusive to Anjali Yoga!
This course will provide you with all of the skills, tools and knowledge you need to confidently and safely teach yin yoga classes.',
1, 'user/assets/img/blog-3.jpg'),
	(4, GETDATE(), 'Mindful Yin Yoga Training Certificate YOGA ALLAINCE', 'Offering you all the fundamental theories behind Mindful Yin Yoga including all aspects of mindfulness, & how we can incorporate this theory into our physical application of Yin yoga.
In Mindful Yin Yoga, the student is encouraged & invited to feel sensations of stretch & compression as the body drops below the surface of the muscles into the YIN tissues of the tendons, ligaments, fascia, & bones.
Mindful Yin Yoga invites you to tune into your body & be kind to yourself. It is a path, a journey, not to get somewhere else, but to be where we are, as we are in this very moment. The practice encourages mindful steady conscious breathing, as well as listening to your body & observing the mind. Allowing you to reconnect both body & mind & return to a sense of wholeness.
You can enjoy Five Mindfulness techniques, Two Mindful meditations & three associated 60 minutes each Yin yoga class practices to release stress & tension in your body as you relax into these Mindful Yin Yoga practices.
With a separate focus on the front body, back body, & upper body. These full-hour yin practices are designed to help you tune in to what your own body needs, release tightness & tension and surrender into complete relaxation.
This course is designed for all levels including beginners, intermediate, & advanced yoga practitioners. I will walk you step-by-step through each of the poses. Variations are offered to suit all body shapes & abilities. Instructions will allow you to settle into the practice without having to keep watching the screen. You can practice at your own pace in the comfort of your home & can come back to the practice as often as desired.',
1, 'user/assets/img/blog-4.jpg')
GO
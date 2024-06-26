USE [master]
GO
/****** Object:  Database [User_23]    Script Date: 31.05.2024 20:39:56 ******/
CREATE DATABASE [User_23]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'User_23', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\User_23.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'User_23_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\User_23_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [User_23] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [User_23].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [User_23] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [User_23] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [User_23] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [User_23] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [User_23] SET ARITHABORT OFF 
GO
ALTER DATABASE [User_23] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [User_23] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [User_23] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [User_23] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [User_23] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [User_23] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [User_23] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [User_23] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [User_23] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [User_23] SET  DISABLE_BROKER 
GO
ALTER DATABASE [User_23] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [User_23] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [User_23] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [User_23] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [User_23] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [User_23] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [User_23] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [User_23] SET RECOVERY FULL 
GO
ALTER DATABASE [User_23] SET  MULTI_USER 
GO
ALTER DATABASE [User_23] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [User_23] SET DB_CHAINING OFF 
GO
ALTER DATABASE [User_23] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [User_23] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [User_23] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [User_23] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'User_23', N'ON'
GO
ALTER DATABASE [User_23] SET QUERY_STORE = ON
GO
ALTER DATABASE [User_23] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [User_23]
GO
/****** Object:  Table [dbo].[Fault]    Script Date: 31.05.2024 20:39:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fault](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FaultTitle] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 31.05.2024 20:39:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PostTitle] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Request]    Script Date: 31.05.2024 20:39:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Equipment] [nvarchar](100) NOT NULL,
	[FaultId] [int] NOT NULL,
	[StatusId] [int] NOT NULL,
	[ProblemDescription] [nvarchar](500) NOT NULL,
	[DateAdded] [date] NOT NULL,
	[ClientName] [nvarchar](100) NOT NULL,
	[ApplicantId] [int] NULL,
	[ExecutorId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 31.05.2024 20:39:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StatusTitle] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 31.05.2024 20:39:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Lastname] [nvarchar](50) NULL,
	[PostId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Fault] ON 

INSERT [dbo].[Fault] ([Id], [FaultTitle]) VALUES (1, N'программные')
INSERT [dbo].[Fault] ([Id], [FaultTitle]) VALUES (2, N'аппаратные')
INSERT [dbo].[Fault] ([Id], [FaultTitle]) VALUES (3, N'косвенные')
SET IDENTITY_INSERT [dbo].[Fault] OFF
GO
SET IDENTITY_INSERT [dbo].[Post] ON 

INSERT [dbo].[Post] ([Id], [PostTitle]) VALUES (1, N'администратор')
INSERT [dbo].[Post] ([Id], [PostTitle]) VALUES (2, N'менеджер')
INSERT [dbo].[Post] ([Id], [PostTitle]) VALUES (3, N'подающий')
INSERT [dbo].[Post] ([Id], [PostTitle]) VALUES (4, N'исполнитель')
SET IDENTITY_INSERT [dbo].[Post] OFF
GO
SET IDENTITY_INSERT [dbo].[Request] ON 

INSERT [dbo].[Request] ([Id], [Equipment], [FaultId], [StatusId], [ProblemDescription], [DateAdded], [ClientName], [ApplicantId], [ExecutorId]) VALUES (3, N'sdfhsdjkf', 3, 1, N'sdfsdfhsdfjhsdjf
sdfhsdjf', CAST(N'2024-05-31' AS Date), N'sdfsdfsdf', 3, NULL)
SET IDENTITY_INSERT [dbo].[Request] OFF
GO
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([Id], [StatusTitle]) VALUES (1, N'в ожидании')
INSERT [dbo].[Status] ([Id], [StatusTitle]) VALUES (2, N'в процессе')
INSERT [dbo].[Status] ([Id], [StatusTitle]) VALUES (3, N'выполнено')
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [Login], [Password], [Name], [Surname], [Lastname], [PostId]) VALUES (1, N'aboba', N'1', N'1', N'1', N'1', 1)
INSERT [dbo].[User] ([Id], [Login], [Password], [Name], [Surname], [Lastname], [PostId]) VALUES (2, N'2', N'2', N'2', N'2', N'2', 2)
INSERT [dbo].[User] ([Id], [Login], [Password], [Name], [Surname], [Lastname], [PostId]) VALUES (3, N'qwerty', N'3', N'3', N'3', N'3', 3)
INSERT [dbo].[User] ([Id], [Login], [Password], [Name], [Surname], [Lastname], [PostId]) VALUES (4, N'4', N'4', N'4', N'4', N'4', 4)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_Fault] FOREIGN KEY([FaultId])
REFERENCES [dbo].[Fault] ([Id])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_Fault]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([Id])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_Status]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_User] FOREIGN KEY([ApplicantId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_User]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_User1] FOREIGN KEY([ExecutorId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_User1]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Post] FOREIGN KEY([PostId])
REFERENCES [dbo].[Post] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Post]
GO
USE [master]
GO
ALTER DATABASE [User_23] SET  READ_WRITE 
GO

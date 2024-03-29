USE [master]
GO
/****** Object:  Database [FolderManager]    Script Date: 2019-07-12 3:19:09 PM ******/
CREATE DATABASE [FolderManager]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FolderManager', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\FolderManager.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FolderManager_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\FolderManager_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [FolderManager] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FolderManager].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FolderManager] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FolderManager] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FolderManager] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FolderManager] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FolderManager] SET ARITHABORT OFF 
GO
ALTER DATABASE [FolderManager] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FolderManager] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FolderManager] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FolderManager] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FolderManager] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FolderManager] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FolderManager] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FolderManager] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FolderManager] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FolderManager] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FolderManager] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FolderManager] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FolderManager] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FolderManager] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FolderManager] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FolderManager] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FolderManager] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FolderManager] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FolderManager] SET  MULTI_USER 
GO
ALTER DATABASE [FolderManager] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FolderManager] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FolderManager] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FolderManager] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FolderManager] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FolderManager] SET QUERY_STORE = OFF
GO
USE [FolderManager]
GO
/****** Object:  Table [dbo].[Files]    Script Date: 2019-07-12 3:19:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Files](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FolderName] [nvarchar](200) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreateBy] [nvarchar](200) NOT NULL,
	[ParentId] [int] NULL,
	[FileType] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FileTypes]    Script Date: 2019-07-12 3:19:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FileTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_FileTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Files] ON 

INSERT [dbo].[Files] ([Id], [FolderName], [CreatedDate], [CreateBy], [ParentId], [FileType]) VALUES (2, N'root', CAST(N'2019-10-07T00:00:00.000' AS DateTime), N'MaiQD', NULL, 1)
INSERT [dbo].[Files] ([Id], [FolderName], [CreatedDate], [CreateBy], [ParentId], [FileType]) VALUES (6, N'Test', CAST(N'2019-07-10T00:00:00.000' AS DateTime), N'MaiQD', 2, 1)
INSERT [dbo].[Files] ([Id], [FolderName], [CreatedDate], [CreateBy], [ParentId], [FileType]) VALUES (7, N'TEST2', CAST(N'2019-07-10T14:46:12.497' AS DateTime), N'MaiQD', 2, 1)
INSERT [dbo].[Files] ([Id], [FolderName], [CreatedDate], [CreateBy], [ParentId], [FileType]) VALUES (8, N'Inside Test', CAST(N'2019-07-10T14:46:45.740' AS DateTime), N'MaiQD', 2, 1)
INSERT [dbo].[Files] ([Id], [FolderName], [CreatedDate], [CreateBy], [ParentId], [FileType]) VALUES (10, N'Inside', CAST(N'2019-07-10T14:50:21.680' AS DateTime), N'MaiQD', 6, 1)
INSERT [dbo].[Files] ([Id], [FolderName], [CreatedDate], [CreateBy], [ParentId], [FileType]) VALUES (11, N'Inside2', CAST(N'2019-07-10T14:50:31.837' AS DateTime), N'MaiQD', 10, 1)
INSERT [dbo].[Files] ([Id], [FolderName], [CreatedDate], [CreateBy], [ParentId], [FileType]) VALUES (12, N'Tex2', CAST(N'2019-07-10T14:59:08.133' AS DateTime), N'MaiQD', 7, 1)
INSERT [dbo].[Files] ([Id], [FolderName], [CreatedDate], [CreateBy], [ParentId], [FileType]) VALUES (13, N'ABC', CAST(N'2019-07-10T15:05:36.637' AS DateTime), N'MaiQD', 6, 1)
INSERT [dbo].[Files] ([Id], [FolderName], [CreatedDate], [CreateBy], [ParentId], [FileType]) VALUES (14, N'ABC55', CAST(N'2019-07-10T16:13:40.447' AS DateTime), N'MaiQD', 2, 1)
INSERT [dbo].[Files] ([Id], [FolderName], [CreatedDate], [CreateBy], [ParentId], [FileType]) VALUES (16, N'Thêm', CAST(N'2019-07-10T16:51:20.800' AS DateTime), N'MaiQD', 2, 1)
INSERT [dbo].[Files] ([Id], [FolderName], [CreatedDate], [CreateBy], [ParentId], [FileType]) VALUES (17, N'mới', CAST(N'2019-07-10T16:51:25.933' AS DateTime), N'MaiQD', 2, 1)
INSERT [dbo].[Files] ([Id], [FolderName], [CreatedDate], [CreateBy], [ParentId], [FileType]) VALUES (18, N'thật', CAST(N'2019-07-10T16:51:31.110' AS DateTime), N'MaiQD', 2, 1)
INSERT [dbo].[Files] ([Id], [FolderName], [CreatedDate], [CreateBy], [ParentId], [FileType]) VALUES (19, N'nhiều', CAST(N'2019-07-10T16:51:36.387' AS DateTime), N'MaiQD', 2, 1)
INSERT [dbo].[Files] ([Id], [FolderName], [CreatedDate], [CreateBy], [ParentId], [FileType]) VALUES (20, N'modal', CAST(N'2019-07-10T16:51:41.920' AS DateTime), N'MaiQD', 2, 1)
INSERT [dbo].[Files] ([Id], [FolderName], [CreatedDate], [CreateBy], [ParentId], [FileType]) VALUES (21, N'để', CAST(N'2019-07-10T16:51:46.777' AS DateTime), N'MaiQD', 2, 1)
INSERT [dbo].[Files] ([Id], [FolderName], [CreatedDate], [CreateBy], [ParentId], [FileType]) VALUES (22, N'nó', CAST(N'2019-07-10T16:51:52.560' AS DateTime), N'MaiQD', 2, 1)
INSERT [dbo].[Files] ([Id], [FolderName], [CreatedDate], [CreateBy], [ParentId], [FileType]) VALUES (23, N'xuống 1', CAST(N'2019-07-10T16:51:59.137' AS DateTime), N'MaiQD', 2, 1)
INSERT [dbo].[Files] ([Id], [FolderName], [CreatedDate], [CreateBy], [ParentId], [FileType]) VALUES (24, N'đóng', CAST(N'2019-07-10T16:52:04.247' AS DateTime), N'MaiQD', 2, 1)
INSERT [dbo].[Files] ([Id], [FolderName], [CreatedDate], [CreateBy], [ParentId], [FileType]) VALUES (29, N'Rename', CAST(N'2019-07-10T17:19:21.163' AS DateTime), N'MaiQD', 12, 1)
INSERT [dbo].[Files] ([Id], [FolderName], [CreatedDate], [CreateBy], [ParentId], [FileType]) VALUES (30, N'123', CAST(N'2019-07-11T18:08:21.513' AS DateTime), N'MaiQD', 6, 1)
INSERT [dbo].[Files] ([Id], [FolderName], [CreatedDate], [CreateBy], [ParentId], [FileType]) VALUES (31, N'123', CAST(N'2019-07-11T22:42:23.980' AS DateTime), N'MaiQD', 8, 1)
INSERT [dbo].[Files] ([Id], [FolderName], [CreatedDate], [CreateBy], [ParentId], [FileType]) VALUES (34, N'58374442_823104754722674_7636199900916482048_n.jpg', CAST(N'2019-07-12T11:36:21.027' AS DateTime), N'MaiQD', 6, 14)
INSERT [dbo].[Files] ([Id], [FolderName], [CreatedDate], [CreateBy], [ParentId], [FileType]) VALUES (35, N'Nuong-chieu-den-hu-hong-Tieu-Phan-Phan-Ly-Tuan-Huu.mp3', CAST(N'2019-07-12T11:41:27.650' AS DateTime), N'MaiQD', 6, 16)
INSERT [dbo].[Files] ([Id], [FolderName], [CreatedDate], [CreateBy], [ParentId], [FileType]) VALUES (36, N'Nuong-chieu-den-hu-hong-Tieu-Phan-Phan-Ly-Tuan-Huu.mp3', CAST(N'2019-07-12T11:42:10.247' AS DateTime), N'MaiQD', 10, 11)
INSERT [dbo].[Files] ([Id], [FolderName], [CreatedDate], [CreateBy], [ParentId], [FileType]) VALUES (37, N'dan''cin.mp4', CAST(N'2019-07-12T11:42:24.903' AS DateTime), N'MaiQD', 10, 12)
INSERT [dbo].[Files] ([Id], [FolderName], [CreatedDate], [CreateBy], [ParentId], [FileType]) VALUES (38, N'nana.jpg', CAST(N'2019-07-12T11:44:37.257' AS DateTime), N'MaiQD', 7, 14)
SET IDENTITY_INSERT [dbo].[Files] OFF
SET IDENTITY_INSERT [dbo].[FileTypes] ON 

INSERT [dbo].[FileTypes] ([Id], [TypeName]) VALUES (1, N'File folder')
INSERT [dbo].[FileTypes] ([Id], [TypeName]) VALUES (2, N'Windows Media')
INSERT [dbo].[FileTypes] ([Id], [TypeName]) VALUES (3, N'Microsoft Digital Video Recording')
INSERT [dbo].[FileTypes] ([Id], [TypeName]) VALUES (4, N'Audio Visual Interleave')
INSERT [dbo].[FileTypes] ([Id], [TypeName]) VALUES (5, N'Moving Pictures Experts Group')
INSERT [dbo].[FileTypes] ([Id], [TypeName]) VALUES (6, N'Musical Instrument Digital Interface')
INSERT [dbo].[FileTypes] ([Id], [TypeName]) VALUES (7, N'Audio Interchange File Format')
INSERT [dbo].[FileTypes] ([Id], [TypeName]) VALUES (8, N'Sun Microsystems và NeXT')
INSERT [dbo].[FileTypes] ([Id], [TypeName]) VALUES (9, N'Audio for Windows')
INSERT [dbo].[FileTypes] ([Id], [TypeName]) VALUES (10, N'CD Audio Track')
INSERT [dbo].[FileTypes] ([Id], [TypeName]) VALUES (11, N'Âm thanh MP4')
INSERT [dbo].[FileTypes] ([Id], [TypeName]) VALUES (12, N'Video MP4')
INSERT [dbo].[FileTypes] ([Id], [TypeName]) VALUES (13, N'Free Lossless Audio Codec')
INSERT [dbo].[FileTypes] ([Id], [TypeName]) VALUES (14, N'Picture')
INSERT [dbo].[FileTypes] ([Id], [TypeName]) VALUES (15, N'Text')
INSERT [dbo].[FileTypes] ([Id], [TypeName]) VALUES (16, N'Unknow')
SET IDENTITY_INSERT [dbo].[FileTypes] OFF
ALTER TABLE [dbo].[Files]  WITH CHECK ADD  CONSTRAINT [FK__Folder__ParentId__37A5467C] FOREIGN KEY([ParentId])
REFERENCES [dbo].[Files] ([Id])
GO
ALTER TABLE [dbo].[Files] CHECK CONSTRAINT [FK__Folder__ParentId__37A5467C]
GO
ALTER TABLE [dbo].[Files]  WITH CHECK ADD  CONSTRAINT [FK_Files_FileTypes] FOREIGN KEY([FileType])
REFERENCES [dbo].[FileTypes] ([Id])
GO
ALTER TABLE [dbo].[Files] CHECK CONSTRAINT [FK_Files_FileTypes]
GO
USE [master]
GO
ALTER DATABASE [FolderManager] SET  READ_WRITE 
GO

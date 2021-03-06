USE [master]
GO
/****** Object:  Database [library_ex_2015]    Script Date: 08/08/2016 19:26:08 ******/
CREATE DATABASE [library_ex_2015]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'library_ex_2015', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\library_ex_2015.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'library_ex_2015_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\library_ex_2015_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [library_ex_2015] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [library_ex_2015].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [library_ex_2015] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [library_ex_2015] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [library_ex_2015] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [library_ex_2015] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [library_ex_2015] SET ARITHABORT OFF 
GO
ALTER DATABASE [library_ex_2015] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [library_ex_2015] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [library_ex_2015] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [library_ex_2015] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [library_ex_2015] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [library_ex_2015] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [library_ex_2015] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [library_ex_2015] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [library_ex_2015] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [library_ex_2015] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [library_ex_2015] SET  DISABLE_BROKER 
GO
ALTER DATABASE [library_ex_2015] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [library_ex_2015] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [library_ex_2015] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [library_ex_2015] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [library_ex_2015] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [library_ex_2015] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [library_ex_2015] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [library_ex_2015] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [library_ex_2015] SET  MULTI_USER 
GO
ALTER DATABASE [library_ex_2015] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [library_ex_2015] SET DB_CHAINING OFF 
GO
ALTER DATABASE [library_ex_2015] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [library_ex_2015] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [library_ex_2015]
GO
/****** Object:  Table [dbo].[authors]    Script Date: 10/15/2015 19:26:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[authors](
	[a_id] [int] IDENTITY(1,1) NOT NULL,
	[a_name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_authors] PRIMARY KEY CLUSTERED 
(
	[a_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[books]    Script Date: 10/15/2015 19:26:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[books](
	[b_id] [int] IDENTITY(1,1) NOT NULL,
	[b_name] [nvarchar](150) NOT NULL,
	[b_year] [smallint] NOT NULL,
	[b_quantity] [smallint] NOT NULL,
 CONSTRAINT [PK_books] PRIMARY KEY CLUSTERED 
(
	[b_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[genres]    Script Date: 10/15/2015 19:26:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[genres](
	[g_id] [int] IDENTITY(1,1) NOT NULL,
	[g_name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_genres] PRIMARY KEY CLUSTERED 
(
	[g_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[m2m_books_authors]    Script Date: 10/15/2015 19:26:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m2m_books_authors](
	[b_id] [int] NOT NULL,
	[a_id] [int] NOT NULL,
 CONSTRAINT [PK_m2m_books_authors] PRIMARY KEY CLUSTERED 
(
	[b_id] ASC,
	[a_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[m2m_books_genres]    Script Date: 10/15/2015 19:26:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[m2m_books_genres](
	[b_id] [int] NOT NULL,
	[g_id] [int] NOT NULL,
 CONSTRAINT [PK_m2m_books_genres] PRIMARY KEY CLUSTERED 
(
	[b_id] ASC,
	[g_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[subscribers]    Script Date: 10/15/2015 19:26:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[subscribers](
	[s_id] [int] IDENTITY(1,1) NOT NULL,
	[s_name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_subscribers] PRIMARY KEY CLUSTERED 
(
	[s_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[subscriptions]    Script Date: 10/15/2015 19:26:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[subscriptions](
	[sb_id] [int] IDENTITY(1,1) NOT NULL,
	[sb_subscriber] [int] NOT NULL,
	[sb_book] [int] NOT NULL,
	[sb_start] [date] NOT NULL,
	[sb_finish] [date] NOT NULL,
	[sb_is_active] [char](1) NOT NULL,
 CONSTRAINT [PK_subscriptions] PRIMARY KEY CLUSTERED 
(
	[sb_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ_genres_g_name]    Script Date: 10/15/2015 19:26:09 ******/
ALTER TABLE [dbo].[genres] ADD  CONSTRAINT [UQ_genres_g_name] UNIQUE NONCLUSTERED 
(
	[g_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[m2m_books_authors]  WITH CHECK ADD  CONSTRAINT [FK_m2m_books_authors_authors] FOREIGN KEY([a_id])
REFERENCES [dbo].[authors] ([a_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[m2m_books_authors] CHECK CONSTRAINT [FK_m2m_books_authors_authors]
GO
ALTER TABLE [dbo].[m2m_books_authors]  WITH CHECK ADD  CONSTRAINT [FK_m2m_books_authors_books] FOREIGN KEY([b_id])
REFERENCES [dbo].[books] ([b_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[m2m_books_authors] CHECK CONSTRAINT [FK_m2m_books_authors_books]
GO
ALTER TABLE [dbo].[m2m_books_genres]  WITH CHECK ADD  CONSTRAINT [FK_m2m_books_genres_books] FOREIGN KEY([b_id])
REFERENCES [dbo].[books] ([b_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[m2m_books_genres] CHECK CONSTRAINT [FK_m2m_books_genres_books]
GO
ALTER TABLE [dbo].[m2m_books_genres]  WITH CHECK ADD  CONSTRAINT [FK_m2m_books_genres_genres] FOREIGN KEY([g_id])
REFERENCES [dbo].[genres] ([g_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[m2m_books_genres] CHECK CONSTRAINT [FK_m2m_books_genres_genres]
GO
ALTER TABLE [dbo].[subscriptions]  WITH CHECK ADD  CONSTRAINT [FK_subscriptions_books] FOREIGN KEY([sb_book])
REFERENCES [dbo].[books] ([b_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[subscriptions] CHECK CONSTRAINT [FK_subscriptions_books]
GO
ALTER TABLE [dbo].[subscriptions]  WITH CHECK ADD  CONSTRAINT [FK_subscriptions_subscribers] FOREIGN KEY([sb_subscriber])
REFERENCES [dbo].[subscribers] ([s_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[subscriptions] CHECK CONSTRAINT [FK_subscriptions_subscribers]
GO
ALTER TABLE [dbo].[subscriptions]  WITH CHECK ADD  CONSTRAINT [check_enum] CHECK  (([sb_is_active]='N' OR [sb_is_active]='Y'))
GO
ALTER TABLE [dbo].[subscriptions] CHECK CONSTRAINT [check_enum]
GO
USE [master]
GO
ALTER DATABASE [library_ex_2015] SET  READ_WRITE 
GO

/* ---------------------------------------------------- */
/*  Generated by Enterprise Architect Version 12.0 		*/
/*  Created On : 08-Aug-2016 20:18:13 				*/
/*  DBMS       : SQL Server 2008 						*/
/* ---------------------------------------------------- */

/* Drop Foreign Key Constraints */

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_subscriptions_books]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [subscriptions] DROP CONSTRAINT [FK_subscriptions_books]
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_subscriptions_subscribers]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [subscriptions] DROP CONSTRAINT [FK_subscriptions_subscribers]
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_m2m_books_genres_books]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [m2m_books_genres] DROP CONSTRAINT [FK_m2m_books_genres_books]
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_m2m_books_genres_genres]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [m2m_books_genres] DROP CONSTRAINT [FK_m2m_books_genres_genres]
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_m2m_books_authors_authors]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [m2m_books_authors] DROP CONSTRAINT [FK_m2m_books_authors_authors]
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_m2m_books_authors_books]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [m2m_books_authors] DROP CONSTRAINT [FK_m2m_books_authors_books]
GO

/* Drop Tables */

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[subscriptions]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [subscriptions]
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[subscribers]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [subscribers]
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[m2m_books_genres]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [m2m_books_genres]
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[m2m_books_authors]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [m2m_books_authors]
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[genres]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [genres]
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[books]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [books]
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[authors]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [authors]
GO

/* Create Tables */

CREATE TABLE [subscriptions]
(
	[sb_id] int NOT NULL IDENTITY (1, 1),
	[sb_subscriber] int NOT NULL,
	[sb_book] int NOT NULL,
	[sb_start] date NOT NULL,
	[sb_finish] date NOT NULL,
	[sb_is_active] char(1) NOT NULL
)
GO

CREATE TABLE [subscribers]
(
	[s_id] int NOT NULL IDENTITY (1, 1),
	[s_name] nvarchar(150) NOT NULL
)
GO

CREATE TABLE [m2m_books_genres]
(
	[b_id] int NOT NULL,
	[g_id] int NOT NULL
)
GO

CREATE TABLE [m2m_books_authors]
(
	[b_id] int NOT NULL,
	[a_id] int NOT NULL
)
GO

CREATE TABLE [genres]
(
	[g_id] int NOT NULL IDENTITY (1, 1),
	[g_name] nvarchar(150) NOT NULL
)
GO

CREATE TABLE [books]
(
	[b_id] int NOT NULL IDENTITY (1, 1),
	[b_name] nvarchar(150) NOT NULL,
	[b_year] smallint NOT NULL,
	[b_quantity] smallint NOT NULL
)
GO

CREATE TABLE [authors]
(
	[a_id] int NOT NULL IDENTITY (1, 1),
	[a_name] nvarchar(150) NOT NULL
)
GO

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE [subscriptions] 
 ADD CONSTRAINT [PK_subscriptions]
	PRIMARY KEY CLUSTERED ([sb_id])
GO

ALTER TABLE [subscriptions] 
 ADD CONSTRAINT [check_enum] CHECK ([sb_is_active] IN ('Y', 'N'))
GO

ALTER TABLE [subscribers] 
 ADD CONSTRAINT [PK_subscribers]
	PRIMARY KEY CLUSTERED ([s_id])
GO

ALTER TABLE [m2m_books_genres] 
 ADD CONSTRAINT [PK_m2m_books_genres]
	PRIMARY KEY CLUSTERED ([b_id],[g_id])
GO

ALTER TABLE [m2m_books_authors] 
 ADD CONSTRAINT [PK_m2m_books_authors]
	PRIMARY KEY CLUSTERED ([b_id],[a_id])
GO

ALTER TABLE [genres] 
 ADD CONSTRAINT [PK_genres]
	PRIMARY KEY CLUSTERED ([g_id])
GO

ALTER TABLE [genres] 
 ADD CONSTRAINT [UQ_genres_g_name] UNIQUE NONCLUSTERED ([g_name])
GO

ALTER TABLE [books] 
 ADD CONSTRAINT [PK_books]
	PRIMARY KEY CLUSTERED ([b_id])
GO

ALTER TABLE [authors] 
 ADD CONSTRAINT [PK_authors]
	PRIMARY KEY CLUSTERED ([a_id])
GO

/* Create Foreign Key Constraints */

ALTER TABLE [subscriptions] ADD CONSTRAINT [FK_subscriptions_books]
	FOREIGN KEY ([sb_book]) REFERENCES [books] ([b_id]) ON DELETE Cascade ON UPDATE Cascade
GO

ALTER TABLE [subscriptions] ADD CONSTRAINT [FK_subscriptions_subscribers]
	FOREIGN KEY ([sb_subscriber]) REFERENCES [subscribers] ([s_id]) ON DELETE Cascade ON UPDATE Cascade
GO

ALTER TABLE [m2m_books_genres] ADD CONSTRAINT [FK_m2m_books_genres_books]
	FOREIGN KEY ([b_id]) REFERENCES [books] ([b_id]) ON DELETE Cascade ON UPDATE Cascade
GO

ALTER TABLE [m2m_books_genres] ADD CONSTRAINT [FK_m2m_books_genres_genres]
	FOREIGN KEY ([g_id]) REFERENCES [genres] ([g_id]) ON DELETE Cascade ON UPDATE Cascade
GO

ALTER TABLE [m2m_books_authors] ADD CONSTRAINT [FK_m2m_books_authors_authors]
	FOREIGN KEY ([a_id]) REFERENCES [authors] ([a_id]) ON DELETE Cascade ON UPDATE Cascade
GO

ALTER TABLE [m2m_books_authors] ADD CONSTRAINT [FK_m2m_books_authors_books]
	FOREIGN KEY ([b_id]) REFERENCES [books] ([b_id]) ON DELETE Cascade ON UPDATE Cascade
GO

USE [master]
GO
/****** Object:  Database [NFC_Bus_Db_New]    Script Date: 03/23/2016 15:35:00 ******/
CREATE DATABASE [NFC_Bus_Db_New] ON  PRIMARY 
( NAME = N'NFC_Bus_db', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER2\MSSQL\DATA\NFC_Bus_Db_New.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'NFC_Bus_db_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER2\MSSQL\DATA\NFC_Bus_Db_New_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [NFC_Bus_Db_New] SET COMPATIBILITY_LEVEL = 90
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NFC_Bus_Db_New].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NFC_Bus_Db_New] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [NFC_Bus_Db_New] SET ANSI_NULLS OFF
GO
ALTER DATABASE [NFC_Bus_Db_New] SET ANSI_PADDING OFF
GO
ALTER DATABASE [NFC_Bus_Db_New] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [NFC_Bus_Db_New] SET ARITHABORT OFF
GO
ALTER DATABASE [NFC_Bus_Db_New] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [NFC_Bus_Db_New] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [NFC_Bus_Db_New] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [NFC_Bus_Db_New] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [NFC_Bus_Db_New] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [NFC_Bus_Db_New] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [NFC_Bus_Db_New] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [NFC_Bus_Db_New] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [NFC_Bus_Db_New] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [NFC_Bus_Db_New] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [NFC_Bus_Db_New] SET  DISABLE_BROKER
GO
ALTER DATABASE [NFC_Bus_Db_New] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [NFC_Bus_Db_New] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [NFC_Bus_Db_New] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [NFC_Bus_Db_New] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [NFC_Bus_Db_New] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [NFC_Bus_Db_New] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [NFC_Bus_Db_New] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [NFC_Bus_Db_New] SET  READ_WRITE
GO
ALTER DATABASE [NFC_Bus_Db_New] SET RECOVERY SIMPLE
GO
ALTER DATABASE [NFC_Bus_Db_New] SET  MULTI_USER
GO
ALTER DATABASE [NFC_Bus_Db_New] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [NFC_Bus_Db_New] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'NFC_Bus_Db_New', N'ON'
GO
USE [NFC_Bus_Db_New]
GO
/****** Object:  Table [dbo].[auto_source]    Script Date: 03/23/2016 15:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auto_source](
	[source_id] [int] IDENTITY(1,1) NOT NULL,
	[source] [nvarchar](50) NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[auto_source] ON
INSERT [dbo].[auto_source] ([source_id], [source]) VALUES (1, N'Ghatkopar')
INSERT [dbo].[auto_source] ([source_id], [source]) VALUES (2, N'Vikroli')
INSERT [dbo].[auto_source] ([source_id], [source]) VALUES (3, N'Mulund')
INSERT [dbo].[auto_source] ([source_id], [source]) VALUES (4, N'Thane')
INSERT [dbo].[auto_source] ([source_id], [source]) VALUES (5, N'Kurla')
SET IDENTITY_INSERT [dbo].[auto_source] OFF
/****** Object:  Table [dbo].[auto_destination]    Script Date: 03/23/2016 15:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auto_destination](
	[destination_id] [int] IDENTITY(1,1) NOT NULL,
	[destination] [nvarchar](50) NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[auto_destination] ON
INSERT [dbo].[auto_destination] ([destination_id], [destination]) VALUES (1, N'Ghatkopar')
INSERT [dbo].[auto_destination] ([destination_id], [destination]) VALUES (2, N'Mulund')
INSERT [dbo].[auto_destination] ([destination_id], [destination]) VALUES (3, N'Vikroli')
INSERT [dbo].[auto_destination] ([destination_id], [destination]) VALUES (4, N'Thane')
INSERT [dbo].[auto_destination] ([destination_id], [destination]) VALUES (5, N'Kurla')
SET IDENTITY_INSERT [dbo].[auto_destination] OFF
/****** Object:  Table [dbo].[Admin_login]    Script Date: 03/23/2016 15:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin_login](
	[admin_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Admin_login] ON
INSERT [dbo].[Admin_login] ([admin_id], [username], [password]) VALUES (1, N'admin', N'admin')
SET IDENTITY_INSERT [dbo].[Admin_login] OFF
/****** Object:  Table [dbo].[Passenger_master]    Script Date: 03/23/2016 15:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Passenger_master](
	[passenger_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [nvarchar](50) NULL,
	[middle_name] [nvarchar](50) NULL,
	[last_name] [nvarchar](50) NULL,
	[address] [nvarchar](max) NULL,
	[contact_no] [nvarchar](50) NULL,
	[email_id] [nvarchar](50) NULL,
	[source] [nvarchar](50) NULL,
	[destination] [nvarchar](50) NULL,
	[fare] [int] NULL,
	[balance] [int] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Passenger_master] ON
INSERT [dbo].[Passenger_master] ([passenger_id], [first_name], [middle_name], [last_name], [address], [contact_no], [email_id], [source], [destination], [fare], [balance]) VALUES (2, N'Ninad', N'Satish', N'Samel', N'Dadar', N'0987654321', N'ninnadsamel@gmail.com', NULL, NULL, NULL, 1000)
SET IDENTITY_INSERT [dbo].[Passenger_master] OFF
/****** Object:  Table [dbo].[TC_master]    Script Date: 03/23/2016 15:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TC_master](
	[tc_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [nvarchar](50) NULL,
	[middle_name] [nvarchar](50) NULL,
	[last_name] [nvarchar](50) NULL,
	[username] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[address] [nvarchar](max) NULL,
	[contact_no] [nvarchar](50) NULL,
	[email_id] [nvarchar](50) NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TC_master] ON
INSERT [dbo].[TC_master] ([tc_id], [first_name], [middle_name], [last_name], [username], [password], [address], [contact_no], [email_id]) VALUES (1, N'Ninad', N'Satish', N'samel', N'ninad', N'ninad', N'dadar', N'8082421570', N'ninadsamel@gmail.com')
SET IDENTITY_INSERT [dbo].[TC_master] OFF
/****** Object:  Table [dbo].[Ticket_fare_master]    Script Date: 03/23/2016 15:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket_fare_master](
	[ticket_fare_id] [int] IDENTITY(1,1) NOT NULL,
	[source] [nvarchar](50) NULL,
	[destination] [nvarchar](50) NULL,
	[fare_amount] [int] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Ticket_fare_master] ON
INSERT [dbo].[Ticket_fare_master] ([ticket_fare_id], [source], [destination], [fare_amount]) VALUES (1, N'Ghatkopar', N'Ghatkopar', 5)
INSERT [dbo].[Ticket_fare_master] ([ticket_fare_id], [source], [destination], [fare_amount]) VALUES (2, N'Ghatkopar', N'Vikroli', 10)
INSERT [dbo].[Ticket_fare_master] ([ticket_fare_id], [source], [destination], [fare_amount]) VALUES (3, N'Ghatkopar', N'Mulund', 15)
INSERT [dbo].[Ticket_fare_master] ([ticket_fare_id], [source], [destination], [fare_amount]) VALUES (4, N'Ghatkopar', N'Thane', 20)
INSERT [dbo].[Ticket_fare_master] ([ticket_fare_id], [source], [destination], [fare_amount]) VALUES (5, N'Ghatkopar', N'Kurla', 12)
INSERT [dbo].[Ticket_fare_master] ([ticket_fare_id], [source], [destination], [fare_amount]) VALUES (6, N'Vikroli', N'Ghatkopar', 10)
INSERT [dbo].[Ticket_fare_master] ([ticket_fare_id], [source], [destination], [fare_amount]) VALUES (7, N'Vikroli', N'Vikroli', 5)
INSERT [dbo].[Ticket_fare_master] ([ticket_fare_id], [source], [destination], [fare_amount]) VALUES (8, N'Vikroli', N'Mulund', 10)
INSERT [dbo].[Ticket_fare_master] ([ticket_fare_id], [source], [destination], [fare_amount]) VALUES (9, N'Vikroli', N'Thane', 15)
INSERT [dbo].[Ticket_fare_master] ([ticket_fare_id], [source], [destination], [fare_amount]) VALUES (10, N'Vikroli', N'Kurla', 15)
INSERT [dbo].[Ticket_fare_master] ([ticket_fare_id], [source], [destination], [fare_amount]) VALUES (11, N'Mulund', N'Ghatkopar', 15)
INSERT [dbo].[Ticket_fare_master] ([ticket_fare_id], [source], [destination], [fare_amount]) VALUES (12, N'Mulund', N'Vikroli', 10)
INSERT [dbo].[Ticket_fare_master] ([ticket_fare_id], [source], [destination], [fare_amount]) VALUES (13, N'Mulund', N'Mulund', 5)
INSERT [dbo].[Ticket_fare_master] ([ticket_fare_id], [source], [destination], [fare_amount]) VALUES (14, N'Mulund ', N'Thane', 10)
INSERT [dbo].[Ticket_fare_master] ([ticket_fare_id], [source], [destination], [fare_amount]) VALUES (15, N'Mulund ', N'Kurla', 20)
INSERT [dbo].[Ticket_fare_master] ([ticket_fare_id], [source], [destination], [fare_amount]) VALUES (16, N'Thane', N'Ghatkopar', 20)
INSERT [dbo].[Ticket_fare_master] ([ticket_fare_id], [source], [destination], [fare_amount]) VALUES (17, N'Thane', N'Vikroli', 15)
INSERT [dbo].[Ticket_fare_master] ([ticket_fare_id], [source], [destination], [fare_amount]) VALUES (18, N'Thane', N'Mulund', 10)
INSERT [dbo].[Ticket_fare_master] ([ticket_fare_id], [source], [destination], [fare_amount]) VALUES (19, N'Thane', N'Thane', 5)
INSERT [dbo].[Ticket_fare_master] ([ticket_fare_id], [source], [destination], [fare_amount]) VALUES (20, N'Thane', N'Kurla', 20)
INSERT [dbo].[Ticket_fare_master] ([ticket_fare_id], [source], [destination], [fare_amount]) VALUES (21, N'Kurla', N'Ghatkopar', 10)
INSERT [dbo].[Ticket_fare_master] ([ticket_fare_id], [source], [destination], [fare_amount]) VALUES (22, N'Kurla', N'Vikroli', 15)
INSERT [dbo].[Ticket_fare_master] ([ticket_fare_id], [source], [destination], [fare_amount]) VALUES (23, N'Kurla', N'Mulund', 20)
INSERT [dbo].[Ticket_fare_master] ([ticket_fare_id], [source], [destination], [fare_amount]) VALUES (24, N'Kurla', N'Thane', 20)
INSERT [dbo].[Ticket_fare_master] ([ticket_fare_id], [source], [destination], [fare_amount]) VALUES (25, N'Kurla', N'Kurla', 5)
INSERT [dbo].[Ticket_fare_master] ([ticket_fare_id], [source], [destination], [fare_amount]) VALUES (28, N'hh', N'jj', 6)
SET IDENTITY_INSERT [dbo].[Ticket_fare_master] OFF
/****** Object:  Table [dbo].[Conductor_master]    Script Date: 03/23/2016 15:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Conductor_master](
	[conductor_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [nvarchar](50) NULL,
	[middle_name] [nvarchar](50) NULL,
	[last_name] [nvarchar](50) NULL,
	[username] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[address] [nvarchar](max) NULL,
	[contact_no] [nvarchar](50) NULL,
	[email_id] [nvarchar](50) NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Conductor_master] ON
INSERT [dbo].[Conductor_master] ([conductor_id], [first_name], [middle_name], [last_name], [username], [password], [address], [contact_no], [email_id]) VALUES (1, N'Ninad', N'Satish', N'samel', N'ninad', N'ninad', N'dadar', N'8082421570', N'ninadsamel@gmail.com')
INSERT [dbo].[Conductor_master] ([conductor_id], [first_name], [middle_name], [last_name], [username], [password], [address], [contact_no], [email_id]) VALUES (2, N'Manoj', N'Satish', N'jagtap', N'manoj', N'manoj', N'goregaon', N'7373737373', N'manoj@gmail.com')
SET IDENTITY_INSERT [dbo].[Conductor_master] OFF
/****** Object:  Table [dbo].[Transaction_master]    Script Date: 03/23/2016 15:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction_master](
	[t_id] [int] IDENTITY(1,1) NOT NULL,
	[passenger_id] [int] NULL,
	[t_date] [datetime] NULL,
	[source] [nvarchar](50) NULL,
	[destination] [nvarchar](50) NULL,
	[fare] [int] NULL,
	[Qty] [int] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Transaction_master] ON
INSERT [dbo].[Transaction_master] ([t_id], [passenger_id], [t_date], [source], [destination], [fare], [Qty]) VALUES (1, 2, CAST(0x0000A29200000000 AS DateTime), N'dombivli', N'dadar', 20, 1)
INSERT [dbo].[Transaction_master] ([t_id], [passenger_id], [t_date], [source], [destination], [fare], [Qty]) VALUES (2, 2, CAST(0x0000A1F400000000 AS DateTime), N'dadar', N'thane', 20, 1)
INSERT [dbo].[Transaction_master] ([t_id], [passenger_id], [t_date], [source], [destination], [fare], [Qty]) VALUES (3, 2, CAST(0x0000A21400000000 AS DateTime), N'mahim', N'Borivli', 30, 1)
INSERT [dbo].[Transaction_master] ([t_id], [passenger_id], [t_date], [source], [destination], [fare], [Qty]) VALUES (4, 2, CAST(0x0000A29300000000 AS DateTime), N'dadar', N'vashi', 30, 1)
SET IDENTITY_INSERT [dbo].[Transaction_master] OFF
/****** Object:  StoredProcedure [dbo].[ticket_fare_update]    Script Date: 03/23/2016 15:35:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ticket_fare_update]
@ticket_fare_id int,
@source nvarchar(50),
@destination nvarchar(50),
@fare_amount nvarchar(50)
AS
BEGIN
	update Ticket_fare_master set source=@source,destination=@destination,fare_amount=@fare_amount
	where ticket_fare_id=@ticket_fare_id
END
GO
/****** Object:  StoredProcedure [dbo].[ticket_fare_select]    Script Date: 03/23/2016 15:35:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ticket_fare_select]
@ticket_fare_id int
AS
BEGIN
	select * from Ticket_fare_master where ticket_fare_id=@ticket_fare_id
END
GO
/****** Object:  StoredProcedure [dbo].[conductor_insert]    Script Date: 03/23/2016 15:35:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[conductor_insert]
	@first_name nvarchar(50),
	@middle_name nvarchar(50),
	@last_name	nvarchar(50),
	@username nvarchar(50),
	@password nvarchar(50),
	@address nvarchar(200),
	@contact_no nvarchar(50),
	@email_id nvarchar(50)
AS
BEGIN
	Insert into Conductor_master(first_name, middle_name, last_name, username, password, address, contact_no, email_id) 
	values(@first_name, @middle_name, @last_name, @username, @password, @address, @contact_no, @email_id ) 
END
GO
/****** Object:  StoredProcedure [dbo].[conductor_delete]    Script Date: 03/23/2016 15:35:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[conductor_delete]
@conductor_id int
AS
BEGIN
	delete from Conductor_master where conductor_id=@conductor_id
END
GO
/****** Object:  StoredProcedure [dbo].[ticket_fare_insert]    Script Date: 03/23/2016 15:35:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ticket_fare_insert]
@source nvarchar(50),
@destination nvarchar(50),
@fare_amount nvarchar(50)
AS
BEGIN
insert into Ticket_fare_master(source,destination,fare_amount)
values(@source,@destination,@fare_amount)
END
GO
/****** Object:  StoredProcedure [dbo].[ticket_fare_delete]    Script Date: 03/23/2016 15:35:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ticket_fare_delete]
@ticket_fare_id int
AS
BEGIN
	delete from Ticket_fare_master where ticket_fare_id=@ticket_fare_id
END
GO
/****** Object:  StoredProcedure [dbo].[tc_update]    Script Date: 03/23/2016 15:35:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tc_update]
@tc_id int,
@first_name nvarchar(50),
@middle_name nvarchar(50),
@last_name nvarchar(50),
@address nvarchar(max),
@contact_no nvarchar(10),
@email_id nvarchar(200)
AS
BEGIN
	update TC_master set first_name=@first_name, middle_name=@middle_name, last_name=@last_name,address=@address,contact_no=@contact_no, email_id=@email_id where tc_id=@tc_id
END
GO
/****** Object:  StoredProcedure [dbo].[tc_select]    Script Date: 03/23/2016 15:35:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tc_select]
@tc_id int
AS
BEGIN
	select * from TC_master where tc_id=@tc_id
END
GO
/****** Object:  StoredProcedure [dbo].[tc_insert]    Script Date: 03/23/2016 15:35:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tc_insert]
@first_name nvarchar(50),
	@middle_name nvarchar(50),
	@last_name	nvarchar(50),
	@username nvarchar(50),
	@password nvarchar(50),
	@address nvarchar(200),
	@contact_no nvarchar(50),
	@email_id nvarchar(50)
AS
BEGIN
	Insert into TC_master(first_name, middle_name, last_name, username, password, address, contact_no, email_id) 
	values(@first_name, @middle_name, @last_name, @username, @password, @address, @contact_no, @email_id ) 
END
GO
/****** Object:  StoredProcedure [dbo].[tc_delete]    Script Date: 03/23/2016 15:35:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[tc_delete]
@tc_id int
AS
BEGIN
	delete from TC_master where tc_id=@tc_id
END
GO
/****** Object:  StoredProcedure [dbo].[passenger_update]    Script Date: 03/23/2016 15:35:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[passenger_update]
(
@passenger_id int,
@first_name nvarchar(50),
@middle_name nvarchar(50),
@last_name nvarchar(50),
@address nvarchar(max),
@contact_no nvarchar(10),
@email_id nvarchar(200),
@source nvarchar(50),
@destination nvarchar(50),
@balance int,
@fare int
)
AS
BEGIN
	update passenger_master set first_name=@first_name, middle_name=@middle_name, last_name=@last_name,address=@address, contact_no=@contact_no, email_id=@email_id,source =@source, destination=@destination,balance=@balance,fare=@fare where passenger_id=@passenger_id
END
GO
/****** Object:  StoredProcedure [dbo].[passenger_select]    Script Date: 03/23/2016 15:35:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[passenger_select]
@passenger_id int
AS
BEGIN
	select * from Passenger_master where passenger_id=@passenger_id
END
GO
/****** Object:  StoredProcedure [dbo].[passenger_insert]    Script Date: 03/23/2016 15:35:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[passenger_insert]
@first_name nvarchar(50),
	@middle_name nvarchar(50),
	@last_name	nvarchar(50),
	
	@address nvarchar(200),
	@contact_no nvarchar(50),
	@email_id nvarchar(50),
	@source nvarchar(50),
	@destination nvarchar(50),
	@balance nvarchar(50),
	@fare nvarchar(50)
AS
BEGIN
	Insert into passenger_master(first_name, middle_name, last_name,  address, contact_no, email_id,source, destination, balance, fare ) 
	values(@first_name, @middle_name, @last_name,  @address, @contact_no, @email_id, @source, @destination,@balance, @fare) 
END
GO
/****** Object:  StoredProcedure [dbo].[passenger_delete]    Script Date: 03/23/2016 15:35:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[passenger_delete]
@passenger_id int
AS
BEGIN
	delete from Passenger_master where passenger_id=@passenger_id
END
GO
/****** Object:  StoredProcedure [dbo].[insert_transaction]    Script Date: 03/23/2016 15:35:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[insert_transaction]
(
@p_id int,
@date datetime,
@source nvarchar(50),
@destination nvarchar(50),
@fare int,
@qty int
)	
AS
BEGIN
	insert into Transaction_master(passenger_id, t_date, source, destination, fare,qty)values(@p_id,@date,@source,@destination,@fare,@qty)
END
GO
/****** Object:  StoredProcedure [dbo].[conductor_update]    Script Date: 03/23/2016 15:35:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[conductor_update]
(
@conductor_id int,
@first_name nvarchar(50),
@middle_name nvarchar(50),
@last_name nvarchar(50),
@address nvarchar(max),
@contact_no nvarchar(10),
@email_id nvarchar(200),
@password nvarchar(50)

)
AS
BEGIN
	update Conductor_master set first_name=@first_name, middle_name=@middle_name, last_name=@last_name,address=@address,contact_no=@contact_no, email_id=@email_id,password=@password where conductor_id=@conductor_id
END
GO
/****** Object:  StoredProcedure [dbo].[conductor_select]    Script Date: 03/23/2016 15:35:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[conductor_select]
@conductor_id int
AS
BEGIN
	select * from Conductor_master where conductor_id=@conductor_id
END
GO

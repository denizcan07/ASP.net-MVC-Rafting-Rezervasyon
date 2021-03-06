USE [master]
GO
/****** Object:  Database [vt]    Script Date: 15.04.2021 13:02:14 ******/
CREATE DATABASE [vt]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'vt', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS02\MSSQL\DATA\vt.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'vt_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS02\MSSQL\DATA\vt_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [vt] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [vt].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [vt] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [vt] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [vt] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [vt] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [vt] SET ARITHABORT OFF 
GO
ALTER DATABASE [vt] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [vt] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [vt] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [vt] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [vt] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [vt] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [vt] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [vt] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [vt] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [vt] SET  ENABLE_BROKER 
GO
ALTER DATABASE [vt] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [vt] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [vt] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [vt] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [vt] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [vt] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [vt] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [vt] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [vt] SET  MULTI_USER 
GO
ALTER DATABASE [vt] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [vt] SET DB_CHAINING OFF 
GO
ALTER DATABASE [vt] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [vt] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [vt] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [vt] SET QUERY_STORE = OFF
GO
USE [vt]
GO
/****** Object:  Table [dbo].[Müsterikayıt]    Script Date: 15.04.2021 13:02:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Müsterikayıt](
	[Mno] [int] NOT NULL,
	[Tc] [nchar](11) NULL,
	[Ad] [nvarchar](50) NULL,
	[Soyad] [nvarchar](50) NULL,
	[Telefon] [nchar](11) NULL,
	[Email] [nvarchar](50) NULL,
	[Reztarih] [datetime] NULL,
	[Kisisayı] [nchar](3) NULL,
 CONSTRAINT [PK__Müsterik__C797C0398DE6CBCB] PRIMARY KEY CLUSTERED 
(
	[Mno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Görevli]    Script Date: 15.04.2021 13:02:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Görevli](
	[Gno] [int] NOT NULL,
	[Gad] [nvarchar](50) NULL,
	[Gsoyad] [nvarchar](50) NULL,
	[Gcinsiyet] [char](20) NULL,
	[Gtelefon] [nchar](11) NULL,
	[Gemail] [nvarchar](50) NULL,
	[Gmaaş] [nchar](4) NULL,
 CONSTRAINT [PK__Görevli__C51FB5ADBBB69BC7] PRIMARY KEY CLUSTERED 
(
	[Gno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gruplar]    Script Date: 15.04.2021 13:02:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gruplar](
	[Grupno] [int] NOT NULL,
	[Raftingtür] [nvarchar](50) NULL,
	[Gno] [int] NULL,
 CONSTRAINT [PK__Gruplar__811254CE5D35DC1E] PRIMARY KEY CLUSTERED 
(
	[Grupno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lokanta]    Script Date: 15.04.2021 13:02:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lokanta](
	[Yemekno] [int] NOT NULL,
	[Yemektürü] [nvarchar](30) NOT NULL,
	[Ücret] [nchar](4) NULL,
 CONSTRAINT [PK__Lokanta__4A931709C6839EBF] PRIMARY KEY CLUSTERED 
(
	[Yemekno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rezbilgi]    Script Date: 15.04.2021 13:02:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rezbilgi](
	[Rezno] [nchar](5) NOT NULL,
	[Mno] [int] NOT NULL,
	[Yemekno] [int] NOT NULL,
	[Grupno] [int] NOT NULL,
	[Raftingücret] [nchar](4) NOT NULL,
 CONSTRAINT [PK__Rezbilgi__D0FA5EBA4E927113] PRIMARY KEY CLUSTERED 
(
	[Rezno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Müsterikayıt] ([Mno], [Tc], [Ad], [Soyad], [Telefon], [Email], [Reztarih], [Kisisayı]) VALUES (24, N'29899040799', N'Aslıcan', N'TOŞUR', N'5387456855 ', N'deniz@gmail.com', CAST(N'2020-05-01T00:00:00.000' AS DateTime), N'10 ')
INSERT [dbo].[Müsterikayıt] ([Mno], [Tc], [Ad], [Soyad], [Telefon], [Email], [Reztarih], [Kisisayı]) VALUES (25, N'29899040775', N'Kemal', N'Can', N'5387456857 ', N'kemal@gmail.com', CAST(N'2020-01-03T00:00:00.000' AS DateTime), N'55 ')
INSERT [dbo].[Müsterikayıt] ([Mno], [Tc], [Ad], [Soyad], [Telefon], [Email], [Reztarih], [Kisisayı]) VALUES (27, N'29899040785', N'Ahmet', N'Can', N'5387456887 ', N'ahmet@gmail.com', CAST(N'2020-01-04T00:00:00.000' AS DateTime), N'22 ')
INSERT [dbo].[Müsterikayıt] ([Mno], [Tc], [Ad], [Soyad], [Telefon], [Email], [Reztarih], [Kisisayı]) VALUES (29, N'29899040737', N'Derya', N'Can', N'5387456859 ', N'derya@gmail.com', CAST(N'2020-08-03T00:00:00.000' AS DateTime), N'5  ')
INSERT [dbo].[Müsterikayıt] ([Mno], [Tc], [Ad], [Soyad], [Telefon], [Email], [Reztarih], [Kisisayı]) VALUES (30, N'29899040779', N'Ali', N'Can', N'5387456825 ', N'ali@gmail.com', CAST(N'2020-09-06T00:00:00.000' AS DateTime), N'90 ')
INSERT [dbo].[Müsterikayıt] ([Mno], [Tc], [Ad], [Soyad], [Telefon], [Email], [Reztarih], [Kisisayı]) VALUES (31, N'29899040705', N'Ümit', N'Can', N'5387456840 ', N'ümit@gmail.com', CAST(N'2020-04-05T00:00:00.000' AS DateTime), N'55 ')
INSERT [dbo].[Müsterikayıt] ([Mno], [Tc], [Ad], [Soyad], [Telefon], [Email], [Reztarih], [Kisisayı]) VALUES (38, N'29899040050', N'Hasan Ali', N'TOSUN', N'05425874127', N'tosun@gmail.com', CAST(N'2020-09-10T00:00:00.000' AS DateTime), N'160')
INSERT [dbo].[Müsterikayıt] ([Mno], [Tc], [Ad], [Soyad], [Telefon], [Email], [Reztarih], [Kisisayı]) VALUES (77, N'12345678919', N'kaya', N'şş', N'05693235478', N'vj@gmail.com', CAST(N'2020-08-22T01:06:48.000' AS DateTime), N'88 ')
INSERT [dbo].[Müsterikayıt] ([Mno], [Tc], [Ad], [Soyad], [Telefon], [Email], [Reztarih], [Kisisayı]) VALUES (85, N'29899040779', N'Hasan', N'Can', N'5387456825 ', N'deniz@gmail.com', CAST(N'2020-09-06T00:00:00.000' AS DateTime), N'90 ')
INSERT [dbo].[Müsterikayıt] ([Mno], [Tc], [Ad], [Soyad], [Telefon], [Email], [Reztarih], [Kisisayı]) VALUES (98, N'29899040715', N'Mert Can', N'TOŞUR', N'5387456845 ', N'mertcan@gmail.com', CAST(N'2020-05-05T00:00:00.000' AS DateTime), N'130')
INSERT [dbo].[Müsterikayıt] ([Mno], [Tc], [Ad], [Soyad], [Telefon], [Email], [Reztarih], [Kisisayı]) VALUES (99, N'20567535467', N'Ayşe Nilüfer', N'Tosuncu', N'05374569857', N'aysenil@hotmail.com', CAST(N'2020-07-05T13:16:59.000' AS DateTime), N'800')
INSERT [dbo].[Müsterikayıt] ([Mno], [Tc], [Ad], [Soyad], [Telefon], [Email], [Reztarih], [Kisisayı]) VALUES (100, N'23585478652', N'Murat', N'Direk', N'05398521485', N'murat@gmail.com', CAST(N'2020-11-05T13:16:59.000' AS DateTime), N'11 ')
INSERT [dbo].[Müsterikayıt] ([Mno], [Tc], [Ad], [Soyad], [Telefon], [Email], [Reztarih], [Kisisayı]) VALUES (120, N'30574589652', N'Volkan', N'Korkmaz', N'05987458963', N'volkan@gmail.com', CAST(N'2020-10-02T13:16:59.000' AS DateTime), N'70 ')
INSERT [dbo].[Müsterikayıt] ([Mno], [Tc], [Ad], [Soyad], [Telefon], [Email], [Reztarih], [Kisisayı]) VALUES (121, N'20567535467', N'Ayşe Nilüfer', N'Tosuncu', N'05374569857', N'aysenil@hotmail.com', CAST(N'2020-07-05T13:16:59.000' AS DateTime), N'800')
INSERT [dbo].[Müsterikayıt] ([Mno], [Tc], [Ad], [Soyad], [Telefon], [Email], [Reztarih], [Kisisayı]) VALUES (130, N'28785247852', N'İbrahim', N'Avşar', N'05387415896', N'ibrahim@gmail.com', CAST(N'2020-04-01T00:00:00.000' AS DateTime), N'300')
INSERT [dbo].[Müsterikayıt] ([Mno], [Tc], [Ad], [Soyad], [Telefon], [Email], [Reztarih], [Kisisayı]) VALUES (140, N'28745874589', N'Selin', N'Kayacı', N'05389654785', N'selin@gmail.com', CAST(N'2020-06-10T00:00:00.000' AS DateTime), N'33 ')
INSERT [dbo].[Müsterikayıt] ([Mno], [Tc], [Ad], [Soyad], [Telefon], [Email], [Reztarih], [Kisisayı]) VALUES (200, N'40585214785', N'Mesut', N'Uysal', N'5687415896 ', N'mesut@gmail.com', CAST(N'2020-12-02T13:16:59.000' AS DateTime), N'78 ')
INSERT [dbo].[Müsterikayıt] ([Mno], [Tc], [Ad], [Soyad], [Telefon], [Email], [Reztarih], [Kisisayı]) VALUES (223, N'23454325678', N'Göksel', N'TOŞUR', N'05435874596', N'göksel@gmail.com', CAST(N'2020-06-27T00:00:00.000' AS DateTime), N'2  ')
INSERT [dbo].[Müsterikayıt] ([Mno], [Tc], [Ad], [Soyad], [Telefon], [Email], [Reztarih], [Kisisayı]) VALUES (255, N'28574585478', N'Alican', N'Keskinli', N'05387458596', N'alican@gmail.com', CAST(N'2020-05-03T00:00:00.000' AS DateTime), N'55 ')
INSERT [dbo].[Müsterikayıt] ([Mno], [Tc], [Ad], [Soyad], [Telefon], [Email], [Reztarih], [Kisisayı]) VALUES (288, N'28574895632', N'Hasan', N'Kale', N'05385412585', N'hasan@gmail.com', CAST(N'2020-08-15T00:00:00.000' AS DateTime), N'44 ')
GO
INSERT [dbo].[Görevli] ([Gno], [Gad], [Gsoyad], [Gcinsiyet], [Gtelefon], [Gemail], [Gmaaş]) VALUES (1, N'Deniz', N'Resul', N'Erkek               ', N'05387456985', N'DR@gmail.com', N'1500')
INSERT [dbo].[Görevli] ([Gno], [Gad], [Gsoyad], [Gcinsiyet], [Gtelefon], [Gemail], [Gmaaş]) VALUES (3, N'Resul', N'Aslan', N'Erkek               ', N'05387459632', N'Resul@gmail.com', N'1800')
INSERT [dbo].[Görevli] ([Gno], [Gad], [Gsoyad], [Gcinsiyet], [Gtelefon], [Gemail], [Gmaaş]) VALUES (6, N'Ayşe', N'Nil', N'Kadın               ', N'05354569654', N'Ayşe@outlook.com', N'1500')
INSERT [dbo].[Görevli] ([Gno], [Gad], [Gsoyad], [Gcinsiyet], [Gtelefon], [Gemail], [Gmaaş]) VALUES (7, N'Mustafa', N'Aktan', N'Erkek               ', N'05354568596', N'mustafa@gmail.com', N'1400')
GO
INSERT [dbo].[Gruplar] ([Grupno], [Raftingtür], [Gno]) VALUES (1, N'Bot', 1)
INSERT [dbo].[Gruplar] ([Grupno], [Raftingtür], [Gno]) VALUES (5, N'Kano', 3)
INSERT [dbo].[Gruplar] ([Grupno], [Raftingtür], [Gno]) VALUES (8, N'Safari Tur', 6)
GO
INSERT [dbo].[Lokanta] ([Yemekno], [Yemektürü], [Ücret]) VALUES (1, N'Balık Menü', N'20  ')
INSERT [dbo].[Lokanta] ([Yemekno], [Yemektürü], [Ücret]) VALUES (2, N'Tavuk Menü', N'17  ')
INSERT [dbo].[Lokanta] ([Yemekno], [Yemektürü], [Ücret]) VALUES (3, N'Hamburger Menü', N'15  ')
INSERT [dbo].[Lokanta] ([Yemekno], [Yemektürü], [Ücret]) VALUES (10, N'Çorba', N'19  ')
GO
ALTER TABLE [dbo].[Gruplar]  WITH CHECK ADD  CONSTRAINT [FK__Gruplar__Gno__52593CB8] FOREIGN KEY([Gno])
REFERENCES [dbo].[Görevli] ([Gno])
GO
ALTER TABLE [dbo].[Gruplar] CHECK CONSTRAINT [FK__Gruplar__Gno__52593CB8]
GO
ALTER TABLE [dbo].[Rezbilgi]  WITH CHECK ADD  CONSTRAINT [FK__Rezbilgi__Grupno__71D1E811] FOREIGN KEY([Grupno])
REFERENCES [dbo].[Gruplar] ([Grupno])
GO
ALTER TABLE [dbo].[Rezbilgi] CHECK CONSTRAINT [FK__Rezbilgi__Grupno__71D1E811]
GO
ALTER TABLE [dbo].[Rezbilgi]  WITH CHECK ADD  CONSTRAINT [FK__Rezbilgi__Mno__6FE99F9F] FOREIGN KEY([Mno])
REFERENCES [dbo].[Müsterikayıt] ([Mno])
GO
ALTER TABLE [dbo].[Rezbilgi] CHECK CONSTRAINT [FK__Rezbilgi__Mno__6FE99F9F]
GO
ALTER TABLE [dbo].[Rezbilgi]  WITH CHECK ADD  CONSTRAINT [FK__Rezbilgi__Yemekn__70DDC3D8] FOREIGN KEY([Yemekno])
REFERENCES [dbo].[Lokanta] ([Yemekno])
GO
ALTER TABLE [dbo].[Rezbilgi] CHECK CONSTRAINT [FK__Rezbilgi__Yemekn__70DDC3D8]
GO
/****** Object:  StoredProcedure [dbo].[ekle]    Script Date: 15.04.2021 13:02:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ekle]
@Mno nchar(5),
@Tc nchar(11),
@Ad nvarchar(50),
@Soyad nvarchar(50),
@Telefon nchar(11),
@Email nvarchar(50),
@Reztarih datetime,
@Kisisayı nchar(3)
As

Insert into Müsterikayıt(Mno,Tc,Ad,Soyad,Telefon,Email,Reztarih,Kisisayı)
values(@Mno,@Tc,@Ad,@Soyad,@Telefon,@Email,@Reztarih,@Kisisayı)
GO
/****** Object:  StoredProcedure [dbo].[göster]    Script Date: 15.04.2021 13:02:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[göster]

As
Select*From Müsterikayıt 
order by Reztarih asc;
GO
/****** Object:  StoredProcedure [dbo].[güncelleme]    Script Date: 15.04.2021 13:02:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[güncelleme]
(
@Mno nchar(5),
@Tc nchar(11),
@Ad nvarchar(50),
@Soyad nvarchar(50),
@Telefon nchar(11),
@Email nvarchar(50),
@Reztarih datetime,
@Kisisayı nchar(3)
)
as
update Müsterikayıt set Tc=@Tc, Ad=@Ad,Soyad=@Soyad, Telefon=@Telefon,Email=@Email, Reztarih=@Reztarih,Kisisayı=@Kisisayı where Mno=@Mno 
GO
/****** Object:  StoredProcedure [dbo].[silme]    Script Date: 15.04.2021 13:02:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[silme]
@Mno nchar(5)
as
delete from Müsterikayıt where Mno=@Mno
GO
USE [master]
GO
ALTER DATABASE [vt] SET  READ_WRITE 
GO

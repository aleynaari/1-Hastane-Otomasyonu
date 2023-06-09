USE [master]
GO
/****** Object:  Database [Hastane]    Script Date: 27.04.2023 15:33:57 ******/
CREATE DATABASE [Hastane]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Hastane', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Hastane.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Hastane_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Hastane_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Hastane] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Hastane].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Hastane] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Hastane] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Hastane] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Hastane] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Hastane] SET ARITHABORT OFF 
GO
ALTER DATABASE [Hastane] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Hastane] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Hastane] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Hastane] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Hastane] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Hastane] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Hastane] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Hastane] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Hastane] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Hastane] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Hastane] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Hastane] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Hastane] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Hastane] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Hastane] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Hastane] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Hastane] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Hastane] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Hastane] SET  MULTI_USER 
GO
ALTER DATABASE [Hastane] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Hastane] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Hastane] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Hastane] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Hastane] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Hastane] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Hastane] SET QUERY_STORE = ON
GO
ALTER DATABASE [Hastane] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Hastane]
GO
/****** Object:  Table [dbo].[Doktorlar]    Script Date: 27.04.2023 15:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doktorlar](
	[DNo] [int] IDENTITY(1,1) NOT NULL,
	[DAdSoyad] [varchar](50) NULL,
	[UzmanAlan] [varchar](50) NULL,
	[PoliNo] [int] NULL,
 CONSTRAINT [PK_Doktorlar] PRIMARY KEY CLUSTERED 
(
	[DNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hastalar]    Script Date: 27.04.2023 15:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hastalar](
	[HastaNo] [int] IDENTITY(1,1) NOT NULL,
	[HastaAdSoyad] [varchar](50) NULL,
	[HastaTC] [int] NULL,
	[HastaDogumTarihi] [datetime] NULL,
	[RandevuTime] [datetime] NULL,
	[DoctorNo] [int] NULL,
	[Reçete] [int] NULL,
	[PNo] [int] NULL,
 CONSTRAINT [PK_Hastalar] PRIMARY KEY CLUSTERED 
(
	[HastaNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kullanici]    Script Date: 27.04.2023 15:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kullanici](
	[KullaniciNo] [int] IDENTITY(1,1) NOT NULL,
	[KullaniciAd] [varchar](50) NULL,
	[KullaniciSifre] [varchar](50) NULL,
	[KullaniciMail] [varchar](50) NULL,
	[KullaniciTelefon] [int] NULL,
	[DNo] [int] NULL,
 CONSTRAINT [PK_Kullanici] PRIMARY KEY CLUSTERED 
(
	[KullaniciNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Poliklinikler]    Script Date: 27.04.2023 15:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Poliklinikler](
	[PNo] [int] IDENTITY(1,1) NOT NULL,
	[PoliAd] [varchar](50) NULL,
	[PoliBaskan] [varchar](50) NULL,
	[PoliHemsire] [varchar](50) NULL,
	[YatakSayisi] [int] NULL,
	[DNo] [int] NULL,
	[HastaNo] [int] NULL,
 CONSTRAINT [PK_Poliklinikler] PRIMARY KEY CLUSTERED 
(
	[PNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Doktorlar] ON 

INSERT [dbo].[Doktorlar] ([DNo], [DAdSoyad], [UzmanAlan], [PoliNo]) VALUES (1, N'Mustafa Kara', N'Dahiliye', 1)
INSERT [dbo].[Doktorlar] ([DNo], [DAdSoyad], [UzmanAlan], [PoliNo]) VALUES (2, N'Alya Yılmaz ', N'KBB', 6)
INSERT [dbo].[Doktorlar] ([DNo], [DAdSoyad], [UzmanAlan], [PoliNo]) VALUES (3, N'Duygu Koç', N'Psikiyatri', 8)
INSERT [dbo].[Doktorlar] ([DNo], [DAdSoyad], [UzmanAlan], [PoliNo]) VALUES (4, N'Aslı Kaya', N'Dahiliye', 1)
INSERT [dbo].[Doktorlar] ([DNo], [DAdSoyad], [UzmanAlan], [PoliNo]) VALUES (5, N'Sergen Ateş', N'Psikiyatri', 3)
INSERT [dbo].[Doktorlar] ([DNo], [DAdSoyad], [UzmanAlan], [PoliNo]) VALUES (6, N'Aydan Yücel', N'Psikolog', 4)
INSERT [dbo].[Doktorlar] ([DNo], [DAdSoyad], [UzmanAlan], [PoliNo]) VALUES (7, N'Ayşe Gün', N'Nöroloji', 9)
INSERT [dbo].[Doktorlar] ([DNo], [DAdSoyad], [UzmanAlan], [PoliNo]) VALUES (8, N'Ali Veli', N'KBB', 6)
INSERT [dbo].[Doktorlar] ([DNo], [DAdSoyad], [UzmanAlan], [PoliNo]) VALUES (11, N'Feyyaz Keskin', N'Çocuk Po', 10)
SET IDENTITY_INSERT [dbo].[Doktorlar] OFF
GO
SET IDENTITY_INSERT [dbo].[Hastalar] ON 

INSERT [dbo].[Hastalar] ([HastaNo], [HastaAdSoyad], [HastaTC], [HastaDogumTarihi], [RandevuTime], [DoctorNo], [Reçete], [PNo]) VALUES (1, N'Mustafa Özen', 78945678, CAST(N'1985-02-12T00:00:00.000' AS DateTime), CAST(N'2023-05-22T00:00:00.000' AS DateTime), 6, 254, 1)
INSERT [dbo].[Hastalar] ([HastaNo], [HastaAdSoyad], [HastaTC], [HastaDogumTarihi], [RandevuTime], [DoctorNo], [Reçete], [PNo]) VALUES (3, N'Kemal Sezen', 8531, CAST(N'1994-05-18T00:00:00.000' AS DateTime), NULL, 3, NULL, 6)
INSERT [dbo].[Hastalar] ([HastaNo], [HastaAdSoyad], [HastaTC], [HastaDogumTarihi], [RandevuTime], [DoctorNo], [Reçete], [PNo]) VALUES (4, N'Fatma Gün', 7853138, CAST(N'1996-11-20T00:00:00.000' AS DateTime), NULL, 1, NULL, 4)
INSERT [dbo].[Hastalar] ([HastaNo], [HastaAdSoyad], [HastaTC], [HastaDogumTarihi], [RandevuTime], [DoctorNo], [Reçete], [PNo]) VALUES (5, N'Ali Kara', 7854213, CAST(N'1980-02-11T00:00:00.000' AS DateTime), NULL, 4, NULL, 1)
INSERT [dbo].[Hastalar] ([HastaNo], [HastaAdSoyad], [HastaTC], [HastaDogumTarihi], [RandevuTime], [DoctorNo], [Reçete], [PNo]) VALUES (6, N'Burcu Güneş', 5851331, CAST(N'1990-09-05T00:00:00.000' AS DateTime), NULL, 7, NULL, 8)
INSERT [dbo].[Hastalar] ([HastaNo], [HastaAdSoyad], [HastaTC], [HastaDogumTarihi], [RandevuTime], [DoctorNo], [Reçete], [PNo]) VALUES (7, N'Murat Boz', 8795414, CAST(N'1975-08-17T00:00:00.000' AS DateTime), NULL, 2, NULL, 9)
INSERT [dbo].[Hastalar] ([HastaNo], [HastaAdSoyad], [HastaTC], [HastaDogumTarihi], [RandevuTime], [DoctorNo], [Reçete], [PNo]) VALUES (8, N'Ayşegül Kaş', 654132, CAST(N'1965-12-16T00:00:00.000' AS DateTime), NULL, 2, NULL, 1)
INSERT [dbo].[Hastalar] ([HastaNo], [HastaAdSoyad], [HastaTC], [HastaDogumTarihi], [RandevuTime], [DoctorNo], [Reçete], [PNo]) VALUES (9, N'Fatma Keskin', 756131021, CAST(N'2000-04-01T00:00:00.000' AS DateTime), CAST(N'2023-04-17T00:00:00.000' AS DateTime), 3, 7568, 9)
INSERT [dbo].[Hastalar] ([HastaNo], [HastaAdSoyad], [HastaTC], [HastaDogumTarihi], [RandevuTime], [DoctorNo], [Reçete], [PNo]) VALUES (14, N'gülhan Keskin', 123111, CAST(N'1989-06-14T00:00:00.000' AS DateTime), CAST(N'2023-04-17T00:00:00.000' AS DateTime), 3, 123, 1)
SET IDENTITY_INSERT [dbo].[Hastalar] OFF
GO
SET IDENTITY_INSERT [dbo].[Kullanici] ON 

INSERT [dbo].[Kullanici] ([KullaniciNo], [KullaniciAd], [KullaniciSifre], [KullaniciMail], [KullaniciTelefon], [DNo]) VALUES (1, N'asli.kaya', N'987456', NULL, NULL, 4)
INSERT [dbo].[Kullanici] ([KullaniciNo], [KullaniciAd], [KullaniciSifre], [KullaniciMail], [KullaniciTelefon], [DNo]) VALUES (2, N'duygu.koç', N'123589', NULL, NULL, 3)
INSERT [dbo].[Kullanici] ([KullaniciNo], [KullaniciAd], [KullaniciSifre], [KullaniciMail], [KullaniciTelefon], [DNo]) VALUES (3, N'alya.yılmaz', N'58412', NULL, NULL, 2)
INSERT [dbo].[Kullanici] ([KullaniciNo], [KullaniciAd], [KullaniciSifre], [KullaniciMail], [KullaniciTelefon], [DNo]) VALUES (4, N'mustafa.kara', N'456789', NULL, NULL, 1)
INSERT [dbo].[Kullanici] ([KullaniciNo], [KullaniciAd], [KullaniciSifre], [KullaniciMail], [KullaniciTelefon], [DNo]) VALUES (5, N'aleyna.ari', N'123456', N'aleyna.ari@hotmail.com', 123885, NULL)
INSERT [dbo].[Kullanici] ([KullaniciNo], [KullaniciAd], [KullaniciSifre], [KullaniciMail], [KullaniciTelefon], [DNo]) VALUES (6, N'admin', N'123', N'aleyna@gmail.com', 345234, NULL)
INSERT [dbo].[Kullanici] ([KullaniciNo], [KullaniciAd], [KullaniciSifre], [KullaniciMail], [KullaniciTelefon], [DNo]) VALUES (7, N'admin3', N'123', N'aa@gmail.com', 35236256, NULL)
SET IDENTITY_INSERT [dbo].[Kullanici] OFF
GO
SET IDENTITY_INSERT [dbo].[Poliklinikler] ON 

INSERT [dbo].[Poliklinikler] ([PNo], [PoliAd], [PoliBaskan], [PoliHemsire], [YatakSayisi], [DNo], [HastaNo]) VALUES (1, N'Dahiliye', N'Aslı Kaya', N'tuğçe', 10, 4, NULL)
INSERT [dbo].[Poliklinikler] ([PNo], [PoliAd], [PoliBaskan], [PoliHemsire], [YatakSayisi], [DNo], [HastaNo]) VALUES (4, N'Psikolog', N'Aydan ', N'Yücel', 25, 6, NULL)
INSERT [dbo].[Poliklinikler] ([PNo], [PoliAd], [PoliBaskan], [PoliHemsire], [YatakSayisi], [DNo], [HastaNo]) VALUES (6, N'KBB', N'Ali Veli', N'Derya', 30, 8, NULL)
INSERT [dbo].[Poliklinikler] ([PNo], [PoliAd], [PoliBaskan], [PoliHemsire], [YatakSayisi], [DNo], [HastaNo]) VALUES (8, N'Psikiyatri', N'Duygu Koç', NULL, 35, 3, NULL)
INSERT [dbo].[Poliklinikler] ([PNo], [PoliAd], [PoliBaskan], [PoliHemsire], [YatakSayisi], [DNo], [HastaNo]) VALUES (9, N'Nöroloji', N'Ayşe Gün', N'arda', 20, 7, NULL)
INSERT [dbo].[Poliklinikler] ([PNo], [PoliAd], [PoliBaskan], [PoliHemsire], [YatakSayisi], [DNo], [HastaNo]) VALUES (11, N'Çocuk Po', N'Murat Şen ', N'Gizem', 15, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Poliklinikler] OFF
GO
ALTER TABLE [dbo].[Hastalar]  WITH CHECK ADD  CONSTRAINT [FK_Hastalar_Poliklinikler] FOREIGN KEY([PNo])
REFERENCES [dbo].[Poliklinikler] ([PNo])
GO
ALTER TABLE [dbo].[Hastalar] CHECK CONSTRAINT [FK_Hastalar_Poliklinikler]
GO
ALTER TABLE [dbo].[Kullanici]  WITH CHECK ADD  CONSTRAINT [FK_Kullanici_Doktorlar] FOREIGN KEY([DNo])
REFERENCES [dbo].[Doktorlar] ([DNo])
GO
ALTER TABLE [dbo].[Kullanici] CHECK CONSTRAINT [FK_Kullanici_Doktorlar]
GO
ALTER TABLE [dbo].[Poliklinikler]  WITH CHECK ADD  CONSTRAINT [FK_Poliklinikler_Doktorlar] FOREIGN KEY([DNo])
REFERENCES [dbo].[Doktorlar] ([DNo])
GO
ALTER TABLE [dbo].[Poliklinikler] CHECK CONSTRAINT [FK_Poliklinikler_Doktorlar]
GO
/****** Object:  StoredProcedure [dbo].[DAdAra]    Script Date: 27.04.2023 15:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DAdAra]
@DAdSoyad varchar(50)
as begin
select * from Doktorlar where DAdSoyad = @DAdSoyad 	
end
GO
/****** Object:  StoredProcedure [dbo].[DAra]    Script Date: 27.04.2023 15:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[DAra]
@DAdSoyad varchar(50),
@DNo int
as begin
select * from Doktorlar where DAdSoyad = @DAdSoyad and DNo = @DNo	
end
GO
/****** Object:  StoredProcedure [dbo].[DEkle]    Script Date: 27.04.2023 15:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DEkle]
@DAdSoyad varchar(50),
@UzmanAlan varchar(50),
@PoliNo int
as begin 
insert into Doktorlar
	(DAdSoyad, UzmanAlan, PoliNo) values 
	(@DAdSoyad, @UzmanAlan, @PoliNo)
end
GO
/****** Object:  StoredProcedure [dbo].[DListele]    Script Date: 27.04.2023 15:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DListele]
as begin
select * from Doktorlar
end
GO
/****** Object:  StoredProcedure [dbo].[DNoAra]    Script Date: 27.04.2023 15:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DNoAra]
@DNo varchar(50)
as begin
select * from Doktorlar where DNo = @DNo 	
end
GO
/****** Object:  StoredProcedure [dbo].[DSil]    Script Date: 27.04.2023 15:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DSil] 
@DNo int
as begin
delete from Doktorlar where DNo = @DNo
end
GO
/****** Object:  StoredProcedure [dbo].[DYenile]    Script Date: 27.04.2023 15:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DYenile]
@DNo int,
@DAdSoyad varchar(50),
@UzmanAlan varchar(50),
@PoliNo int 
as begin
update Doktorlar set DAdSoyad = @DAdSoyad, UzmanAlan = @UzmanAlan, PoliNo = @PoliNo
where DNo = @DNo
end
GO
/****** Object:  StoredProcedure [dbo].[Giris]    Script Date: 27.04.2023 15:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Giris] (
@kad varchar(50), --tablodakiyle aynısını yazmamıza gerek yok
@sifre varchar(50)
)
as begin 
select * from Kullanici where 
	KullaniciAd = @kad and KullaniciSifre = @sifre
end
GO
/****** Object:  StoredProcedure [dbo].[HAdAra]    Script Date: 27.04.2023 15:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[HAdAra]
@HastaAdSoyad varchar(50)
as begin
select * from Hastalar where 
	HastaAdSoyad = @HastaAdSoyad	
end
GO
/****** Object:  StoredProcedure [dbo].[HAra]    Script Date: 27.04.2023 15:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[HAra]
@HastaAdSoyad varchar(50)
as begin
select * from Hastalar where 
	HastaAdSoyad = @HastaAdSoyad	
end
GO
/****** Object:  StoredProcedure [dbo].[HEkle]    Script Date: 27.04.2023 15:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[HEkle]
@HastaAdSoyad varchar(50),
@HastaTC int,
@HastaDogumTarihi datetime,
@RandevuTime datetime,
@DoctorNo int,
@Reçete int ,
@PNo int
as begin
insert into Hastalar
	(HastaAdSoyad , HastaTC , HastaDogumTarihi , RandevuTime , DoctorNo , Reçete, PNo ) values
	(@HastaAdSoyad, @HastaTC, @HastaDogumTarihi, @RandevuTime, @DoctorNo, @Reçete, @PNo)
end
GO
/****** Object:  StoredProcedure [dbo].[HListele]    Script Date: 27.04.2023 15:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[HListele]
as begin
select * from Hastalar
end
GO
/****** Object:  StoredProcedure [dbo].[HSil]    Script Date: 27.04.2023 15:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[HSil]
@HastaNo int
as begin 
delete from Hastalar where HastaNo = @HastaNo
end
GO
/****** Object:  StoredProcedure [dbo].[HTCAra]    Script Date: 27.04.2023 15:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[HTCAra]
@HastaTC varchar(50)
as begin
select * from Hastalar where 
	HastaTC = @HastaTc	
end
GO
/****** Object:  StoredProcedure [dbo].[HYenile]    Script Date: 27.04.2023 15:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[HYenile]
@HastaNo int,
@HastaAdSoyad varchar(50),
@HastaTC int,
@HastaDogumTarihi datetime,
@RandevuTime datetime,
@DoctorNo int,
@Reçete int,
@PNo int
as begin
update Hastalar set HastaAdSoyad = @HastaAdSoyad, HastaTC = @HastaTC, HastaDogumTarihi = @HastaDogumTarihi, RandevuTime = @RandevuTime, DoctorNo = @DoctorNo, Reçete = @Reçete, PNo = @PNo
where HastaNo = @HastaNo
end
GO
/****** Object:  StoredProcedure [dbo].[KEkle]    Script Date: 27.04.2023 15:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[KEkle]
@KullaniciAd varchar(50),
@KullaniciSifre varchar(50),
@KullaniciMail varchar(50),
@KullaniciTelefon int
as begin
insert into Kullanici
	(KullaniciAd,KullaniciSifre,KullaniciMail,KullaniciTelefon) values
	(@KullaniciAd, @KullaniciSifre, @KullaniciMail, @KullaniciTelefon)
end
GO
/****** Object:  StoredProcedure [dbo].[KListele]    Script Date: 27.04.2023 15:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[KListele]
as begin
select * from Kullanici
end
GO
/****** Object:  StoredProcedure [dbo].[KSil]    Script Date: 27.04.2023 15:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[KSil]
@KullaniciNo int
as begin
delete from Kullanici where KullaniciNo = @KullaniciNo
end
GO
/****** Object:  StoredProcedure [dbo].[KYenile]    Script Date: 27.04.2023 15:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[KYenile] 
@KullaniciNo int,
@KullaniciAd varchar(50),
@KullaniciSifre varchar(50),
@KullaniciMail varchar(50),
@KullaniciTelefon int
as begin 
update Kullanici set KullaniciAd = @KullaniciAd, KullaniciSifre = @KullaniciSifre, KullaniciMail = @KullaniciMail, KullaniciTelefon = @KullaniciTelefon
where KullaniciNo = @KullaniciNo
end
GO
/****** Object:  StoredProcedure [dbo].[PAdAra]    Script Date: 27.04.2023 15:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PAdAra]
@PoliAd varchar(50)
as begin
select * from Poliklinikler where
	PoliAd = @PoliAd
end
GO
/****** Object:  StoredProcedure [dbo].[PAra]    Script Date: 27.04.2023 15:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PAra]
@PoliAd varchar(50)
as begin
select * from Poliklinikler where
	PoliAd = @PoliAd
end
GO
/****** Object:  StoredProcedure [dbo].[PEkle]    Script Date: 27.04.2023 15:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PEkle]
@PoliAd varchar(50),
@PoliBaskan varchar(50),
@PoliHemsire varchar(50),
@YatakSayisi int
as begin
insert into Poliklinikler
	(PoliAd, PoliBaskan, PoliHemsire, YatakSayisi)  values 
	(@PoliAd, @PoliBaskan, @PoliHemsire, @YatakSayisi)
end
GO
/****** Object:  StoredProcedure [dbo].[PListele]    Script Date: 27.04.2023 15:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PListele]
as begin
select * from Poliklinikler
end
GO
/****** Object:  StoredProcedure [dbo].[PNoAra]    Script Date: 27.04.2023 15:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PNoAra]
@PNo varchar(50)
as begin
select * from Poliklinikler where
	PNo = @PNo
end
GO
/****** Object:  StoredProcedure [dbo].[PSil]    Script Date: 27.04.2023 15:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PSil]
@PNo int
as begin
delete from Poliklinikler where PNo = @PNo 
end
GO
/****** Object:  StoredProcedure [dbo].[PYenile]    Script Date: 27.04.2023 15:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PYenile]
@PNo int,
@PoliAd varchar(50),
@PoliBaskan varchar(50),
@PoliHemsire varchar(50),
@YatakSayisi int
as begin
update Poliklinikler set PoliAd = @PoliAd, PoliBaskan = @PoliBaskan, PoliHemsire = @PoliHemsire, YatakSayisi = @YatakSayisi
where PNo = @PNo
end
GO
/****** Object:  StoredProcedure [dbo].[S1]    Script Date: 27.04.2023 15:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[S1]
as begin
select UzmanAlan, count(DNo) as 'Doktor Sayısı' from Doktorlar group by UzmanAlan
end
GO
/****** Object:  StoredProcedure [dbo].[S2]    Script Date: 27.04.2023 15:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[S2]
as begin
select DAdSoyad from Doktorlar order by DAdSoyad asc
end
GO
/****** Object:  StoredProcedure [dbo].[S3]    Script Date: 27.04.2023 15:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[S3]
as begin 
select sum(YatakSayisi) as 'Toplam Yatak Sayısı' from Poliklinikler 
end
GO
/****** Object:  StoredProcedure [dbo].[S4]    Script Date: 27.04.2023 15:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[S4]
as begin
select * from Poliklinikler p join Doktorlar d 
on p.PNo=d.PoliNo join Hastalar h 
on d.PoliNo=h.PNo
end
GO
/****** Object:  StoredProcedure [dbo].[S5]    Script Date: 27.04.2023 15:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[S5]
as begin
select HastaDogumTarihi, HastaAdSoyad from Hastalar order by HastaDogumTarihi desc
end
GO
/****** Object:  StoredProcedure [dbo].[Sorgu1]    Script Date: 27.04.2023 15:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Sorgu1]
as begin
select UzmanAlan, count(DNo) from Doktorlar group by UzmanAlan
end
GO
USE [master]
GO
ALTER DATABASE [Hastane] SET  READ_WRITE 
GO

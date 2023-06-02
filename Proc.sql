--*************Kullanýcý Tablosu Baþlangýç*************

create proc KListele
as begin
select * from Kullanici
end

create proc KEkle
@KullaniciAd varchar(50),
@KullaniciSifre varchar(50),
@KullaniciMail varchar(50),
@KullaniciTelefon int
as begin
insert into Kullanici
	(KullaniciAd,KullaniciSifre,KullaniciMail,KullaniciTelefon) values
	(@KullaniciAd, @KullaniciSifre, @KullaniciMail, @KullaniciTelefon)
end

create proc KYenile 
@KullaniciNo int,
@KullaniciAd varchar(50),
@KullaniciSifre varchar(50),
@KullaniciMail varchar(50),
@KullaniciTelefon int
as begin 
update Kullanici set KullaniciAd = @KullaniciAd, KullaniciSifre = @KullaniciSifre, KullaniciMail = @KullaniciMail, KullaniciTelefon = @KullaniciTelefon
where KullaniciNo = @KullaniciNo
end

create proc KSil
@KullaniciNo int
as begin
delete from Kullanici where KullaniciNo = @KullaniciNo
end

--*************Kullanýcý Tablosu Bitiþ*************
--*************Doktorlar Tablosu Baþlangýç*************

create proc DListele
as begin
select * from Doktorlar
end

create proc DEkle
@DAdSoyad varchar(50),
@UzmanAlan varchar(50),
@PoliNo int
as begin 
insert into Doktorlar
	(DAdSoyad, UzmanAlan, PoliNo) values 
	(@DAdSoyad, @UzmanAlan, @PoliNo)
end

create proc DYenile
@DNo int,
@DAdSoyad varchar(50),
@UzmanAlan varchar(50),
@PoliNo int 
as begin
update Doktorlar set DAdSoyad = @DAdSoyad, UzmanAlan = @UzmanAlan, PoliNo = @PoliNo
where DNo = @DNo
end

create proc DSil 
@DNo int
as begin
delete from Doktorlar where DNo = @DNo
end

create proc DAdAra
@DAdSoyad varchar(50)
as begin
select * from Doktorlar where DAdSoyad = @DAdSoyad 	
end

create proc DNoAra
@DNo varchar(50)
as begin
select * from Doktorlar where DNo = @DNo 	
end

--*************Doktorlar Tablosu Bitiþ*************
--*************Hastalar Tablosu Baþlangýç*************

create proc HListele
as begin
select * from Hastalar
end

alter proc HEkle
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

alter proc HYenile
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

create proc HSil
@HastaNo int
as begin 
delete from Hastalar where HastaNo = @HastaNo
end

create proc HAdAra
@HastaAdSoyad varchar(50)
as begin
select * from Hastalar where 
	HastaAdSoyad = @HastaAdSoyad	
end

create proc HTCAra
@HastaTC varchar(50)
as begin
select * from Hastalar where 
	HastaTC = @HastaTc	
end
	
--*************Hastalar Tablosu Bitiþ*************
--*************Poliklinik Tablosu Baþlangýç*************

create proc PListele
as begin
select * from Poliklinikler
end

create proc PEkle
@PoliAd varchar(50),
@PoliBaskan varchar(50),
@PoliHemsire varchar(50),
@YatakSayisi int
as begin
insert into Poliklinikler
	(PoliAd, PoliBaskan, PoliHemsire, YatakSayisi)  values 
	(@PoliAd, @PoliBaskan, @PoliHemsire, @YatakSayisi)
end

create proc PYenile
@PNo int,
@PoliAd varchar(50),
@PoliBaskan varchar(50),
@PoliHemsire varchar(50),
@YatakSayisi int
as begin
update Poliklinikler set PoliAd = @PoliAd, PoliBaskan = @PoliBaskan, PoliHemsire = @PoliHemsire, YatakSayisi = @YatakSayisi
where PNo = @PNo
end

create proc PSil
@PNo int
as begin
delete from Poliklinikler where PNo = @PNo 
end

create proc PAdAra
@PoliAd varchar(50)
as begin
select * from Poliklinikler where
	PoliAd = @PoliAd
end

create proc PNoAra
@PNo varchar(50)
as begin
select * from Poliklinikler where
	PNo = @PNo
end

--*************Poliklinik Tablosu Bitiþ*************

--*************Kullanýcý Giriþ*************
create procedure [dbo].[Giris] (
@kad varchar(50), --tablodakiyle aynýsýný yazmamýza gerek yok
@sifre varchar(50)
)
as begin 
select * from Kullanici where 
	KullaniciAd = @kad and KullaniciSifre = @sifre
end


--*************Raporlama*************

--uzmanlýða göre kaç adet doktor oluðunun gösteren sorgu 
create proc S1
as begin
select UzmanAlan, count(DNo) as 'Doktor Sayýsý' from Doktorlar group by UzmanAlan
end
--doktorlarý alfabetik sýrayan sorgu
create proc S2
as begin
select DAdSoyad from Doktorlar order by DAdSoyad asc
end

--toplam yatak sayýsýnýn gösteren sorgu
create proc S3
as begin 
select sum(YatakSayisi) as 'Toplam Yatak Sayýsý' from Poliklinikler 
end

--poliklinik, doktorlar ve hasta bilgisi
alter proc S4
as begin
select * from Poliklinikler p join Doktorlar d 
on p.PNo=d.PoliNo join Hastalar h 
on d.PoliNo=h.PNo
end

--hasta doðum yýlýna göre sýralama
alter proc S5
as begin
select HastaDogumTarihi, HastaAdSoyad from Hastalar order by HastaDogumTarihi desc
end

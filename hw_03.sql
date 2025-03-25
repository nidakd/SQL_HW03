--1. SORU:
--USA” ülkesine ait, 2009 yılı içerisinde oluşturulmuş 
--tüm faturaların (Invoice) toplamını listeleyen bir sorgu yazınız.

--extract fonksiyonu kullanarak;
SELECT SUM(total) AS total_invoice
FROM Invoice
WHERE billing_country = 'USA'
AND EXTRACT(YEAR FROM invoice_date) = 2009;

--SUM(total) AS total_invoice kodu:
--2009 yılında USA'ya kesilen faturaların toplamını hesaplar.

--FROM Invoice:
--fatura bilgilerini içeren Invoice tablosundan veri çeker.

--WHERE billing_country = 'USA' kodu:
--sadece ABD'ye ait faturaları filtreler.

--AND EXTRACT(YEAR FROM invoice_date) = 2009 kodu:
--tarih sütunundan sadece yılı alır ve 2009 olanları seçer.


--en basic şekilde between kullanarak sorgumuzu şu şekilde de yazabiliriz;
SELECT SUM(total) AS total_invoice
FROM Invoice
WHERE billing_country = 'USA'
AND invoice_date BETWEEN '2009-01-01' AND '2009-12-31';

--yukarıdaki iki sorgu da aynı sonucu döndürür.


--2.SORU: 
--Tüm parça (track) bilgilerini, bu parçaların ait olduğu playlisttrack
--ve playlist tablolarıyla birleştirerek (JOIN) listeleyen bir sorgu yazınız.

SELECT t.*, pt.playlist_id, p.name AS playlist_name
FROM track t
JOIN playlisttrack pt ON t.track_id = pt.track_id
JOIN playlist p ON pt.playlist_id = p.playlist_id;

--SELECT t.*, pt.playlist_id, p.name AS playlist_name kodu ile:
--t.* track tablosundaki tüm sütunları getirir. (t yerine başka bir alians verebiliriz.)

--pt.playlist_id kodu:
--parçanın hangi playlist ID’sine ait olduğunu getirir.(pt yerine başka bir isim koyabiliriz.)

--p.name AS playlist_name kodu ile:
--playlist’in adını alır ve playlist_name olarak isimlendiririz.(p yerine baika bir isim verebiliriz.)

--FROM track t kodu ile:
--track tablosundan parçaları alıyoruz.
--alias (takma ad) olarak t kullanıyoruz, yani t.* dediğimizde track tablosundaki tüm sütunları almış oluyoruz.

--JOIN playlisttrack pt ON t.track_id = pt.track_i kodu:
--playlisttrack tablosu, parçalar ile playlistler arasındaki ilişkiyi gösterir.

--t.track_id = pt.track_id kodu:
--track tablosundaki parçaları, playlisttrack tablosundaki eşleşen parçalarla birleştiriyoruz.
--böylece hangi parçanın hangi oynatma listesinde olduğunu öğreniyoruz.

--JOIN playlist p ON pt.playlist_id = p.playlist_id kodu:
--playlist tablosu, oynatma listelerinin adlarını içerir.
--p.name sütununu alarak, playlist'in adını ekliyoruz.
--pt.playlist_id = p.playlist_id bu kısım ise:
--playlisttrack içindeki playlist_id ile playlist içindeki playlist_id eşleştirilerek
--playlist'in adı (p.name) sorguya dahil edilir.

-------------------

--üstteki sorguda select t.* yaparak tüm track bilgilerini getirmiş olduk. 
--eğer soruda parçanın temel bilgileri istenilseydi şöyle yazabilirdik:
SELECT t.track_id, t.name AS track_name, t.album_id, p.playlist_id, p.name AS playlist_name
FROM track t
JOIN playlisttrack pt ON t.track_id = pt.track_id
JOIN playlist p ON pt.playlist_id = p.playlist_id;

-------------------

--3.SORU:
--Let There Be Rock" adlı albüme ait tüm parçaları (Track) listeleyen,
--sanatçı (Artist) bilgisini de içeren bir sorgu yazınız. 
--Ayrıca, sonuçları parça süresi (milliseconds) büyükten küçüğe sıralayınız.

SELECT 
    t.track_id, 
    t.name AS track_name, 
    a.title AS album_title, 
    ar.name AS artist_name, 
    t.milliseconds
FROM track t
JOIN album a ON t.album_id = a.album_id
JOIN artist ar ON a.artist_id = ar.artist_id
WHERE a.title = 'Let There Be Rock'
ORDER BY t.milliseconds DESC;

--select ile bizden istenilen sütunları seçiyoruz:
--t.track_id, par.a id'si
--t.name AS track_name, parça adı
--a.title AS album_title, albüm adı
--ar.name AS artist_name, satançının adı
--t.milliseconds, parçanın süresi(milliseconds)

--from track t, track tablosunu kullandığımız anlamına geliyor.

--JOIN album a ON t.album_id = a.album_id kodu ile:
--album_id üzerinden track (parçalar) ile album (albüm) tablolarını birleştiriyoruz
--hangi parçanın hangi albüme ait olduğunu öğreniyoruz.

--JOIN artist ar ON a.artist_id = ar.artist_id kodu ile:
--artist_id üzerinden album (albüm) ile artist (sanatçı) tablolarını birleştiriyoruz
--albümün hangi sanatçıya ait olduğunu öğreniyoruz.

--WHERE a.title = 'Let There Be Rock' kodu ile:
--sadece "Let There Be Rock" adlı albüme ait şarkıları getiriyoruz.

--ORDER BY t.milliseconds DES kodu ile:
--parçaları süresine (milliseconds) göre büyükten küçüğe sıralıyoruz.








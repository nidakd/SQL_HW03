--1. SORU:
--USA” ülkesine ait, 2009 yılı içerisinde oluşturulmuş 
--tüm faturaların (Invoice) toplamını listeleyen bir sorgu yazınız.

--extract fonksiyonu kullanarak;
SELECT SUM(total) AS total_invoice
FROM Invoice
WHERE billing_country = 'USA'
AND EXTRACT(YEAR FROM invoice_date) = 2009;

--en basic şekilde between kullanarak;
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
--üstteki sorguda select t.* yaparak tüm track bilgilerini getirmiş olduk. 
--eğer soruda parçanın temel bilgileri istenilseydi şöyle yazabilirdik:
SELECT t.track_id, t.name AS track_name, t.album_id, p.playlist_id, p.name AS playlist_name
FROM track t
JOIN playlisttrack pt ON t.track_id = pt.track_id
JOIN playlist p ON pt.playlist_id = p.playlist_id;


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








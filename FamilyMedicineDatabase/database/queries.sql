-- Sorgu 1: Belirli bir doktorun baktığı hastaların listesi
-- Bu sorgu Doktor ve Hasta tablolarını Randevu tablosu üzerinden birleştirir
SELECT H.hastaID, H.ad, H.soyad, D.ad AS doktorAdi, D.soyad AS doktorSoyadi
FROM Hasta H
JOIN Randevu R ON H.hastaID = R.hastaID
JOIN Doktor D ON R.doktorID = D.doktorID
WHERE D.doktorID = 1;  -- Örnek doktor ID'si

-- Açıklama: Bu sorgu belirli bir doktorun (doktorID=1) baktığı hastaların listesini getirir. 
-- Doktor tablosu ile Randevu tablosu doktorID üzerinden, Randevu tablosu ile Hasta tablosu hastaID üzerinden birleştirilir.

-- Sorgu 2: Hastaların aldığı tahlil sonuçları
-- Bu sorgu Hasta ve Tahlil tablolarını birleştirir
SELECT H.hastaID, H.ad, H.soyad, T.tahlilSonuc
FROM Hasta H
JOIN Tahlil T ON H.hastaID = T.hastaID;

-- Açıklama: Bu sorgu hastaların aldığı tahlil sonuçlarını listeler. 
-- Hasta tablosu ile Tahlil tablosu hastaID üzerinden birleştirilir.

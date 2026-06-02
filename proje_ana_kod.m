%% GÖRÜNTÜ İŞLEME İLE NESNE SEGMENTASYONU PROJESİ
clear; clc; close all;

% 1. Resmi Sisteme Yükle
orjinalResim = imread('C:\Users\hzlbz\Downloads\elma.jpg'); 

% 2. Görüntüyü Işıktan Etkilenmeyen HSV Renk Uzayına Çevir
hsvResim = rgb2hsv(orjinalResim);

% 3. Kırmızı Elmanın Renk Sınırlarını Tanımla (Ekrandaki Ayarların Tam Karşılığı)
H = hsvResim(:,:,1);
S = hsvResim(:,:,2);
V = hsvResim(:,:,3);

% Kırmızı renk çemberin iki ucunda olduğu için mantıksal iki maskeyi birleştiriyoruz
% Kalemi ve arka planı eleyecek en kararlı aralıklar:
maske1 = (H >= 0.95 | H <= 0.05) & (S >= 0.40 & S <= 1.0) & (V >= 0.20 & V <= 1.0);

% =========================================================================
% MORFOLOJİK TEMİZLİK (Gürültü Engelleme ve İyileştirme)
% =========================================================================
% Adım A: Elmanın içindeki küçük siyah delikleri otomatik kapat
temizMaske = imfill(maske1, 'holes');

% Adım B: Küçük nesneleri (kalemden kalan lekeleri) tamamen sil
% (Boyutu 5000 pikselden küçük olan her şeyi temizler)
temizMaske = bwareaopen(temizMaske, 5000);

% Adım C: Maskeyi görüntünün tipine çevirip orijinal resme giydir
maskeUint8 = uint8(temizMaske);
yeniNesmeGoruntusu = orjinalResim .* maskeUint8;
% =========================================================================

% 4. Sonuçları Ekranda Göster
figure('Name', 'Gelişmiş Nesne Segmentasyonu', 'NumberTitle', 'off');

% Sol Panel
subplot(1,3,1); 
imshow(orjinalResim); 
title('\bf 1. Orjinal Resim', 'Color', 'b');

% Orta Panel
subplot(1,3,2); 
imshow(temizMaske); 
title('\bf 2. Morfolojik Filtreli Maske', 'Color', 'r');

% Sağ Panel
subplot(1,3,3); 
imshow(yeniNesmeGoruntusu); 
title('\bf 3. Tamamen Temizlenmiş Elma', 'Color', 'g');

% Ekranı Tam Boyut Yap
set(gcf, 'Position', get(0, 'Screensize'));
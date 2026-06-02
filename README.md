# Görüntü İşleme ile Renk Tabanlı Nesne Segmentasyonu

Bu proje, MATLAB ortamında bilgisayarlı görü ve görüntü işleme teknikleri kullanılarak karmaşık bir arka plandan hedef nesnenin (kırmızı elma) başarıyla ayrıştırılmasını (segmentasyon) gerçekleştirmektedir.

## 🚀 Projenin Çalışma Mantığı
1. **Renk Uzayı Dönüşümü:** Görüntü, ortam ışığından etkilenmemesi adına RGB uzayından **HSV (Hue, Saturation, Value)** renk uzayına dönüştürülmüştür.
2. **Morfolojik Filtreleme:** Sadece renk filtresi uygulandığında oluşan ışık parlamaları (delikler) `imfill` ile kapatılmış, çevre gürültüleri (mavi kalem kalıntıları) ise `bwareaopen` fonksiyonu ile temizlenmiştir.
3. **Maskeleme:** Elde edilen ikili (binary) maske orijinal resme giydirilerek hedef nesne arka plandan tamamen izole edilmiştir.

## 📊 Proje Çıktısı ve Analiz Paneli
Klasör içindeki `proje_ana_kod.m` dosyası çalıştırıldığında elde edilen 3'lü analiz paneli aşağıdadır:

![Proje Ekran Görüntüsü](Ekran görüntüsü 2026-06-02 100224.png)

## 🛠️ Nasıl Çalıştırılır?
1. Bu depoyu (repository) bilgisayarınıza indirin.
2. `proje_ana_kod.m` dosyasındaki resim yolunu kendi bilgisayarınıza göre güncelleyin.
3. MATLAB üzerinde **Run** butonuna basarak projeyi çalıştırabilirsiniz.

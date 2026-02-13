# WinUtil Türkçe

[ChrisTitusTech/winutil](https://github.com/ChrisTitusTech/winutil) projesinin Türkçe çevirisi.

## Hızlı Başlangıç

** PowerShell'i yönetici olarak çalıştırın:**

```powershell
irm https://raw.githubusercontent.com/AybarsBarut/winutil_TR_localization/main/windevTR.ps1 | iex
```

##  Ne Yapar?

Bu script:
1. GitHub'dan en güncel WinUtil sürümünü indirir
2. Tüm UI elementlerini otomatik olarak Türkçe'ye çevirir
3. Uygulamayı başlatır

##  Çevrilen Öğeler

- Ana sekmeler: **Kur**, **Ayarlamalar**, **Yapılandırma**, **Güncellemeler**
- Tüm butonlar ve menü öğeleri
- Tooltip'ler ve açıklamalar
- Windows Güncelleme yapılandırma metinleri
- Bağlam menüsü (Kes, Kopyala, Yapıştır)

## Yerel Kullanım

1. Script'i indirin:
```powershell
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/AybarsBarut/WinUtil-Turkish/main/windevTR.ps1" -OutFile "windevTR.ps1"
```

2. Çalıştırın:
```powershell
.\windevTR.ps1
```

##  Nasıl Çalışır?

Script, orijinal WinUtil'i indirdikten sonra regex ile tüm İngilizce UI metinlerini Türkçe karşılıklarıyla değiştirir. Bu sayede:
- Her zaman en güncel sürümü kullanırsınız
- Orijinal projenin tüm özelliklerinden yararlanırsınız
- Türkçe arayüz ile rahatça kullanırsınız

##  Katkıda Bulunma

Çeviri iyileştirmeleri için Pull Request göndermekten çekinmeyin!

## Lisans

Bu proje orijinal WinUtil projesiyle aynı lisansa sahiptir.

## Teşekkürler

- [Chris Titus Tech](https://github.com/ChrisTitusTech) - Orijinal WinUtil projesi için

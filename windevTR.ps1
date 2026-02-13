<#
.SYNOPSIS
    WinUtil Türkçe sürümünü çalıştırır
.DESCRIPTION
    Bu script GitHub'dan en güncel WinUtil sürümünü indirir ve UI elementlerini Türkçe'ye çevirir.
.EXAMPLE
    .\windevTR.ps1
#>

Write-Host "WinUtil Türkçe sürümü hazırlanıyor..." -ForegroundColor Cyan

# En güncel sürümü GitHub'dan indir
$latestTag = (Invoke-RestMethod "https://api.github.com/repos/ChrisTitusTech/winutil/tags")[0].name
Write-Host "En güncel sürüm indiriliyor: $latestTag" -ForegroundColor Yellow
$script = Invoke-RestMethod "https://github.com/ChrisTitusTech/winutil/releases/download/$latestTag/winutil.ps1"

Write-Host "Türkçe çeviriler uygulanıyor..." -ForegroundColor Yellow

# XAML içindeki metinleri Türkçe'ye çevir
$translations = @{
    # Ana sekmeler
    '<Underline>I</Underline>nstall'                                                                                                                                  = '<Underline>K</Underline>ur'
    '<Underline>T</Underline>weaks'                                                                                                                                   = '<Underline>A</Underline>yarlamalar'
    '<Underline>C</Underline>onfig'                                                                                                                                   = '<Underline>Y</Underline>apılandırma'
    '<Underline>U</Underline>pdates'                                                                                                                                  = '<Underline>G</Underline>üncellemeler'
    
    # TabItem Headers
    'Header="Install"'                                                                                                                                                = 'Header="Kur"'
    'Header="Tweaks"'                                                                                                                                                 = 'Header="Ayarlamalar"'
    'Header="Config"'                                                                                                                                                 = 'Header="Yapılandırma"'
    'Header="Updates"'                                                                                                                                                = 'Header="Güncellemeler"'
    
    # Tooltip'ler
    'Press Ctrl-F and type app name to filter application list below. Press Esc to reset the filter'                                                                  = 'Uygulama listesini filtrelemek için Ctrl-F tuşuna basın ve uygulama adını yazın. Filtreyi sıfırlamak için Esc tuşuna basın'
    'Change the Winutil UI Theme'                                                                                                                                     = 'Winutil Arayüz Temasını Değiştir'
    'Adjust Font Scaling for Accessibility'                                                                                                                           = 'Erişilebilirlik için Yazı Tipi Ölçeklendirmesini Ayarla'
    
    # Tema menüsü
    'Header="Auto"'                                                                                                                                                   = 'Header="Otomatik"'
    'Follow the Windows Theme'                                                                                                                                        = 'Windows Temasını Takip Et'
    'Header="Dark"'                                                                                                                                                   = 'Header="Koyu"'
    'Use Dark Theme'                                                                                                                                                  = 'Koyu Tema Kullan'
    'Header="Light"'                                                                                                                                                  = 'Header="Açık"'
    'Use Light Theme'                                                                                                                                                 = 'Açık Tema Kullan'
    
    # Font Scaling
    'Text="Font Scaling"'                                                                                                                                             = 'Text="Yazı Tipi Ölçeklendirmesi"'
    'Text="Small"'                                                                                                                                                    = 'Text="Küçük"'
    'Text="Large"'                                                                                                                                                    = 'Text="Büyük"'
    'Content="Reset"'                                                                                                                                                 = 'Content="Sıfırla"'
    'Content="Apply"'                                                                                                                                                 = 'Content="Uygula"'
    
    # Ayarlar menüsü
    'Header="Import"'                                                                                                                                                 = 'Header="İçe Aktar"'
    'Import Configuration from exported file.'                                                                                                                        = 'Dışa aktarılan dosyadan yapılandırmayı içe aktar.'
    'Header="Export"'                                                                                                                                                 = 'Header="Dışa Aktar"'
    'Export Selected Elements and copy execution command to clipboard.'                                                                                               = 'Seçili öğeleri dışa aktar ve yürütme komutunu panoya kopyala.'
    'Header="About"'                                                                                                                                                  = 'Header="Hakkında"'
    'Header="Sponsors"'                                                                                                                                               = 'Header="Sponsorlar"'
    
    # Bağlam menüsü
    'Header="Cut"'                                                                                                                                                    = 'Header="Kes"'
    'Header="Copy"'                                                                                                                                                   = 'Header="Kopyala"'
    'Header="Paste"'                                                                                                                                                  = 'Header="Yapıştır"'
    
    # Tweaks sekmesi
    'Content="Recommended Selections:"'                                                                                                                               = 'Content="Önerilen Seçimler:"'
    'Content=" Standard "'                                                                                                                                            = 'Content=" Standart "'
    'Content=" Clear "'                                                                                                                                               = 'Content=" Temizle "'
    'Content=" Show Installed Apps "'                                                                                                                                 = 'Content=" Yüklü Uygulamaları Göster "'
    'Note: Hover over items to get a better description. Please be careful as many of these tweaks will heavily modify your system.'                                  = 'Not: Daha iyi açıklama almak için öğelerin üzerine gelin. Lütfen dikkatli olun, bu ayarlamaların çoğu sisteminizi önemli ölçüde değiştirecektir.'
    'Recommended selections are for normal users and if you are unsure do NOT check anything else!'                                                                   = 'Önerilen seçimler normal kullanıcılar içindir ve emin değilseniz başka hiçbir şeyi işaretLEMEYIN!'
    'Content="Run Tweaks"'                                                                                                                                            = 'Content="Ayarlamaları Uygula"'
    'Content="Undo Selected Tweaks"'                                                                                                                                  = 'Content="Seçili Ayarlamaları Geri Al"'
    
    # Updates sekmesi
    'Content="Default Settings"'                                                                                                                                      = 'Content="Varsayılan Ayarlar"'
    'Default Windows Update Configuration'                                                                                                                            = 'Varsayılan Windows Güncelleme Yapılandırması'
    'No modifications to Windows defaults'                                                                                                                            = 'Windows varsayılanlarında değişiklik yok'
    'Removes any custom update settings'                                                                                                                              = 'Özel güncelleme ayarlarını kaldırır'
    'Note: This resets your Windows Update settings to default out of the box settings. It removes ANY policy or customization that has been done to Windows Update.' = 'Not: Bu, Windows Güncelleme ayarlarınızı varsayılan kutunun dışındaki ayarlara sıfırlar. Windows Güncellemesi''ne yapılan HERHANGİ bir ilke veya özelleştirmeyi kaldırır.'
    
    'Content="Security Settings"'                                                                                                                                     = 'Content="Güvenlik Ayarları"'
    'Balanced Security Configuration'                                                                                                                                 = 'Dengeli Güvenlik Yapılandırması'
    'Feature updates delayed by 365 days'                                                                                                                             = 'Özellik güncellemeleri 365 gün ertelendi'
    'Security updates installed after 4 days'                                                                                                                         = 'Güvenlik güncellemeleri 4 gün sonra yüklendi'
    'Feature Updates:'                                                                                                                                                = 'Özellik Güncellemeleri:'
    'New features and potential bugs'                                                                                                                                 = 'Yeni özellikler ve olası hatalar'
    'Security Updates:'                                                                                                                                               = 'Güvenlik Güncellemeleri:'
    'Critical security patches'                                                                                                                                       = 'Kritik güvenlik yamaları'
    'Note: This only applies to Pro systems that can use group policy.'                                                                                               = 'Not: Bu yalnızca grup ilkesini kullanabilen Pro sistemleri için geçerlidir.'
    
    'Content="Disable All Updates"'                                                                                                                                   = 'Content="Tüm Güncellemeleri Devre Dışı Bırak"'
    '!! Not Recommended !!'                                                                                                                                           = '!! Önerilmez !!'
    'Disables ALL Windows Updates'                                                                                                                                    = 'TÜM Windows Güncellemelerini devre dışı bırakır'
    'Increases security risks'                                                                                                                                        = 'Güvenlik risklerini artırır'
    'Only use for isolated systems'                                                                                                                                   = 'Yalnızca izole sistemler için kullanın'
    'Warning: Your system will be vulnerable without security updates.'                                                                                               = 'Uyarı: Sisteminiz güvenlik güncellemeleri olmadan savunmasız kalacaktır.'
}

# Çevirileri uygula
foreach ($key in $translations.Keys) {
    $script = $script -replace [regex]::Escape($key), $translations[$key]
}

Write-Host "Türkçe WinUtil başlatılıyor..." -ForegroundColor Green

# Scripti çalıştır
Invoke-Expression $script

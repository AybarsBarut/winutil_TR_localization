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

# XAML ve JSON içindeki metinleri Türkçe'ye çevir
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
    
    # Install sekmesi - Actions butonları (JSON'dan geliyor)
    '"Content": "Install/Upgrade Applications"'                                                                                                                       = '"Content": "Uygulamaları Kur/Güncelle"'
    '"Content": "Uninstall Applications"'                                                                                                                             = '"Content": "Uygulamaları Kaldır"'
    '"Content": "Upgrade all Applications"'                                                                                                                           = '"Content": "Tüm Uygulamaları Güncelle"'
    '"ButtonContent": "Install/Upgrade Selected"'                                                                                                                     = '"ButtonContent": "Seçilenleri Kur/Güncelle"'
    '"ButtonContent": "Uninstall Selected"'                                                                                                                           = '"ButtonContent": "Seçilenleri Kaldır"'
    '"ButtonContent": "Get Installed"'                                                                                                                                = '"ButtonContent": "Yüklü Olanları Göster"'
    '"ButtonContent": "Import Config"'                                                                                                                                = '"ButtonContent": "Yapılandırmayı İçe Aktar"'
    '"ButtonContent": "Upgrade All"'                                                                                                                                  = '"ButtonContent": "Tümünü Güncelle"'
    
    # Install sekmesi - Selection butonları (JSON'dan geliyor)
    '"Content": "Clear Selection"'                                                                                                                                    = '"Content": "Seçimi Temizle"'
    '"Content": "Collapse All Categories"'                                                                                                                            = '"Content": "Tüm Kategorileri Daralt"'
    '"Content": "Expand All Categories"'                                                                                                                              = '"Content": "Tüm Kategorileri Genişlet"'
    '"Content": "Get Installed"'                                                                                                                                      = '"Content": "Yüklü Olanları Göster"'
    '"Content": "Selected Apps: 0"'                                                                                                                                   = '"Content": "Seçili Uygulamalar: 0"'
    
    # Tweaks sekmesi - Tweak isimleri (JSON'dan geliyor - en yaygın olanlar)
    '"Content": "Create Restore Point"'                                                                                                                               = '"Content": "Geri Yükleme Noktası Oluştur"'
    '"Content": "Delete Temporary Files"'                                                                                                                             = '"Content": "Geçici Dosyaları Sil"'
    '"Content": "Disable Activity History"'                                                                                                                           = '"Content": "Etkinlik Geçmişini Devre Dışı Bırak"'
    '"Content": "Disable Consumer Features"'                                                                                                                          = '"Content": "Tüketici Özelliklerini Devre Dışı Bırak"'
    '"Content": "Disable Hibernation"'                                                                                                                                = '"Content": "Hazırda Bekletmeyi Devre Dışı Bırak"'
    '"Content": "Disable Location Tracking"'                                                                                                                          = '"Content": "Konum Takibini Devre Dışı Bırak"'
    '"Content": "Disable Powershell 7 Telemetry"'                                                                                                                     = '"Content": "PowerShell 7 Telemetrisini Devre Dışı Bırak"'
    '"Content": "Disable Telemetry"'                                                                                                                                  = '"Content": "Telemetriyi Devre Dışı Bırak"'
    '"Content": "Disable Windows Platform Binary Table"'                                                                                                              = '"Content": "Windows Platform Binary Table Devre Dışı Bırak"'
    '"Content": "Enable End Task With Right Click"'                                                                                                                   = '"Content": "Sağ Tıkla ile Görevi Sonlandırmayı Etkinleştir"'
    '"Content": "Remove Widgets"'                                                                                                                                     = '"Content": "Widgetları Kaldır"'
    '"Content": "Run Disk Cleanup"'                                                                                                                                   = '"Content": "Disk Temizliği Çalıştır"'
    '"Content": "Set Services to Manual"'                                                                                                                             = '"Content": "Hizmetleri Manuel Yap"'
    '"Content": "Adobe Network Block"'                                                                                                                                = '"Content": "Adobe Ağ Engelleme"'
    '"Content": "Block Razer Software Installs"'                                                                                                                      = '"Content": "Razer Yazılım Kurulumlarını Engelle"'
    '"Content": "Brave Debloat"'                                                                                                                                      = '"Content": "Brave Temizleme"'
    '"Content": "Disable Background Apps"'                                                                                                                            = '"Content": "Arka Plan Uygulamalarını Devre Dışı Bırak"'
    '"Content": "Disable Fullscreen Optimizations"'                                                                                                                   = '"Content": "Tam Ekran Optimizasyonlarını Devre Dışı Bırak"'
    '"Content": "Disable IPv6"'                                                                                                                                       = '"Content": "IPv6 Devre Dışı Bırak"'
    '"Content": "Disable Microsoft Copilot"'                                                                                                                          = '"Content": "Microsoft Copilot Devre Dışı Bırak"'
    '"Content": "Disable Notification Tray/Calendar"'                                                                                                                 = '"Content": "Bildirim Tepsisi/Takvimi Devre Dışı Bırak"'
    '"Content": "Disable Storage Sense"'                                                                                                                              = '"Content": "Depolama Algılama Devre Dışı Bırak"'
    '"Content": "Disable Teredo"'                                                                                                                                     = '"Content": "Teredo Devre Dışı Bırak"'
    '"Content": "Edge Debloat"'                                                                                                                                       = '"Content": "Edge Temizleme"'
    '"Content": "Prefer IPv4 over IPv6"'                                                                                                                              = '"Content": "IPv6 Yerine IPv4 Tercih Et"'
    '"Content": "Remove ALL MS Store Apps - NOT RECOMMENDED"'                                                                                                         = '"Content": "TÜM MS Store Uygulamalarını Kaldır - ÖNERİLMEZ"'
    '"Content": "Remove Gallery from Explorer"'                                                                                                                       = '"Content": "Gezginden Galeriyi Kaldır"'
    '"Content": "Remove Home from Explorer"'                                                                                                                          = '"Content": "Gezginden Ana Sayfa Kaldır"'
    '"Content": "Remove Microsoft Edge"'                                                                                                                              = '"Content": "Microsoft Edge Kaldır"'
    
    # Tweaks sekmesi - Customize Preferences (JSON'dan geliyor)
    '"Content": "Bing Search in Start Menu"'                                                                                                                          = '"Content": "Başlat Menüsünde Bing Araması"'
    '"Content": "Center Taskbar Items"'                                                                                                                               = '"Content": "Görev Çubuğu Öğelerini Ortala"'
    '"Content": "Cross-Device Resume"'                                                                                                                                = '"Content": "Cihazlar Arası Devam Etme"'
    '"Content": "Dark Theme for Windows"'                                                                                                                             = '"Content": "Windows için Koyu Tema"'
    '"Content": "Detailed BSoD"'                                                                                                                                      = '"Content": "Detaylı BSoD"'
    '"Content": "Disable Multiplane Overlay"'                                                                                                                         = '"Content": "Multiplane Overlay Devre Dışı Bırak"'
    '"Content": "Mouse Acceleration"'                                                                                                                                 = '"Content": "Fare Hızlandırma"'
    '"Content": "New Outlook"'                                                                                                                                        = '"Content": "Yeni Outlook"'
    '"Content": "NumLock on Startup"'                                                                                                                                 = '"Content": "Başlangıçta NumLock"'
    '"Content": "Recommendations in Start Menu"'                                                                                                                      = '"Content": "Başlat Menüsünde Öneriler"'
    '"Content": "Remove Settings Home Page"'                                                                                                                          = '"Content": "Ayarlar Ana Sayfasını Kaldır"'
    '"Content": "S3 Sleep"'                                                                                                                                           = '"Content": "S3 Uyku"'
    '"Content": "Search Button in Taskbar"'                                                                                                                           = '"Content": "Görev Çubuğunda Arama Düğmesi"'
    '"Content": "Show File Extensions"'                                                                                                                               = '"Content": "Dosya Uzantılarını Göster"'
    '"Content": "Show Hidden Files"'                                                                                                                                  = '"Content": "Gizli Dosyaları Göster"'
    '"Content": "Sticky Keys"'                                                                                                                                        = '"Content": "Yapışkan Tuşlar"'
    '"Content": "Task View Button in Taskbar"'                                                                                                                        = '"Content": "Görev Çubuğunda Görev Görünümü Düğmesi"'
    '"Content": "Verbose Messages During Logon"'                                                                                                                      = '"Content": "Oturum Açma Sırasında Ayrıntılı Mesajlar"'
    
    # Tweaks sekmesi - Performance Plans
    '"Content": "Add and Activate Ultimate Performance Profile"'                                                                                                      = '"Content": "Ultimate Performans Profilini Ekle ve Etkinleştir"'
    '"Content": "Remove Ultimate Performance Profile"'                                                                                                                = '"Content": "Ultimate Performans Profilini Kaldır"'
    
    # Config sekmesi - Features (JSON'dan geliyor)
    '"Content": "All .Net Framework (2,3,4)"'                                                                                                                         = '"Content": "Tüm .Net Framework (2,3,4)"'
    '"Content": "HyperV Virtualization"'                                                                                                                              = '"Content": "HyperV Sanallaştırma"'
    '"Content": "Legacy Media (WMP, DirectPlay)"'                                                                                                                     = '"Content": "Eski Medya (WMP, DirectPlay)"'
    '"Content": "Windows Subsystem for Linux"'                                                                                                                        = '"Content": "Linux için Windows Alt Sistemi"'
    '"Content": "NFS - Network File System"'                                                                                                                          = '"Content": "NFS - Ağ Dosya Sistemi"'
    '"Content": "Enable Daily Registry Backup Task (Runs at 12:30 AM)"'                                                                                               = '"Content": "Günlük Kayıt Defteri Yedekleme Görevini Etkinleştir (Gece 00:30)"'
    '"Content": "Enable Legacy F8 Boot Recovery"'                                                                                                                     = '"Content": "Eski F8 Önyükleme Kurtarmayı Etkinleştir"'
    '"Content": "Disable Legacy F8 Boot Recovery"'                                                                                                                    = '"Content": "Eski F8 Önyükleme Kurtarmayı Devre Dışı Bırak"'
    '"Content": "Windows Sandbox"'                                                                                                                                    = '"Content": "Windows Sandbox"'
    '"Content": "Install Features"'                                                                                                                                   = '"Content": "Özellikleri Kur"'
    
    # Config sekmesi - Fixes (JSON'dan geliyor)
    '"Content": "Set Up Autologin"'                                                                                                                                   = '"Content": "Otomatik Oturum Açmayı Ayarla"'
    '"Content": "Reset Windows Update"'                                                                                                                               = '"Content": "Windows Güncellemesini Sıfırla"'
    '"Content": "Reset Network"'                                                                                                                                      = '"Content": "Ağı Sıfırla"'
    '"Content": "System Corruption Scan"'                                                                                                                             = '"Content": "Sistem Bozulma Taraması"'
    '"Content": "WinGet Reinstall"'                                                                                                                                   = '"Content": "WinGet Yeniden Yükle"'
    '"Content": "Remove Adobe Creative Cloud"'                                                                                                                        = '"Content": "Adobe Creative Cloud Kaldır"'
    
    # Config sekmesi - Legacy Windows Panels (JSON'dan geliyor)
    '"Content": "Control Panel"'                                                                                                                                      = '"Content": "Denetim Masası"'
    '"Content": "Computer Management"'                                                                                                                                = '"Content": "Bilgisayar Yönetimi"'
    '"Content": "Network Connections"'                                                                                                                                = '"Content": "Ağ Bağlantıları"'
    '"Content": "Power Panel"'                                                                                                                                        = '"Content": "Güç Paneli"'
    '"Content": "Printer Panel"'                                                                                                                                      = '"Content": "Yazıcı Paneli"'
    '"Content": "Region"'                                                                                                                                             = '"Content": "Bölge"'
    '"Content": "Windows Restore"'                                                                                                                                    = '"Content": "Windows Geri Yükleme"'
    '"Content": "Sound Settings"'                                                                                                                                     = '"Content": "Ses Ayarları"'
    '"Content": "System Properties"'                                                                                                                                  = '"Content": "Sistem Özellikleri"'
    '"Content": "Date and Time"'                                                                                                                                      = '"Content": "Tarih ve Saat"'
    
    # Config sekmesi - PowerShell Profile
    '"Content": "Install CTT PowerShell Profile"'                                                                                                                     = '"Content": "CTT PowerShell Profilini Yükle"'
    '"Content": "Uninstall CTT PowerShell Profile"'                                                                                                                   = '"Content": "CTT PowerShell Profilini Kaldır"'
    
    # Config sekmesi - Remote Access
    '"Content": "Enable OpenSSH Server"'                                                                                                                              = '"Content": "OpenSSH Sunucusunu Etkinleştir"'
    
    # Install sekmesi - Sol panel kategorileri
    'Text="Actions"'                                                                                                                                                  = 'Text="İşlemler"'
    'Text="Package Manager"'                                                                                                                                          = 'Text="Paket Yöneticisi"'
    'Text="Select Icon"'                                                                                                                                              = 'Text="Simge Seç"'
    'Text="Selection"'                                                                                                                                                = 'Text="Seçim"'
    'Text="Applications"'                                                                                                                                             = 'Text="Uygulamalar"'
    'Text="Communication"'                                                                                                                                            = 'Text="İletişim"'
    'Text="Development"'                                                                                                                                              = 'Text="Geliştirme"'
    'Text="Browsers"'                                                                                                                                                 = 'Text="Tarayıcılar"'
    'Text="Games"'                                                                                                                                                    = 'Text="Oyunlar"'
    'Text="Multimedia Tools"'                                                                                                                                         = 'Text="Multimedya Araçları"'
    'Text="Microsoft Tools"'                                                                                                                                          = 'Text="Microsoft Araçları"'
    'Text="Utilities"'                                                                                                                                                = 'Text="Yardımcı Programlar"'
    'Text="Pro Tools"'                                                                                                                                                = 'Text="Profesyonel Araçlar"'
    'Text="Document"'                                                                                                                                                 = 'Text="Belge"'
    
    # Install sekmesi - Butonlar
    'Content="Install/Upgrade Selected"'                                                                                                                              = 'Content="Seçilenleri Kur/Güncelle"'
    'Content="Uninstall Selected"'                                                                                                                                    = 'Content="Seçilenleri Kaldır"'
    'Content="Get Installed"'                                                                                                                                         = 'Content="Yüklü Olanları Göster"'
    'Content="Import Config"'                                                                                                                                         = 'Content="Yapılandırmayı İçe Aktar"'
    'Content="Clear Selection"'                                                                                                                                       = 'Content="Seçimi Temizle"'
    'Content="Upgrade All"'                                                                                                                                           = 'Content="Tümünü Güncelle"'
    'Content="Uninstall All"'                                                                                                                                         = 'Content="Tümünü Kaldır"'
    'Content="Install Chocolatey"'                                                                                                                                    = 'Content="Chocolatey Kur"'
    'Content="Install WinGet"'                                                                                                                                        = 'Content="WinGet Kur"'
    
    # Tweaks sekmesi - Kategoriler
    'Text="Essential Tweaks"'                                                                                                                                         = 'Text="Temel Ayarlamalar"'
    'Text="z__Advanced Tweaks - CAUTION"'                                                                                                                             = 'Text="z__Gelişmiş Ayarlamalar - DİKKAT"'
    'Text="Performance Plans"'                                                                                                                                        = 'Text="Performans Planları"'
    'Text="Customize Preferences"'                                                                                                                                    = 'Text="Tercihleri Özelleştir"'
    
    # Tweaks sekmesi - Üst butonlar
    'Content="Recommended Selections:"'                                                                                                                               = 'Content="Önerilen Seçimler:"'
    'Content=" Standard "'                                                                                                                                            = 'Content=" Standart "'
    'Content=" Minimal "'                                                                                                                                             = 'Content=" Minimal "'
    'Content=" Clear "'                                                                                                                                               = 'Content=" Temizle "'
    'Content=" Show Installed Apps "'                                                                                                                                 = 'Content=" Yüklü Uygulamaları Göster "'
    
    # Tweaks sekmesi - Alt butonlar
    'Content="Run Tweaks"'                                                                                                                                            = 'Content="Ayarlamaları Uygula"'
    'Content="Undo Selected Tweaks"'                                                                                                                                  = 'Content="Seçili Ayarlamaları Geri Al"'
    
    # Tweaks sekmesi - Uyarı metinleri
    'Note: Hover over items to get a better description. Please be careful as many of these tweaks will heavily modify your system.'                                  = 'Not: Daha iyi açıklama almak için öğelerin üzerine gelin. Lütfen dikkatli olun, bu ayarlamaların çoğu sisteminizi önemli ölçüde değiştirecektir.'
    'Recommended selections are for normal users and if you are unsure do NOT check anything else!'                                                                   = 'Önerilen seçimler normal kullanıcılar içindir ve emin değilseniz başka hiçbir şeyi işaretLEMEYIN!'
    
    # Config sekmesi - Kategoriler
    'Text="Features"'                                                                                                                                                 = 'Text="Özellikler"'
    'Text="Fixes"'                                                                                                                                                    = 'Text="Düzeltmeler"'
    'Text="Legacy Windows Panels"'                                                                                                                                    = 'Text="Eski Windows Panelleri"'
    'Text="Powershell Profile Powershell 7+ Only"'                                                                                                                    = 'Text="PowerShell Profili (Sadece PowerShell 7+)"'
    'Text="Remote Access"'                                                                                                                                            = 'Text="Uzaktan Erişim"'
    
    # Updates sekmesi - Butonlar ve başlıklar
    'Content="Default Settings"'                                                                                                                                      = 'Content="Varsayılan Ayarlar"'
    'Content="Security Settings"'                                                                                                                                     = 'Content="Güvenlik Ayarları"'
    'Content="Disable All Updates"'                                                                                                                                   = 'Content="Güncellemeleri Kapat"'
    
    # Updates sekmesi - Açıklamalar
    'Default Windows Update Configuration'                                                                                                                            = 'Varsayılan Windows Güncelleme Yapılandırması'
    'No modifications to Windows defaults'                                                                                                                            = 'Windows varsayılanlarında değişiklik yok'
    'Removes any custom update settings'                                                                                                                              = 'Özel güncelleme ayarlarını kaldırır'
    'Balanced Security Configuration'                                                                                                                                 = 'Dengeli Güvenlik Yapılandırması'
    'Feature updates delayed by 365 days'                                                                                                                             = 'Özellik güncellemeleri 365 gün ertelendi'
    'Security updates installed after 4 days'                                                                                                                         = 'Güvenlik güncellemeleri 4 gün sonra yüklendi'
    'Feature Updates:'                                                                                                                                                = 'Özellik Güncellemeleri:'
    'New features and potential bugs'                                                                                                                                 = 'Yeni özellikler ve olası hatalar'
    'Security Updates:'                                                                                                                                               = 'Güvenlik Güncellemeleri:'
    'Critical security patches'                                                                                                                                       = 'Kritik güvenlik yamaları'
    '!! Not Recommended !!'                                                                                                                                           = '!! Önerilmez !!'
    'Disables ALL Windows Updates'                                                                                                                                    = 'TÜM Windows Güncellemelerini devre dışı bırakır'
    'Increases security risks'                                                                                                                                        = 'Güvenlik risklerini artırır'
    'Only use for isolated systems'                                                                                                                                   = 'Yalnızca izole sistemler için kullanın'
    
    # Updates sekmesi - Notlar
    'Note: This resets your Windows Update settings to default out of the box settings. It removes ANY policy or customization that has been done to Windows Update.' = 'Not: Bu, Windows Güncelleme ayarlarınızı varsayılan kutunun dışındaki ayarlara sıfırlar. Windows Güncellemesine yapılan HERHANGİ bir ilke veya özelleştirmeyi kaldırır.'
    'Note: This only applies to Pro systems that can use group policy.'                                                                                               = 'Not: Bu yalnızca grup ilkesini kullanabilen Pro sistemleri için geçerlidir.'
    'Warning: Your system will be vulnerable without security updates.'                                                                                               = 'Uyarı: Sisteminiz güvenlik güncellemeleri olmadan savunmasız kalacaktır.'
    
    # Tooltip'ler
    'Press Ctrl-F and type app name to filter application list below. Press Esc to reset the filter'                                                                  = 'Uygulama listesini filtrelemek için Ctrl-F tuşuna basın ve uygulama adını yazın. Filtreyi sıfırlamak için Esc tuşuna basın'
    'Change the Winutil UI Theme'                                                                                                                                     = 'Winutil Arayüz Temasını Değiştir'
    'Adjust Font Scaling for Accessibility'                                                                                                                           = 'Erişilebilirlik için Yazı Tipi Ölçeklendirmesini Ayarla'
    
    # Tema menüsü
    'Header="Theme"'                                                                                                                                                  = 'Header="Tema"'
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
    'Header="Settings"'                                                                                                                                               = 'Header="Ayarlar"'
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
    
    # Genel butonlar
    'Content="Yes"'                                                                                                                                                   = 'Content="Evet"'
    'Content="No"'                                                                                                                                                    = 'Content="Hayır"'
    'Content="OK"'                                                                                                                                                    = 'Content="Tamam"'
    'Content="Cancel"'                                                                                                                                                = 'Content="İptal"'
    'Content="Close"'                                                                                                                                                 = 'Content="Kapat"'
    'Content="Save"'                                                                                                                                                  = 'Content="Kaydet"'
    'Content="Open"'                                                                                                                                                  = 'Content="Aç"'
    'Content="Browse"'                                                                                                                                                = 'Content="Gözat"'
    'Content="Search"'                                                                                                                                                = 'Content="Ara"'
    'Content="Refresh"'                                                                                                                                               = 'Content="Yenile"'
}

# Çevirileri uygula
foreach ($key in $translations.Keys) {
    $script = $script -replace [regex]::Escape($key), $translations[$key]
}

Write-Host "Türkçe WinUtil başlatılıyor..." -ForegroundColor Green

# Scripti çalıştır
Invoke-Expression $script

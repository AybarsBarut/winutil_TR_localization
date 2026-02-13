<#
.SYNOPSIS
    WinUtil TÃ¼rkÃ§e sÃ¼rÃ¼mÃ¼nÃ¼ Ã§alÄ±ÅŸtÄ±rÄ±r
.DESCRIPTION
    Bu script GitHub'dan en gÃ¼ncel WinUtil sÃ¼rÃ¼mÃ¼nÃ¼ indirir ve UI elementlerini TÃ¼rkÃ§e'ye Ã§evirir.
.EXAMPLE
    .\windevTR.ps1
#>

Write-Host "WinUtil TÃ¼rkÃ§e sÃ¼rÃ¼mÃ¼ hazÄ±rlanÄ±yor..." -ForegroundColor Cyan

# En gÃ¼ncel sÃ¼rÃ¼mÃ¼ GitHub'dan indir
$latestTag = (Invoke-RestMethod "https://api.github.com/repos/ChrisTitusTech/winutil/tags")[0].name
Write-Host "En gÃ¼ncel sÃ¼rÃ¼m indiriliyor: $latestTag" -ForegroundColor Yellow
$script = Invoke-RestMethod "https://github.com/ChrisTitusTech/winutil/releases/download/$latestTag/winutil.ps1"

Write-Host "TÃ¼rkÃ§e Ã§eviriler uygulanÄ±yor..." -ForegroundColor Yellow

# XAML ve JSON iÃ§indeki metinleri TÃ¼rkÃ§e'ye Ã§evir
$translations = @{
    # Ana sekmeler
    '<Underline>I</Underline>nstall'                                                                                                                                  = '<Underline>K</Underline>ur'
    '<Underline>T</Underline>weaks'                                                                                                                                   = '<Underline>A</Underline>yarlamalar'
    '<Underline>C</Underline>onfig'                                                                                                                                   = '<Underline>Y</Underline>apÄ±landÄ±rma'
    '<Underline>U</Underline>pdates'                                                                                                                                  = '<Underline>G</Underline>Ã¼ncellemeler'
    
    # TabItem Headers
    'Header="Install"'                                                                                                                                                = 'Header="Kur"'
    'Header="Tweaks"'                                                                                                                                                 = 'Header="Ayarlamalar"'
    'Header="Config"'                                                                                                                                                 = 'Header="YapÄ±landÄ±rma"'
    'Header="Updates"'                                                                                                                                                = 'Header="GÃ¼ncellemeler"'
    
    # Install sekmesi - Actions butonlarÄ± (JSON'dan geliyor)
    '"Content": "Install/Upgrade Applications"'                                                                                                                       = '"Content": "UygulamalarÄ± Kur/GÃ¼ncelle"'
    '"Content": "Uninstall Applications"'                                                                                                                             = '"Content": "UygulamalarÄ± KaldÄ±r"'
    '"Content": "Upgrade all Applications"'                                                                                                                           = '"Content": "TÃ¼m UygulamalarÄ± GÃ¼ncelle"'
    '"ButtonContent": "Install/Upgrade Selected"'                                                                                                                     = '"ButtonContent": "SeÃ§ilenleri Kur/GÃ¼ncelle"'
    '"ButtonContent": "Uninstall Selected"'                                                                                                                           = '"ButtonContent": "SeÃ§ilenleri KaldÄ±r"'
    '"ButtonContent": "Get Installed"'                                                                                                                                = '"ButtonContent": "YÃ¼klÃ¼ OlanlarÄ± GÃ¶ster"'
    '"ButtonContent": "Import Config"'                                                                                                                                = '"ButtonContent": "YapÄ±landÄ±rmayÄ± Ä°Ã§e Aktar"'
    '"ButtonContent": "Upgrade All"'                                                                                                                                  = '"ButtonContent": "TÃ¼mÃ¼nÃ¼ GÃ¼ncelle"'
    
    # Install sekmesi - Selection butonlarÄ± (JSON'dan geliyor)
    '"Content": "Clear Selection"'                                                                                                                                    = '"Content": "SeÃ§imi Temizle"'
    '"Content": "Collapse All Categories"'                                                                                                                            = '"Content": "TÃ¼m Kategorileri Daralt"'
    '"Content": "Expand All Categories"'                                                                                                                              = '"Content": "TÃ¼m Kategorileri GeniÅŸlet"'
    '"Content": "Get Installed"'                                                                                                                                      = '"Content": "YÃ¼klÃ¼ OlanlarÄ± GÃ¶ster"'
    '"Content": "Selected Apps: 0"'                                                                                                                                   = '"Content": "SeÃ§ili Uygulamalar: 0"'
    
    # Tweaks sekmesi - Tweak isimleri (JSON'dan geliyor - en yaygÄ±n olanlar)
    '"Content": "Create Restore Point"'                                                                                                                               = '"Content": "Geri YÃ¼kleme NoktasÄ± OluÅŸtur"'
    '"Content": "Delete Temporary Files"'                                                                                                                             = '"Content": "GeÃ§ici DosyalarÄ± Sil"'
    '"Content": "Disable Activity History"'                                                                                                                           = '"Content": "Etkinlik GeÃ§miÅŸini Devre DÄ±ÅŸÄ± BÄ±rak"'
    '"Content": "Disable Consumer Features"'                                                                                                                          = '"Content": "TÃ¼ketici Ã–zelliklerini Devre DÄ±ÅŸÄ± BÄ±rak"'
    '"Content": "Disable Hibernation"'                                                                                                                                = '"Content": "HazÄ±rda Bekletmeyi Devre DÄ±ÅŸÄ± BÄ±rak"'
    '"Content": "Disable Location Tracking"'                                                                                                                          = '"Content": "Konum Takibini Devre DÄ±ÅŸÄ± BÄ±rak"'
    '"Content": "Disable Powershell 7 Telemetry"'                                                                                                                     = '"Content": "PowerShell 7 Telemetrisini Devre DÄ±ÅŸÄ± BÄ±rak"'
    '"Content": "Disable Telemetry"'                                                                                                                                  = '"Content": "Telemetriyi Devre DÄ±ÅŸÄ± BÄ±rak"'
    '"Content": "Disable Windows Platform Binary Table"'                                                                                                              = '"Content": "Windows Platform Binary Table Devre DÄ±ÅŸÄ± BÄ±rak"'
    '"Content": "Enable End Task With Right Click"'                                                                                                                   = '"Content": "SaÄŸ TÄ±kla ile GÃ¶revi SonlandÄ±rmayÄ± EtkinleÅŸtir"'
    '"Content": "Remove Widgets"'                                                                                                                                     = '"Content": "Widget''larÄ± KaldÄ±r"'
    '"Content": "Run Disk Cleanup"'                                                                                                                                   = '"Content": "Disk TemizliÄŸi Ã‡alÄ±ÅŸtÄ±r"'
    '"Content": "Set Services to Manual"'                                                                                                                             = '"Content": "Hizmetleri Manuel Yap"'
    '"Content": "Adobe Network Block"'                                                                                                                                = '"Content": "Adobe AÄŸ Engelleme"'
    '"Content": "Block Razer Software Installs"'                                                                                                                      = '"Content": "Razer YazÄ±lÄ±m KurulumlarÄ±nÄ± Engelle"'
    '"Content": "Brave Debloat"'                                                                                                                                      = '"Content": "Brave Temizleme"'
    '"Content": "Disable Background Apps"'                                                                                                                            = '"Content": "Arka Plan UygulamalarÄ±nÄ± Devre DÄ±ÅŸÄ± BÄ±rak"'
    '"Content": "Disable Fullscreen Optimizations"'                                                                                                                   = '"Content": "Tam Ekran OptimizasyonlarÄ±nÄ± Devre DÄ±ÅŸÄ± BÄ±rak"'
    '"Content": "Disable IPv6"'                                                                                                                                       = '"Content": "IPv6 Devre DÄ±ÅŸÄ± BÄ±rak"'
    '"Content": "Disable Microsoft Copilot"'                                                                                                                          = '"Content": "Microsoft Copilot Devre DÄ±ÅŸÄ± BÄ±rak"'
    '"Content": "Disable Notification Tray/Calendar"'                                                                                                                 = '"Content": "Bildirim Tepsisi/Takvimi Devre DÄ±ÅŸÄ± BÄ±rak"'
    '"Content": "Disable Storage Sense"'                                                                                                                              = '"Content": "Depolama AlgÄ±lama Devre DÄ±ÅŸÄ± BÄ±rak"'
    '"Content": "Disable Teredo"'                                                                                                                                     = '"Content": "Teredo Devre DÄ±ÅŸÄ± BÄ±rak"'
    '"Content": "Edge Debloat"'                                                                                                                                       = '"Content": "Edge Temizleme"'
    '"Content": "Prefer IPv4 over IPv6"'                                                                                                                              = '"Content": "IPv6 Yerine IPv4 Tercih Et"'
    '"Content": "Remove ALL MS Store Apps - NOT RECOMMENDED"'                                                                                                         = '"Content": "TÃœM MS Store UygulamalarÄ±nÄ± KaldÄ±r - Ã–NERÄ°LMEZ"'
    '"Content": "Remove Gallery from Explorer"'                                                                                                                       = '"Content": "Gezgin''den Galeriyi KaldÄ±r"'
    '"Content": "Remove Home from Explorer"'                                                                                                                          = '"Content": "Gezgin''den Ana Sayfa KaldÄ±r"'
    '"Content": "Remove Microsoft Edge"'                                                                                                                              = '"Content": "Microsoft Edge KaldÄ±r"'
    
    # Tweaks sekmesi - Customize Preferences (JSON'dan geliyor)
    '"Content": "Bing Search in Start Menu"'                                                                                                                          = '"Content": "BaÅŸlat MenÃ¼sÃ¼nde Bing AramasÄ±"'
    '"Content": "Center Taskbar Items"'                                                                                                                               = '"Content": "GÃ¶rev Ã‡ubuÄŸu Ã–ÄŸelerini Ortala"'
    '"Content": "Cross-Device Resume"'                                                                                                                                = '"Content": "Cihazlar ArasÄ± Devam Etme"'
    '"Content": "Dark Theme for Windows"'                                                                                                                             = '"Content": "Windows iÃ§in Koyu Tema"'
    '"Content": "Detailed BSoD"'                                                                                                                                      = '"Content": "DetaylÄ± BSoD"'
    '"Content": "Disable Multiplane Overlay"'                                                                                                                         = '"Content": "Multiplane Overlay Devre DÄ±ÅŸÄ± BÄ±rak"'
    '"Content": "Mouse Acceleration"'                                                                                                                                 = '"Content": "Fare HÄ±zlandÄ±rma"'
    '"Content": "New Outlook"'                                                                                                                                        = '"Content": "Yeni Outlook"'
    '"Content": "NumLock on Startup"'                                                                                                                                 = '"Content": "BaÅŸlangÄ±Ã§ta NumLock"'
    '"Content": "Recommendations in Start Menu"'                                                                                                                      = '"Content": "BaÅŸlat MenÃ¼sÃ¼nde Ã–neriler"'
    '"Content": "Remove Settings Home Page"'                                                                                                                          = '"Content": "Ayarlar Ana SayfasÄ±nÄ± KaldÄ±r"'
    '"Content": "S3 Sleep"'                                                                                                                                           = '"Content": "S3 Uyku"'
    '"Content": "Search Button in Taskbar"'                                                                                                                           = '"Content": "GÃ¶rev Ã‡ubuÄŸunda Arama DÃ¼ÄŸmesi"'
    '"Content": "Show File Extensions"'                                                                                                                               = '"Content": "Dosya UzantÄ±larÄ±nÄ± GÃ¶ster"'
    '"Content": "Show Hidden Files"'                                                                                                                                  = '"Content": "Gizli DosyalarÄ± GÃ¶ster"'
    '"Content": "Sticky Keys"'                                                                                                                                        = '"Content": "YapÄ±ÅŸkan TuÅŸlar"'
    '"Content": "Task View Button in Taskbar"'                                                                                                                        = '"Content": "GÃ¶rev Ã‡ubuÄŸunda GÃ¶rev GÃ¶rÃ¼nÃ¼mÃ¼ DÃ¼ÄŸmesi"'
    '"Content": "Verbose Messages During Logon"'                                                                                                                      = '"Content": "Oturum AÃ§ma SÄ±rasÄ±nda AyrÄ±ntÄ±lÄ± Mesajlar"'
    
    # Tweaks sekmesi - Performance Plans
    '"Content": "Add and Activate Ultimate Performance Profile"'                                                                                                      = '"Content": "Ultimate Performans Profilini Ekle ve EtkinleÅŸtir"'
    '"Content": "Remove Ultimate Performance Profile"'                                                                                                                = '"Content": "Ultimate Performans Profilini KaldÄ±r"'
    
    # Config sekmesi - Features (JSON'dan geliyor)
    '"Content": "All .Net Framework (2, 3, 4)"'                                                                                                                       = '"Content": "TÃ¼m .Net Framework (2, 3, 4)"'
    '"Content": "HyperV Virtualization"'                                                                                                                              = '"Content": "HyperV SanallaÅŸtÄ±rma"'
    '"Content": "Legacy Media (WMP, DirectPlay)"'                                                                                                                     = '"Content": "Eski Medya (WMP, DirectPlay)"'
    '"Content": "Windows Subsystem for Linux"'                                                                                                                        = '"Content": "Linux iÃ§in Windows Alt Sistemi"'
    '"Content": "NFS - Network File System"'                                                                                                                          = '"Content": "NFS - AÄŸ Dosya Sistemi"'
    '"Content": "Enable Daily Registry Backup Task (Runs at 12:30 AM)"'                                                                                               = '"Content": "GÃ¼nlÃ¼k KayÄ±t Defteri Yedekleme GÃ¶revini EtkinleÅŸtir (Gece 00:30)"'
    '"Content": "Enable Legacy F8 Boot Recovery"'                                                                                                                     = '"Content": "Eski F8 Ã–nyÃ¼kleme KurtarmayÄ± EtkinleÅŸtir"'
    '"Content": "Disable Legacy F8 Boot Recovery"'                                                                                                                    = '"Content": "Eski F8 Ã–nyÃ¼kleme KurtarmayÄ± Devre DÄ±ÅŸÄ± BÄ±rak"'
    '"Content": "Windows Sandbox"'                                                                                                                                    = '"Content": "Windows Sandbox"'
    '"Content": "Install Features"'                                                                                                                                   = '"Content": "Ã–zellikleri Kur"'
    
    # Config sekmesi - Fixes (JSON'dan geliyor)
    '"Content": "Set Up Autologin"'                                                                                                                                   = '"Content": "Otomatik Oturum AÃ§mayÄ± Ayarla"'
    '"Content": "Reset Windows Update"'                                                                                                                               = '"Content": "Windows GÃ¼ncellemesini SÄ±fÄ±rla"'
    '"Content": "Reset Network"'                                                                                                                                      = '"Content": "AÄŸÄ± SÄ±fÄ±rla"'
    '"Content": "System Corruption Scan"'                                                                                                                             = '"Content": "Sistem Bozulma TaramasÄ±"'
    '"Content": "WinGet Reinstall"'                                                                                                                                   = '"Content": "WinGet Yeniden YÃ¼kle"'
    '"Content": "Remove Adobe Creative Cloud"'                                                                                                                        = '"Content": "Adobe Creative Cloud KaldÄ±r"'
    
    # Config sekmesi - Legacy Windows Panels (JSON'dan geliyor)
    '"Content": "Control Panel"'                                                                                                                                      = '"Content": "Denetim MasasÄ±"'
    '"Content": "Computer Management"'                                                                                                                                = '"Content": "Bilgisayar YÃ¶netimi"'
    '"Content": "Network Connections"'                                                                                                                                = '"Content": "AÄŸ BaÄŸlantÄ±larÄ±"'
    '"Content": "Power Panel"'                                                                                                                                        = '"Content": "GÃ¼Ã§ Paneli"'
    '"Content": "Printer Panel"'                                                                                                                                      = '"Content": "YazÄ±cÄ± Paneli"'
    '"Content": "Region"'                                                                                                                                             = '"Content": "BÃ¶lge"'
    '"Content": "Windows Restore"'                                                                                                                                    = '"Content": "Windows Geri YÃ¼kleme"'
    '"Content": "Sound Settings"'                                                                                                                                     = '"Content": "Ses AyarlarÄ±"'
    '"Content": "System Properties"'                                                                                                                                  = '"Content": "Sistem Ã–zellikleri"'
    '"Content": "Date and Time"'                                                                                                                                      = '"Content": "Tarih ve Saat"'
    
    # Config sekmesi - PowerShell Profile
    '"Content": "Install CTT PowerShell Profile"'                                                                                                                     = '"Content": "CTT PowerShell Profilini YÃ¼kle"'
    '"Content": "Uninstall CTT PowerShell Profile"'                                                                                                                   = '"Content": "CTT PowerShell Profilini KaldÄ±r"'
    
    # Config sekmesi - Remote Access
    '"Content": "Enable OpenSSH Server"'                                                                                                                              = '"Content": "OpenSSH Sunucusunu EtkinleÅŸtir"'
    
    # Install sekmesi - Sol panel kategorileri
    'Text="Actions"'                                                                                                                                                  = 'Text="Ä°ÅŸlemler"'
    'Text="Package Manager"'                                                                                                                                          = 'Text="Paket YÃ¶neticisi"'
    'Text="Select Icon"'                                                                                                                                              = 'Text="Simge SeÃ§"'
    'Text="Selection"'                                                                                                                                                = 'Text="SeÃ§im"'
    'Text="Applications"'                                                                                                                                             = 'Text="Uygulamalar"'
    'Text="Communication"'                                                                                                                                            = 'Text="Ä°letiÅŸim"'
    'Text="Development"'                                                                                                                                              = 'Text="GeliÅŸtirme"'
    'Text="Browsers"'                                                                                                                                                 = 'Text="TarayÄ±cÄ±lar"'
    'Text="Games"'                                                                                                                                                    = 'Text="Oyunlar"'
    'Text="Multimedia Tools"'                                                                                                                                         = 'Text="Multimedya AraÃ§larÄ±"'
    'Text="Microsoft Tools"'                                                                                                                                          = 'Text="Microsoft AraÃ§larÄ±"'
    'Text="Utilities"'                                                                                                                                                = 'Text="YardÄ±mcÄ± Programlar"'
    'Text="Pro Tools"'                                                                                                                                                = 'Text="Profesyonel AraÃ§lar"'
    'Text="Document"'                                                                                                                                                 = 'Text="Belge"'
    
    # Install sekmesi - Butonlar
    'Content="Install/Upgrade Selected"'                                                                                                                              = 'Content="SeÃ§ilenleri Kur/GÃ¼ncelle"'
    'Content="Uninstall Selected"'                                                                                                                                    = 'Content="SeÃ§ilenleri KaldÄ±r"'
    'Content="Get Installed"'                                                                                                                                         = 'Content="YÃ¼klÃ¼ OlanlarÄ± GÃ¶ster"'
    'Content="Import Config"'                                                                                                                                         = 'Content="YapÄ±landÄ±rmayÄ± Ä°Ã§e Aktar"'
    'Content="Clear Selection"'                                                                                                                                       = 'Content="SeÃ§imi Temizle"'
    'Content="Upgrade All"'                                                                                                                                           = 'Content="TÃ¼mÃ¼nÃ¼ GÃ¼ncelle"'
    'Content="Uninstall All"'                                                                                                                                         = 'Content="TÃ¼mÃ¼nÃ¼ KaldÄ±r"'
    'Content="Install Chocolatey"'                                                                                                                                    = 'Content="Chocolatey Kur"'
    'Content="Install WinGet"'                                                                                                                                        = 'Content="WinGet Kur"'
    
    # Tweaks sekmesi - Kategoriler
    'Text="Essential Tweaks"'                                                                                                                                         = 'Text="Temel Ayarlamalar"'
    'Text="z__Advanced Tweaks - CAUTION"'                                                                                                                             = 'Text="z__GeliÅŸmiÅŸ Ayarlamalar - DÄ°KKAT"'
    'Text="Performance Plans"'                                                                                                                                        = 'Text="Performans PlanlarÄ±"'
    'Text="Customize Preferences"'                                                                                                                                    = 'Text="Tercihleri Ã–zelleÅŸtir"'
    
    # Tweaks sekmesi - Ãœst butonlar
    'Content="Recommended Selections:"'                                                                                                                               = 'Content="Ã–nerilen SeÃ§imler:"'
    'Content=" Standard "'                                                                                                                                            = 'Content=" Standart "'
    'Content=" Minimal "'                                                                                                                                             = 'Content=" Minimal "'
    'Content=" Clear "'                                                                                                                                               = 'Content=" Temizle "'
    'Content=" Show Installed Apps "'                                                                                                                                 = 'Content=" YÃ¼klÃ¼ UygulamalarÄ± GÃ¶ster "'
    
    # Tweaks sekmesi - Alt butonlar
    'Content="Run Tweaks"'                                                                                                                                            = 'Content="AyarlamalarÄ± Uygula"'
    'Content="Undo Selected Tweaks"'                                                                                                                                  = 'Content="SeÃ§ili AyarlamalarÄ± Geri Al"'
    
    # Tweaks sekmesi - UyarÄ± metinleri
    'Note: Hover over items to get a better description. Please be careful as many of these tweaks will heavily modify your system.'                                  = 'Not: Daha iyi aÃ§Ä±klama almak iÃ§in Ã¶ÄŸelerin Ã¼zerine gelin. LÃ¼tfen dikkatli olun, bu ayarlamalarÄ±n Ã§oÄŸu sisteminizi Ã¶nemli Ã¶lÃ§Ã¼de deÄŸiÅŸtirecektir.'
    'Recommended selections are for normal users and if you are unsure do NOT check anything else!'                                                                   = 'Ã–nerilen seÃ§imler normal kullanÄ±cÄ±lar iÃ§indir ve emin deÄŸilseniz baÅŸka hiÃ§bir ÅŸeyi iÅŸaretLEMEYIN!'
    
    # Config sekmesi - Kategoriler
    'Text="Features"'                                                                                                                                                 = 'Text="Ã–zellikler"'
    'Text="Fixes"'                                                                                                                                                    = 'Text="DÃ¼zeltmeler"'
    'Text="Legacy Windows Panels"'                                                                                                                                    = 'Text="Eski Windows Panelleri"'
    'Text="Powershell Profile Powershell 7+ Only"'                                                                                                                    = 'Text="PowerShell Profili (Sadece PowerShell 7+)"'
    'Text="Remote Access"'                                                                                                                                            = 'Text="Uzaktan EriÅŸim"'
    
    # Updates sekmesi - Butonlar ve baÅŸlÄ±klar
    'Content="Default Settings"'                                                                                                                                      = 'Content="VarsayÄ±lan Ayarlar"'
    'Content="Security Settings"'                                                                                                                                     = 'Content="GÃ¼venlik AyarlarÄ±"'
    'Content="Disable All Updates"'                                                                                                                                   = 'Content="TÃ¼m GÃ¼ncellemeleri Devre DÄ±ÅŸÄ± BÄ±rak"'
    
    # Updates sekmesi - AÃ§Ä±klamalar
    'Default Windows Update Configuration'                                                                                                                            = 'VarsayÄ±lan Windows GÃ¼ncelleme YapÄ±landÄ±rmasÄ±'
    'No modifications to Windows defaults'                                                                                                                            = 'Windows varsayÄ±lanlarÄ±nda deÄŸiÅŸiklik yok'
    'Removes any custom update settings'                                                                                                                              = 'Ã–zel gÃ¼ncelleme ayarlarÄ±nÄ± kaldÄ±rÄ±r'
    'Balanced Security Configuration'                                                                                                                                 = 'Dengeli GÃ¼venlik YapÄ±landÄ±rmasÄ±'
    'Feature updates delayed by 365 days'                                                                                                                             = 'Ã–zellik gÃ¼ncellemeleri 365 gÃ¼n ertelendi'
    'Security updates installed after 4 days'                                                                                                                         = 'GÃ¼venlik gÃ¼ncellemeleri 4 gÃ¼n sonra yÃ¼klendi'
    'Feature Updates:'                                                                                                                                                = 'Ã–zellik GÃ¼ncellemeleri:'
    'New features and potential bugs'                                                                                                                                 = 'Yeni Ã¶zellikler ve olasÄ± hatalar'
    'Security Updates:'                                                                                                                                               = 'GÃ¼venlik GÃ¼ncellemeleri:'
    'Critical security patches'                                                                                                                                       = 'Kritik gÃ¼venlik yamalarÄ±'
    '!! Not Recommended !!'                                                                                                                                           = '!! Ã–nerilmez !!'
    'Disables ALL Windows Updates'                                                                                                                                    = 'TÃœM Windows GÃ¼ncellemelerini devre dÄ±ÅŸÄ± bÄ±rakÄ±r'
    'Increases security risks'                                                                                                                                        = 'GÃ¼venlik risklerini artÄ±rÄ±r'
    'Only use for isolated systems'                                                                                                                                   = 'YalnÄ±zca izole sistemler iÃ§in kullanÄ±n'
    
    # Updates sekmesi - Notlar
    'Note: This resets your Windows Update settings to default out of the box settings. It removes ANY policy or customization that has been done to Windows Update.' = 'Not: Bu, Windows GÃ¼ncelleme ayarlarÄ±nÄ±zÄ± varsayÄ±lan kutunun dÄ±ÅŸÄ±ndaki ayarlara sÄ±fÄ±rlar. Windows GÃ¼ncellemesi''ne yapÄ±lan HERHANGÄ° bir ilke veya Ã¶zelleÅŸtirmeyi kaldÄ±rÄ±r.'
    'Note: This only applies to Pro systems that can use group policy.'                                                                                               = 'Not: Bu yalnÄ±zca grup ilkesini kullanabilen Pro sistemleri iÃ§in geÃ§erlidir.'
    'Warning: Your system will be vulnerable without security updates.'                                                                                               = 'UyarÄ±: Sisteminiz gÃ¼venlik gÃ¼ncellemeleri olmadan savunmasÄ±z kalacaktÄ±r.'
    
    # Tooltip'ler
    'Press Ctrl-F and type app name to filter application list below. Press Esc to reset the filter'                                                                  = 'Uygulama listesini filtrelemek iÃ§in Ctrl-F tuÅŸuna basÄ±n ve uygulama adÄ±nÄ± yazÄ±n. Filtreyi sÄ±fÄ±rlamak iÃ§in Esc tuÅŸuna basÄ±n'
    'Change the Winutil UI Theme'                                                                                                                                     = 'Winutil ArayÃ¼z TemasÄ±nÄ± DeÄŸiÅŸtir'
    'Adjust Font Scaling for Accessibility'                                                                                                                           = 'EriÅŸilebilirlik iÃ§in YazÄ± Tipi Ã–lÃ§eklendirmesini Ayarla'
    
    # Tema menÃ¼sÃ¼
    'Header="Theme"'                                                                                                                                                  = 'Header="Tema"'
    'Header="Auto"'                                                                                                                                                   = 'Header="Otomatik"'
    'Follow the Windows Theme'                                                                                                                                        = 'Windows TemasÄ±nÄ± Takip Et'
    'Header="Dark"'                                                                                                                                                   = 'Header="Koyu"'
    'Use Dark Theme'                                                                                                                                                  = 'Koyu Tema Kullan'
    'Header="Light"'                                                                                                                                                  = 'Header="AÃ§Ä±k"'
    'Use Light Theme'                                                                                                                                                 = 'AÃ§Ä±k Tema Kullan'
    
    # Font Scaling
    'Text="Font Scaling"'                                                                                                                                             = 'Text="YazÄ± Tipi Ã–lÃ§eklendirmesi"'
    'Text="Small"'                                                                                                                                                    = 'Text="KÃ¼Ã§Ã¼k"'
    'Text="Large"'                                                                                                                                                    = 'Text="BÃ¼yÃ¼k"'
    'Content="Reset"'                                                                                                                                                 = 'Content="SÄ±fÄ±rla"'
    'Content="Apply"'                                                                                                                                                 = 'Content="Uygula"'
    
    # Ayarlar menÃ¼sÃ¼
    'Header="Settings"'                                                                                                                                               = 'Header="Ayarlar"'
    'Header="Import"'                                                                                                                                                 = 'Header="Ä°Ã§e Aktar"'
    'Import Configuration from exported file.'                                                                                                                        = 'DÄ±ÅŸa aktarÄ±lan dosyadan yapÄ±landÄ±rmayÄ± iÃ§e aktar.'
    'Header="Export"'                                                                                                                                                 = 'Header="DÄ±ÅŸa Aktar"'
    'Export Selected Elements and copy execution command to clipboard.'                                                                                               = 'SeÃ§ili Ã¶ÄŸeleri dÄ±ÅŸa aktar ve yÃ¼rÃ¼tme komutunu panoya kopyala.'
    'Header="About"'                                                                                                                                                  = 'Header="HakkÄ±nda"'
    'Header="Sponsors"'                                                                                                                                               = 'Header="Sponsorlar"'
    
    # BaÄŸlam menÃ¼sÃ¼
    'Header="Cut"'                                                                                                                                                    = 'Header="Kes"'
    'Header="Copy"'                                                                                                                                                   = 'Header="Kopyala"'
    'Header="Paste"'                                                                                                                                                  = 'Header="YapÄ±ÅŸtÄ±r"'
    
    # Genel butonlar
    'Content="Yes"'                                                                                                                                                   = 'Content="Evet"'
    'Content="No"'                                                                                                                                                    = 'Content="HayÄ±r"'
    'Content="OK"'                                                                                                                                                    = 'Content="Tamam"'
    'Content="Cancel"'                                                                                                                                                = 'Content="Ä°ptal"'
    'Content="Close"'                                                                                                                                                 = 'Content="Kapat"'
    'Content="Save"'                                                                                                                                                  = 'Content="Kaydet"'
    'Content="Open"'                                                                                                                                                  = 'Content="AÃ§"'
    'Content="Browse"'                                                                                                                                                = 'Content="GÃ¶zat"'
    'Content="Search"'                                                                                                                                                = 'Content="Ara"'
    'Content="Refresh"'                                                                                                                                               = 'Content="Yenile"'
}

# Ã‡evirileri uygula
foreach ($key in $translations.Keys) {
    $script = $script -replace [regex]::Escape($key), $translations[$key]
}

Write-Host "TÃ¼rkÃ§e WinUtil baÅŸlatÄ±lÄ±yor..." -ForegroundColor Green

# Scripti Ã§alÄ±ÅŸtÄ±r
Invoke-Expression $script

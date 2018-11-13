
set BASE="boxstarter.common" "boxstarter.bootstrapper" "boxstarter.chocolatey" "boxstarter" "boxstarter.winconfig"
set BASE=%BASE% "chocolateygui" "chocolatey-core.extension" "chocolatey-fastanswers.extension"
set BASE=%BASE% "dropbox" "postman" "anaconda3" "wsl" "yarn"
set SYSTEM="googlechrome" "firefox" "sysinternals" "filezilla"
set UTILS="putty.install" "WinSCP" "7zip" "flashplayerplugin" "mysql.workbench" "imagemagick.app" "adobeair"
set UTILS=%UTILS% "adobereader" "kdiff3" "flashplayeractivex" "adobereader-update" "powershell" "adobeshockwaveplayer" "pdfcreator"
set UTILS=%UTILS% "treesizefree" "slack" "vlc" "sourcetree" "cpu-z.install" "hwinfo.install"
set EDITORS="notepadplusplus" "phpstorm" "sublimetext3" "sublimetext3.packagecontrol" "freevideoeditor" "openoffice" "jivkok.sublimetext3.packages"
set PACKAGES=%BASE% %SYSTEM% %UTILS% %EDITORS%

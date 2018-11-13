# Description: Boxstarter Script
# Author: David Moseley
# Common settings for web dev

Disable-UAC

# Get the base URI path from the ScriptToCall value
$packageArg = "-bootstrapPackage"
$helperUri = $Boxstarter['ScriptToCall']
$strpos = $helperUri.IndexOf($packageArg)
$helperUri = $helperUri.Substring($strpos + $packageArg.Length)
$helperUri = $helperUri.TrimStart("'", " ")
$helperUri = $helperUri.TrimEnd("'", " ")
$helperUri = $helperUri.Substring(0, $helperUri.LastIndexOf("/"))
$helperUri += "/scripts"
write-host "helper script base URI is $helperUri"

function executeScript {
    Param ([string]$script)
    write-host "executing $helperUri/$script ..."
	iex ((new-object net.webclient).DownloadString("$helperUri/$script"))
}

#--- Setting up Windows ---
executeScript "FileExplorerSettings.ps1";
executeScript "SystemConfiguration.ps1";
executeScript "CommonDevTools.ps1";
executeScript "RemoveDefaultApps.ps1";
executeScript "Browsers.ps1";

choco install -y vscode
choco install -y SublimeText3
choco install -y sublimetext3.packagecontrol
choco install -y jivkok.sublimetext3.packages
choco install -y notepadplusplus
choco install -y zeal
choco install -y scriptcs
choco install -y freevideoeditor
choco install -y openoffice


#--- Tools ---
code --install-extension msjsdiag.debugger-for-chrome
code --install-extension msjsdiag.debugger-for-edge

choco install -y dropbox
choco install -y slack
choco install -y winscp
choco install -y HeidiSQL
choco install -y mysql.workbench
choco install -y notepadplusplus
choco install -y sharex
choco install -y cmder
choco install -y putty # installing because we want the pageant ssh agent4
choco install -y puretext # paste as plain text with Win + V
choco install -y phpstorm

executeScript "HyperV.ps1";
executeScript "WSL.ps1";
executeScript "Docker.ps1";


Enable-UAC
Enable-MicrosoftUpdate
Install-WindowsUpdate -acceptEula

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
executeScript "HyperV.ps1";
RefreshEnv
executeScript "WSL.ps1";
RefreshEnv
executeScript "Docker.ps1";
executeScript "Browsers.ps1";

#--- Tools ---
code --install-extension msjsdiag.debugger-for-chrome
code --install-extension msjsdiag.debugger-for-edge

choco install dropbox -y
choco install slack -y
choco install winscp -y
choco install HeidiSQL -y
choco install notepadplusplus -y
choco install sharex -y
choco install cmder -y
choco install putty -y # installing because we want the pageant ssh agent4
choco install puretext -y # paste as plain text with Win + V

Enable-UAC
Enable-MicrosoftUpdate
Install-WindowsUpdate -acceptEula

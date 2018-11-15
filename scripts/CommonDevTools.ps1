

#--- Fonts
choco install hackfont firacode inconsolata -y # dejavufonts robotofonts droidfonts -y

#--- Basic Tools
choco install curl wget openssh 7zip -y

RefreshEnv

# tools we expect devs across many scenarios will want
choco install -y dotnetcore-sdk
# choco install -y windows-sdk-10.1
choco install -y git -params '"/GitAndUnixToolsOnPath /WindowsTerminal"'
choco install -y yarn
# choco install -y 7zip.install
# choco install -y anaconda3
choco install -y sysinternals
# choco install -y autohotkey
choco install -y diffmerge


choco feature disable --name=checksumFiles
choco feature enable --name=allowGlobalConfirmation




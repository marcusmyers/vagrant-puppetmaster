
netsh interface ip set address name="Local Area Connection 2" source=static addr=192.168.2.100 mask=255.255.255.0 

type "%SystemRoot%\system32\drivers\etc\hosts" | find "192.168.2.10    puppet.nacswildcats.dev" ||echo 192.168.2.10    puppet.nacswildcats.dev>>"%SystemRoot%\system32\drivers\etc\hosts"

@powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('http://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%systemdrive%\chocolatey\bin

@powershell -NoProfile -ExecutionPolicy unrestricted -File "C:\vagrant\windows.ps1 -agent xp -Msi puppet-3.6.2.msi"

ping -n 20 -w 1 127.0.0.1>nul

del /F C:\vagrant\puppet-*.msi


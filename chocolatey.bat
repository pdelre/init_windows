@powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('http://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%systemdrive%\chocolatey\bin
 
cinstm fiddler
cinstm 7zip
cinstm notepadplusplus
cinstm GoogleChrome.Canary
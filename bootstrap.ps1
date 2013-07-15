D:\VBoxWindowsAdditions.exe /S
 
dotNetFx40_Client_x86_x64.exe /passive /norestart
 
REM remove pins
if(!(Test-Path "HKCU:\Software\Policies\Microsoft\Windows\Explorer")) { New-Item "HKCU:\Software\Policies\Microsoft\Windows\Explorer" }
New-ItemProperty -path "HKCU:\Software\Policies\Microsoft\Windows\Explorer" -name "TaskbarNoPinnedList" -Type DWORD -value "1"
 
REM no grouping
Set-ItemProperty -path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -name "TaskbarGlomLevel" -Type DWORD -value "2"
Set-ItemProperty -path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -name "TaskbarSmallIcons" -Type DWORD -value "1"
 
REM hidden files & extensions
Set-ItemProperty -path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -name "Hidden" -Type DWORD -value "1"
Set-ItemProperty -path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -name "HideFileExt" -Type DWORD -value "0"
 
REM show all notifications
Set-ItemProperty -path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer" -name "EnableAutoTray" -Type DWORD -value "0"
 
REM set timezone
tzutil /s "Eastern Standard Time"
 
Stop-Process -processname explorer -Force
Start-Process $env:systemroot\explorer.exe
 
REM cmd options
Set-ItemProperty -path "HKCU:\Console" -name "QuickEdit" -Type DWORD -value "1"
Set-ItemProperty -path "HKCU:\Console" -name "HistoryBufferSize" -Type DWORD -value "100"
REM 0x0028 = 40 height; 0x0064 = 100 width
Set-ItemProperty -path "HKCU:\Console" -name "WindowSize" -Type DWORD -value "0x00280064"
REM 0x270F = 9999 height; 0x0064 = 100 width
Set-ItemProperty -path "HKCU:\Console" -name "ScreenBufferSize" -Type DWORD -value "0x270F0064"
 
REM disabled Windows Update auto reboot
Set-ItemProperty -path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -name "NoAutoRebootWithLoggedOnUsers" -Type DWORD -value "1"
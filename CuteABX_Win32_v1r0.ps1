$cuteenv_software = "MusicPlayerSoftware Version 1.4 outputting Audio Streaming through User123's plugin and no other DSP plugins used, Operating System changes - disabling generic error sounds, disabling audio interface energy management profiles"
$cuteenv_hardware = "Laptop Company_Name Model Configuration (eg 8GB RAM, Model 500 GPU with 1GB VRAM), Data cable make and model, DAC make and model and modifications if any (eg: external clock source, external Digital Isolators)"
$cuteenv_transudcer = "Amplifier Used and Modifications if any (external power supplies, transistor/capacitor swaps, etc) and Transudcer used and modifications if any"
$cuteenv_inipath = "C:\Users\user\Music\f\"
$cuteenv_abxfile = $cuteenv_inipath + "ABX_result.textfile"
$cuteenv_songfile0 = $cuteenv_inipath + "1\music.audiofile"
$cuteenv_songfile1 = $cuteenv_inipath + "2\music.audiofile"
$cuteenv_finishmessage = $cuteenv_inipath + "finishmessage.audiofile"
$cuteenv_player0 = "C:\MusicPlayer1\MusicPlayer1.exe"
$cuteenv_player1 = "C:\MusicPlayer1\MusicPlayer2.exe"
$cuteenv_delaycommon = 0
$cuteenv_delayfile0 = 0
$cuteenv_delayfile1 = 0
$cuteenv_delayrandomminimum = 0.1
$cuteenv_delayrandommaximum = 0.99
$cuteenv_testiterations = 6
$ABXenvironmentcaption = (Get-WmiObject -class Win32_OperatingSystem).Caption
$ABXenvironmentversion = [System.Environment]::OSVersion.Version
$ABXprogramversion = "v1.0r0_powershell"
"CuteABX $ABXprogramversion $ABXenvironmentcaption $ABXenvironment" | Out-File -Filepath $cuteenv_abxfile
Add-Content $cuteenv_abxfile "Software setup is $cuteenv_software"
Add-Content $cuteenv_abxfile "Hardware setup is $cuteenv_hardware"
Add-Content $cuteenv_abxfile "Transducer setup is $cuteenv_transducer"
$comparemode = Read-Host "Enter 0.To Compare Music files with Default Player 1.To compare players"
Add-Content $cuteenv_abxfile "Enter 0.To Compare Music files with Default Player 1.To compare players Answer: $comparemode"
$delaymode = Read-Host "Enter 0.To have no delays 1.To have pre configured delays 2.To have randomized delays"
Add-Content $cuteenv_abxfile "Enter 0.To have no delays 1.To have pre configured delays 2.To have randomized delays Answer: $delaymode"
if($delaymode -gt 0){
Add-Content $cuteenv_abxfile "delaycommon $cuteenv_delaycommon delayfile0 $cuteenv_delayfile0 delayfile1 $cuteenv_delayfile1"
if($delaymode -eq 2){
Add-Content $cuteenv_abxfile "delayrandomrange $cuteenv_delayrandomminimum $cuteenv_delayrandommaximum"}
}
$delayrandom = 0
$y = Get-Date
Add-Content $cuteenv_abxfile "Date $y"
for (($i = 0); $i -lt $cuteenv_testiterations; $i++){
$a = 0, 1 | Get-Random
$f = 0
$b = ($a + 1) % 2
$g = 0
$c = Get-Random -Minimum 0 -Maximum 2
$h = 0
$m = 0
Do{
$e = Read-Host "Enter  1.Play-A  2.Play-B  3.Play-X  4.X-is-A  5.X-is-B"
if($e -eq 1){
$p = $a
$f = $f + 1}
if($e -eq 2){
$p = $b
$g = $g + 1}
if($e -eq 3){
$p = $c
$h = $h + 1}
if ($p -eq 0){
$delayfile = $cuteenv_delayfile0
if ($comparemode -eq 0){
$q = $cuteenv_songfile0}
else {
$q = $cuteenv_player0}
}
if ($p -eq 1){
$delayfile = $cuteenv_delayfile1
if ($comparemode -eq 0){
$q = $cuteenv_songfile1}
else {
$q = $cuteenv_player1}
}
if ($e -lt 4){
if ($delaymode -eq 0){
if ($comparemode -eq 0){
Invoke-Item $q}
else {
Start-Process "$q" "$cuteenv_songfile0"}
}
else {
if ($delaymode -eq 2){
$delayrandom = Get-Random -Minimum $cuteenv_delayrandomminimum -Maximum $cuteenv_delayrandommaximum}
$delaytotal = $cuteenv_delaycommon + $delayfile + $delayrandom
Start-Sleep -seconds $delaytotal
if ($comparemode -eq 0){
Invoke-Item $q}
else {
Start-Process "$q" "$cuteenv_songfile0"}
}}
}
else{
$m = 1
if ($e -eq 4){
$d = $a}
if ($e -eq 5){
$d = $b}
$preference = Read-Host "Enter  1.I-Prefer-X 2.I-DONOT-Prefer-X 3.No-Preference-just-Difference"
}
} While ($m -le 0)
$y = Get-Date -Format HH:mm:ss
Add-Content $cuteenv_abxfile "$a || $b || $c || $d || $preference|| $f || $g || $h || $y"
"`n"
}
Invoke-Item $cuteenv_finishmessage
$auxiliary = Read-Host "Other than the exit button, have you used any play/pause/rewind/other controls on the player? 1. Yes 2.No"
Add-Content $cuteenv_abxfile "Other than the exit button, have you used any play/pause/rewind/other controls on the player? 1.Yes 2.No Answer: $auxiliary"

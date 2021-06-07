$inipath = "C:\Users\user\Music\"
$abxfile = $inipath + "ABX_result.textfile"
$songfile0 = $inipath + "1\song.audiofile"
$songfile1 = $inipath + "2\song.audiofile"
$finishmessage = $inipath + ".flac"
$player0 = "C:\MusicPlayer1\MusicPlayer1.exe"
$player1 = "C:\MusicPlayer1\MusicPlayer2.exe"
$delaycommon = 0
$delayfile0 = 0
$delayfile1 = 0
$delayrandom = 0
$delayrandomminimum = 0.1
$delayrandommaximum = 0.99
$ABXenvironmentcaption = (Get-WmiObject -class Win32_OperatingSystem).Caption
$ABXenvironmentversion = [System.Environment]::OSVersion.Version
$ABXprogramversion = v1.0r0_powershell
"CuteABX $ABXprogramversion $ABXenvironmentcaption $ABXenvironment" | Out-File -Filepath $abxfile
$comparemode = Read-Host "Enter 0.To Compare Music files with Default Player 1.To compare players"
Add-Content $abxfile "Enter 0.To Compare Music files with Default Player 1.To compare players Answer: $comparemode"
$delaymode = Read-Host "Enter 0.To have no delays 1.To have pre configured delays 2.To have randomized delays"
Add-Content $abxfile "Enter 0.To have no delays 1.To have pre configured delays 2.To have randomized delays Answer: $delaymode"
if($delaymode -gt 0){
Add-Content $abxfile "delaycommon $delaycommon delayfile0 $delayfile0 delayfile1 $delayfile1"
if($delaymode -eq 2){
Add-Content $abxfile "delayrandomrange $delayrandomminimum $delayrandommaximum"}
}
$y = Get-Date
Add-Content $abxfile "Date $y"
for (($i = 0); $i -lt 10; $i++){
$a = 0, 1 | Get-Random
$f = 0
$b = ($a + 1) % 2
$g = 0
$c = Get-Random -Minimum 0 -Maximum 2 ##(same as $a but written in a different way)
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
$delayfile = $delayfile0
if ($comparemode -eq 0){
$q = $songfile0}
else {
$q = "$player0"}}
if ($p -eq 1){
$delayfile = $delayfile1
if ($comparemode -eq 0){
$q = $songfile1}
else {
$q = "$player1"}}
if ($e -lt 4){
if ($delaymode -eq 0){
Invoke-Item $q}
else {
if ($delaymode -eq 2){
$delayrandom = Get-Random -Minimum $delayrandomminimum -Maximum $delayrandommaximum}
$delaytotal = $delaycommon + $delayfile + $delayrandom
Start-Sleep -seconds $delaytotal
Start-Process "$q" "$songfile0"}
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
Add-Content $abxfile "$a || $b || $c || $d || $preference|| $f || $g || $h || $y"
"`n"
}
Invoke-Item $finishmessage
$auxiliary = Read-Host "Other than the exit button, have you used any play/pause/rewind/other controls on the player? 1. Yes 2.No"
Add-Content $abxfile "Other than the exit button, have you used any play/pause/rewind/other controls on the player? 1.Yes 2.No Answer: $auxiliary"
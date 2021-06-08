cuteenv_whattest='z sells zeeshells by the zeeshore'
cuteenv_software='MusicPlayerSoftware Version 1.4 outputting Audio Streaming through User123's plugin and no other DSP plugins used, Operating System changes - disabling generic error sounds, disabling audio interface energy management profiles'
cuteenv_hardware='Laptop Company_Name Model Configuration (eg 8GB RAM, Model 500 GPU with 1GB VRAM), Data cable make and model, DAC make and model and modifications if any (eg: external clock source, external Digital Isolators)'
cuteenv_transudcer='Amplifier Used and Modifications if any (external power supplies, transistor/capacitor swaps, etc) and Transudcer used and modifications if any'
cuteenv_inipath='C:\Users\user\Music\'
cuteenv_abxfile= $cuteenv_inipath + "ABX_result.textfile"
cuteenv_songfile0 = $cuteenv_inipath + "1\music.audiofile"
cuteenv_songfile1 = $cuteenv_inipath + "2\music.audiofile"
cuteenv_finishmessage = $cuteenv_inipath + "finishmessage.audiofile"
cuteenv_player0='C:\MusicPlayer1\MusicPlayer1.exe'
cuteenv_player1='C:\MusicPlayer1\MusicPlayer2.exe'
cuteenv_delaycommon=0
cuteenv_delayfile0=0
cuteenv_delayfile1=0
cuteenv_delayrandomminimum=0.1
cuteenv_delayrandommaximum=0.99
cuteenv_testiterations=6
#$ABXenvironmentcaption = (Get-WmiObject -class Win32_OperatingSystem).Caption
#$ABXenvironmentversion = [System.Environment]::OSVersion.Version
#$ABXprogramversion = "v1.0r0_powershell"
#"CuteABX $ABXprogramversion $ABXenvironmentcaption $ABXenvironment" | Out-File -Filepath $cuteenv_abxfile
#Add-Content $cuteenv_abxfile "Test setup is $cuteenv_whattest"
#Add-Content $cuteenv_abxfile "Software setup is $cuteenv_software"
#Add-Content $cuteenv_abxfile "Hardware setup is $cuteenv_hardware"
#Add-Content $cuteenv_abxfile "Transducer setup is $cuteenv_transducer"
read -p "Enter 0.To Compare Music files with Default Player 1.To compare players" comparemode
#Add-Content $cuteenv_abxfile "Enter 0.To Compare Music files with Default Player 1.To compare players Answer: $comparemode"
read -p "Enter 0.To have no delays 1.To have pre configured delays 2.To have randomized delays" delaymode
#Add-Content $cuteenv_abxfile "Enter 0.To have no delays 1.To have pre configured delays 2.To have randomized delays Answer: $delaymode"
if [$delaymode -gt 0]; then
	Add-Content $cuteenv_abxfile "delaycommon $cuteenv_delaycommon delayfile0 $cuteenv_delayfile0 delayfile1 $cuteenv_delayfile1"
	if [$delaymode -eq 2]; then
		Add-Content $cuteenv_abxfile "delayrandomrange $cuteenv_delayrandomminimum $cuteenv_delayrandommaximum"
	fi
fi
delayrandom = 0
y=$(date +%d.%m.%y-%H:%M:%S)
#Add-Content $cuteenv_abxfile "Date $y"
#for (($i = 0); $i -lt $cuteenv_testiterations; $i++){
a=$(($RAMDOM%2))
f=0
b=$(($a + 1)%2)
g=0
c=$(shuf -i 0-2 -n 1)
h=0
m=0
Do{
read -p "Enter  1.Play-A  2.Play-B  3.Play-X  4.X-is-A  5.X-is-B" e
if [$e -eq 1]; then
	p=$a
	f=$f+1
fi
if [$e -eq 2]; then
	p=$b
	g=$g+1
fi
if [$e -eq 3]; then
	p=$c
	h=$h+1
fi
if [$p -eq 0]; then
	delayfile = $cuteenv_delayfile0
	if [$comparemode -eq 0]; then
		q=$cuteenv_songfile0
	else
		q=$cuteenv_player0
	fi
fi
if [$p -eq 0]; then
	delayfile = $cuteenv_delayfile1
	if [$comparemode -eq 0]; then
		q=$cuteenv_songfile1
	else
		q=$cuteenv_player1
	fi
fi
if [$e -lt 4]; then
	if [$delaymode -eq 0]; then
		if [$comparemode -eq 0]; then
			Invoke-Item $q
		else
			Start-Process "$q" "$cuteenv_songfile0"
		fi
	else
		if [$delaymode -eq 2]; then
			delayrandom = Get-Random -Minimum $cuteenv_delayrandomminimum -Maximum $cuteenv_delayrandommaximum
		fi
		delaytotal=$($cuteenv_delaycommon + $delayfile + $delayrandom)
		sleep $delaytotal
		if [$comparemode -eq 0]; then
#			Invoke-Item $q
		else
#			Start-Process "$q" "$cuteenv_songfile0"
		fi
	fi
else
	m=1
	if [$e -eq 4]; then
		d=$a
	fi
	if [$e -eq 5]; then
		d=$b
	fi
	read -p "Enter  1.I-Prefer-X 2.I-DONOT-Prefer-X 3.No-Preference-just-Difference" preference
fi
} While ($m -le 0)
y=$(%H:%M:%S)
#Add-Content $cuteenv_abxfile "$a || $b || $c || $d || $preference|| $f || $g || $h || $y"
"`n"
}
#Invoke-Item $cuteenv_finishmessage
read -p "Other than the exit button, have you used any play/pause/rewind/other controls on the player? 1. Yes 2.No" auxiliary
#Add-Content $cuteenv_abxfile "Other than the exit button, have you used any play/pause/rewind/other controls on the player? 1.Yes 2.No Answer: $auxiliary"

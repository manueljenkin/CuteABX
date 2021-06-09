Kindly Update all the necessary cuteenv variables prior to running the script. The script can be edited using either a text editor or ISE. Make sure you set the Default Music Playback software prior to using the CuteABX tool.  The CuteABX_Win32_v1r0.ps1 file currently works to execute the ABX test (Kindly make sure necessary permissions are granted for the running the script on your OS).

The recommended usage for each "cuteenv" variable is as follows
1. cuteenv_whattest - A description of what the test is about, what is being compared (different music files in same player, or same music file in different players), preferrably with input about sample rate, etc of the music. 
2. cuteenv_software - The software and operating system environment used, volume levels both in the OS volume control and also DAC control panel, any software plugins and operating system modifications if any
3. cuteenv_hardware - Description of the DAC, Transport and interconnects, with modifications if any (eg: external clocks, isolators, transistor/capacitor swaps)
4. cuteenv_transudcer - Description about the amplification and playback systems with modification if any (eg: external power supplies, transistor/capacitor swaps)
5. cuteenv_inipath - The main path for the files
6. cuteenv_abxfile - The file to store the ABX results to
7. cuteenv_songfile0 and cuteenv_songfile1 - The two audio files to compare. If screen is not turned off, and music playback software displays the file name, preferrably keep the two files in a different folder with same name.
8. cuteenv_finishmessage - A custom audio file to convey the test has been finished (useful when running the test with screen off)
9. cuteenv_player0 and cuteenv_player1 - The two music players to compare.
10. cuteenv_delaycommon - common delay for both the file opening operation
11. cuteenv_delayfile0 and cuteenv_delayfile1 - custom delays additional to common delay for each of the file opening operations
12. cuteenv_delayrandomminimum and cuteenv_delayrandommaximum - randomized delay maximum and minimum value. Enter a non integer value to ensure it can generate non integer (seconds) time delay (adds on top of delay common and delay file).
13. cuteenv_testiterations - number of iterations to run the test. A minimum of 6 iterations is recommended.

Runtime inputs:
1. comparemode - used to set the mode either comparing audio files (cuteenv_songfile0 and cuteenv_songfile1) through system default music player or comparing different music players (cuteenv_player0 and cuteenv_player1) using a test audio file (cuteenv_player0).
2. delaymode - used to set delays before running each test if any.

# CuteABX
CuteABX set of software tools for generating AB-X tests. Kindly Read the LICENSE prior to using the tools.

Version 1.0 has been written as a Shell Script that runs in an interactive commandline. It is recommended to run the script in low priority so as to not interfere with the playback software priority.

The tool has options for comparing two or more music files in the default player set in your operating system, and can also be used to compare different players, DSP filters and settings. At present, it can compare music players that allow invoking the playback by double clicking the music file. Players that require custom invoking requirements are not supported. It provides functions to randomize time delays to reduce the effect of proxy due to difference in execution time during the AB-X test. Kindly refer to the UserManual for guidance on how to configure the settings and variables.

Music Players with a GUI can be compared by turning the screen OFF, and using the shortcut keys to close the player once the listening is over. After all tests are over, the personally customized finishing message will play and screen can be turned ON again.

The tool has been designed to output a result that is easy to read and infer. The first few rows shall have information about the test setup environment (including the version of CuteABX used) and the variable setups. Following it, output file contains entries about the result of each test. The first four columns contain the primary variables - A, B, X, and user-prediction. The last five columns have auxiliary information about user-preference, number of trials in each of A, B and X during the test and the time-marker of completion of the test. This can be used for further inferences and correlations if required. It is recommended to leave the code untouched, apart from the test environment variables that contain the "cuteenv_" prefix, as this can help reduce variables when assessing the output. In case any part of the code other than the test environment variables has been changed, it is recommended to mention the change along with the result, and preferrably share the modified code along with the result.

An example of the output is as follows:

CuteABX v1.0r0_powershell RandomOSversionRandom <br />
Software setup is MusicPlayerSoftware Version 1.4 outputting Audio Streaming through User123's plugin and no other DSP plugins used, Operating System changes - disabling generic Error sounds, disabling audio interface energy management profiles <br />
Hardware setup is Laptop Company_Name Model Configuration 8GB RAM Model H GPU 1GB VRAM, ABC Data Cable, DAC MODEL 4 with M123 Isolator and N234 Master Clock) <br />
Transducer setup is AmplifierModel TransducerModel <br />
Enter 0.To Compare Music files with Default Player 1.To compare players Answer: 0 <br />
Enter 0.To have no delays 1.To have pre configured delays 2.To have randomized delays Answer: 0 <br />
Date 06/07/2021 02:01:11 <br />
1 || 0 || 1 || 1 || 1|| 2 || 2 || 2 || 02:05:12 <br />
1 || 0 || 0 || 0 || 0|| 2 || 2 || 2 || 02:07:14 <br />
1 || 0 || 0 || 0 || 0|| 1 || 3 || 2 || 02:10:16 <br />
1 || 0 || 0 || 0 || 0|| 2 || 1 || 1 || 02:12:17 <br />
0 || 1 || 1 || 0 || 0|| 1 || 1 || 1 || 02:13:19 <br />
1 || 0 || 1 || 1 || 1|| 1 || 1 || 1 || 02:14:20 <br />
Other than the exit button, have you used any play/pause/rewind/other controls on the player? 1.Yes 2.No Answer: 2

The tool is designed to be used primarily for personal preference analysis. Kindly donot force or impose this tool on an unwilling participant.

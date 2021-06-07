# CuteABX
CuteABX set of software tools for generating AB-X tests. Kindly Read the LICENSE prior to using the tools.

Version 1.0 has been written as a Shell Script. The initial release is on PowerShell for Windows Operating System. A port using Zshell is being developed for MacOS, Linux, BSD and other Unix-Like or Unix-Based Operating systems.

The tool has options for comparing two music files in a given default player, and can also be used to compare different players and settings. It provides functions to randomize time delays to reduce the effect of proxy due to difference in execution time during the AB-X test. Kindly refer to the UserManual for guidance on how to configure the settings and variables.

The tool has been designed to output a result that is easy to read and infer. The first few rows shall have information about the test setup environment (including the version of CuteABX used) and the variable setups. Following it, output file contains entries about the trials. The first four columns contain the primary variables - A, B, X, and user-prediction. The last four columns have auxiliary information about user-preference, number of trials in each of A, B and X during the test and the time-marker of completion of the test. This can be used for further inferences and correlations if required.

It is recommended to leave the code untouched and modify only the variables that have "cuteenv_" prefix as per your system.

The following is a set of guidelines when sharing results from the tests.

If you have not modified any part of the code other than the variables, then Feel free to copy paste the results, with the header mentioning the The Playback Software used and compared, tweaks on the OS and playback software if any, in the Digital Unit section, you can mention the DAC, Cables and any networking component used in between. In the rest you can mention the Amplifier (if separate) and the transducer. Optionally you can also mention the song and the release master used.

For the User Manual Please Refer to the User Manual shared in the same directory

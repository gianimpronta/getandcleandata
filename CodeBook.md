Codebook
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals. These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals. Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm.

Finally a Fast Fourier Transform (FFT) was applied to some of these signals (Note the 'FFT' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

"Subject"																		An identifier of the subject who carried out the experiment.

"Activity"																	The activity being performed

"BodyAcceleration-Mean-XYZ"                 Mean of the body signal from accelerometer in the three axes (in g's)
"BodyAcceleration-StdDev-XYZ"               Standard Deviation of the body signal from accelerometer in the three axes (in g's)

"GravityAcceleration-Mean-XYZ"              Mean of the gravity signal from accelerometer in the three axes (in g's)
"GravityAcceleration-StdDev-XYZ"            Standard Deviation of the gravity signal from accelerometer in the three axes (in g's)

"BodyAccelerationJerk-Mean-XYZ"             Mean of the body signal from accelerometer in the three axes (in g's) and angular velocity 																							derivated in time to obtain Jerk Signals
"BodyAccelerationJerk-StdDev-XYZ"           Standard Deviation of the body signal from accelerometer in the three axes (in g's) and 																								angular velocity derivated in time to obtain Jerk Signals

"BodyGyroscope-Mean-XYZ"                    Mean of the body signal from gyroscope in the three axes (in g's)
"BodyGyroscope-StdDev-XYZ"                  Standard Deviation of the body signal from gyroscope in the three axes (in g's)

"BodyGyroscopeJerk-Mean-XYZ"                Mean of the body signal from gyroscope in the three axes (in g's) and angular velocity                                                 derivated in time to obtain Jerk Signals
"BodyGyroscopeJerk-StdDev-XYZ"              Standard Deviation of the body signal from gyroscope in the three axes (in g's) and angular                                            velocity derivated in time to obtain Jerk Signals

"BodyAcceleration-Magnitude-Mean"           Mean of the body signal from accelerometer magnitude
"BodyAcceleration-Magnitude-StdDev"         Standard Deviation of the body signal from accelerometer magnitude

"GravityAcceleration-Magnitude-Mean"        Mean of the gravity signal from accelerometer magnitude
"GravityAcceleration-Magnitude-StdDev"      Standard Deviation of the gravity signal from accelerometer magnitude

"BodyAccelerationJerk-Magnitude-Mean"       Mean of the body signal from accelerometer and angular velocity derivated in time t																											to obtain Jerk Signals magnitude
"BodyAccelerationJerk-Magnitude-StdDev"     Standard Deviation of the body signal from accelerometer and angular velocity derivated in 																							time to obtain Jerk Signals magnitude

"BodyGyroscope-Magnitude-Mean"              Mean of the body signal from gyroscope magnitude
"BodyGyroscope-Magnitude-StdDev"            Standard Deviation of the body signal from gyroscope magnitude

"BodyGyroscopeJerk-Magnitude-Mean"          Mean of the body signal  from gyroscope in the and angular velocity derivated in time to 																								obtain Jerk Signals magnitude
"BodyGyroscopeJerk-Magnitude-StdDev"        Standard Deviation of the body signal from gyroscope and angular velocity derivated in time 																						to obtain Jerk Signals magnitude

"BodyAcceleration-Mean-XYZ-FFT"             Mean of the body signal from accelerometer in the three axes (in g's) after a Fast Fourier Transform
"BodyAcceleration-StdDev-XYZ-FFT"						Standard Deviation of the body signal from accelerometer in the three axes (in g's) after a Fast Fourier Transform

"BodyAccelerationJerk-Mean-XYZ-FFT"					Mean of the body signal from accelerometer in the three axes (in g's) and angular velocity 																							derivated in time to obtain Jerk Signals after a Fast Fourier Transform
"BodyAccelerationJerk-StdDev-XYZ-FFT"				Standard Deviation of the body signal from accelerometer in the three axes (in g's) and 																								angular velocity derivated in time to obtain Jerk Signals after a Fast Fourier Transform

"BodyGyroscope-Mean-XYZ-FFT"								Mean of the body signal from gyroscope in the three axes (in g's) after a Fast Fourier Transform
"BodyGyroscope-StdDev-XYZ-FFT"							Standard Deviation of the body signal from gyroscope in the three axes (in g's) after a Fast Fourier Transform

"BodyAcceleration-Magnitude-Mean-FFT"				Mean of the body signal from accelerometer magnitude after a Fast Fourier Transform
"BodyAcceleration-Magnitude-StdDev-FFT"     Standard Deviation of the body signal from accelerometer magnitude after a Fast Fourier Transform


"BodyAccelerationJerk-Magnitude-Mean-FFT		Mean of the body signal from accelerometer and angular velocity derivated in time t																											to obtain Jerk Signals magnitude after a Fast Fourier Transform
"BodyAccelerationJerk-Magnitude-StdDev-FFT"	Standard Deviation of the body signal from accelerometer and angular velocity derivated 																								in time to obtain Jerk Signals magnitude after a Fast Fourier Transform

"BodyGyroscope-Magnitude-Mean-FFT"					Mean of the body signal from gyroscope magnitude after a Fast Fourier Transform
"BodyGyroscope-Magnitude-StdDev-FFT"				Standard Deviation of the body signal from gyroscope magnitude after a Fast Fourier Transform

"BodyGyroscopeJerk-Magnitude-Mean-FFT"			Mean of the body signal  from gyroscope in the and angular velocity derivated in time to 																								obtain Jerk Signals magnitude after a Fast Fourier Transform
"BodyGyroscopeJerk-Magnitude-StdDev-FFT"		Standard Deviation of the body signal from gyroscope and angular velocity derivated in time 																						to obtain Jerk Signals magnitude after a Fast Fourier Transform

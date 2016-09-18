Codebook
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals. These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals. Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm.

Finally a Fast Fourier Transform (FFT) was applied to some of these signals (Note the 'FFT' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

"Subject"																		An identifier of the subject who carried out the experiment.

"Activity"																	The activity being performed

“time-BodyAcceleration-Mean-XYZ"                 Mean of the body signal from accelerometer in the three axes (in g's)
"time-BodyAcceleration-StdDev-XYZ"               Standard Deviation of the body signal from accelerometer in the three axes (in g's)

"time-GravityAcceleration-Mean-XYZ"              Mean of the gravity signal from accelerometer in the three axes (in g's)
"time-GravityAcceleration-StdDev-XYZ"            Standard Deviation of the gravity signal from accelerometer in the three axes (in g's)

"time-BodyAccelerationJerk-Mean-XYZ"             Mean of the body signal from accelerometer in the three axes (in g's) and angular velocity 																							derivated in time to obtain Jerk Signals
"time-BodyAccelerationJerk-StdDev-XYZ"           Standard Deviation of the body signal from accelerometer in the three axes (in g's) and 																								angular velocity derivated in time to obtain Jerk Signals

"time-BodyGyroscope-Mean-XYZ"                    Mean of the body signal from gyroscope in the three axes (in g's)
"time-BodyGyroscope-StdDev-XYZ"                  Standard Deviation of the body signal from gyroscope in the three axes (in g's)

"time-BodyGyroscopeJerk-Mean-XYZ"                Mean of the body signal from gyroscope in the three axes (in g's) and angular velocity                                                 derivated in time to obtain Jerk Signals
"time-BodyGyroscopeJerk-StdDev-XYZ"              Standard Deviation of the body signal from gyroscope in the three axes (in g's) and angular                                            velocity derivated in time to obtain Jerk Signals

"time-BodyAcceleration-Magnitude-Mean"           Mean of the body signal from accelerometer magnitude
"time-BodyAcceleration-Magnitude-StdDev"         Standard Deviation of the body signal from accelerometer magnitude

"time-GravityAcceleration-Magnitude-Mean"        Mean of the gravity signal from accelerometer magnitude
"time-GravityAcceleration-Magnitude-StdDev"      Standard Deviation of the gravity signal from accelerometer magnitude

"time-BodyAccelerationJerk-Magnitude-Mean"       Mean of the body signal from accelerometer and angular velocity derivated in time t																											to obtain Jerk Signals magnitude
"time-BodyAccelerationJerk-Magnitude-StdDev"     Standard Deviation of the body signal from accelerometer and angular velocity derivated in 																							time to obtain Jerk Signals magnitude

"time-BodyGyroscope-Magnitude-Mean"              Mean of the body signal from gyroscope magnitude
"time-BodyGyroscope-Magnitude-StdDev"            Standard Deviation of the body signal from gyroscope magnitude

"time-BodyGyroscopeJerk-Magnitude-Mean"          Mean of the body signal  from gyroscope in the and angular velocity derivated in time to 																								obtain Jerk Signals magnitude
"time-BodyGyroscopeJerk-Magnitude-StdDev"        Standard Deviation of the body signal from gyroscope and angular velocity derivated in time 																						to obtain Jerk Signals magnitude

“FFT-BodyAcceleration-Mean-XYZ"             Mean of the body signal from accelerometer in the three axes (in g's) after a Fast Fourier Transform
"FFT-odyAcceleration-StdDev-XYZ"						Standard Deviation of the body signal from accelerometer in the three axes (in g's) after a Fast Fourier Transform

"FFT-BodyAccelerationJerk-Mean-XYZ"					Mean of the body signal from accelerometer in the three axes (in g's) and angular velocity 																							derivated in time to obtain Jerk Signals after a Fast Fourier Transform
"FFT-BodyAccelerationJerk-StdDev-XYZ"				Standard Deviation of the body signal from accelerometer in the three axes (in g's) and 																								angular velocity derivated in time to obtain Jerk Signals after a Fast Fourier Transform

"FFT-BodyGyroscope-Mean-XYZ"								Mean of the body signal from gyroscope in the three axes (in g's) after a Fast Fourier Transform
"FFT-BodyGyroscope-StdDev-XYZ"							Standard Deviation of the body signal from gyroscope in the three axes (in g's) after a Fast Fourier Transform

"FFT-BodyAcceleration-Magnitude-Mean"				Mean of the body signal from accelerometer magnitude after a Fast Fourier Transform
"FFT-BodyAcceleration-Magnitude-StdDev"     Standard Deviation of the body signal from accelerometer magnitude after a Fast Fourier Transform


"FFT-BodyAccelerationJerk-Magnitude-Mean”		Mean of the body signal from accelerometer and angular velocity derivated in time t																											to obtain Jerk Signals magnitude after a Fast Fourier Transform
"FFT-BodyAccelerationJerk-Magnitude-StdDev"	Standard Deviation of the body signal from accelerometer and angular velocity derivated 																								in time to obtain Jerk Signals magnitude after a Fast Fourier Transform

"FFT-BodyGyroscope-Magnitude-Mean"					Mean of the body signal from gyroscope magnitude after a Fast Fourier Transform
"FFT-BodyGyroscope-Magnitude-StdDev"				Standard Deviation of the body signal from gyroscope magnitude after a Fast Fourier Transform

"FFT-BodyGyroscopeJerk-Magnitude-Mean"			Mean of the body signal  from gyroscope in the and angular velocity derivated in time to 																								obtain Jerk Signals magnitude after a Fast Fourier Transform
"FFT-BodyGyroscopeJerk-Magnitude-StdDev"		Standard Deviation of the body signal from gyroscope and angular velocity derivated in time 																						to obtain Jerk Signals magnitude after a Fast Fourier Transform

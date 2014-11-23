---
title: "Code Book"
output: html_document
---
##1. Raw data
The raw data used for this tidy data set is given by the UCI (Center of Machine Learning and intelligence Systems).It is called 'Human Activity Recognition Using Smartphones Data set' and has been downloaded from "http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones" on 23th November 2014.

The data set includes data from an experiment, regarding the performance of daily living activities. The data has been recorded by accelerometer and gyroscope, which are embedded in the smartphone of the volunteers. Additionally, the activities has been video-recorded.

There has been 30 subjects, which did the following activities:

- Walking
- Walking upstairs
- Walking downstairs
- Sitting
- Standing
- Laying

For each activity, there has been captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.

The raw data has been given in a zip-File. Instead of one data set, there were different data sets and additional information in it. Moreover the "core"-data sets, which includes the main data has been split up in a training- and a test-data set (X_test/X_train).

###2. Data Transformation
The goal was to get one data set including the subjects, the activities and the measurements regarding mean and standard deviation. Therefore, the following transformations has been done to the raw data:

####1. Combining the datasets
As told above, there were several data sets included in the zip-file. For our goal, we need to combine following sets:

1. X_test / X_train: includes the records for each measure
2. y_test / y_train: includes a vector of the activities
3. subject_test / subject_train: includes a vector of the subjects

Before combining the single sets, the column names has been set. For the y_test / y_train sets, the column name has been set to "activity". For the subject_test / subject_train sets, the column name has been set to "subject". For the records sets (X_test / X_train), the column names has been set by the feature set, which was also included in the zip-file.

Afterwards, the sets has been combined:

testcomb: subject_test + y_test + X_test  
traincomb: subject_train + y_train + X_train

And at least:

comp: testcomb + traincomb

####2. Renaming of Activity
To make the data set more readable, the activity should come in words rather than in numbers. In the zip-file there is also a file called "activity_labels" which shows, how the values of the variable "activity" (1-6) has to be interpreted. We transform the activity variable to a factor variable and rename the levels.

####3. Subset of Measures
The measures of the raw data come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

For this data set, we just want to keep the variables of the raw data, which estimates the mean or the standard deviation (std) from the given signals. We don't keep variables with "meanFreq" in it, because they are based on a weighted average of the frequency components and not just the mean value of the given signals. In the assignment only mean and std values has been asked.

####4. Group the dataset
In the last step, the data set has been grouped by the subject- and the activity variable regarding the mean value of each measure variable. So that there is just one value for example for the mean time Body signal recorded by the accelerometer on the X axial regarding subject 1, sitting.

The tidy data set now covers 180 observation (rows) and 68 variables (columns).

###3. Variables in the dataset

VARIABLENAME|TYP|VALUES|EXPLANATION  
------------|---|------|-----------  
subject|integer|1-30|the single volunteers   
activity|factor|WALKING|-  
-|-|WALKING_UPSTAIRS|-  
-|-|WALKING_DOWNSTAIRS|-  
-|-|SITTING|-  
-|-|STANDING|-  
-|-|LAYING|-  
tBodyAcc.mean...X|numeric|mean|time Body signal from accelerometer axial X    
tBodyAcc.mean...Y|numeric|mean|time Body signal from accelerometer axial Y  
tBodyAcc.mean...Z|numeric|mean|time Body signal from accelerometer axial Z  
tGravityAcc.mean...X|numeric|mean|time Gravity signal from accelerometer axial X  
tGravityAcc.mean...Y|numeric|mean|time Gravity signal from accelerometer axial Y  
tGravityAcc.mean...Z|numeric|mean|time Gravity signal from accelerometer axial Z  
tBodyAccJerk.mean...X|numeric|mean|time Body Jerk signal from accelerometer axial Z  
tBodyAccJerk.mean...Y|numeric|mean|time Body Jerk signal from accelerometer axial Y  
tBodyAccJerk.mean...Z|numeric|mean|time Body Jerk signal from accelerometer axial Z  
tBodyGyro.mean...X|numeric|mean|time Body signal from gyroscope axial X  
tBodyGyro.mean...Y|numeric|mean|time Body signal from gyroscope axial Y  
tBodyGyro.mean...Z|numeric|mean|time Body signal from gyroscope axial Z  
tBodyGyroJerk.mean...X|numeric|mean|time Body Jerk signal from gyroscope axial X  
tBodyGyroJerk.mean...Y|numeric|mean|time Body Jerk signal from gyroscope axial Y  
tBodyGyroJerk.mean...Z|numeric|mean|time Body Jerk signal from gyroscope axial Z  
tBodyAccMag.mean..|numeric|mean|magnitude of time Body signals from accelerometer  
tGravityAccMag.mean..|numeric|mean|magnitude of time Gravity signals from accelerometer  
tBodyAccJerkMag.mean..|numeric|mean|magnitude of time Body Jerk signals from accelerometer  
tBodyGyroMag.mean..|numeric|mean|magnitude of time Body signals from gyroscope 
tBodyGyroJerkMag.mean..|numeric|mean|magnitude of time Body Jerk signals from gyroscope 
fBodyAcc.mean...X|numeric|mean|frequency Body signal from accelerometer axial X  
fBodyAcc.mean...Y|numeric|mean|frequency Body signal from accelerometer axial Y  
fBodyAcc.mean...Z|numeric|mean|frequency Body signal from accelerometer axial Z  
fBodyAccJerk.mean...X|numeric|mean|frequency Body Jerk signal from accelerometer axial X  
fBodyAccJerk.mean...Y|numeric|mean|frequency Body Jerk signal from accelerometer axial Y  
fBodyAccJerk.mean...Z|numeric|mean|frequency Body Jerk signal from accelerometer axial Z  
fBodyGyro.mean...X|numeric|mean|frequency Body signal from gyroscope axial X  
fBodyGyro.mean...Y|numeric|mean|frequency Body signal from gyroscope axial Y  
fBodyGyro.mean...Z|numeric|mean|frequency Body signal from gyroscope axial Z  
fBodyAccMag.mean..|numeric|mean|magnitude of frequency Body signal from accelerometer  
fBodyBodyAccJerkMag.mean..|numeric|mean|magnitude of frequency Body Jerk signal from accelerometer  
fBodyBodyGyroMag.mean..|numeric|mean|magnitude of frequency Body signal from gyroscope  
fBodyBodyGyroJerkMag.mean..|numeric|mean|magnitude of frequency Body Jerk signal from gyroscope  
tBodyAcc.std...X|numeric|std|time Body signal from accelerometer axial X  
tBodyAcc.std...Y|numeric|std|time Body signal from accelerometer axial Y  
tBodyAcc.std...Z|numeric|std|time Body signal from accelerometer axial Z  
tGravityAcc.std...X|numeric|std|time Gravity signal from accelerometer axial X  
tGravityAcc.std...Y|numeric|std|time Gravity signal from accelerometer axial Y  
tGravityAcc.std...Z|numeric|std|time Gravity signal from accelerometer axial Z  
tBodyAccJerk.std...X|numeric|std|time Body Jerk signal from accelerometer axial X  
tBodyAccJerk.std...Y|numeric|std|time Body Jerk signal from accelerometer axial Y  
tBodyAccJerk.std...Z|numeric|std|time Body Jerk signal from accelerometer axial Z  
tBodyGyro.std...X|numeric|std|time Body signal from gyroscope axial X  
tBodyGyro.std...Y|numeric|std|time Body signal from gyroscope axial Y  
tBodyGyro.std...Z|numeric|std|time Body signal from gyroscope axial Z  
tBodyGyroJerk.std...X|numeric|std|time Body Jerk signal from gyroscope axial X  
tBodyGyroJerk.std...Y|numeric|std|time Body Jerk signal from gyroscope axial Y  
tBodyGyroJerk.std...Z|numeric|std|time Body Jerk signal from gyroscope axial Z  
tBodyAccMag.std..|numeric|std|magnitude of time Body signals from accelerometer 
tGravityAccMag.std..|numeric|std|magnitude of time Gravity signals from accelerometer 
tBodyAccJerkMag.std..|numeric|std|magnitude of time Body Jerk signals from accelerometer 
tBodyGyroMag.std..|numeric|std|magnitude of time Body signals from gyroscope  
tBodyGyroJerkMag.std..|numeric|std|magnitude of time Body Jerk signals from gyroscope  
fBodyAcc.std...X|numeric|std|frequency Body signal from accelerometer axial X  
fBodyAcc.std...Y|numeric|std|frequency Body signal from accelerometer axial Y  
fBodyAcc.std...Z|numeric|std|frequency Body signal from accelerometer axial Z  
fBodyAccJerk.std...X|numeric|std|frequency Body Jerk signal from accelerometer axial X  
fBodyAccJerk.std...Y|numeric|std|frequency Body Jerk signal from accelerometer axial Y  
fBodyAccJerk.std...Z|numeric|std|frequency Body Jerk signal from accelerometer axial Z  
fBodyGyro.std...X|numeric|std|frequency Body Jerk signal from gyroscope axial X  
fBodyGyro.std...Y|numeric|std|frequency Body Jerk signal from gyroscope axial Y  
fBodyGyro.std...Z|numeric|std|frequency Body Jerk signal from gyroscope axial Z  
fBodyAccMag.std..|numeric|std|magnitude of frequency Body signals from accelerometer  
fBodyBodyAccJerkMag.std..|numeric|std|magnitude of frequency Body Jerk signals from accelerometer  
fBodyBodyGyroMag.std..|numeric|std|magnitude of frequency Body signals from gyroscope  
fBodyBodyGyroJerkMag.std..|numeric|std|magnitude of frequency Body Jerk signals from gyroscope  


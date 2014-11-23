GetCleanData
============

This repo includes the solution for the Coursera Course Project of Course Getting and Cleaning Data.

The assignment was to write an R script which does the following:

1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement. 
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive variable names. 
5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  
This R script (run_analysis.R) does the following:
  
Step 1: It downloads the raw data in the currently working directory in form
of a zip file (name: Daten). Afterwards, it unzip the zip file and save the folder in the currently working
directory (name: UCI HAR Dataset).

Step 2: It loads the necessary data in R:

  test<-X_test (measured values for each observation - test data set)
  actest<-y_test (activities of each observation - test data set)
  subtest<-subject_test (number of subject for each observation - test data set)
  train<-X_train (measured values for each observation - training data set)
  actrain<-y_train (activities of each observation - training data set)
  subtrain<-subject_train (number of subject for each observation - training data set)
  feat<-features (measure names (column names))

Step 3: It sets the column names for each set.

  test, train <- the values of column V2 of feat
  actest, actrain <- "activity"
  subtest, subtrain <- "subject"

Step 4: It combines the data sets. First all test / train data sets and in a second
step combine the resulting test and train data set.

Step 5: It renames the activity variable by changing it to a factor variable
and afterwards rename the labels.

Step 6: It create a subset of comp, so that just measures with "mean" or "std"
in it will be in the final data set.

Step 7: It group the resulting data set by subject and activity variable and
summarize the data by mean.

Step 8: It saves the data set as text file (Tidyset.txt) in the working directory.

Step 9: It calls the view function, so that the data set can be seen in R.

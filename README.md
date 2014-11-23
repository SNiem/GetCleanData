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


##########################################################################################################
####################                       run_analysis.R               ##################################
##########################################################################################################


##Step 1: Downloading and unizip the Zip-File##

fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./Daten.zip",mode="wb")
unzip("./Daten.zip")

##Step 2:Read single data Files in R##

test<-read.table("./UCI HAR Dataset/test/X_test.txt")
actest<-read.table("./UCI HAR Dataset/test/y_test.txt")
subtest<-read.table("./UCI HAR Dataset/test/subject_test.txt")
train<-read.table("./UCI HAR Dataset/train/X_train.txt")
actrain<-read.table("./UCI HAR Dataset/train/y_train.txt")
subtrain<-read.table("./UCI HAR Dataset/train/subject_train.txt")
feat<-read.table("./UCI HAR Dataset/features.txt")

##Step 3: Set the colnames for each single data set##

colnames(train)<-make.names(feat$V2,unique=TRUE)
colnames(test)<-make.names(feat$V2,unique=TRUE)
colnames(actest)<-"activity"
colnames(actrain)<-"activity"
colnames(subtest)<-"subject"
colnames(subtrain)<-"subject"

##Step 4: Combine the data sets to one train- and one test data set##

testcomp<-cbind(subtest,actest,test)
traincomp<-cbind(subtrain,actrain,train)

##combine the train- and testdataset to one complete data set##

comp<-rbind(testcomp,traincomp)

##Step 5: Rename the levels of the activity variable##

comp$activity<-factor(comp$activity,levels=c("1","2","3","4","5","6"),labels=c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"))

##Step 6: Define a subset of measures, which include 'mean' or 'std' plus subject and activity##

subact<-select(comp,subject,activity) #for keeping the subject and activity variable
submean<-comp[grep("mean",names(comp))] #all measures with "mean" in it
submean1<-select(submean,-grep("meanFreq",names(submean))) #meanFreq excluded
substd<-comp[grep("std",names(comp))] #all measures with "std" in it

compsub<-cbind(subact,submean1,substd)

##Step 7: Group the data set by subject and activity variable with mean for each measurement##

library(dplyr)
library(reshape2)

Group<-group_by(compsub,subject,activity)
Summa<-summarise_each(Group,funs(mean))

##Step 8: Write dataset as .txt file in working directory##

write.table(Summa,"Tidyset.txt",row.names=FALSE)

##Step 9: View data set##

View(Summa)

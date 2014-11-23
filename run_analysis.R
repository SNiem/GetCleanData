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

{\rtf1\ansi\ansicpg1252\cocoartf1265\cocoasubrtf190
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
\margl1440\margr1440\vieww25100\viewh13320\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural

\f0\fs24 \cf0 fileurl="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" \
download.file(fileurl,destfile="wearable.zip",method="curl")\
unzip("wearable.zip")\
\
features <- read.table(file="UCI\\ HAR\\ Dataset/features.txt",sep=" ",col.names=c("id","name"))\
\
meanstdcols <- grep("-mean\\\\(\\\\)|-std\\\\(\\\\)",features[,2])\
features[,2] <- tolower(gsub("[-()]","",features[,2]))\
\
activity_labels <-  read.table(file="UCI\\ HAR\\ Dataset/activity_labels.txt",sep=" ",col.names=c("id","activity"))\
\
y_train <- read.table(file="UCI\\ HAR\\ Dataset/train/Y_train.txt",col.names=c("activityid"))\
x_train_in <- read.table(file="UCI\\ HAR\\ Dataset/train/X_train.txt",col.names=as.vector(features$name))\
x_train <- x_train_in[,meanstdcols]\
subject_train <- read.table(file="UCI\\ HAR\\ Dataset/train/subject_train.txt",col.names=c("subject"))\
\
activity = merge(y_train,activity_labels,by.x="activityid",by.y="id")\
data_train <- cbind(x_train,subject_train,activity)\
\
y_test <- read.table(file="UCI\\ HAR\\ Dataset/test/Y_test.txt",col.names=c("activityid"))\
x_test_in <- read.table(file="UCI\\ HAR\\ Dataset/test/X_test.txt",col.names=as.vector(features$name))\
x_test <- x_test_in[,meanstdcols]\
subject_test <- read.table(file="UCI\\ HAR\\ Dataset/test/subject_test.txt",col.names=c("subject"))\
\
activity= merge(y_test,activity_labels,by.x="activityid",by.y="id")\
data_test <- cbind(x_test,subject_test,activity)\
\
all_data <- rbind(data_train,data_test)\
\
all_data <- all_data[, !(colnames(all_data) %in% c("activityid"))]\
\
data_ave_by_subject_activity <- aggregate(.~subject+activity,all_data,mean)\
\
write.table(data_ave_by_subject_activity,file="tidydata.txt",row.names=FALSE)\
}
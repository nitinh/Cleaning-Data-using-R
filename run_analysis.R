fileurl="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl,destfile="wearable.zip",method="curl")
unzip("wearable.zip")

features <- read.table(file="UCI\ HAR\ Dataset/features.txt",sep=" ",col.names=c("id","name"))

meanstdcols <- grep("-mean\\(\\)|-std\\(\\)",features[,2])
features[,2] <- tolower(gsub("[-()]","",features[,2]))

activity_labels <-  read.table(file="UCI\ HAR\ Dataset/activity_labels.txt",sep=" ",col.names=c("id","activity"))

y_train <- read.table(file="UCI\ HAR\ Dataset/train/Y_train.txt",col.names=c("activityid"))
x_train_in <- read.table(file="UCI\ HAR\ Dataset/train/X_train.txt",col.names=as.vector(features$name))
x_train <- x_train_in[,meanstdcols]
subject_train <- read.table(file="UCI\ HAR\ Dataset/train/subject_train.txt",col.names=c("subject"))

y_test <- read.table(file="UCI\ HAR\ Dataset/test/Y_test.txt",col.names=c("activityid"))
x_test_in <- read.table(file="UCI\ HAR\ Dataset/test/X_test.txt",col.names=as.vector(features$name))
x_test <- x_test_in[,meanstdcols]
subject_test <- read.table(file="UCI\ HAR\ Dataset/test/subject_test.txt",col.names=c("subject"))

subject <- rbind(subject_train,subject_test)
y_all <- rbind(y_train,y_test)
adt <- cbind(subject,y_all)

x_data <- rbind(x_train,x_test)

activity = merge(adt,activity_labels,by.x="activityid",by.y="id")

all_data <- cbind(x_data,activity)

all_data <- all_data[, !(colnames(all_data) %in% c("activityid"))]

data_ave_by_subject_activity <- aggregate(.~subject+activity,all_data,mean)

write.table(data_ave_by_subject_activity,file="tidydata.txt",row.names=FALSE)

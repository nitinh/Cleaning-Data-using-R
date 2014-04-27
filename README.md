

1. The script run_analysis.R , downloads the file https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
and saves in the working directory as wearable.zip and unzips it.

2. The script ignores the raw data files in the directories "UCI HAR Dataset/train/Inertial Signals" and "UCI HAR Dataset/test/Inertial Signals"

3. The script then reads data from featurs.txt and activity_labels.txt

4. Only the features that contain the string -mean() or -std() in the feature name  are selected 

5. The names of the features are modified to 
	a. Convert the uppercase characters to lowercase
	b. Remove the characters - ( )

6. The script then reads data from  X_train.txt ,y_train.txt ,subject_train.txt  

7. The script merges y_train and activity_labels.txt into "activity" data frame

8. The script merges X_train , subject_train and activity data frames into "data_train" data frame

9. The script then reads data from  X_test.txt ,y_test.txt ,subject_test.txt  

10. The script merges y_test and activity_labels.txt into "activity" data frame

11. The script merges X_test , subject_test and activity data frames into "data_test" data frame

12. The script combines the rows from the data frames data_train and data_test into dataframe all_data

13. The script removes column activityid from the dataframe  all_data

14. The script then creates a second, independent tidy data set "data_ave_by_subject_activity"  with the average of each variable for each activity and each subject

15. The script then writes the new tidy dataset into file tidydata.txt in to working directory


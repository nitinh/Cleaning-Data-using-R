

1. The script run_analysis.R , downloads the file https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
and saves in the working directory as wearable.zip and unzips it.

2. The script ignores the raw data files in the directories "UCI HAR Dataset/train/Inertial Signals" and "UCI HAR Dataset/test/Inertial Signals"

3. The script then reads data from featurs.txt and activity_labels.txt

4. Only the features that contain the string -mean() or -std() in the feature name  are selected 

5. The names of the features are modified to 
	a. Convert the uppercase characters to lowercase
	b. Remove the characters - ( )

6. The script then reads data from  X_train.txt ,y_train.txt ,subject_train.txt  . It reads only the columns selected in step 4 from the file X_train

7. The script then reads data from  X_test.txt ,y_test.txt ,subject_test.txt  . It reads only the columns selected in step 4 from the file X_test

8. The script combines rows from  y_train.txt and y_test.txt into "y_all" data frame

9. The script combines rows from  subject_train.txt and subject_test.txt into "subject" data frame

10. The script merges y_all and subject data frames into "adt" data frame

11. The script combines rows from  x_train.txt and x_test.txt into "x_data" data frame

12. The script then merges data frames "adt" and "activity_labels" into "activity" data frame

13. The script then combines columns from x_data and activity  into data frame "all_data"

14. The script removes column activityid from the dataframe  "all_data"

15. The script then creates a second, independent tidy data set "data_ave_by_subject_activity"  with the average of each variable for each activity and each subject

16. The script then writes the new tidy dataset into file tidydata.txt in to working directory


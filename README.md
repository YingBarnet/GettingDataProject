# GettingDataProject
==================================================================
This file is to explain how run_analysis.R works.
==================================================================

The run_analysis.R is a script to analyse the data which was collected by the Samsung smartphone. The script need to be put to the working directory together with the 
collected dataset which is stored below folder"\UCI HAR Dataset". The while file structure need to be organized like this:

- 'run_analysis.R'

- '/UCI HAR Dataset/README.txt'

- '/UCI HAR Dataset/features_info.txt': Shows information about the variables used on the feature vector.

- '/UCI HAR Dataset/features.txt': List of all features.

- '/UCI HAR Dataset/activity_labels.txt': Links the class labels with their activity name.

- '/UCI HAR Dataset/train/X_train.txt': Training set.

- '/UCI HAR Dataset/train/y_train.txt': Training labels.

- '/UCI HAR Dataset/test/X_test.txt': Test set.

- '/UCI HAR Dataset/test/y_test.txt': Test labels.

==================================================================

The script has 5 parts to do below tasks:
1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement. 
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive variable names. 
5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

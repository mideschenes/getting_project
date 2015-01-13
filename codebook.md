Getting and Cleaning Data : course project (codebook)
===================================

----------
The raw data
-------------
The [raw data](https://d396qusza40orc.cloudfront.net/getdata/projectfiles/UCI%20HAR%20Dataset.zip) (described [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)) are organized like this (in UCI HAR Dataset directory) :

 - Train data, in Train directory
   - The subjects id (subject\_train.txt) 
   - The activities id (y\_train.txt) 
   - The measurements (x\_train.txt), normalized and bounded within [-1,1]
 - Test data, in Test directory
   - The subjects id (subject\_test.txt) 
   - The activities id (y\_test.txt) 
   - The measurements (x\_test.txt), normalized and bounded within [-1,1]
 - The features (names of measurements) are listed in features.txt and their description is in features\_infos.txt
 - The activity labels (in activity\_labels.txt) are the readable names of activity ids

----------
Transformation
-------------
The transformation is performed in 5 steps :
>  1. Merges the training and the test sets to create one data set. First, the script merges the subjects id with the activities id and the measurements for the train data. Second, it does the same thing with the test data. Then, it merges the train and the test data together. After this step, we have a dataset of 562 columns (subject, activity and features) for 10,299 observations.
>  2. Extracts only the measurements on the mean and standard deviation for each measurement. The script names the columns with the labels in features.txt and extracts these columns : Subject, Activity, anything including mean() and std(). After this step, we have a dataset of 68 columns for 10,299 observations.
>  3. Uses descriptive activity names (in activity_labels.txt) to name the activities in the data set. After this step, the columns that contains activity ids is replace by a columns that contains activity labels.
>  4. Appropriately labels the data set with descriptive variable names. After this step, the columns names are more readable (you can take a look at them in the section "Features : initial names vs result names").
> - Remove parentheses and dash Replace the "t" at begining by TimeDomainSignal and the "F" at begining by FrequencyDomainSignal
> - Capitalize the words mean and std
> - Elaborate names : (Acc become Acceleration, GyroJerk become AngularAcceleration, Gyro become AngularSpeed and Mag become Magnitude)
> - Remove "Body" repetition
>  5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. After this step, the tidy dataset created is explain in the next section.

----------
The result
-------------
After the step 4, we have a tidy dataset :

 - 10299 rows (corresponding at the train and the test data, the measurement of each subject and each activity)
 - 68 columns (subject id, activity label, and all the columns originally named with mean() or std())

After the step 5, we hava another tidy dataset, write in file tidy.txt :

 - 180 rows (corresponding to the average measurements for the 30 subjects, each of them doing 6 activities)
 - 68 columns (same as step 4)

----------
Features : initial names vs result names
-------------
| Initial names               | Result names                                                  |
| --------------------------- |---------------------------------------------------------------|
| Subject                     | Subject                                                       |
| Activity                    | Activity                                                      |
| tBodyAcc-mean()-X           | TimeDomainSignal_BodyAcceleration_MeanX                       |
| tBodyAcc-mean()-Y           | TimeDomainSignal_BodyAcceleration_MeanY                       |
| tBodyAcc-mean()-Z           | TimeDomainSignal_BodyAcceleration_MeanZ                       |
| tBodyAcc-std()-X            | TimeDomainSignal_BodyAcceleration_StdX                        |
| tBodyAcc-std()-Y            | TimeDomainSignal_BodyAcceleration_StdY                        |
| tBodyAcc-std()-Z            | TimeDomainSignal_BodyAcceleration_StdZ                        |
| tGravityAcc-mean()-X        | TimeDomainSignal_GravityAcceleration_MeanX                    |
| tGravityAcc-mean()-Y        | TimeDomainSignal_GravityAcceleration_MeanY                    |
| tGravityAcc-mean()-Z        | TimeDomainSignal_GravityAcceleration_MeanZ                    |
| tGravityAcc-std()-X         | TimeDomainSignal_GravityAcceleration_StdX                     |
| tGravityAcc-std()-Y         | TimeDomainSignal_GravityAcceleration_StdY                     |
| tGravityAcc-std()-Z         | TimeDomainSignal_GravityAcceleration_StdZ                     |
| tBodyAccJerk-mean()-X       | TimeDomainSignal_BodyAcceleration_JerkMeanX                   |
| tBodyAccJerk-mean()-Y       | TimeDomainSignal_BodyAcceleration_JerkMeanY                   |
| tBodyAccJerk-mean()-Z       | TimeDomainSignal_BodyAcceleration_JerkMeanZ                   |
| tBodyAccJerk-std()-X        | TimeDomainSignal_BodyAcceleration_JerkStdX                    |
| tBodyAccJerk-std()-Y        | TimeDomainSignal_BodyAcceleration_JerkStdY                    |
| tBodyAccJerk-std()-Z        | TimeDomainSignal_BodyAcceleration_JerkStdZ                    |
| tBodyGyro-mean()-X          | TimeDomainSignal_BodyAngularSpeed_MeanX                       |
| tBodyGyro-mean()-Y          | TimeDomainSignal_BodyAngularSpeed_MeanY                       |
| tBodyGyro-mean()-Z          | TimeDomainSignal_BodyAngularSpeed_MeanZ                       |
| tBodyGyro-std()-X           | TimeDomainSignal_BodyAngularSpeed_StdX                        |
| tBodyGyro-std()-Y           | TimeDomainSignal_BodyAngularSpeed_StdY                        |
| tBodyGyro-std()-Z           | TimeDomainSignal_BodyAngularSpeed_StdZ                        |
| tBodyGyroJerk-mean()-X      | TimeDomainSignal_BodyAngularAcceleration_MeanX                |
| tBodyGyroJerk-mean()-Y      | TimeDomainSignal_BodyAngularAcceleration_MeanY                |
| tBodyGyroJerk-mean()-Z      | TimeDomainSignal_BodyAngularAcceleration_MeanZ                |
| tBodyGyroJerk-std()-X       | TimeDomainSignal_BodyAngularAcceleration_StdX                 |
| tBodyGyroJerk-std()-Y       | TimeDomainSignal_BodyAngularAcceleration_StdY                 |
| tBodyGyroJerk-std()-Z       | TimeDomainSignal_BodyAngularAcceleration_StdZ                 |
| tBodyAccMag-mean()          | TimeDomainSignal_BodyAcceleration_Magnitude_Mean              |
| tBodyAccMag-std()           | TimeDomainSignal_BodyAcceleration_Magnitude_Std               |
| tGravityAccMag-mean()       | TimeDomainSignal_GravityAcceleration_Magnitude_Mean           |
| tGravityAccMag-std()        | TimeDomainSignal_GravityAcceleration_Magnitude_Std            |
| tBodyAccJerkMag-mean()      | TimeDomainSignal_BodyAcceleration_JerkMagnitude_Mean          |
| tBodyAccJerkMag-std()       | TimeDomainSignal_BodyAcceleration_JerkMagnitude_Std           |
| tBodyGyroMag-mean()         | TimeDomainSignal_BodyAngularSpeed_Magnitude_Mean              |
| tBodyGyroMag-std()          | TimeDomainSignal_BodyAngularSpeed_Magnitude_Std               |
| tBodyGyroJerkMag-mean()     | TimeDomainSignal_BodyAngularAcceleration_Magnitude_Mean       |
| tBodyGyroJerkMag-std()      | TimeDomainSignal_BodyAngularAcceleration_Magnitude_Std        |
| fBodyAcc-mean()-X           | FrequencyDomainSignal_BodyAcceleration_MeanX                  |
| fBodyAcc-mean()-Y           | FrequencyDomainSignal_BodyAcceleration_MeanY                  |
| fBodyAcc-mean()-Z           | FrequencyDomainSignal_BodyAcceleration_MeanZ                  |
| fBodyAcc-std()-X            | FrequencyDomainSignal_BodyAcceleration_StdX                   |
| fBodyAcc-std()-Y            | FrequencyDomainSignal_BodyAcceleration_StdY                   |
| fBodyAcc-std()-Z            | FrequencyDomainSignal_BodyAcceleration_StdZ                   |
| fBodyAccJerk-mean()-X       | FrequencyDomainSignal_BodyAcceleration_JerkMeanX              |
| fBodyAccJerk-mean()-Y       | FrequencyDomainSignal_BodyAcceleration_JerkMeanY              |
| fBodyAccJerk-mean()-Z       | FrequencyDomainSignal_BodyAcceleration_JerkMeanZ              |
| fBodyAccJerk-std()-X        | FrequencyDomainSignal_BodyAcceleration_JerkStdX               |
| fBodyAccJerk-std()-Y        | FrequencyDomainSignal_BodyAcceleration_JerkStdY               |
| fBodyAccJerk-std()-Z        | FrequencyDomainSignal_BodyAcceleration_JerkStdZ               |
| fBodyGyro-mean()-X          | FrequencyDomainSignal_BodyAngularSpeed_MeanX                  |
| fBodyGyro-mean()-Y          | FrequencyDomainSignal_BodyAngularSpeed_MeanY                  |
| fBodyGyro-mean()-Z          | FrequencyDomainSignal_BodyAngularSpeed_MeanZ                  |
| fBodyGyro-std()-X           | FrequencyDomainSignal_BodyAngularSpeed_StdX                   |
| fBodyGyro-std()-Y           | FrequencyDomainSignal_BodyAngularSpeed_StdY                   |
| fBodyGyro-std()-Z           | FrequencyDomainSignal_BodyAngularSpeed_StdZ                   |
| fBodyAccMag-mean()          | FrequencyDomainSignal_BodyAcceleration_Magnitude_Mean         |
| fBodyAccMag-std()           | FrequencyDomainSignal_BodyAcceleration_Magnitude_Std          |
| fBodyBodyAccJerkMag-mean()  | FrequencyDomainSignal_BodyAcceleration_JerkMagnitude_Mean     |
| fBodyBodyAccJerkMag-std()   | FrequencyDomainSignal_BodyAcceleration_JerkMagnitude_Std      |
| fBodyBodyGyroMag-mean()     | FrequencyDomainSignal_BodyAngularSpeed_Magnitude_Mean         |
| fBodyBodyGyroMag-std()      | FrequencyDomainSignal_BodyAngularSpeed_Magnitude_Std          |
| fBodyBodyGyroJerkMag-mean() | FrequencyDomainSignal_BodyAngularAcceleration_Magnitude_Mean  |
| fBodyBodyGyroJerkMag-std()  | FrequencyDomainSignal_BodyAngularAcceleration_Magnitude_Std   |
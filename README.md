Getting and Cleaning Data : course project (readme)
===================================

The project
-------------
As it's written in the project assignment :

> The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

The script that we have to write (run_analysis.R) :

>  1. Merges the training and the test sets to create one data set. First, the script merges the subjects id with the activities id and the measurements for the train data. Second, it does the same thing with the test data. Then, it merges the train and the test data together.
>  2. Extracts only the measurements on the mean and standard deviation for each measurement. The script names the columns with the labels in features.txt and extracts these columns : Subject, Activity, anything including mean() and std().
>  3. Uses descriptive activity names (in activity_labels.txt) to name the activities in the data set.
>  4. Appropriately labels the data set with descriptive variable names. 
> - Remove parentheses and dash Replace the "t" at begining by TimeDomainSignal and the "F" at begining by FrequencyDomainSignal
> - Capitalize the words mean and std
> - Elaborate names : (Acc become Acceleration, GyroJerk become AngularAcceleration, Gyro become AngularSpeed and Mag become Magnitude)
> - Remove "Body" repetition
>  5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

----------
Files
-------------
The directory includes :

 - **run_analysis.R** : R script file that get data, merge them, extract the data that interest us (mean et standard deviation) and create tidy dataset.
 - **readme.md** : this file! The markdown file which explains how to run run_analysis.R.
 - **codebook.md** : The markdown file that describes the variables, the data, and the transformations performed to clean up the data in run_analysis.R.
 - **UCI HAR Dataset** : The data directory that includes (the two Inertial signals directory aren't used by run\_analysis.R)
   - train and test data, each one in a separate directory, the raw data including[^inertial] :
     - the subjects id (subject\_test.txt) 
     - the activities id (y\_test.txt and y\_train.txt) 
     - the measurements (x\_test.txt and x\_train.txt) normalized and bounded within [-1,1]
   - activity\_labels.txt : used to associate the data in y\_test.txt and y\_train.txt files with readable names
   - features.txt : used to name the measurements in x\_test.txt and x\_train.txt
   - features_info.txt : the description of the raw data

The raw data can be [downloaded](https://d396qusza40orc.cloudfront.net/getdata/projectfiles/UCI%20HAR%20Dataset.zip) and you can read [their full description](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

----------
How to run the script
-------------
 1. Make sure you have downloaded every files mentioned in files
    section, keeping the structure of the main directory : ***(ajouter la
    capture)***
 2. Open R, set the working directory and run : *source("run_analysis.R")*
 3. See the tidy dataset in main directory (tidy.txt) !

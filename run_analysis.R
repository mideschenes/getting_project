###############################################################################
## This script :                                                             ##
##   1. Merges the training and the test sets to create one data set         ##
##   2. Extracts only the measurements on the mean and standard deviation    ##
##      for each measurement                                                 ##
##   3. Uses descriptive activity names to name the activities in the        ##
##      data set                                                             ##
##   4. Appropriately labels the data set with descriptive variable names    ##
##   5. From the data set in step 4, creates a second, independent tidy      ##
##      data set with the average of each variable for each activity         ##
##      and each subject                                                     ##
## See more details on readme.md!                                            ##
###############################################################################

###############################################################################
## 1. Merges the training and the test sets to create one data set           ##
###############################################################################

## Load train datas and merge them in one dataset
train_subjectsid <- read.table("UCI HAR Dataset/train/subject_train.txt")
train_activitiesid <- read.table("UCI HAR Dataset/train/y_train.txt")
train_data <- read.table("UCI HAR Dataset/train/X_train.txt")
train <- cbind(cbind(train_subjectsid, train_activitiesid), train_data)

## Load test datas and merge them in one dataset
test_subjectsid <- read.table("UCI HAR Dataset/test/subject_test.txt")
test_activitiesid <- read.table("UCI HAR Dataset/test/y_test.txt")
test_data <- read.table("UCI HAR Dataset/test/X_test.txt")
test <- cbind(cbind(test_subjectsid, test_activitiesid), test_data)

## Merge train dataset and test dataset together
all <- rbind(train, test)


###############################################################################
## 2. Extracts only the measurements on the mean and standard deviation      ##
##    for each measurement                                                   ##
###############################################################################

## Load labels datas (features) and name the all dataset columns 
labels <- read.table("UCI HAR Dataset/features.txt")
names(all) <- c("Subject", "Activity", as.character(labels$V2))

## Extract the columns : Subject, Activity, anything including mean() and std()
mean_std <- all[, grep("Subject|Activity|mean\\(\\)|std\\(\\)", 
                        names(all), 
                        value=TRUE)]


###############################################################################
## 3. Uses descriptive activity names to name the activities in the data set ##
###############################################################################

## Load activity labels
activities <- read.table("UCI HAR Dataset/activity_labels.txt")

## Replace the id of the activities by their label
mean_std$Activity <- activities[mean_std$Activity,2]




print(names(mean_std))




###############################################################################
## 4. Appropriately labels the data set with descriptive variable names      ##
###############################################################################

## Remove parentheses and dash
names(mean_std) <- gsub('\\(|\\)|-', "", names(mean_std))

## Replace the "t" at begining by TimeDomainSignal
names(mean_std) <- gsub('^t', "TimeDomainSignal_", names(mean_std))

## Replace the "F" at begining by FrequencyDomainSignal
names(mean_std) <- gsub('^f', "FrequencyDomainSignal_", names(mean_std))

## Capitalize the words mean and std
names(mean_std) <- gsub('mean', "Mean", names(mean_std))
names(mean_std) <- gsub('std', "Std", names(mean_std))

## Elaborate names
names(mean_std) <- gsub('Acc', "Acceleration_", names(mean_std))
names(mean_std) <- gsub('GyroJerk', "AngularAcceleration_", names(mean_std))
names(mean_std) <- gsub('Gyro', "AngularSpeed_", names(mean_std))
names(mean_std) <- gsub('Mag', "Magnitude_", names(mean_std))

## Remove "Body" repetition
names(mean_std) <- gsub('BodyBody', "Body", names(mean_std))


###############################################################################
## 5. From the data set in step 4, creates a second, independent tidy data   ##
##    set with the average of each variable for each activity and            ##
##    each subject                                                           ##
###############################################################################

## Load plyr library to be able to use ddply function
library(plyr)

## Calculate the average
avg_act_sub <-  ddply(mean_std, c("Subject","Activity"), numcolwise(mean))

## Write the dataset in a file named tidy.txt
write.table(avg_act_sub, row.name=FALSE, file = "tidy.txt") 
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
trainSubjectsId <- read.table("UCI HAR Dataset/train/subject_train.txt")
trainActivitiesId <- read.table("UCI HAR Dataset/train/y_train.txt")
trainData <- read.table("UCI HAR Dataset/train/X_train.txt")
train <- cbind(cbind(trainSubjectsId, trainActivitiesId), trainData)

## Load test datas and merge them in one dataset
testSubjectsId <- read.table("UCI HAR Dataset/test/subject_test.txt")
testActivitiesId <- read.table("UCI HAR Dataset/test/y_test.txt")
testData <- read.table("UCI HAR Dataset/test/X_test.txt")
test <- cbind(cbind(testSubjectsId, testActivitiesId), testData)

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
meanStd <- all[, grep("Subject|Activity|mean\\(\\)|std\\(\\)", 
                        names(all), 
                        value = TRUE)]


###############################################################################
## 3. Uses descriptive activity names to name the activities in the data set ##
###############################################################################

## Load activity labels
activities <- read.table("UCI HAR Dataset/activity_labels.txt")

## Replace the id of the activities by their label
meanStd$Activity <- activities[meanStd$Activity, 2]


###############################################################################
## 4. Appropriately labels the data set with descriptive variable names      ##
###############################################################################

## Remove parentheses and dash
names(meanStd) <- gsub('\\(|\\)|-', "", names(meanStd))

## Replace the "t" at begining by TimeDomainSignal
names(meanStd) <- gsub('^t', "TimeDomainSignal_", names(meanStd))

## Replace the "F" at begining by FrequencyDomainSignal
names(meanStd) <- gsub('^f', "FrequencyDomainSignal_", names(meanStd))

## Capitalize the words mean and std
names(meanStd) <- gsub('mean', "Mean", names(meanStd))
names(meanStd) <- gsub('std', "Std", names(meanStd))

## Elaborate names
names(meanStd) <- gsub('Acc', "Acceleration_", names(meanStd))
names(meanStd) <- gsub('GyroJerk', "AngularAcceleration_", names(meanStd))
names(meanStd) <- gsub('Gyro', "AngularSpeed_", names(meanStd))
names(meanStd) <- gsub('Mag', "Magnitude_", names(meanStd))

## Remove "Body" repetition
names(meanStd) <- gsub('BodyBody', "Body", names(meanStd))


###############################################################################
## 5. From the data set in step 4, creates a second, independent tidy data   ##
##    set with the average of each variable for each activity and            ##
##    each subject                                                           ##
###############################################################################

## Load plyr library to be able to use ddply function
library(plyr)

## Calculate the average
avgActSub <-  ddply(meanStd, c("Subject", "Activity"), numcolwise(mean))

## Write the dataset in a file named tidy.txt
write.table(avgActSub, row.name = FALSE, file = "tidy.txt") 
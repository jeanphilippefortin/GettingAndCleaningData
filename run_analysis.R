## Load need library
library(dplyr)
library(tidyr)

## Set the path to be used later to load files
basePath <- paste(getwd(), "/data/UCI HAR Dataset/", sep="")
testPath <- paste(basePath, "test/", sep="")
trainPath <- paste(basePath, "train/", sep="")

## 1. Merges the training and the test sets to create one data set

## Get the activity labels and features columns names
subjectLabel <- c("subjectId")

activityLabels <- read.table(paste(basePath, "activity_labels.txt", sep=""))
names(activityLabels) <- c("activityId", "activity")

features <- read.table(paste(basePath, "features.txt", sep=""), stringsAsFactor=FALSE)
featuresLabels <- as.vector(features[,2])
rm(features)

## assemble the test dataset
testSubject <- read.table(paste(testPath, "subject_test.txt", sep=""))
testX <- read.table(paste(testPath, "X_test.txt", sep=""))
testY <- read.table(paste(testPath, "Y_test.txt", sep=""))

## set names
names(testSubject) <- subjectLabel
names(testX) <- featuresLabels
names(testY) <- names(activityLabels)[1]

## bind together
test <- cbind(testSubject, testY, testX)

## remove parts
rm(testSubject)
rm(testX)
rm(testY)

## assemble the train dataset
trainSubject <- read.table(paste(trainPath, "subject_train.txt", sep=""))
trainX <- read.table(paste(trainPath, "X_train.txt", sep=""))
trainY <- read.table(paste(trainPath, "Y_train.txt", sep=""))

names(trainSubject) <- subjectLabel
names(trainX) <- featuresLabels
names(trainY) <- names(activityLabels)[1]
        
## bind together
train <- cbind(trainSubject, trainY, trainX)

## remove parts
rm(trainSubject)
rm(trainX)
rm(trainY)

## merge test + train 
fullSet <- rbind(train, test)

## remove individual sets
rm(train)
rm(test)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## use a regex to extract columname, we search for mean, std and both id columns
subset <- fullSet[ ,grepl("mean\\(\\)|std\\(\\)|subjectId|activityId", names(fullSet))]
## remove unused set
rm(fullSet)

## 3. Uses descriptive activity names to name the activities in the data set
## merge activityLabels to get descriptive activity names
subset <- merge(activityLabels, subset, all=TRUE, by=c("activityId"))

## 4. Appropriately labels the data set with descriptive variable names. 
## this was done previously by setting the column names a i moved along

## 5. From the data set in step 4, creates a second, independent tidy data set 
##    with the average of each variable for each activity and each subject.

## convert to have all columns as variable 
ds <- subset %>% gather(means, mean, 4:69, na.rm=TRUE)
## group to be able to use summarize
grouped <- group_by(ds, subjectId, activityId)
## summarise to get the mean of columns and convert back to a data frame to use write.table
tidy <- as.data.frame(summarise(grouped, mean=mean(mean)))

## write file to disk
write.table(tidy, "tidy.txt", row.name=FALSE)


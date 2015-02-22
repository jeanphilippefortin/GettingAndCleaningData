# Getting And Cleaning Data
Course project from Getting and Cleaning data on Coursera, February 2015

Scripts authored by Jean-Philippe Fortin


## Steps to execute projet
There is two option to run this project, either you
- Download this repository 
- Download the project data [available here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

Then you need to set your working environnement, if downloading the project data, the data is expected to be in a folder caller Data and keeping the original folder structure in the zip file

You can then run the R script run_analysis.R

As the project states, it does ( taken directly from the course page ):

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Running this script will output a filled named tidy.txt containing the tidy data set produced by the R script.

*Running this script will require having dplyr and tidyr packages installed
 

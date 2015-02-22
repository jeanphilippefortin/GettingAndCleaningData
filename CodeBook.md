## Code book for the Getting and Cleaning Data project

- Files for this project can be found online at : https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
- Full description of this data is available here : http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
- More information on the data set and its field can be found in the downloaded data in those files

>- README.txt - Full info on included files and the data set
- features_info.txt - Information on the variables

# Methodology

- Starts by creating 3 variables to hold the column names: subject, activity and features
- Read the 3 test files into 3 data frame then add their columns names
- Bind togheter the 3 files to create a complete file, i prefered to load the 2 small first to leave all the features at the end of the data frame, i find it easier to read after that.
- Repeat the same process with the 3 files from the train data set
- Bind the train and test data set togheter. 
- Dispose of all unused data frame to prevent errors and release memory
- With the complete data set select only columns with the mean and the standard deviation, also do not forget to include the identity column as they will be need later. Selection of columns is made using regular expression
- For the final set, to get a tidy data set consisting of the mean of all features, used gather get them in column and then added group_by both subjectId and activityId. Then use summarise with the mean function to get the final result.
- File is then written to disk with row.name=FALSE

# Resulting file
The new file, tidy.txt, contains a tidy data set with the subject, activity and mean of all the features.

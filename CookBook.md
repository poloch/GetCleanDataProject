## File description

Csv file with ',' separator.

Generated from the train and test data from [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata/projectfiles/UCI%20HAR%20Dataset.zip) :
- `features.txt` to selet the columns (features) to extract from train and test observed data.
- `train/X_train.txt` and `test/X_test.txt` the train, resp test observed data (signals from the motion sensors)
- `train/y_train.txt` and `test/y_test.txt` the train, resp test activity associated to the observations
- `activity_labels.txt` labels for the activity index found in previous files.

# Generation process

The cleaned dataset **motion_data.csv** is obtained by the following steps:
1. extract of some colums from the train observation data (`train/X_train.txt`):
.* get the id (row number) of the features with values of the form ".\*-mean().\*" or ".\*-std().\*" (in `features.txt`)
.* extract the corresponding columns (column number = feature id) from the observation data.
2. join with labelled activities
.* join (cbind, ie. join on line numbers) the observation table with the activity table
.* join (merge on activity id) with the `activity_labels.txt` table
3. idem with test data, that is happened to the same output table

# Output dimensions

All dimensions are double except, ''activity'' which is a string.

1. tBodyAcc-mean()-X
1. tBodyAcc-mean()-Y
1. tBodyAcc-mean()-Z
1. tBodyAcc-std()-X
1. tBodyAcc-std()-Y
1. tBodyAcc-std()-Z
1. tGravityAcc-mean()-X
1. tGravityAcc-mean()-Y
1. tGravityAcc-mean()-Z
1. tGravityAcc-std()-X
1. tGravityAcc-std()-Y
1. tGravityAcc-std()-Z
1. tBodyAccJerk-mean()-X
1. tBodyAccJerk-mean()-Y
1. tBodyAccJerk-mean()-Z
1. tBodyAccJerk-std()-X
1. tBodyAccJerk-std()-Y
1. tBodyAccJerk-std()-Z
1. tBodyGyro-mean()-X
1. tBodyGyro-mean()-Y
1. tBodyGyro-mean()-Z
1. tBodyGyro-std()-X
1. tBodyGyro-std()-Y
1. tBodyGyro-std()-Z
1. tBodyGyroJerk-mean()-X
1. tBodyGyroJerk-mean()-Y
1. tBodyGyroJerk-mean()-Z
1. tBodyGyroJerk-std()-X
1. tBodyGyroJerk-std()-Y
1. tBodyGyroJerk-std()-Z
1. tBodyAccMag-mean()
1. tBodyAccMag-std()
1. tGravityAccMag-mean()
1. tGravityAccMag-std()
1. tBodyAccJerkMag-mean()
1. tBodyAccJerkMag-std()
1. tBodyGyroMag-mean()
1. tBodyGyroMag-std()
1. tBodyGyroJerkMag-mean()
1. tBodyGyroJerkMag-std()
1. fBodyAcc-mean()-X
1. fBodyAcc-mean()-Y
1. fBodyAcc-mean()-Z
1. fBodyAcc-std()-X
1. fBodyAcc-std()-Y
1. fBodyAcc-std()-Z
1. fBodyAccJerk-mean()-X
1. fBodyAccJerk-mean()-Y
1. fBodyAccJerk-mean()-Z
1. fBodyAccJerk-std()-X
1. fBodyAccJerk-std()-Y
1. fBodyAccJerk-std()-Z
1. fBodyGyro-mean()-X
1. fBodyGyro-mean()-Y
1. fBodyGyro-mean()-Z
1. fBodyGyro-std()-X
1. fBodyGyro-std()-Y
1. fBodyGyro-std()-Z
1. fBodyAccMag-mean()
1. fBodyAccMag-std()
1. fBodyBodyAccJerkMag-mean()
1. fBodyBodyAccJerkMag-std()
1. fBodyBodyGyroMag-mean()
1. fBodyBodyGyroMag-std()
1. fBodyBodyGyroJerkMag-mean()
1. fBodyBodyGyroJerkMag-std()
1. activity

**This data analysis used the Human Activity Recognition Using Smartphone Data Set (UCI HAR)**

_Taken from source: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones_

Data was first downloaded from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


A variable was assigned for each data frame.

1) activitylab - Activity measurements label: > 1- WALKING, 2- WALKING_UPSTAIRS, 3- WALKING_DOWNSTAIRS, 4- SITTING, 
5- STANDING, 6- LAYING. Numbers are designated to each activity.Column name     for the labels was named "actnumber".Data set assigned: "activity_labels.txt". 

2) feature - Each measurement label taken from each participant.
             The features come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 
             Data set assigned: "features.txt"

3) xtrain - Variable assigned to the train data measured from each measurement from each subject. 
            Data set assigned:X_train.txt"

4) ytrain - Variable assigned to the train data measure from each activity measurement label for each subject. 
            Data set assigned: train/y_train.txt"

5) subtrain - Variable assigned to the data on which the number of each subject on the train data is recorded. 
              Data set assigned: "subject_train.txt"

6) xtest -  Variable assigned to the test data measured from each measurement from each subject.
            Data set assigned: "X_test.txt". 

7) ytest -  Variable assigned to the train data measure from each activity measurement label for each subject. 
             Data set assigned: "y_test.txt"

8) subtest - Variable assigned to the data on which the number of each subject on the test data is recorded. 
             Data set assigned: subject_test.txt"

**Step 1:** Test data and Train data are put together into one data frame. 

Variables assigned 
1) xbind- Rows of X (xtest, xtrain)are put together (using rbind func)
2) ybind- Rows of Y (ytest, ytrain) are put together (using rbind func)
3) subbind - Rows of subjects (subtest, subtrain) numbers are put together (using rbind func)
4) Onedata - All data (subbind, xbind, ybind) is put together (using cbind func)



**Step 2:** Measurements on the mean and standard deviation for each measurement are extracted.

From the assigned "Onedata" variable, the columns of subject, actnumber  and those that contained the word "mean" and "std" were selected and assigned to a new variable called "OneData2"


**Step 3:**  Descriptive activity names were used to name the activities in the data set.

The numbers designated above "actnumber" column were then assigned to each of their activities (1 to WALKING, 2 to WALKING_UPSTAIRS, 3 to WALKING_DOWNSTAIRS, 4 to SITTING, 5 to STANDING, 6 to LAYING)

**Step 4:** The data set was labeled with more descriptive names.

Abbreviations and other characters ("-,()")were replaced: 

"actnumber" was renamed to "activity"
"t" was replaced with "Time"
"f" was replaced with "Frequency"
"Acc" was replaced with "Accelerometer"
"Mag"was replaced with "Magnitude"
"-mean()" was replaced with "Mean"
"-std()" was replaced with "STD"
"-freq()" was replaced with "Frequency"

**Step 5:** A second, independent tidy data set is created with the average of each variable for each activity and each subject.

Onedata2 was grouped by (using function group_by) subject and activity, further its average for each variable was taken (using summarized_all and mean functions). This new data set was now assigned to TidyData variable. 


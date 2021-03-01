
#Download the zip file
file<-"/Users/danielaaguilar/Documents/repo/datasciencecoursera.zip"
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL,file, method="curl")
unzip(file)

#Assigning Tables and naming columns  
activitylab<-read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("actnumber", "activity"))
feature<-read.table("UCI HAR Dataset/features.txt", col.names = c("number","measurement"))
xtrain<-read.table("UCI HAR Dataset/train/X_train.txt", col.names = feature$measurement)
ytrain<-read.table("UCI HAR Dataset/train/y_train.txt", col.names = "actnumber")
subtrain<-read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
xtest<-read.table("UCI HAR Dataset/test/X_test.txt", col.names = feature$measurement)
ytest<-read.table("UCI HAR Dataset/test/y_test.txt", col.names = "actnumber")
subtest<-read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject" )

#Step1
#Merges the training and the test sets to create one data set.
xbind<-rbind(xtrain, xtest)
ybind<-rbind(ytrain, ytest)
subbind<-rbind(subtrain,subtest)
Onedata<-cbind.data.frame(subbind, xbind, ybind)
str(Onedata)

#Step2
#Extracts only the measurements on the mean and standard deviation for each measurement.
Onedata2<-Onedata %>% select(subject, actnumber, contains("mean"),contains("std"))

#Step3
#Uses descriptive activity names to name the activities in the data set
Onedata2$actnumber<- factor(Onedata2$actnumber, levels = c(1,2,3,4,5,6), labels = c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING","LAYING"))
#OR Onedata2$actnumber <- activitylab[Onedata2$actnumber, 2]

#Step4
#Appropriately labels the data set with descriptive variable names. 
Onedata2<-Onedata2 %>% rename("activity"="actnumber")
names(Onedata2)<-gsub("^t", "Time", names(Onedata2))
names(Onedata2)<-gsub("^f", "Frequency", names(Onedata2))
names(Onedata2)<-gsub("Acc", "Accelerometer", names(Onedata2))
names(Onedata2)<-gsub("Mag", "Magnitude", names(Onedata2))
names(Onedata2)<-gsub("-mean()", "Mean", names(Onedata2))
names(Onedata2)<-gsub("-std()", "STD", names(Onedata2))
names(Onedata2)<-gsub("-freq()", "Frequency", names(Onedata2))

#Step5
#From the data set in step 4, creates a second, independent tidy data set 
#with the average of each variable for each activity and each subject.
TidyData<-Onedata2 %>% group_by(subject, activity) %>% summarise_all(mean)


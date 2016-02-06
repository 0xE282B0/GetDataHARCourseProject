
#Download Dataset and unzip it.
#url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#download.file(url = url, destfile = "UCI HAR Dataset.zip")
#unzip(zipfile="./UCI HAR Dataset.zip",exdir="./")

# Read files
features <- read.table("UCI HAR Dataset/features.txt", quote="\"", comment.char="")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", quote="\"", comment.char="")

subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", quote="\"", comment.char="")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", quote="\"", comment.char="")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt", quote="\"", comment.char="")

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", quote="\"", comment.char="")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", quote="\"", comment.char="")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt", quote="\"", comment.char="")

# Add labels
names(subject_test) <- "Subjects"
names(y_test) <- c("Activity")
names(X_test) <- features[[2]]

names(subject_train) <- "Subjects"
names(y_train) <- c("Activity")
names(X_train) <- features[[2]]

# 1. Merges the training and the test sets to create one data set.
data <- rbind(cbind(subject_test,y_test,X_test),cbind(subject_train,y_train,X_train))

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
data <- data[,c(1,2,grep("-std\\(|-mean\\(" , names(data)))]

# 3. Uses descriptive activity names to name the activities in the data set
data[["Activity"]] <- activity_labels[ match(data[["Activity"]], activity_labels[[1]] ) ,2]

# 4. Appropriately labels the data set with descriptive variable names. 
names(data)<-gsub("^t", "Time", names(data))
names(data)<-gsub("^f", "Frequency", names(data))
names(data)<-gsub("Acc", "Accelerometer", names(data))
names(data)<-gsub("Gyro", "Gyroscope", names(data))
names(data)<-gsub("Mag", "Magnitude", names(data))
names(data)<-gsub("BodyBody", "Body", names(data))
names(data)<-gsub("mean\\(\\)", "Mean", names(data))
names(data)<-gsub("std\\(\\)", "StandardDeviation", names(data))
names(data)<-gsub("-", "", names(data))

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(reshape2)
output <- dcast( melt(data, c("Subjects", "Activity")), Subjects + Activity ~ variable, mean)

write.table(output, file = "TidyData.txt",row.name=FALSE)
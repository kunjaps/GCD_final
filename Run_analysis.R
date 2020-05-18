# final assignment script

# Here, we are reading the different data from the files
features <- read.table("/Users/vrsreeganesh/Project_data/features.txt", col.names = c("n","functions"))
activities <- read.table("/Users/vrsreeganesh/Project_data/activity_labels.txt", col.names = c("code","activity"))
subject_test <- read.table("/Users/vrsreeganesh/Project_data/test/subject_test.txt", col.names = "subject")
x_test <- read.table("/Users/vrsreeganesh/Project_data/test/X_test.txt", col.names = features$functions)
y_test <- read.table("/Users/vrsreeganesh/Project_data/test/y_test.txt", col.names = "code")
subject_train <- read.table("/Users/vrsreeganesh/Project_data/train/subject_train.txt", col.names = "subject")
x_train <- read.table("/Users/vrsreeganesh/Project_data/train/X_train.txt", col.names = features$functions)
y_train <- read.table("/Users/vrsreeganesh/Project_data/train/y_train.txt", col.names = "code")

# naming things in the right way
names(TidyData)[2] = "activity"
names(TidyData)<-gsub("Acc", "Accelerometer", names(TidyData))
names(TidyData)<-gsub("Gyro", "Gyroscope", names(TidyData))
names(TidyData)<-gsub("BodyBody", "Body", names(TidyData))
names(TidyData)<-gsub("Mag", "Magnitude", names(TidyData))
names(TidyData)<-gsub("^t", "Time", names(TidyData))
names(TidyData)<-gsub("^f", "Frequency", names(TidyData))
names(TidyData)<-gsub("tBody", "TimeBody", names(TidyData))
names(TidyData)<-gsub("-mean()", "Mean", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("-std()", "STD", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("-freq()", "Frequency", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("angle", "Angle", names(TidyData))
names(TidyData)<-gsub("gravity", "Gravity", names(TidyData))

# independant tidy dataset with average of each variable
FinalData <- TidyData %>% group_by(subject, activity) %>% summarise_all(funs(mean))
write.table(FinalData, "/Users/vrsreeganesh/Desktop/FinalData.txt", row.name=FALSE)

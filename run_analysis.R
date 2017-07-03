
# download data file 
url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
filename = file.path(WD,"dataset.zip")
download.file(url, filename, mode = "wb")

# extract data
unzip(filename)

# change working directory to unzipped data folder
setwd("./UCI HAR Dataset")

##
#1. Merge the training and the test sets to create one data set.
##

# Load x,y,subjects for test and training data
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
test_subjects <- read.table("test/subject_test.txt")
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
train_subjects <- read.table("train/subject_train.txt")

# Merge x,y,subjects for test/train 
y_data <- rbind(y_test,y_train)
x_data <- rbind(x_test,x_train)
subjects <- rbind(test_subjects,train_subjects)

##
#2. Extract only the measurements on the mean and standard deviation for each measurement.
##

# get feature names
features <- read.table("features.txt")

# assign names to merged data
names(x_data) <- features[,2]

# build filter containing features with mean or std in the name
mean_std_filter <- grepl("mean()|std()",names(x_data))

# use filter to subset data
mean_std_features <- x_data[,mean_std_filter]

##
#3. Use descriptive activity names to name the activities in the data set
##

# get the activity labels
activity_labels <- read.table("activity_labels.txt",
                              col.names=c("activity_id","activity_name"))

# name y_data id to prepare for join
names(y_data) <- "activity_id"

# add activity labels to y_data and remove superfluous id
y_data <- left_join(y_data,activity_labels,by="activity_id")[,2]

#
#4. Appropriately label the data set with descriptive variable names.
#

# name subject id something a bit more descriptive and change it to a factor
names(subjects) <- "Subject"
subjects$Subject <- as.factor(subjects$Subject)

#bind subjects, Activity, and readings datasets together in tidy data frame
first_data_set <- cbind(Subject = subjects, Activity = y_data, mean_std_features)

#
#5. From the data set in step 4, create a second, independent tidy data set with the average 
# of each variable for each activity and each subject.
#

# group first data set by the subject and activity then calculate the mean/average for each feature
second_data_set <- first_data_set %>% 
  group_by(Subject,Activity) %>%
  summarize_each(funs(mean))

# change back to script directory
setwd("..") 
# write file
write.csv(second_data_set,"tidy_dataset.csv",row.names=FALSE)



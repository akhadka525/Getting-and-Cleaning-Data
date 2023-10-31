## Load the necessary libraries. 
## If not installed, install and load these libraries

packages <- c("data.table", "dplyr")
installed_packages <- packages %in% rownames(installed.packages())
if (any(installed_packages == FALSE)) {
        install.packages(packages[!installed_packages])
}
invisible(lapply(packages, library, character.only = TRUE))

## Load the data for the project work
dir_path <- getwd() ## Get the path of the current/working directory
data_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url = data_url, file.path(dir_path, "UCI_HAR.zip"))
unzip(zipfile = "UCI_HAR.zip")


# Read and merge the training and test data

combined_data <- rbind(
        fread(file.path(dir_path, "UCI HAR Dataset/train/X_train.txt")),
        fread(file.path(dir_path, "UCI HAR Dataset/test/X_test.txt"))
)


# Extract the data features to set column names

features <- fread(file.path(dir_path, "UCI HAR Dataset/features.txt"),
                  col.names = c("index", "featureNames"))
head(features,10) ## Check for first 10 features

## Extract only features on the mean and standard deviation for each measurement.

required_features <- grep("(mean|std)\\(\\)", features[, featureNames])
required_featuresNames <- gsub("[()]", "", 
                               features[required_features, featureNames])

## Extract measurement on the mean and standard deviation for each measurement.
named_data <- combined_data[, ..required_features]
data.table::setnames(named_data, colnames(named_data), required_featuresNames)


## Read the activity labels and subjects numbers from the text file and 
## append to data set

activityLabels <- fread(file.path(dir_path, "UCI HAR Dataset/activity_labels.txt"),
                        col.names = c("index", "activityName"))

trainActivities <- fread(file.path(dir_path, "UCI HAR Dataset/train/y_train.txt"),
                         col.names = c("Activity"))
trainSubjectNo <- fread(file.path(dir_path, "UCI HAR Dataset/train/subject_train.txt"),
                        col.names = c("SubjectNumber"))

testActivities <- fread(file.path(dir_path, "UCI HAR Dataset/test/y_test.txt"),
                        col.names = c("Activity"))
testSubjectNo <- fread(file.path(dir_path, "UCI HAR Dataset/test/subject_test.txt"),
                       col.names = c("SubjectNumber"))

combined_Activity_SubNo <- rbind(
        cbind(trainSubjectNo, trainActivities),
        cbind(testSubjectNo, testActivities)
)


## Combine the SubjectNumber and Activities with dataframe created

tidy_data <- cbind(combined_Activity_SubNo, named_data)


## Label the data for activity number with activity names
tidy_data$Activity <- factor(tidy_data$Activity,
                             levels = activityLabels$index,
                             labels = activityLabels$activityName)


# Group the data  for each activity and subject and calculate the average

## Check whether the SubjectNumber variable is factor

tidy_data$SubjectNumber <- as.factor(tidy_data$SubjectNumber)

## Now group data by SubjectNumber and Activity and calculate average

averaged_data <- tidy_data %>%
        group_by(SubjectNumber, Activity) %>%
        summarise_all(list(mean = ~ mean(., na.rm = TRUE)))
names(averaged_data) <- sub("_mean$", "", names(averaged_data))
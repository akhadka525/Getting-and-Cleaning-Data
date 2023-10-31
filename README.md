# Peer-graded Assignment: Getting and Cleaning Data Course Project
This repository contain a R Script to prepare a tidy data from the given dataset.

# Description:
This repository contains a R Analysis Script [run_analysis.R] that prepares a tidy data using the data collected from the accelerometers from the Samsung Galaxy S Smartphone. The full description of the data can be obtained from [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). The dataset used in this project can be downloaded from the link [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

The R script [run_analysis.R] works in the following order:
- Download the data from the site [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and load into R studio for analysis.
- Merges the training and test data sets to create the single data set.
- Extract only the data on measurements on the mean and standard deviation for each measurement.
- Descriptive activity names are used to name the activities in the data set.
- Data set is appropriately labelled with the descriptive variable names.
- Another new data set is created with the average of each variable for each activity and subject.

For more information on data, variables and transformations performed to clean up the data refer [CodeBook.md]

#Executing Code
Clone this repository or copy the code run_analysis.R to R console and run the code.

#Author:
Anil Kumar Khadka


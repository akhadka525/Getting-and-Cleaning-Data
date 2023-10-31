# Peer-graded Assignment: Getting and Cleaning Data Course Project

## Description:
Additional information on data, variables, and transformations used/performed in R script [run_analysis.R] to clean up the collected data and prepare the tidy data.

## Data Source:
The data set used in this analysis and its description can be found in:
- Data Set: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
- Data Description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## About Data Set:
The datset used is teh Human Activity Recognition Using Smartphones Dataset Version 1.0. This dataset contains the experiments carried out with a group of 30 volunteers within the age group 19-48 years. During the experiment each person performed six activities namely, Walking, Walking upstairs, Walking downstairs, Sitting, Standing and Lying wearing a smartphone (Samsung Galaxy S II) on the waist. The embedded accelerometer and gyroscope were used to record 3-axial linear acceleration and 3-axial angular velocity at constant rate of 50 Hz. The experiments were video recorded and labelled manually. The obtained dataset has been randomly partitioned into two sets: training data which contains 70% of the volunteers and remaining 30% test data.

Noise filtetrs were applied to preprocess the sensor signals and then sampled in fixed-width sliding windos of 2.56 seconds and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

## What data set includes?
- README.txt: Provides brief description of the data set
- activity_labels.txt: Links the class labels with activity name
- feature_info.txt: Information about variables used on feature vector
- feature.txt: List of all features
- train/X_train.txt: Training set
- train/y_train.txt: Training labels
- test/X_test.txt: Test set.
- test/y_test.txt: Test labels.
- train(test)/subject_train(test).txt: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
- train(test)/Inertial Signals/total_acc_x_train(test).txt: The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train(test).txt' and 'total_acc_z_train(test).txt' files for the Y and Z axis. 
- train(test)/Inertial Signals/body_acc_x_train(test).txt: The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
- train(test)/Inertial Signals/body_gyro_x_train(test).txt: The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

## What each data represents in [run_analysis.R]
- combined_data: Merged data set of training and test sets
- tidy data: combined data set well labelled with descriptive variable names
- averaged_data: Tidy data set formed by averaging each variable for each activity and each subject
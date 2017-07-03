# Getting and Cleaning Data - Final Project

### The final project for [Getting and Cleaning Data](https://www.coursera.org/course/getdata) involves getting, cleaning, and analyzing a ["sample dataset"](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) of gyroscopic readings from smartphone users. The data has been seperated in to test and train sets with feature names and other useful data spread across multiple files. Our objective is to convert the data to a more analysis-friendly structure and obtain some summary metrics by creating an R script which performs the following tasks:

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names.
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and  each subject.

### Files in this repo:
* README.md - explanation of this repo (you are reading this right now)
* codebook.md - code book detailing the dataset and script 
* run_analysis.R - R script to retrieve and process data
* tidy_dataset.txt - tidy output satisfying project requirements

### Requirements:
* R
* data-table
* Internet access

### Usage:
* Set R working directory to script location
* Execute run_analysis.R
## Getting And Cleaning Data Course Project

This repo contains submission materials for the Getting and Cleaning Data Course Project run by JHU on Coursera.


## Repo contents:

This repo contains the following files:

README.md  - this file.

run_analysis.R  - the script file required to run the analysis outlined below.

CodeBook.MD  - a code book describing the raw data products, and how they are transformed into a tidy data set that meet the requirements of the project description (outlined below). 


# Project description

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

*<b> Raw data description </b> <a href="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones"> Human Activity Recognition Using Smartphones </a>

<b> Raw data: </b> <a href="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"> UCI HAR Dataset.zip </a>

You should create one R script called run_analysis.R that does the following. 

1.    Merges the training and the test sets to create one data set.
2.    Extracts only the measurements on the mean and standard deviation for each measurement. 
3.    Uses descriptive activity names to name the activities in the data set
4.    Appropriately labels the data set with descriptive variable names. 
5.    From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## To generate the tidy data set

1. Download the run_analysis.R script and put it in your working directory. 
2. Make sure the folder "UCI HAR Dataset" is in your working directory.
3. To run the script use the following command:
   > source ("run_analysis.R")
4. The code will output the file "tidy.txt" in your working directory that contains the desired tidy data set. 

The code book CodeBook.md describing the inner workings of the code is contained within this repo. 


## Notes:

The run_analysis script relies on the R package "plyr" being installed.

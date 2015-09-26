# Getting and Cleaning Data
## Project assingment 1

The purpose of this project is to prepare tidy data that can be used for later analysis. In brief it contains:
 
 - a tidy data set (`dataset`) as described below,
 - a simple analysis (`groupedMeans`) as described below,
 - a code book that describes the variables, the data, and any transformations performed to clean up the data [CodeBook.md](CodeBook.md).
 
One of the most exciting areas in all of data science right now is wearable computing - see for example [this article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/).
Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users.
The data linked below represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Here are the data for the project: 

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

These data are not replicated in this repo. You should download the above file and unzip it in the same working directory of this project. 
It is also intended that you preserve the directory structure of the unzipped files. See the [CodeBook](CodeBook.md) for more details about where the relevant 
raw data files should be.


This project consists of a script `run_analysis.R` written in R which will produce the following data:

 - `dataset` containing data ready for analysis and described in the [CodeBook](CodeBook.md)
 - `groupedMeans` containing a simple analysis on the above `dataset`.

The script will also produce a file named `groupedMeans.txt` containing a txt export of the above analysis.

Refer to the [CodeBook](CodeBook.md) for details about the process by which dataset is built, and the meaning of the data it contains.

## Dataset

Contains only the subset of gyro and accelerometer features referring to **mean** (`mean`) or **standard deviations** (`std`) measured in the original experiment (i.e.: reported in the `X_*` files), along with the corresponding activity name and subject. Training and test data are merged giving data for all 30 subjects.

## groupedMeans

Reports the **average** of each variable in the dataset for each activity and each subject. Measurement names are the same as for the dataset.
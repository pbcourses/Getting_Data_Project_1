# Human Activity Recognition Using Smartphones Data Set

The data linked below represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 
An in depth description of the raw data is available at the site where the data was obtained: 

[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

At the above link you will also find technical descriptions about how the data was collected.

Here is a brief introduction about how data was collected:

> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, 
> WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and 
> gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the > data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 
> 30% the test data. 
>
> The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% 
> overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass 
> filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff 
> frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.



**Here are the data for the project:** 

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

These data are not replicated in this repo. You should download the above file and unzip it in the same working directory of this project.
See below for where the relevant raw data files should be.

The project consists of a single R script `run_analysis.R` which will produce the following data:

### Data

 - `dataset`: A dataset ready for analysis. It contains _subject_, _activity\_name_ and the measurements on the **mean** and **standard deviation** for each original experiment measurement. It also merges the training and the test sets from the original experiment.
 - `groupedMeans`: A simple analysis containing the mean of all features from the `dataset` grouped by _activity\_name_ and _subject_.
 

 ## Dataset features
 
  - subject: the id of the subject 1 through 30
  - activity\_name: WALKING, WALKING\_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
 
 All measurement features are renamed for a convenient use with R. From the original name single or multiple `(`, `)`, `,` or `-`, become a single `_`. Below the dataset feature name and the correspondent name found in the original experiment data source. Only features containing _mean_ or _std_ between two `_`, are selected from the transformed feature names.
 
| Feature Name  | Source feature Name |
| :------------ |:---------------|
| tBodyAcc_mean_X | tBodyAcc-mean()-X |
| tBodyAcc_mean_Y | tBodyAcc-mean()-Y |
| tBodyAcc_mean_Z | tBodyAcc-mean()-Z |
| tBodyAcc_std_X | tBodyAcc-std()-X |
| tBodyAcc_std_Y | tBodyAcc-std()-Y |
| tBodyAcc_std_Z | tBodyAcc-std()-Z |
| tGravityAcc_mean_X | tGravityAcc-mean()-X |
| tGravityAcc_mean_Y | tGravityAcc-mean()-Y |
| tGravityAcc_mean_Z | tGravityAcc-mean()-Z |
| tGravityAcc_std_X | tGravityAcc-std()-X |
| tGravityAcc_std_Y | tGravityAcc-std()-Y |
| tGravityAcc_std_Z | tGravityAcc-std()-Z |
| tBodyAccJerk_mean_X | tBodyAccJerk-mean()-X |
| tBodyAccJerk_mean_Y | tBodyAccJerk-mean()-Y |
| tBodyAccJerk_mean_Z | tBodyAccJerk-mean()-Z |
| tBodyAccJerk_std_X | tBodyAccJerk-std()-X |
| tBodyAccJerk_std_Y | tBodyAccJerk-std()-Y |
| tBodyAccJerk_std_Z | tBodyAccJerk-std()-Z |
| tBodyGyro_mean_X | tBodyGyro-mean()-X |
| tBodyGyro_mean_Y | tBodyGyro-mean()-Y |
| tBodyGyro_mean_Z | tBodyGyro-mean()-Z |
| tBodyGyro_std_X | tBodyGyro-std()-X |
| tBodyGyro_std_Y | tBodyGyro-std()-Y |
| tBodyGyro_std_Z | tBodyGyro-std()-Z |
| tBodyGyroJerk_mean_X | tBodyGyroJerk-mean()-X |
| tBodyGyroJerk_mean_Y | tBodyGyroJerk-mean()-Y |
| tBodyGyroJerk_mean_Z | tBodyGyroJerk-mean()-Z |
| tBodyGyroJerk_std_X | tBodyGyroJerk-std()-X |
| tBodyGyroJerk_std_Y | tBodyGyroJerk-std()-Y |
| tBodyGyroJerk_std_Z | tBodyGyroJerk-std()-Z |
| tBodyAccMag_mean_ | tBodyAccMag-mean() |
| tBodyAccMag_std_ | tBodyAccMag-std() |
| tGravityAccMag_mean_ | tGravityAccMag-mean() |
| tGravityAccMag_std_ | tGravityAccMag-std() |
| tBodyAccJerkMag_mean_ | tBodyAccJerkMag-mean() |
| tBodyAccJerkMag_std_ | tBodyAccJerkMag-std() |
| tBodyGyroMag_mean_ | tBodyGyroMag-mean() |
| tBodyGyroMag_std_ | tBodyGyroMag-std() |
| tBodyGyroJerkMag_mean_ | tBodyGyroJerkMag-mean() |
| tBodyGyroJerkMag_std_ | tBodyGyroJerkMag-std() |
| fBodyAcc_mean_X | fBodyAcc-mean()-X |
| fBodyAcc_mean_Y | fBodyAcc-mean()-Y |
| fBodyAcc_mean_Z | fBodyAcc-mean()-Z |
| fBodyAcc_std_X | fBodyAcc-std()-X |
| fBodyAcc_std_Y | fBodyAcc-std()-Y |
| fBodyAcc_std_Z | fBodyAcc-std()-Z |
| fBodyAcc_meanFreq_X | fBodyAcc-meanFreq()-X |
| fBodyAcc_meanFreq_Y | fBodyAcc-meanFreq()-Y |
| fBodyAcc_meanFreq_Z | fBodyAcc-meanFreq()-Z |
| fBodyAccJerk_mean_X | fBodyAccJerk-mean()-X |
| fBodyAccJerk_mean_Y | fBodyAccJerk-mean()-Y |
| fBodyAccJerk_mean_Z | fBodyAccJerk-mean()-Z |
| fBodyAccJerk_std_X | fBodyAccJerk-std()-X |
| fBodyAccJerk_std_Y | fBodyAccJerk-std()-Y |
| fBodyAccJerk_std_Z | fBodyAccJerk-std()-Z |
| fBodyAccJerk_meanFreq_X | fBodyAccJerk-meanFreq()-X |
| fBodyAccJerk_meanFreq_Y | fBodyAccJerk-meanFreq()-Y |
| fBodyAccJerk_meanFreq_Z | fBodyAccJerk-meanFreq()-Z |
| fBodyGyro_mean_X | fBodyGyro-mean()-X |
| fBodyGyro_mean_Y | fBodyGyro-mean()-Y |
| fBodyGyro_mean_Z | fBodyGyro-mean()-Z |
| fBodyGyro_std_X | fBodyGyro-std()-X |
| fBodyGyro_std_Y | fBodyGyro-std()-Y |
| fBodyGyro_std_Z | fBodyGyro-std()-Z |
| fBodyGyro_meanFreq_X | fBodyGyro-meanFreq()-X |
| fBodyGyro_meanFreq_Y | fBodyGyro-meanFreq()-Y |
| fBodyGyro_meanFreq_Z | fBodyGyro-meanFreq()-Z |
| fBodyAccMag_mean_ | fBodyAccMag-mean() |
| fBodyAccMag_std_ | fBodyAccMag-std() |
| fBodyAccMag_meanFreq_ | fBodyAccMag-meanFreq() |
| fBodyBodyAccJerkMag_mean_ | fBodyBodyAccJerkMag-mean() |
| fBodyBodyAccJerkMag_std_ | fBodyBodyAccJerkMag-std() |
| fBodyBodyAccJerkMag_meanFreq_ | fBodyBodyAccJerkMag-meanFreq() |
| fBodyBodyGyroMag_mean_ | fBodyBodyGyroMag-mean() |
| fBodyBodyGyroMag_std_ | fBodyBodyGyroMag-std() |
| fBodyBodyGyroMag_meanFreq_ | fBodyBodyGyroMag-meanFreq() |
| fBodyBodyGyroJerkMag_mean_ | fBodyBodyGyroJerkMag-mean() |
| fBodyBodyGyroJerkMag_std_ | fBodyBodyGyroJerkMag-std() |
| fBodyBodyGyroJerkMag_meanFreq_ | fBodyBodyGyroJerkMag-meanFreq() |
| angle_tBodyAccMean_gravity_ | angle(tBodyAccMean,gravity) |
| angle_tBodyAccJerkMean_gravityMean_ | angle(tBodyAccJerkMean),gravityMean) |
| angle_tBodyGyroMean_gravityMean_ | angle(tBodyGyroMean,gravityMean) |
| angle_tBodyGyroJerkMean_gravityMean_ | angle(tBodyGyroJerkMean,gravityMean) |
| angle_X_gravityMean_ | angle(X,gravityMean) |
| angle_Y_gravityMean_ | angle(Y,gravityMean) |
| angle_Z_gravityMean_ | angle(Z,gravityMean) |


## Files disposition

The original source data files should be unzipped in the working directory obtaining the `./UCI HAR Dataset` directory. This directory name is the `baseDataSourceDir` variable. If source data is unzipped in a different directory, `baseDataSourceDir` should be changed accordingly.

Under the above directory there should be:

 - `features.txt`: containing the source features name for the measurements
 - `activity_labels.txt`: containing the activity names and the corresponding id used in the original source files
 - `test`: a directory containing data for testing
    - `subject_test.txt`: subject id for each measurement
    - `X_test.txt`: measured features
    - `y_text.txt`: activity relative to the measures
 - `train`: a directory containing data for training
    - `subject_train.txt`: subject id for each measurement
    - `X_train.txt`: measured features
    - `y_train.txt`: activity relative to the measures
    
 ## Transformations
 
 1. feature names are read from `features.txt` and changed as described in Dataset features.
 2. activity names and ids are read from `activity_labels.txt`
 3. training and test data are read as described below and then binded by rows in a single dataset
    1. read `subject_*` 
    2. read `X_*` and then select only features containing `mean` or `std` between two `_` 
    3. read `y_*` for the activity ids, join ids with the correspondent activity names and select only the names
    4. bind by columns subject, activity_name and the selected measure features
    
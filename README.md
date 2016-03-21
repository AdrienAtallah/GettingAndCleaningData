#Coursera: getting and cleaning data course project
by: Adrien Atallah

###Background:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

More information, visit the UCI Machine Learning Repository: [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#)


###Set up:

1. Download 'UCI HAR Dataset' available [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

2. extract the folder 'UCI HAR Dataset' into your working directory in R 

3. run 'run_alysis.R' 

###Analysis files:

'run_analysis.R'  reads in the raw data files contained in the 'UCI HAR Datset' as well as descriptor files.  It then extracts only the mean and standard deviation measurements, reorders a new data frame involving both the test and training subjects that is ordered by activity and subject.  this is written to a file 'test_training-Mean_SD.csv'.  The script also calculates the means of each measurement by activity and subject and writes the data to 'Means_by_Subject-Activity.csv'



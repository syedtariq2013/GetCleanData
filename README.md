
# Coursera Project based on:

Human Activity Recognition Using Smartphones Dataset
Version 1.0

## Original Project Contributors:
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit? degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

### From the Readme.txt of the original project

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 


### Objectives of Coursera Project

Created one R script called run_analysis.R that does the following. 

1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement. 

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive activity names. 

5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

### Design of run_analysis.R

1. All file directories are relative to 'UCI HAR Dataset' main directory. 

2. The 2 main sub-directories are train and test which contain the data files: 
  * <b>X_train.txt</b> and <b>X_test.txt</b> (measurement data)
  * <b>y_test.txt</b> and <b>y_train.txt</b> (activity codes)
  * <b>subject_test.txt</b> and <b>subject_train.txt</b> (IDs of the volunteers)
  * <b>activity_labels.txt</b> in the main directory (labels corresponding to the activity codes)
  * <b>features.txt</b> contains the descriptions of each column of the measurement data. The file <b>names.txt</b> is modifed version of features.txt
  * <b>meanStd.txt</b> (created for this project) contains the descriptions of columns that will go in the 'tidy' data frame. It is a subset of names.txt.
  * <b>codebook.md</b> contains 
  
3. Read each of the files into their respective data frames

4. Add activity codes and subject ids to the data frames as columns

5. Replace the activity codes with the activity labels

6. Combine each of the train and test sets into a single data frame (final data frame)

7. File names.txt is derived from features.txt and contains the column names to be used in the final data frame. Names in features.txt are not very R-friendly. All hyphens, parenthesis were replaced by periods. (Although, mixed-case and periods are not considered standard, they were retained to keep the names readable).

8. Using 'melt' the data frame is re-shaped so the subject and activity label codes are first and the data frame is sorted with the subject and activity labels as keys.

9. Using dcast and mean the averages are calculated for each subject-activity aggregate.

10. This yeilds a tidy data frame


						CODE BOOK - DATA DICTIONARY 
						
Column Index and Headers
--------------------------------------------------------------------------------------------------------------------	
	1 - ' Subject'			- Identifies the subject measured during the study.  A total of 30 Subjects found in both data sets.
							- 
			'Test_Data'		- Nine (9) participants in Test Study
			  '2'
			  '4'
			  '9'
			  '10'
			  '12'
			  '13'
			  '18'
			  '20'
			  '24'
			'Train_Data'	- Twenty One (21) participants in Training Study
			  '1'
			  '3'
			  '5'
			  '6'
			  '7'
			  '8'
			  '11'
			  '14'
			  '15'
			  '16'
			  '17'
			  '19'
			  '21'
			  '22'
			  '23'
			  '25'
			  '26'
			  '27'
			  '28'
			  '29'
			  '30'

	2 - 'Activity' - Six Activities were measured with the following Activity Labels.  The original Source Data Set used numbers 1 to 6 only
					- Translation was required for each numeric value.
			1 - 'WALKING'
			2 - 'WALKING_UPSTAIRS'
			3 - 'WALKING_DOWNSTAIRS'
			4 - 'SITTING'
			5 - 'STANDING'
			6 - 'LAYING'
	
	69 - 'Data_Source'		- Identifies the Source of the data.  Two data sets were  part of the study, Test and Train.
							- This column is NOT required in the analysis, but provides an audit point to determine which data set the values are from.
				'Test_Data'
				'Train_Data'
		

	Standard Deviation Columns 
			- As per the study requirements, data points within the original sets were extracted if they reported the standard deviation.
	6 - 'tBodyAcc-std()-X'
	7 - 'tBodyAcc-std()-Y'
	8 - 'tBodyAcc-std()-Z'
	12 - 'tGravityAcc-std()-X'
	13 - 'tGravityAcc-std()-Y'
	14 - 'tGravityAcc-std()-Z'
	18 - 'tBodyAccJerk-std()-X'
	19 - 'tBodyAccJerk-std()-Y'
	20 - 'tBodyAccJerk-std()-Z'
	24 - 'tBodyGyro-std()-X'
	25 - 'tBodyGyro-std()-Y'
	26 - 'tBodyGyro-std()-Z'
	30 - 'tBodyGyroJerk-std()-X'
	31 - 'tBodyGyroJerk-std()-Y'
	32 - 'tBodyGyroJerk-std()-Z'
	34 - 'tBodyAccMag-std()'
	36 - 'tGravityAccMag-std()'
	38 - 'tBodyAccJerkMag-std()'
	40 - 'tBodyGyroMag-std()'
	42 - 'tBodyGyroJerkMag-std()'
	46 - 'fBodyAcc-std()-X'
	47 - 'fBodyAcc-std()-Y'
	48 - 'fBodyAcc-std()-Z'
	52 - 'fBodyAccJerk-std()-X'
	53 - 'fBodyAccJerk-std()-Y'
	54 - 'fBodyAccJerk-std()-Z'
	58 - 'fBodyGyro-std()-X'
	59 - 'fBodyGyro-std()-Y'
	60 - 'fBodyGyro-std()-Z'
	62 - 'fBodyAccMag-std()'
	64 - 'fBodyBodyAccJerkMag-std()'
	66 - 'fBodyBodyGyroMag-std()'
	68 - 'fBodyBodyGyroJerkMag-std()'
	
	Mean Data Columns 
			- As per the study requirements, data points within the original sets were extracted if they reported the mean.	
	
	3 - 'tBodyAcc-mean()-X'
	4 - 'tBodyAcc-mean()-Y'
	5 - 'tBodyAcc-mean()-Z'
	9 - 'tGravityAcc-mean()-X'
	10 - 'tGravityAcc-mean()-Y'
	11 - 'tGravityAcc-mean()-Z'
	15 - 'tBodyAccJerk-mean()-X'
	16 - 'tBodyAccJerk-mean()-Y'
	17 - 'tBodyAccJerk-mean()-Z'
	21 - 'tBodyGyro-mean()-X'
	22 - 'tBodyGyro-mean()-Y'
	23 - 'tBodyGyro-mean()-Z'
	27 - 'tBodyGyroJerk-mean()-X'
	28 - 'tBodyGyroJerk-mean()-Y'
	29 - 'tBodyGyroJerk-mean()-Z'
	33 - 'tBodyAccMag-mean()'
	35 - 'tGravityAccMag-mean()'
	37 - 'tBodyAccJerkMag-mean()'
	39 - 'tBodyGyroMag-mean()'
	41 - 'tBodyGyroJerkMag-mean()'
	43 - 'fBodyAcc-mean()-X'
	44 - 'fBodyAcc-mean()-Y'
	45 - 'fBodyAcc-mean()-Z'
	49 - 'fBodyAccJerk-mean()-X'
	50 - 'fBodyAccJerk-mean()-Y'
	51 - 'fBodyAccJerk-mean()-Z'
	55 - 'fBodyGyro-mean()-X'
	56 - 'fBodyGyro-mean()-Y'
	57 - 'fBodyGyro-mean()-Z'
	61 - 'fBodyAccMag-mean()'
	63 - 'fBodyBodyAccJerkMag-mean()'
	65 - 'fBodyBodyGyroMag-mean()'
	67 - 'fBodyBodyGyroJerkMag-mean()'



Data
-------------------------------------------------------------------------------------------------------------------	

Data Used in this study is found in several different sources:

After unzipping the file (The script does this automatically) the following files and directories are created in your working Directory:

Working Directory
			- UCI HAR Dataset
			------------------
			FILE: 'activity_labels.txt' - File contains the activities that are translated from numeric values found in datasets
			FILE: 'features.txt' - File contains the column names for each numeric measurement found in datasets
			FILE: 'features_info.txt' - NOT USED IN ANALYSIS File contains the descritpion of column names 

			- test Directory
			--------------------
			FILE: 'subject_test.txt' - File contains the subject for each row or observation found in datasets
			FILE: 'X_test.txt' - File contains the raw data with all measurements for Test Dataset.  Numeric Fixed Width Format
			FILE: 'y_test.txt - File contains the activities measured by row or observation.  Single value 1 to 6 for each row.
		
			- train Directory
			--------------------
			FILE: 'subject_train.txt' - File contains the subject for each row or observation found in datasets
			FILE: 'X_train.txt' - File contains the raw data with all measurements for Test Dataset.  Numeric Fixed Width Format
			FILE: 'y_train.txt - File contains the activities measured by row or observation.  Single value 1 to 6 for each row.


Transformations to clean up and present the data
-------------------------------------------------------------------------------------------------------------------	

In order to clean the data repeatably and make it easy to audit, the script follows specific tasks:

1. Define the Library's required - dplyr, data.table, tidyr and reshape2 - ensure you have them install in your R environment
2. Set your WD in order to start the study.  IMPORTANT: A proper working Directory is required to ensure you create a clean starting point.
3. Check if the standard working directory created by study exists - 'ProjectWork', if it does not exist, make the directory and sets the working directory
4. If the 'ProjectWork' directory didn't exist, download the dataset from 
"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip " and unzip.
5. Pull data used globally in study - Column Titles, Activity Names
6. Filter Column Names and create vector with required columns in tidy dataset (mean and std)
7. Load Test Data for X and Y
8. Split Data after its loaded into columns (Fixed Width - 16 Characters)
9. Merged the test data with subject and activity
10. Rename data.frame names to provide the appropriate labels
11. Housekeeping to remove data.frames no longer used
12. Repeat from Step 7 for Train Data
13. Merge the consolidated test and train data
14. Subset to using the Filtered Column Names to obtain the required columns.
15. Convert Measurement columns into numeric in order to perform math.
16. Convert data to 'long' format using melt
17. Tidy up the data by subject and activity to calculate the means
18. Housekeeping to remove data.frames no longer used
18. Save the output to .txt file without quotes and a blank delimited format
# R-Cleaning-Data-Samsung-Activity-Recog <h1> tag
##  Repository for Cleaning Data Coursera Project  <h2> tag

## This repository contains R script that does the following: <h2> tag
       1 Merges the training and the test sets to create one data set.
          (Source Data found at: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
       2 Extracts only the measurements on the mean and standard deviation for each measurement. 
       3 Uses descriptive activity names to name the activities in the data set
       4 Appropriately labels the data set with descriptive variable names. 
       5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each               activity and each subject.
       
## Project Description: <h2> tag
       One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

    http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 


##In order to clean the data repeatably and make it easy to audit, the script follows specific tasks: <h2> tag

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
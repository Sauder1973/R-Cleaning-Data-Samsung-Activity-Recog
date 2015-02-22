

# run_analysis.R

#  Written By: W. Sauder Feb 19 2015
#  R script that does the following: 
#       1 Merges the training and the test sets to create one data set.
#       2 Extracts only the measurements on the mean and standard deviation for each measurement. 
#       3 Uses descriptive activity names to name the activities in the data set
#       4 Appropriately labels the data set with descriptive variable names. 
#       5 From the data set in step 4, creates a second, independent tidy data 
#               set with the average of each variable for each activity and each subject.


library(dplyr)
library(data.table)
library(tidyr)
library(reshape2)



# PREWORK: Download File and UnZip to Current Working Directory
#-------------------------------------------------------------------------------------------------------------

#Replace current location to set working directory for the study.

#setwd("C:\\Users\\Wes\\Documents\\RWorkingDirectory\\CleaningData\\")
#getwd()

# If Study Directory does not exist - considers this a first time run and will create a directory for the 
#       study as well as download the zip file from the site and unzip creating the required directory structure.
if (!file.exists("ProjectWork"))
{ dir.create("ProjectWork")
  getwd()
  zipFile <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
  download.file(zipFile,"ProjectDataset.zip", mode="wb")
  unzip("ProjectDataset.zip")
}

setwd(".\\ProjectWork\\")
getwd()

setwd(".\\UCI HAR Dataset\\")
getwd()
testDir <- ".\\test"
trainDir <- ".\\train\\"



#Obtain Titles of The Files
#--------------------------------------------------------------------------------------------------------------

con <- file("features.txt")
open(con)
titles <- read.table(con, header = FALSE)
        #Obsolete        
        #x <- scan(con,what = "character", strip.white = FALSE, skip=0 ,nlines=10,  quiet = TRUE, flush = TRUE, multi.line = TRUE );
        #titles <- setNames(titles, c("TitleNum", "Parameter"))
close(con)


CompleteTitles <- as.vector(titles$V2)  #Use this to Label Raw Data


#Determine Columns that are acceptable to use for the tidy data set
#--------------------------------------------------------------------------------------------------------------


ValidColumns <- filter(titles, grepl('mean()|std()',V2))

ValidColumns <- filter(ValidColumns, !grepl('meanFreq()',V2))
ValidColumns <- as.vector(ValidColumns$V2)



ValidColumns <- c("Measured_Subject", "Y_Desc_List",ValidColumns,"Data_Source")


#Obtain Activities List
#--------------------------------------------------------------------------------------------------------------

con <- file("activity_labels.txt")
open(con)
activities <- read.table(con, header = FALSE)
StudyActivities <- as.vector(activities$V2)  #Use this as Filter if required
close(con)


#Load Data from Test Data set into data.frame
#--------------------------------------------------------------------------------------------------------------
setwd(testDir)
getwd()

#Load Data from Test Data Y set into data.frame
#------------------------------------------------

currFile <- "Y_test.txt"
con <- file(currFile)
open(con)

Y_Data <- read.table(con, header = FALSE)
Y_DataActionList <- as.vector(Y_Data$V1)
close(con)
#Convert Y Data Numeric Values to Descriptors
Y_Desc_List <- StudyActivities[as.factor(Y_DataActionList)]


#Load Data from Test Data X set into data.frame
#------------------------------------------------

currFile <- "X_test.txt"
con <- file(currFile)
open(con)
cols <-c(1:560)*16

#X_Data_Test <- fread(currFile, header = FALSE, sep="\n")
X_Data_Test <- fread(currFile, header = FALSE, sep="\n")
close(con)

X_Data_TestSplit <- separate(X_Data_Test, V1, titles$V2, sep=cols,remove = TRUE,colClasses = "numeric")

Data_Source <- rep("Test_Data",2947)

#Load Data from Test Data subject_test into data.frame
#------------------------------------------------

currFile <- "subject_test.txt"
con <- file(currFile)
open(con)

Subject <-  fread(currFile, header = FALSE, sep="\n")
close(con)

# do not clear - this is master for the next step!
#----------------------------------------------------------------------------------------------------
MasterTestData <- cbind(Subject,Y_Desc_List,X_Data_TestSplit,Data_Source)

#housekeeping - clear Data.frames no longer used:
        X_Data_Test <- NULL
        X_Data_TestSplit <- NULL
        Y_Data <- NULL
        Y_DataActionList = NULL


#USE BELOW CODE TO VALIDATE 
#test output - WRITE TEST DATA TO FILE
#write.table(X_Data_Test,"X_Data_Test.csv", sep = ",", row.names = FALSE)
#write.table(X_Data_TestSplit,"X_Data_TestSplit.csv", sep = ",", row.names = FALSE)
#write.table(MasterTestData,"MasterTestDataSample.csv", sep = ",", row.names = FALSE)
#--------------------------------------------------------------------------


#Load Data from Train Data set into data.frame
#--------------------------------------------------------------------------------------------------------------

setwd("..\\")
getwd()

setwd(trainDir)
getwd()


#Load Data from Train Data Y set into data.frame
#------------------------------------------------
currFile <- "y_train.txt"
con <- file(currFile)
open(con)

Y_Data <- read.table(con, header = FALSE)
close(con)
Y_DataActionList <- as.vector(Y_Data$V1)

#Convert Y Data Numeric Values to Descriptors
Y_Desc_List <- StudyActivities[as.factor(Y_DataActionList)]

#Load Data from Train Data X set into data.frame
#------------------------------------------------


currFile <- "X_train.txt"
con <- file(currFile)
open(con)
cols <-c(1:560)*16


X_Data_Train <- fread(currFile, header = FALSE, sep="\n")
close(con)


X_Data_TrainSplit <- separate(X_Data_Train, V1, titles$V2, sep=cols,remove = TRUE,colClasses = "numeric")






#Load Data from Train Data subject_test into data.frame
#------------------------------------------------

currFile <- "subject_train.txt"
con <- file(currFile)
open(con)

Subject <-  fread(currFile, header = FALSE, sep="\n")

close(con)
# do not clear - this is master for the next step!
#----------------------------------------------------------------------------------------------------
Data_Source <- rep("Train_Data",7352)
MasterTrainData <- cbind(Subject,Y_Desc_List,X_Data_TrainSplit,Data_Source)



# do not clear - this is master for the next step!
#MasterTrainData <- cbind(Y_Desc_List,X_Data_TrainSplit,Data_Source)

#housekeeping - clear Data.frames no longer used:
X_Data_Train <- NULL
X_Data_TrainSplit <- NULL
Y_Data <- NULL
Y_DataActionList = NULL


#Combine The Data Sets
#--------------------------------------------------------------------------------------------------------------
CompleteDF <- rbind(MasterTestData,MasterTrainData)

#Change Name of First Column to Measured_Subject
setnames(CompleteDF,"V1", "Measured_Subject")

#housekeeping - clear Data.frames no longer used:
MasterTestData <- NULL
MasterTrainData <- NULL

#Simplify the CompleteDF using Mean and Std Filter stored in ValidColumns
#--------------------------------------------------------------------------------------------------------------


Index <- CompleteDF[ ,which(names(CompleteDF) %in% ValidColumns)]

HumanActRecogData <- subset(CompleteDF, select=Index)
#Change Name of Second Column to Activity


#write.table(HumanActivityRecognitionData,"TidyDataSet_Pt1_Master.csv", sep = ",")

#housekeeping - clear Data.frames no longer used:
CompleteDF <- NULL
Subject <- NULL
titles <- NULL
activities = NULL

#Part Two - Tidy Data Set Summary
#--------------------------------------------------------------------------------------------------------------
# From the data set in step 4, creates a second, independent tidy data set with the average of 
#each variable for each activity and each subject.
#--------------------------------------------------------------------------------------------------------------
setnames(HumanActRecogData,"Y_Desc_List", "Activity")
HumanActRecogData <- HumanActRecogData[with(HumanActRecogData,order(Activity,Measured_Subject)),]


ValidColumnsCorrected <- gsub("\\(|\\)", "", ValidColumns)
ValidColumnsCorrected <- gsub("\\-", "_", ValidColumnsCorrected)
SummaryTitles <- ValidColumnsCorrected[3:68]



colnames(HumanActRecogData) <- ValidColumnsCorrected

HumanActRecogData <- subset(HumanActRecogData, select = -Data_Source)

# Set Subject as Key
setkey(HumanActRecogData,"Measured_Subject")

#Convert Character to Numeric
for (x in SummaryTitles){
        HumanActRecogData[[x]]<-as.numeric(HumanActRecogData[[x]])
        }


#Build Clean DataSet
#-----------------------------------------------------------------------------------
#Melt Data - Long Format Table - One measurement by subject and activity per line
setnames(HumanActRecogData,"Y_Desc_List", "Activity")
Melted_HARD <- melt(HumanActRecogData, id=c("Measured_Subject","Activity"), measured=SummaryTitles)

#Summarize Data - Calculate Mean for Variables Long Format Table - One measurement by subject and activity per line
Tidy_HumanActivityRecog <- ddply(Melted_HARD, c("Measured_Subject", "Activity", "variable"), summarise,
      mean = mean(value))
setnames(Tidy_HumanActivityRecog,"variable", "Measurement")

#housekeeping - clear Data.frames no longer used:
Melted_HARD <- NULL
HumanActRecogData <- NULL

#Write Tidy Data to Disk
setwd("..")
getwd()
write.table(Tidy_HumanActivityRecog,"Tidy_HumanActivityRecog.csv", sep = ",", row.names = FALSE)

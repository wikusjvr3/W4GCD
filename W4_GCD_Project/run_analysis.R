# ---------------------------------------------------------------------------
# *************************---------ooo---------*****************************
#
#                           Start of Requirement 1
#           Merges the training and the test sets to create one data set.
#
# *************************---------ooo---------*****************************
# ---------------------------------------------------------------------------



# ***************************************************************************
# Step 1: Download Zip File to Raw Data Folder and Extract contents
# ***************************************************************************

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if(!file.exists("rawdata")){dir.create("rawdata")}
if(!file.exists("rawdata/ProjectFiles.zip")){
     download.file(fileURL,"rawdata/ProjectFiles.zip","curl")
         unzip(zipfile="rawdata/ProjectFiles.zip",exdir="rawdata/")
}


# ***************************************************************************
# Check Step 1a: Show that rawdata directory was created
# ***************************************************************************

# > list.dirs(path = ".", full.names = TRUE, recursive = FALSE)
#
# [1] "./.Rproj.user" "./data"        "./rawdata"

# ***************************************************************************
# Check Step 1b: Show that download and extraction of zip file was successful
# ***************************************************************************

# > list.files(path = "rawdata/", pattern = NULL, all.files = FALSE,
# +                 full.names = FALSE, recursive = TRUE,
# +                 ignore.case = FALSE, include.dirs = FALSE, no.. = FALSE)
#
# [1] "ProjectFiles.zip"
# [2] "UCI HAR Dataset/activity_labels.txt"
# [3] "UCI HAR Dataset/features_info.txt"
# [4] "UCI HAR Dataset/features.txt"
# [5] "UCI HAR Dataset/README.txt"
# [6] "UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt"
# [7] "UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt"
# [8] "UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt"
# [9] "UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt"
# [10] "UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt"
# [11] "UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt"
# [12] "UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt"
# [13] "UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt"
# [14] "UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt"
# [15] "UCI HAR Dataset/test/subject_test.txt"
# [16] "UCI HAR Dataset/test/X_test.txt"
# [17] "UCI HAR Dataset/test/y_test.txt"
# [18] "UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt"
# [19] "UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt"
# [20] "UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt"
# [21] "UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt"
# [22] "UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt"
# [23] "UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt"
# [24] "UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt"
# [25] "UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt"
# [26] "UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt"
# [27] "UCI HAR Dataset/train/subject_train.txt"
# [28] "UCI HAR Dataset/train/X_train.txt"
# [29] "UCI HAR Dataset/train/y_train.txt"



# ******************************************************************
# Step 2: Load Test & Train Datasets into R
# ******************************************************************

install.packages("data.table")
library(data.table)
Test_subjectDF <- read.table("rawdata/UCI HAR Dataset/test/subject_test.txt")
Test_XDF <- read.table("rawdata/UCI HAR Dataset/test/X_test.txt")
Test_YDF <- read.table("rawdata/UCI HAR Dataset/test/Y_test.txt")
Train_subjectDF <- read.table("rawdata/UCI HAR Dataset/train/subject_train.txt")
Train_XDF <- read.table("rawdata/UCI HAR Dataset/train/X_train.txt")
Train_YDF <- read.table("rawdata/UCI HAR Dataset/train/Y_train.txt")


# ***************************************************************************
# Check Step 2: Show files imported and their dimensions are correct
# ***************************************************************************

# > dim(Test_subjectDF)
# [1] 2947    1
#
# > dim(Test_XDF)
# [1] 2947  561
#
# > dim(Test_YDF)
# [1] 2947    1
#
# > dim(Train_subjectDF)
# [1] 7352    1
#
# > dim(Train_XDF)
# [1] 7352  561
#
# > dim(Train_YDF)
# [1] 7352    1

# ***************************************************************************
#  Step 3: Bind X,Y,Subject data frames into one data frame
# ***************************************************************************


XDF <- rbind(Test_XDF,Train_XDF)
YDF <- rbind(Test_YDF,Train_YDF)
subjectDF <- rbind(Test_subjectDF,Train_subjectDF)
RawDF <- cbind(XDF,YDF,subjectDF)


# ***************************************************************************
# Check Step 3: Show files merged and their dimensions are correct
# ***************************************************************************

# > dim(XDF)            # should be 2947 + 7352 = 102999 and var @ 561
# [1] 10299   561
#
# > dim(YDF)            # should be 2947 + 7352 = 102999 and var @ 1
# [1] 10299     1
#
# > dim(subjectDF)      # should be 2947 + 7352 = 102999 and var @ 1
# [1] 10299     1
#
# > dim(RawDF)          # should be 102999 rows and var 561 + 1 + 1 = 563
# [1] 10299   563
#


# ***************************************************************************
#  Step 4: Write combined dataframe to rawdata folder as text file
# ***************************************************************************


fwrite(RawDF,"rawdata/combined_rawdata.txt")


# ***************************************************************************
# Check Step 4: Show file was created
# ***************************************************************************

# > list.files(path = "rawdata/", pattern = NULL, all.files = FALSE,
# +                full.names = FALSE, recursive = FALSE,
# +                ignore.case = FALSE, include.dirs = FALSE, no.. = FALSE)
#
# [1] "combined_rawdata.txt" "ProjectFiles.zip"     "UCI HAR Dataset"
#


# ***************************************************************************
#  Step 5a: Create New Features file for combined Raw Data
# ***************************************************************************

Features <- read.table("rawdata/UCI HAR Dataset/features.txt")
Additions <- data.frame(V1 = c(max(Features$V1)+1, max(Features$V1)+2),
                        V2 = c("Activity_code","Subject_ID"))

RawDF_cb <- rbind(Features,Additions)



# ****************************************************************************
#  Check Step 5a: Check Features and Additions data frames combined correctly.
# ****************************************************************************

# > dim(Features)
# [1] 561   2
#
# > dim(Additions)
# [1] 2 2
#
# > print(Additions)
# V1            V2
# 1 562 Activity_code
# 2 563    Subject_ID
#
# > dim(RawDF_cb)
# [1] 563   2
#
# > tail(RawDF_cb,4)                    #Dimension ok and last 2 rows added ok
#      V1                   V2
# 560 560 angle(Y,gravityMean)
# 561 561 angle(Z,gravityMean)
# 562 562        Activity_code
# 563 563           Subject_ID


# ****************************************************************************
#  Step 5b: Export combined Features to file
# ****************************************************************************


fwrite(RawDF_cb,"rawdata/combined_features.txt")


# ****************************************************************************
#  Check Step 5b: Export of combined Features file successful
# ****************************************************************************

# > list.files(path = "rawdata/", pattern = NULL, all.files = FALSE,
# +                full.names = FALSE, recursive = FALSE,
# +                ignore.case = FALSE, include.dirs = FALSE, no.. = FALSE)
#
# [1] "combined_features.txt" "combined_rawdata.txt"  "ProjectFiles.zip"
# [4] "UCI HAR Dataset"
#



# ****************************************************************************
#  Step 5c: Export combined Features to file ready for cookbook.md list object
# ****************************************************************************


source("CreateCodeBook.R")
CodeBook(RawDF_cb,"rawdata/cbImport.txt")


# ****************************************************************************
#  Check Step 5c: Export of combined Features file ready successful
# ****************************************************************************

# >  list.files(path = "rawdata/", pattern = NULL, all.files = FALSE,
# +                 full.names = FALSE, recursive = FALSE,
# +                 ignore.case = FALSE, include.dirs = FALSE, no.. = FALSE)
#
# [1] "cbImport.txt"          "combined_features.txt" "combined_rawdata.txt"
# [4] "ProjectFiles.zip"      "UCI HAR Dataset"

# ***************************************************************************
#  Step 6: Clear Global environment
# ***************************************************************************

rm(list=ls(all=TRUE))




# ---------------------------------------------------------------------------
# ---------------------------------------------------------------------------
#                           End of Requirement 1
# ---------------------------------------------------------------------------
# ---------------------------------------------------------------------------




# ---------------------------------------------------------------------------
# *************************---------ooo---------*****************************
#
#                           Start of Requirement 2
#           Extract only the measurements on the mean and standard deviation
#                          for each measurement.
#
# *************************---------ooo---------*****************************
# ---------------------------------------------------------------------------

# ***************************************************************************
#  Step 1a: Import combined RawData file and new Features file
# ***************************************************************************

library(data.table)
RawDF <- fread("rawdata/combined_rawdata.txt")
Features <- fread("rawdata/combined_features.txt")

# ***************************************************************************
#  Check Step 1a: Show files and dimensions imported correctly
# ***************************************************************************

# > dim(RawDF)
# [1] 10299   563

# > dim(Features)
# [1] 563   2

# ***************************************************************************
#  Step 1b: Assign new Features to Combined RawData variables
# ***************************************************************************

names(RawDF) <- Features$V2
rm(Features)

# ***************************************************************************
#  Step 1b: Check new variables assigned correctly
# ***************************************************************************

# > head(names(RawDF),3)
# [1] "tBodyAcc-mean()-X" "tBodyAcc-mean()-Y" "tBodyAcc-mean()-Z"

# > tail(names(RawDF),3)
# [1] "angle(Z,gravityMean)" "Activity_code"        "Subject_ID"

# > dim(RawDF)
# [1] 10299   563

# ***************************************************************************
#  Step 2a: Find variables with words 'mean' and 'std', and
#  filter data frame and include "Subject_ID" and "Activity_code"
# ***************************************************************************

MScolNums <- c(grep("Subject_ID", names(RawDF)),
               grep("Activity_code", names(RawDF)),
               grep("mean", names(RawDF)),
               grep("std", names(RawDF)))

MeanStdDF <- subset(RawDF,select= MScolNums)


# ***************************************************************************
#  Check Step 2a: New Data frame with variables only with 'mean' and 'std',
#  including "Subject_ID" and "Activity_code"
# ***************************************************************************

# > length(MScolNums)
# [1] 81

# > dim(MeanStdDF)
# [1] 10299    81
#
# The following will check that MeanStdDF only contains the required variables:
#
# > lenvars <- c(length(grep("std",names(MeanStdDF))),
# +              length(grep("mean",names(MeanStdDF))),
# +              length(grep("Subject_ID",names(MeanStdDF))),
# +              length(grep("Activity_code",names(MeanStdDF))))
#
# > lenvars
# [1] 33 46  1  1
#
# > sum(lenvars)
# [1] 81
#
# The following will check if there are any duplicate variables:
# > sum(duplicated(names(MeanStdDF)))
# [1] 0


# ****************************************************************************
#  Step 2b: Export Extracted data frame to file
# ****************************************************************************


fwrite(MeanStdDF,"rawdata/Extracted_Data.txt")



# ****************************************************************************
#  Check Step 2b: Export of Extracted Data file successful
# ****************************************************************************

# > list.files(path = "rawdata/", pattern = NULL, all.files = FALSE,
# +                 full.names = FALSE, recursive = FALSE,
# +                 ignore.case = FALSE, include.dirs = FALSE, no.. = FALSE)
#
# [1] "cbImport.txt"          "combined_features.txt" "combined_rawdata.txt"
# [4] "Extracted_Data.txt"    "ProjectFiles.zip"      "UCI HAR Dataset"
#



# ****************************************************************************
#  Step 3: Export variables of Extracted Data to file;
#            ready for cookbook.md list object
# ****************************************************************************


    y <- data.frame(V1 = names(MeanStdDF))
    x <- data.frame(V2 = seq.int(ncol(MeanStdDF)))
    new <- cbind(x,y)

source("CreateCodeBook.R")
CodeBook(new,"rawdata/ExtractedcbImport.txt")

# ****************************************************************************
#  Check Step 3: Export of Extracted Data variables file successful for import
#                   to cookbook.md
# ****************************************************************************


# > list.files(path = "rawdata/", pattern = NULL, all.files = FALSE,
# +                 full.names = FALSE, recursive = FALSE,
# +                 ignore.case = FALSE, include.dirs = FALSE, no.. = FALSE)
# [1] "cbImport.txt"          "combined_features.txt" "combined_rawdata.txt"
# [4] "Extracted_Data.txt"    "ExtractedcbImport.txt" "ProjectFiles.zip"
# [7] "UCI HAR Dataset"



# ***************************************************************************
#  Step 4: Clear Global environment
# ***************************************************************************

rm(list=ls(all=TRUE))



# ---------------------------------------------------------------------------
# ---------------------------------------------------------------------------
#                           End of Requirement 2
# ---------------------------------------------------------------------------
# ---------------------------------------------------------------------------





# ---------------------------------------------------------------------------
# *************************---------ooo---------*****************************
#
#                           Start of Requirement 3
#        Uses descriptive activity names to name the activities in the data set
#
#
# *************************---------ooo---------*****************************
# ---------------------------------------------------------------------------


# ***************************************************************************
#  Step 1: Import extracted raw data & Activities Features files
# ***************************************************************************

library(data.table)
MeanStdDF <- fread("rawdata/Extracted_Data.txt")
Activities <- fread("rawdata/UCI HAR Dataset/activity_labels.txt")


# ***************************************************************************
#  Check Step 1: Show data frames import successfully
# ***************************************************************************

# > dim(MeanStdDF)
# [1] 10299    81

# > dim(Activities)
# [1] 6 2

# ***************************************************************************
#  Step 1: Import extracted raw data & Activities Features files
# ***************************************************************************

MeanStdDF$Actvty_fctrs <- factor(MeanStdDF$Activity_code)
levels(MeanStdDF$Actvty_fctrs) = Activities$V2

# Re-order data frame so that Activity factors variable is in position 3
ReorderDF <- MeanStdDF[,c(1:2,82,3:81)]


# ***************************************************************************
#  Check Step 2: Show that levels of activity codes updated correctly
# ***************************************************************************

# > dim(ReorderDF)
# [1] 10299    82

# > print(Activities)
# V1                 V2
# 1:  1            WALKING
# 2:  2   WALKING_UPSTAIRS
# 3:  3 WALKING_DOWNSTAIRS
# 4:  4            SITTING
# 5:  5           STANDING
# 6:  6             LAYING

# > str(ReorderDF$Actvty_fctrs)
# Factor w/ 6 levels "WALKING","WALKING_UPSTAIRS",..: 5 5 5 5 5 5 5 5 5 5 ...

# > head(subset(ReorderDF$Actvty_fctrs,ReorderDF$Activity_code==1),1)
# [1] WALKING
# Levels: WALKING WALKING_UPSTAIRS WALKING_DOWNSTAIRS SITTING STANDING LAYING

# # > head(subset(ReorderDF$Actvty_fctrs,ReorderDF$Activity_code==2),1)
# [1] WALKING_UPSTAIRS
# Levels: WALKING WALKING_UPSTAIRS WALKING_DOWNSTAIRS SITTING STANDING LAYING

# # > head(subset(ReorderDF$Actvty_fctrs,ReorderDF$Activity_code==3),1)
# [1] WALKING_DOWNSTAIRS
# Levels: WALKING WALKING_UPSTAIRS WALKING_DOWNSTAIRS SITTING STANDING LAYING

# > head(subset(ReorderDF$Actvty_fctrs,ReorderDF$Activity_code==4),1)
# [1] SITTING
# Levels: WALKING WALKING_UPSTAIRS WALKING_DOWNSTAIRS SITTING STANDING LAYING

# > head(subset(ReorderDF$Actvty_fctrs,ReorderDF$Activity_code==5),1)
# [1] STANDING
# Levels: WALKING WALKING_UPSTAIRS WALKING_DOWNSTAIRS SITTING STANDING LAYING

# > head(subset(ReorderDF$Actvty_fctrs,ReorderDF$Activity_code==6),1)
# [1] LAYING
# Levels: WALKING WALKING_UPSTAIRS WALKING_DOWNSTAIRS SITTING STANDING LAYING

# > str(ReorderDF)
# Classes ‘data.table’ and 'data.frame':	10299 obs. of  82 variables:
# $ Subject_ID        : int  2 2 2 2 2 2 2 2 2 2 ...
# $ Activity_code     : int  5 5 5 5 5 5 5 5 5 5 ...
# $ Actvty_fctrs      : Factor w/ 6 levels "WALKING","WALKING_UPSTAIRS"...
#  variables 4-81 not shown...


# ***************************************************************************
#  Step 3: Export Activity updated raw data to file
# ***************************************************************************


fwrite(ReorderDF, "rawdata/ActivityUpdatedRawData.txt")




# ***************************************************************************
#  Check Step 3:  Updated raw data with Activity exported to file
# ***************************************************************************

# > fwrite(MeanStdDF, "rawdata/ActivityUpdatedRawData.txt")
# > list.files(path = "rawdata/", pattern = NULL, all.files = FALSE,
# +                 full.names = FALSE, recursive = FALSE,
# +                 ignore.case = FALSE, include.dirs = FALSE, no.. = FALSE)
#
# [1] "ActivityUpdatedRawData.txt" "cbImport.txt"        "combined_features.txt"
# [4] "combined_rawdata.txt"       "Extracted_Data.txt"  "ExtractedcbImport.txt"
# [7] "ProjectFiles.zip"           "UCI HAR Dataset"

# ****************************************************************************
#  Step 4: Export variables of Updated Activity Data to file;
#            ready for cookbook.md list object
# ****************************************************************************


y <- data.frame(V1 = names(ReorderDF))
x <- data.frame(V2 = seq.int(ncol(ReorderDF)))
new <- cbind(x,y)

source("CreateCodeBook.R")
CodeBook(new,"rawdata/UpdatedActvcbImport.txt")

# ****************************************************************************
#  Check Step 4: Export of Activity Updated Data variables file successful for
#                  import to cookbook.md
# ****************************************************************************


# > list.files(path = "rawdata/", pattern = NULL, all.files = FALSE,
# +                 full.names = FALSE, recursive = FALSE,
# +                 ignore.case = FALSE, include.dirs = FALSE, no.. = FALSE)
# [1] "ActivityUpdatedRawData.txt" "cbImport.txt"        "combined_features.txt"
# [4] "combined_rawdata.txt"       "Extracted_Data.txt"  "ExtractedcbImport.txt"
# [7] "ProjectFiles.zip"           "UCI HAR Dataset"     "UpdatedActvcbImport.txt"



# ****************************************************************************
#  Step 5: Clear Global Environment
# ****************************************************************************

rm(list=ls(all=TRUE))


# ---------------------------------------------------------------------------
# ---------------------------------------------------------------------------
#                           End of Requirement 3
# ---------------------------------------------------------------------------
# ---------------------------------------------------------------------------




# ---------------------------------------------------------------------------
# *************************---------ooo---------*****************************
#
#                           Start of Requirement 4
#       Appropriately labels the data set with descriptive variable names.
#
#   Rules:  > Clean invalid charachters like " ( ) - , "
#           > Remove duplicates words in variables
#           > Make sure there are no duplicate variables
#
# *************************---------ooo---------*****************************
# ---------------------------------------------------------------------------

# ****************************************************************************
#  Step 1: Load Activity Raw Data file into R & output column names to variable
# ****************************************************************************


library(data.table)
dirty <- fread("rawdata/ActivityUpdatedRawData.txt")
rawdataVars <- names(dirty)

# ****************************************************************************
#  Check Step 1: Show data frame imported and new column names variable created.
# ****************************************************************************

# > dim(dirty)
# [1] 10299    82

# str(rawdataVars)
# chr [1:82] "Subject_ID" "Activity_code" "Actvty_fctrs" "tBodyAcc-mean()-X" ...


# ****************************************************************************
#  Step 2: Cleanup column names & replace raw data frame variables with new
#          list.
# ****************************************************************************

# source r script for RenderName funcion.
# See Rename.R in project folder or Coodbook.md

source("Rename.R")
cleanedVars <- unlist(lapply(rawdataVars,RenderName))
names(dirty) <- cleanedVars

# ****************************************************************************
#  Check Step 2: Confirm no Duplicated variable names
# ****************************************************************************

# > sum(duplicated(s))
# [1] 0

# > match(s,rawdataVars)
# [1]  1  2  3 NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
# [28] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
# [55] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
# [82] NA

# ****************************************************************************
#  Step 3: Export Tidy data. Export variables and Descriptions to file for
#           import to cookbook.md list object
# ****************************************************************************

# source r script for AddDescn funcion.
# See addDescription.R in project folder or Coodbook.md

source('addDescription.R')
temp <- unlist(lapply(cleanedVars,AddDescn))

x <- data.frame(V2 = seq.int(ncol(dirty)))
y <- data.frame(V1 = names(dirty))
z <- data.frame(V3 = temp)
new <- cbind(x,y,z)

source("CreateCodeBook.R")
CodeBook(new,"data/TidycbImport.txt")


fwrite(dirty, "data/TidyData.txt")

# ****************************************************************************
#  Check Step 3: Show Export of Tidy Data variables file successful for
#                  import to cookbook.md
# ****************************************************************************


# > list.files(path = "data/", pattern = NULL, all.files = FALSE,
# +                 full.names = FALSE, recursive = FALSE,
# +                 ignore.case = FALSE, include.dirs = FALSE, no.. = FALSE)
# [1] "TidycbImport.txt" "TidyData.txt"


# ****************************************************************************
#  Step 4: Clear Global Environment
# ****************************************************************************

rm(list=ls(all=TRUE))



# ---------------------------------------------------------------------------
# ---------------------------------------------------------------------------
#                           End of Requirement 4
# ---------------------------------------------------------------------------
# ---------------------------------------------------------------------------



# ---------------------------------------------------------------------------
# *************************---------ooo---------*****************************
#
#                           Start of Requirement 5
# From the data set in step 4, creates a second, independent tidy data set
# with the average of each *variable* for each *activity* and each *subject*.
#
# *************************---------ooo---------*****************************
# ---------------------------------------------------------------------------


# ****************************************************************************
#  Step 1: Load Tidy Data file into R
# ****************************************************************************

library(data.table)
library(dplyr)
TidyData <- fread("data/TidyData.txt")


# ****************************************************************************
#  Check Step 1: Show Tiday data frame imported successfully.
# ****************************************************************************

# > dim(TidyData)
# [1] 10299    82
#

# ****************************************************************************
#  Step 2: Select relevant columns and group by Activity and Subject.
#          Obtain average of all variables on grouped data.
# ****************************************************************************


TDF <- tbl_df(TidyData)
DT <- TDF %>%
    select(Subject_ID,-Activity_code,Actvty_fctrs:FreqBodyGyroJerkMagStdev) %>%
    group_by(Actvty_fctrs, Subject_ID) %>%
        summarise_all(funs(mean))

# ****************************************************************************
#  Check Step 2: Show grouping and mean was applied to all columns.
# ****************************************************************************

# > dim(DT)
# [1] 180  81


# ****************************************************************************
#  Step 3: Export Summarised  Tidy data. Export variables and Descriptions to
#   file for import to cookbook.md list object
# ****************************************************************************

#  Add Grouped Average description to current column names

cols <- names(DT)
cols <- paste0("GrpdAvg",cols)
cols <- sub("GrpdAvgActvty_fctrs","Actvty_fctrs",x = cols)
cols <- sub("GrpdAvgSubject_ID","Subject_ID",x = cols)
names(DT) <- cols

# source r script for AddDescn funcion.
# See addDescription.R in project folder or Coodbook.md

source('addDescription.R')
temp <- unlist(lapply(cols,AddDescn))

x <- data.frame(V2 = seq.int(ncol(DT)))
y <- data.frame(V1 = names(DT))
z <- data.frame(V3 = temp)
a <- data.frame(V4 = c("Group_by 1","Group_by 2",
                       rep("Calculation: Grouped Average",ncol(DT)-2)))
new <- cbind(x,y,z,a)

source("CreateCodeBook.R")
CodeBook(new,"data/GroupedAvgcbImport.txt")


fwrite(DT,"data/GroupedAvgData.txt")

# ****************************************************************************
#  Check Step 3: Show Export of Grouped Average Tidy Data file successful.
#               Show updated columns and description file ready for cookbook.md
# ****************************************************************************


# >  list.files(path = "data/", pattern = NULL, all.files = FALSE,
# +                  full.names = FALSE, recursive = FALSE,
# +                  ignore.case = FALSE, include.dirs = FALSE, no.. = FALSE)

# [1] "GroupedAvgcbImport.txt" "GroupedAvgData.txt"     "TidycbImport.txt"
# [4] "TidyData.txt"


# ****************************************************************************
#  Step 4: Clear Global Environment
# ****************************************************************************

rm(list=ls(all=TRUE))


# ---------------------------------------------------------------------------
# ---------------------------------------------------------------------------
#                           End of Requirement 5
# ---------------------------------------------------------------------------
# ---------------------------------------------------------------------------

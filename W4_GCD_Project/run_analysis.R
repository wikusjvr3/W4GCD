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

library(data.table)
fwrite(MeanStdDF,"rawdata/Extracted_Data.txt")
MeanStdDF <- fread("rawdata/Extracted_Data.txt")

head(test,2)
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

# ***************************************************************************
#  Step 4: Clear Global environment
# ***************************************************************************

rm(list=ls(all=TRUE))



# ---------------------------------------------------------------------------
# ---------------------------------------------------------------------------
#                           End of Requirement 2
# ---------------------------------------------------------------------------
# ---------------------------------------------------------------------------

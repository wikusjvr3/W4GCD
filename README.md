# Week 4: Getting and Cleaning Data Project
Purpose of this project: Demonstrate my ability to collect, work with, and clean a data set.
Goal of this project: Prepare tidy data that can be used for later analysis.

**Tasklist**

- [x] The submitted data set is tidy.

- [x] The Github repo contains the required scripts.

- [x] GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the *variables* and *summaries* calculated, along with *units*, and any other relevant information.

- [x] The README that explains the analysis files is clear and understandable.

- [x] The work submitted for this project is the work of the student who submitted it.

## README
This repo explains how all of the scripts work and how they are connected.

### CONTENTS OF REPO
1. Parent Repo which contains README.MD & README.html and RStudio_Project folder (W4_GCD_Project).
2. Within W4_GCD_Project folder is all the files needed to enable a reproducable analysis:

    2.1 Raw Data Folder: Original "un-tidied" / raw form of data and lists
    
    2.2 Data Folder: Tidy Data File and Grouped Average File created by 
    RunAnlysis.R script file
    
    2.3 RStudio Project File: W4_GCD_Project.Rproj  
    (Run this file to open the project environment in RStudio)
    
    2.4 Codebook.md & CodeBook.html: Detailed markdown file of data profile
    and structure.  It is recommended to view the html file instead.
    
    2.5 run_analysis.R: R Script to tidy Data and perform anlysis.
    
    2.6 CreateCodeBook.R: R Script file containing a function created
    to generate lists for the codebook. The above file in 2.5 will source this 
    file to run code.
    
    2.7 Rename.R: R Script file containing a function created
    to generate Tidy Variable Names used to overwrite "untidy" column names.
    The above file in 2.5 will source this file to run code.
    
    2.8 addDescription.R: R Script file containing a function created
    to generate meaningful descriptions for the Tidy Variable Names.
    The above file in 2.5 will source this file to run code.
    

#### Project Briefing

One of the most exciting areas in all of data science right now is wearable computing - see for example this article (http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/). Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following:

1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement.

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive variable names.

5. From the data set in step 4, creates a second, independent tidy data set with the average of each *variable* for each *activity* and each *subject*.   
    
## How Requirements Were Met:

**Requirement 1**

1. Download Zip File to Raw Data Folder and Extract contents
2. Load Test & Train Datasets into R
3. Bind X,Y,Subject data frames into one data frame
4. Write combined dataframe to rawdata folder as text file
5. Create New Features file for combined Raw Data
6. Export combined Features to file
7. Export combined Features to file ready for cookbook.md list object
8. Clear Global environment

**Requirement 2**

1. Import combined RawData file and new Features file
2. Assign new Features to Combined RawData variables
3. Find variables with words 'mean' and 'std', and
   filter data frame and include "Subject_ID" and "Activity_code"
4. Export Extracted data frame to file
5. Export variables of Extracted Data to file; ready for cookbook.md list object
6. Clear Global environment

**Requirement 3**

1. Import extracted raw data & Activities Features files
2. Update levels of activity codes 
3. Export Activity updated raw data to file
4. Export variables of Updated Activity Data to file; ready for cookbook.md 
   list object
5. Clear Global Environment

**Requirement 4**

1. Load Activity Raw Data file into R & output column names to variable
2. Cleanup column names & replace raw data frame variables with new list.
3. Export Tidy data. Export variables and Descriptions to file for import to cookbook.md list object
4. Clear Global Environment

**Requirement 5**

1. Load Tidy Data file into R
2. Select relevant columns and group by Activity and Subject. Obtain average 
   of all variables on grouped data.
3. Export Summarised  Tidy data. Export variables and Descriptions to file for
   import to cookbook.md list object
4. Clear Global Environment

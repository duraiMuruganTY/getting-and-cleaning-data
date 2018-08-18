library(dplyr)
library(reshape2)
## Set working Directory

## setwd("C:\\Users\\durai.murugan\\Documents\\R")
## getwd()

## Data Download

fileName <- "UCI.zip"
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if(!file.exists(fileName)){
  download.file(url,fileName, mode = "wb") 
}

## Unzip the file

dir <- file.path(getwd(),"UCI data")
if(!file.exists(dir)){
  unzip("UCI.zip", exdir=dir)
}

##  read test datasets
setwd(file.path(dir,"UCI HAR Dataset","test"))
subject_test <- read.table("subject_test.txt")
x_test <- read.table("X_test.txt")
y_test <- read.table("y_test.txt")

## read train datasets
setwd(file.path(dir,"UCI HAR Dataset","train"))
subject_train <- read.table("subject_train.txt")
x_train <- read.table("X_train.txt")
y_train <- read.table("y_train.txt")

## read other details
setwd(file.path(dir,"UCI HAR Dataset"))
activity_labels <- read.table("activity_labels.txt")
features <- read.table("features.txt")  

## Analysis

# Step 1 Merges the training and the test sets to create one data set

# X is measurement & y is activity

subject <- rbind(subject_test,subject_train)
x <- rbind(x_test,x_train)
y <- rbind(y_test,y_train)

## Using dataset with all features
# Step 4 Appropriately labels the data set with descriptive variable names
names(x) <- features[,2]
names(subject) <- 'subject'
names(y) <- 'activity'

# Step 2 Extracts only the measurements on the mean and standard deviation for each measurement

reqCol <- grep("mean()|std()", features[, 2]) 
dataSet <- x[,reqCol]
activity <- y

dataSet <- cbind(subject,activity, dataSet)

# Step 3 Uses descriptive activity names to name the activities in the data set
activity_factor <- factor(dataSet$activity)
levels(activity_factor) <- activity_labels[,2]
dataSet$activity <- activity_factor

##step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subjectx


##Creating new independent data set
##dataSet_new <- cbind(subject,activity, x)
##dataSet_new$activity <- activity_factor
## I face an issue while summarizing the data. The columns with bandsEnergy substring arenot unique
## So I have concatenated X,y and Z to it
##dataset with only those columns having bandEnergy substring
##indx <- grepl('bandsEnergy',colnames(dataSet_new))
##dataSet_new_1 <- dataSet_new[,indx]
## dataset with other columns
##dataSet_new_2 <- dataSet_new[,!indx]
##fetching column names
##issue_index <- colnames(dataSet_new_1)
## generating axis
##axis <- rep(c(rep('X',14),rep('Y',14),rep('Z',14)),3)
##concatinating it
##colnames(dataSet_new_1) <- paste0(issue_index,'-',axis)
##cbind both the datasets 
##dataSet_new <- cbind(dataSet_new_1,dataSet_new_2)
##run_analysis<- (dataSet_new %>%  group_by(subject,activity) %>% summarise_each(funs( mean)))

## Approach 2
## melting data 
data1 <- melt(dataSet,(id.vars=c("subject","activity")))
## calculating mean and renaming features
data2 <- dcast(data1, subject + activity ~ variable, mean)
names(data2)[-c(1:2)] <- paste("Average of " , names(data2)[-c(1:2)] )

print(data2)

write.csv(data2, "tidy_data.txt", row.names=FALSE)
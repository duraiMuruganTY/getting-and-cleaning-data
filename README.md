# getting-and-cleaning-data
Coursera Peer Assignment on getting and cleaning data

# Files Used

Data files are:
1. X - that contain's metrics/features without proper descriptive name (561 Column)
2. Y - Activity (1 column)
3. Subject (1 column)

all the above files have test and train version

Other than above files, there are 2 files as follows:
1. feature names
2. activity names

# Steps done
1. Download, unzip and read the data
2. Merge train and test
3. Extract only measurements with mean and standard deviation
4. assign names to the activity
5. summarize each metrics by subject and activity

# Functions Used
1. rbind,cbind to combine dataset ny row and column respectively
2. grep to find the column names with mean/sd
3. melt to transform the data
4. dcast to perform average over melted data
5. write.csv to get the data in csv format

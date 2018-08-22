## Library Used

1. dplyr
2. reshape2

## Variables Used

1. fileName  - Name of the downloaded ZIP file
2. dir - lcoation of the above file
3. subject_test - data frame that contains test data of subject
4. x_test - data frame that contains test data of feature data
5. y_test - data frame that contains test data of activity
6. subject_train - data frame that contains train data of subject
7. x_train - data frame that contains test train of feteaure data
8. y_train -  data frame that contains test train of activity
9. activity_labels - name of activities that are fetched from activities_labels.txt
10. features - name of features that are fetched from features.txt


## Final Variables

1. dataSet - combined data set of subject, activity and features which are SD/Mean
2. data1 - melted data
3. data2 - mean() applied on tidy data

Methodology/Steps are explained in Readme.md

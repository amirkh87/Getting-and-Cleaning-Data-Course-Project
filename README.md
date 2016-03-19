# Getting-and-Cleaning-Data-Course-Project



## Explanation of the run_analysis.R Script

The `run_analysis.R` script aims to accomplish the following goals:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Please see the `run_analysis.R` script for a detailed description of the implementation of each step used to accomplish the goals.  Here is a high level description of the steps in the script used to accomplish each goal.

To accomplish goal 1, the run_analysis.R script performs the following steps:

1. Reads in the `X_test.txt`, `y_test.txt`, and `subject_test.txt` files into data frames.
2. Reads in the train data files into data frames.
3. Reads names of all Variables and activity names
4. Concatenates the rows of the test and train data of x, y and the subject seperately
5. give names to all variables according to names downloaded in step 3

To accomplish goal 2+3+4, the run_analysis.R script performs the following steps:

1. Filter the feature labels to only those containing 'mean' or 'std' in the name
2. give names to the columns from `features.txt`
3. merge activity names to y column
4. Combine subject, y and x data to one Data Frame called "DF"
5. Read in the activity labels and corresponding numeric codes from `activity_labels.txt`.


To accomplish goal 5, the run_analysis.R script performs the following steps:

1. group by activity and subject and make a new data frame by summarising mean of all columns
2.
        write.table(DF_means,"DF_means.txt",row.names = FALSE)

   It can be read using the command:

        read.table("DF_means.txt", header=TRUE)


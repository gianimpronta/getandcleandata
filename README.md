# Getting and Cleaning Data Course Project

* [Problem Summary](#summary)
* [Repository Contents](#contents)
* [The Process](#process)
* [Reading](#reading)

<h1 id=summary>Problem Summary </h1>
This is the Project for week 4 in *Getting and Cleaning Data* Course in Cousera, which is based on tidying a dataset from a research called "Human Activity Recognition Using Smartphones", made by Smartlabs. The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The resulting dataset is kind of messy, then is our job to 'tidy' the dataset, removing some columns and leaving only the columns which the "mean()" and "sd()" functions were applied (not meanFreq for example). 

<h1 id=contents>Repository Contents</h1>
The [gianimpronta/getandcleandata](https://github.com/gianimpronta/getandcleandata) repository includes three files that can be used to read the data. The [Codebook](http://github.com/gianimpronta/getandcleandata/CodeBook.md) includes the code book to variables. Additional files in the repository include the README.md and the original dataset.

<table>
<tr><th>File Name</th><th>Description</th></tr>
<tr><td valign=top>README.md</td><td>Documentation explaining the project and how to use files contained in the repository.</td></tr>
<tr><td valign=top>CodeBook.rmd</td><td>Documentation explaining what each variable measures.</td></tr>
<tr><td valign=top>run_analysis.R</td><td>R script to all the processing on the original dataset</td></tr>
<tr><td valign=top>Original Data.zip</td><td>.zip file containing all the original data</td></tr>
</table>

<h1 id=process>The Process</h1>
To build a data frame that contains the person-level data from a particular state's PUMS raw data file, we must complete a sequence of five steps.

<table>
<tr><td>1 - Merges the training and the test sets to create one data set.</td></tr>
<tr><td>2 - Extracts only the measurements on the mean and standard deviation for each measurement.</tr></td>
<tr><td>3 - Uses descriptive activity names to name the activities in the data set.</td></tr>
<tr><td>4 - Appropriately labels the data set with descriptive variable names.</td></tr>
<tr><td>5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.</td></tr>
</table>

<h2>Merge the training and test sets to create one data set</h2>

First of all, we have to read the files, the original data set consists in six files :
<table>
<tr><th>File Name</th><th>Description</th></tr>
<tr><td>'features.txt'</td><td>List of all features.</td></tr>
<tr><td>'activity_labels.txt'</td><td>Links the class labels with their activity name.</td></tr>
<tr><td>'train/X_train.txt'</td><td> Training set.</td></tr>
<tr><td>'train/y_train.txt'</td><td> Training labels.</td></tr>
<tr><td>'test/X_test.txt'</td><td> Test set.</td></tr>
<tr><td>'test/y_test.txt'</td><td> Test labels.</td></tr>
</table>

The code to read each one of these files: 

```R
### Reading the subjects
subject_test <- read.table("./test/subject_test.txt", col.names = "Subject")
subject_train <- read.table("./train/subject_train.txt", col.names = "Subject")
dfsubject <- rbind(subject_test, subject_train)
rm(subject_train, subject_test)

### Reading the activity and features labels
features <- read.table("features.txt", header = FALSE, stringsAsFactors = FALSE, row.names = 1)
activity_labels <- read.table("activity_labels.txt", header = FALSE)

### Reading the X files
x_test <- read.table("./test/X_test.txt")
x_train <- read.table("./train/X_train.txt")
dfx <- rbind(x_test, x_train)
colnames(dfx) <- features[[1]]
dfmeanstd <- dfx[,grepl(".*-mean\\(\\).*|.*-std\\(\\).*", names(dfx))]
rm(dfx,x_train, x_test)

### Reading the y files
y_test <- read.table("./test/y_test.txt", col.names = "Activity")
y_train <- read.table("./train/y_train.txt", col.names = "Activity")
dfactivity <- rbind(y_test, y_train)
dfactivity[[1]] <- factor(dfactivity[[1]], labels = activity_labels[[2]])
rm(y_test, y_train)

```
As we can see, after reading the files we came to 5 data.frames ("dfsubject", "features", "activity_labels", "dfmeanstd", "dfactivity"), with their own column names already setted, with exception of "dfmeanstd", which it's columns names we''ll set later.

After all that we join the datasets and arrange them by Subject then by activity:

```R
df <- dfsubject %>%
      cbind(dfactivity) %>%
      cbind(dfmeanstd) %>%
      arrange(Subject, Activity)
```
<h2>Extracts only the measurements on the mean and standard deviation for each measurement.</h2>

We note that in the step before we have already selected the columns for the "dfmeanstd" data.frame which has "mean()"and "sd()" using this code:
```R 
dfmeanstd <- dfx[,grepl(".*-mean\\(\\).*|.*-std\\(\\).*", names(dfx))]
```

<h2>Uses descriptive activity names to name the activities in the data set.</h2>

As we can see, this step is done after reading the y_ files. The files consists in a series of 1's, 2's, 3's, 4's, 5's and 6's representing the activities of WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING, respectively,  which is defined within the "activity_labels.txt" file loaded into "activity_labels" data.frame. 
We simply transform the "dfactivity" first column values (that`s why we use [[1]] instead of [1]) to factors using "activity_labels" second column values as labels
```R dfactivity[[1]] <- factor(dfactivity[[1]], labels = activity_labels[[2]]) ```

<h2>Appropriately labels the data set with descriptive variable names.</h2>

Below we can see the code to create the new columns names for the "dfmeanstd" data.frame:

```R 
### Creating a vector to rename the variables
newnames <- character(0)
createnames <- function(){
      firstpart <- c("BodyAcceleration", "GravityAcceleration", "BodyAccelerationJerk", "BodyGyroscope", 
             "BodyGyroscopeJerk")
      secondpart <- c("Mean", "StdDev")
      thirdpart <- c("X", "Y", "Z")
      counter <- 1
      for(i in 1:5){
            for(j in 1:2){
                  for(k in 1:3){
                        newnames[counter] <<- paste(firstpart[i], secondpart[j], thirdpart[k], sep = "-")
                        counter <- counter+1
                  }
            }
      }
      
      for(i in 1:5){
            for(j in 1:2){
                  newnames[counter] <<- paste(firstpart[i], "Magnitude", secondpart[j], sep = "-")
                  counter <- counter+1
            }
      }
      for(i in c(1,3,4)){
            for(j in 1:2){
                  for(k in 1:3){
                        newnames[counter] <<- paste(firstpart[i], secondpart[j], thirdpart[k], "FFT", sep = "-")
                        counter <- counter+1
                  }
            }
      }
      for(j in 1:2){
            newnames[counter] <<- paste(firstpart[1], "Magnitude", secondpart[j], "FFT", sep = "-")
            counter <- counter+1
      }
      for(i in 3:5){
            for(j in 1:2){
                  newnames[counter] <<- paste(firstpart[i], "Magnitude", secondpart[j], "FFT", sep = "-")
                  counter <- counter+1
            }      
      }
}
createnames()
colnames(dfmeanstd) <- newnames
```

<h2>Creating a second, independent tidy data set with the average of each variable for each activity and each subject.</h2>

Using dplyr pipeline, grouping by subject then by activity, then using "summarize_each", which summarize each one of the columns within the dataset by the groups previously defined using the function "mean()".

```R
df2 <- df %>%
      group_by(Subject, Activity) %>%
      summarize_each(funs(mean))
```

<h2>Writing</h2>

In the end, the script writes the resulting data set to a file called "tidydata.txt" without row names.
```R write.table(df2, "tidydata.txt", row.names = FALSE) ```

<h1 id= reading>Reading the file</h1>
To read the file correctly I suggest to use the following command:
```R read.table("tidydata.txt", header = TRUE, cheack.names = FALSE)```

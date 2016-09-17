
### Loading Required packages
library(dplyr)
library(tidyr)

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

### Reading the y files
y_test <- read.table("./test/y_test.txt", col.names = "Activity")
y_train <- read.table("./train/y_train.txt", col.names = "Activity")
dfactivity <- rbind(y_test, y_train)
dfactivity[[1]] <- factor(dfactivity[[1]], labels = activity_labels[[2]])
rm(y_test, y_train)

rm(features, activity_labels)

### Creating one dataset
df <- dfsubject %>%
      cbind(dfactivity) %>%
      cbind(dfmeanstd) %>%
      arrange(Subject, Activity)

rm(dfactivity, dfsubject, dfmeanstd, newnames, createnames)

### Creating the second dataset      
df2 <- df %>%
      group_by(Subject, Activity) %>%
      summarize_each(funs(mean))

### Writing the file
write.table(df2, "tidydata.txt", row.names = FALSE)
rm(df, df2)
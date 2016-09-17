# Getting and Cleaning Data Course Project

* [Problem Summary](#summary)
* [Repository Contents](#contents)
* [Key Concepts from Getting and Cleaning Data](#concepts)
* [The Process](#process)

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

<h2>Merge the training and test sets to creta one data set</h2>

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
---------------------------------------------------------------------------------------------------

The code to evaluate each row and write it to the correct file is implemented as an anonymous function.

    inFile <- "./data/REVISEDPUMS5_36.TXT"
    outputPersonFile <- "./data/PUMS_person_NY.txt"
    outputHouseholdFile <- "./data/PUMS_household_NY.txt"

    theInput <- readLines(inFile,n = -1)
    theResult <- lapply(theInput,function(x) {
     if(substr(x,1,1)=="P") {cat(x,file=outputPersonFile,sep="\n",append=TRUE)}
     else {cat(x,file=outputHouseholdFile,sep="\n",append=TRUE)}
    })

On a laptop with an Intel i5 processor, 8 Gb of RAM, and a 512 Gb solid state disk, we are able to split the data into the required output files in about one minute. While it is technically possible to write a program that reads the data row by row, initializes a row for a data frame, then builds the data frame with <code>rbind(),</code> the benefit of the file-based approach is its simplicity.

Having split the file into person and household records, we can use existing R functions to load the data, rather than building a custom parser to load the data into a data frame.

<h2>Read Input Formats from the Codebook</h2>

Taking another look at the code book spreadsheet, the tab for the person-level data has 1,219 rows. Manually creating the length vector for all these variables as required by the <code>read.fwf()</code> function would be tedious to create, and difficult to debug.

Here is where knowing the best way to do something in R is invaluable. The spreadsheet itself can be used to generate the input length vector AND column names for the resulting data frame, not only saving a lot of tedious work, but also ensuring accuracy of the input arguments to <code>read.fwf()</code>.

On closer inspection, we notice that many of the rows in the left part of the worksheet are duplicates because there is a set of columns in the middle of the spreadsheet that provide variable labels for each variable to its left.

Therefore, we can read columns 1 - 7 with <code>read.xlsx()</code> and use the <code>data.table::unique()</code> function to eliminate the duplicates.

Also, to improve readability of the spreadsheet, the authors included a number of empty rows. A simple <code>!is.na(codeBook$LEN)</code> on the column length variable can remove the blank row, bringing us to a total of 174 variables in the person file. The R code required to process the code book is listed below.

    library(xlsx)
    # using vgrep() determine the row and column indexes
    # note that column names are in row 2
    # reference: http://www.jargon.net/jargonfile/v/vgrep.html
    colIndex <- 1:7
    rowIndex <- 2:1219
    codeBook <- read.xlsx("./data/5pct_PUMS_record_layout.xls",
                          sheetIndex=2,
                          colIndex=colIndex,
                          rowIndex=rowIndex,
                          stringsAsFactors=FALSE)
    # remove blank rows
    codeBook <- codeBook[!is.na(codeBook$VARIABLE),]
    # remove duplicate rows
    library(data.table)
    codeBook <- unique(as.data.table(codeBook))

    # remove NA rows by setting length to a numeric variable, and processing
    # with !is.na
    codeBook$LEN <- as.numeric(codeBook$LEN)
    codeBook <- codeBook[!is.na(codeBook$LEN)]

<h2>Read the Household Records into a Data Frame</h2>

The <code>LEN</code> and <code>VARIABLE</code> columns in the code book are exactly what we need to specify in <code>read.fwf()</code> to avoid a lot of tedious manual effort building the vectors required for the <code>widths</code> and <code>col.names</code> arguments.

For pedagogical purposes we explicitly created vectors for these arguments, but we could have referenced the vectors directly from the <code>codeBook</code> data frame. To reduce  the memory allocation overhead in <code>read.fwf()</code>, we set the <code>n=</code> argument to 953076, the number of rows in the input file. The code to load the PUMS data into a data frame is as follows.

    # set widths vector to LEN (length) column
    colWidths <- codeBook$LEN

    # set column names to the VARIABLE column in codebook
    colNames <- codeBook$VARIABLE
    # read PUMS data previously separated by split PUMS R script
    personData <- read.fwf("./data/PUMS_person_NY.txt",
                           colWidths,
                           header=FALSE,
                           n=953076,
                           col.names = colNames,
                           stringsAsFactors=FALSE)


The R code required to process the spreadsheet and create a data frame required only 11 statements, including two <code>library()</code> calls. Our laptop was able to read the 950K records and create a data frame in R in about 19.6 minutes. The resulting R data frame consumed 701.8Mb of memory. After posting this solution on the course Discussion Forum, David Hood \(a  Community TA\) wrote that earlier this year, Hadley Wickham had published an R package to dramatically speed the reading of data into R.

We then replaced <code>read.fwf()</code> with <code>readr::read_fwf()</code> and reduced the load time from 19 minutes to 8.98 seconds. Additionally, the size of the data frame dropped from 701.8Mb to 341.2Mb, a greater than 50% reduction in memory use. 

Code for the  <code>readr::read_fwf()</code> solution is included below.

    # use Wickham's readr package to read the data
    library(readr)
    personData <- read_fwf("./data/PUMS_person_NY.txt",
                           fwf_widths(colWidths, col_names=colNames),
                           n_max=953076)

<h2>Conclusion</h2>
By analyzing the contents of the data and code book spreadsheet, it turns out that there is a very elegant R solution for processing this data. Substituting the high performance <code>readr::read_fwf()</code> for the base <code>read.fwf()</code> it also becomes a high performance solution.  

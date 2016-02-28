# Getting-and-Cleaning-Data-Project
This is a repo. fill with required files of the course project of the "Getting and Cleaning Data"</br>
For the "ReadMe" file, let us walk through the script I wrote</br>
## Basic idea
The basic idea of the script is the merge the train data and test data. Give them a name and select data needed. Just as the instructions of the requirements.
## Data needed
According to the provider of the data set. We will need the following data set:</br>
X_train.txt: To get the feature vectors of the training set.</br>
X_test.txt: To get feature vectors of the test set.</br>
subject_train.txt: To get the ID of subjects contained in the training set.</br>
subject_test.txt: To get the ID of subjects contained in the test set.</br>
y_train.txt: To get the ID of activities for the training set.</br>
y_test.txt: To get the ID of activities for the test set.</br>
feature.txt: To get the descriptive name of the features.</br>
activity_label: To get the descriptive name of the activities.</br>
## Details of the script
### Merge the training and test sets
"rbind()" function to merge the data. And I put the training set above the test set.
### Extract only the measurements on the mean and standard deviation
According to the provider of data sets. Measurements on the mean will contain a "mean()", and a "std()" for standard deviation.</br>
"grep()" function will offer us an index of the locations of such letters.</br>
After finding the data.</br>
"gsub()" function will eliminate the phrathesis we have.</br> 
"tolower()" funtion will make the name in lower case to facilitate the following manipulations.</br>
### Give a descriptive activity names
I consider the words in "activity_label" as descriptive name. So I use them after eliminate the "_" character.</br>
And name this data as "Activity" to facilitate the following manipulation.</br>
### Label the data set with descriptive names
A lot of work has been done. So we just need to bind the subject ID with other data sets.</br>
### Create a second set.
We will do this with two "for" loops</br>
First we get all distinct subjects.</br>
And create a new data frame to store the data we need called "finaldata".</br>
Here we need a temperory variable called "cnt" indicating which row we are working with.</br>
And we loop through every distinct subject and activity.</br>
Copy the data to a temperory variable, paste is to "finaldata" as the following code"</br>
    tmp <- cleaneddata[cleaneddata$SubjectID==i & cleaneddata$Activity==activities[j, 2], ]</br>
    finaldata[cnt, 3:numCols] <- colMeans(tmp[, 3:numCols])</br>
Then we move to the next row.</br>
And write the data out into "tidy_data.txt"



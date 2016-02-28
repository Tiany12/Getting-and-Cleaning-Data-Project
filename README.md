# Getting-and-Cleaning-Data-Project
This is a repo. fill with required files of the course project of the "Getting and Cleaning Data"
For the "ReadMe" file, let us walk through the script I wrote
## Basic idea
The basic idea of the script is the merge the train data and test data. Give them a name and select data needed. Just as the instructions of the requirements.
## Data needed
According to the provider of the data set. We will need the following data set:
X_train.txt: To get the feature vectors of the training set.
X_test.txt: To get feature vectors of the test set.
subject_train.txt: To get the ID of subjects contained in the training set.
subject_test.txt: To get the ID of subjects contained in the test set.
y_train.txt: To get the ID of activities for the training set.
y_test.txt: To get the ID of activities for the test set.
feature.txt: To get the descriptive name of the features.
activity_label: To get the descriptive name of the activities.
## Details of the script
### Merge the training and test sets
"rbind()" function to merge the data. And I put the training set above the test set.
### Extract only the measurements on the mean and standard deviation
According to the provider of data sets. Measurements on the mean will contain a "mean()", and a "std()" for standard deviation.
"grep()" function will offer us an index of the locations of such letters.
After finding the data.
"gsub()" function will eliminate the phrathesis we have. 
"tolower()" funtion will make the name in lower case to facilitate the following manipulations.
### Give a descriptive activity names
I consider the words in "activity_label" as descriptive name. So I use them after eliminate the "_" character.
And name this data as "Activity" to facilitate the following manipulation.
### Label the data set with descriptive names
A lot of work has been done. So we just need to bind the subject ID with other data sets.
### Create a second set.
We will do this with two "for" loops
First we get all distinct subjects.
And create a new data frame to store the data we need called "finaldata".
Here we need a temperory variable called "cnt" indicating which row we are working with.
And we loop through every distinct subject and activity.
Copy the data to a temperory variable, paste is to "finaldata" as the following code"
    tmp <- cleaneddata[cleaneddata$SubjectID==i & cleaneddata$Activity==activities[j, 2], ]
    finaldata[cnt, 3:numCols] <- colMeans(tmp[, 3:numCols])
Then we move to the next row.
And write the data out into "tidy_data.txt"



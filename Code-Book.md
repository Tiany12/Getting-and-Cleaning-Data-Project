# Code-Book for the script
This is a brief description of all the variables used in the script
## Data sets
trainset: Feature vectors extracted from "X_train.txt"</br>
testset: Feature vectors extracted from "X_test.txt"</br>
trainsubject: Subjects' ID extracted from "subject_train.txt"</br>
testsubject: Subjects' ID extracted from "test_train.txt"</br>
trainlabel: Activities' ID extracted from "y_train.txt"</br>
testlabel: Activities' ID extracted from "y_test.txt"</br>
features: Features' descriptive names extracted from "features.txt"</br>
activities: Activities' descriptive names extracted from "activity_label.txt"</br>
## Data frame
data: Feature vectors after merging</br>
subject: Subjects' ID after merging</br>
label: Activities' ID after merging</br>
cleaneddata: Cleaned data after step 4</br>
## Temporory variables
idx: Indexs of the locations relating with mean or standard deviation</br>
distinctsubjects: List of distinct subjects</br>
numdistinctsubjects: The number of distinct subjects. Used for the loop.</br>
numactivities: The number of distinct activities. Used for the loop.</br>
numCols: The number of columns should appear in the final data. Used for the loop.</br>


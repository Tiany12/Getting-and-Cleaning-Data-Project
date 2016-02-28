## This is the script for Getting and Cleaning Data
## Preparations: Load all the data
## Warning: If you want to run this script smoothly, please ensure all the files are in the working directionary

trainset <- read.table("X_train.txt")
testset <- read.table("X_test.txt")
trainsubject <- read.table("subject_train.txt")
testsubject <- read.table("subject_test.txt")
trainlabel <- read.table("y_train.txt")
testlabel <- read.table("y_test.txt")
features <- read.table("features.txt")
activities <- read.table("activity_labels.txt")

# 1. Merges the training and the test sets to create one data set.

data <- rbind(trainset, testset)
subject <- rbind(trainsubject, testsubject)
label <- rbind(trainlabel, testlabel)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

idx <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
data <- data[, idx]
names(data) <- features[idx, 2]
names(data) <- gsub("\\(|\\)", "", names(data))
names(data) <- tolower(names(data))

# 3. Uses descriptive activity names to name the activities in the data set.

activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))
label[,1] = activities[label[,1], 2]
names(label) <- "Activity"

# 4. Appropriately labels the data set with descriptive activity names.

names(subject) <- "SubjectID"
cleaneddata <- cbind(subject, label, data)
write.table(cleaneddata, "cleaned_data.txt")

# 5. Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject.

distinctsubjects = unique(subject)[,1]
numdistinctsubjects = length(unique(subject)[,1])
numactivities = length(activities[,1])
numCols = dim(cleaneddata)[2]
finaldata = cleaneddata[1:(numdistinctsubjects*numactivities), ]

cnt = 1
for (i in 1:numdistinctsubjects) {
  for (j in 1:numactivities) {
    finaldata[cnt, 1] = distinctsubjects[i]
    finaldata[cnt, 2] = activities[j, 2]
    tmp <- cleaneddata[cleaneddata$SubjectID==i & cleaneddata$Activity==activities[j, 2], ]
    finaldata[cnt, 3:numCols] <- colMeans(tmp[, 3:numCols])
    cnt = cnt+1
  }
}
write.table(finaldata, "tidy_data.txt", row.name=FALSE)
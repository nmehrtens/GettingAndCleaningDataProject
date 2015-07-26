# run_analysis.R
# transforms raw data obtained from the Samsung Galaxy S smartphone
# into a tidy data set.

library(plyr)


# Load raw data

# Load test and training data
testData <- read.table("UCI HAR Dataset/test/X_test.txt", header=FALSE)
trainData <- read.table("UCI HAR Dataset/train/X_train.txt", header=FALSE)

# Load activity labels for test and training data
activityTest <- read.table("UCI HAR Dataset/test/y_test.txt", header=FALSE,
	     col.names="activityID")
activityTrain <- read.table("UCI HAR Dataset/train/y_train.txt", header=FALSE,
	      col.names="activityID")

# Load activity label descriptions
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt",
	       header = FALSE, col.names=c("activityID","activity"))

# Load feature names for the test and training data
featureLabels <- read.table("UCI HAR Dataset/features.txt",
	      header=FALSE, col.names=c("featureID","featureName"))                                                                      

# Load subject data for test and training data
subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt", header=FALSE,
	    col.names = "subjectID",colClasses = "factor")
subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt", header=FALSE,
		col.names = "subjectID", colClasses = "factor")
                                                                                


# Assign activity description to the corresponding activity label for the test and training sets
# joins on activityID

activityTest <- join(activityTest, activityLabels, type ="inner")
activityTrain <- join(activityTrain, activityLabels, type ="inner")



# Generate `tidy' column names for the test and training data.
# Note, feature names should be:
# all lower case where possible, descriptive, not duplicated,
# not have underscores or dot or white spaces. 

dataLabels <- as.character(featureLabels$featureName)
dataLabels <- gsub("-","",dataLabels)
dataLabels <- gsub(",","",dataLabels)
dataLabels <- gsub("\\(","",dataLabels)
dataLabels <- gsub("\\)","",dataLabels)
dataLabels <- gsub("Acc","Accelorator",dataLabels)
dataLabels <- gsub("Gyro","Gyroscope",dataLabels)


# Note, the meta data for the dataLabels contain duplicated column names
# but these columns are not retained in the final tidy data set, so are left as is.


# Assign tidy column names to the test and training data.
colnames(testData) <- dataLabels
colnames(trainData) <- dataLabels


# Create a merged data set for the test and training data.
# Merge data for the training set
trainData$subjectID <- subjectTrain$subjectID
trainData$activity <- activityTrain$activity

# Merge data for the test set
testData$subjectID <- subjectTest$subjectID
testData$activity <- activityTest$activity

# Merge the test and training sets 
allData <- rbind(trainData,testData)


# Create a trimmed data set extracting only the columns with
# Mean and Standard Deviation measurements in the merged data set.

selectedLabels <- grepl("Mean|mean|std|activity|subject", dataLabels)
trimmedData <- allData[selectedLabels]


# Summarize the trimmed data set to calculate the average of each variable, grouped by both activity and subject. 
summarizedData <- ddply(trimmedData,.(activity,subjectID),numcolwise(mean,na.rm=TRUE))

# output the tidy data set using row.names = FALSE
write.table(summarizedData, "tidy.txt", sep="\t", row.names =FALSE)







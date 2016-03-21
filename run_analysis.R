# Getting and Cleaning Data: Course Project
# Adrien Atallah

#Read in test and training data sets:
xtest <- read.table("./UCI HAR Dataset/test/X_test.txt")
xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt")

#Read in variable names for both data sets:
feat <- read.table("./UCI HAR Dataset/features.txt")

#Read in activity labels (numeric) for each set:
testact <- read.table("./UCI HAR Dataset/test/y_test.txt")
trainact <- read.table("./UCI HAR Dataset/train/y_train.txt")

#Read in activity label names:
actlabel <- read.table("./UCI HAR Dataset/activity_labels.txt")

#Read in subject identifier data for each set:
testsub <- read.table("./UCI HAR Dataset/test/subject_test.txt")
trainsub <- read.table("./UCI HAR Dataset/train/subject_train.txt")

#match and name variables from features.txt data:
colnames(xtest) <- feat[,2]
colnames(xtrain) <- feat[,2]

#extract only the mean and standard deviation measurements in both data sets:
testmsd <- grep("(*)mean(*)|(*)std(*)", names(xtest))
xtestmsd <- xtest[,testmsd]
trainmsd <- grep("(*)mean(*)|(*)std(*)", names(xtrain))
xtrainmsd <- xtrain[, trainmsd]

#add activity column:
test <- cbind(xtestmsd, testact)
colnames(test)[80] <- "activity"
train <- cbind(xtrainmsd, trainact)
colnames(train)[80] <- "activity"

#add subject column:
test <- cbind(test, testsub)
colnames(test)[81] <- "subject"
train <- cbind(train, trainsub)
colnames(train)[81] <- "subject"

#merge test and training data sets (test first):
df <- merge(test, train, all = TRUE, sort = FALSE)

#replace numbers in activity column with corresponding activity names:
df$activity <- actlabel[,2][match(df$activity, actlabel[,1])]

#clean up appropriately named variables:
names <- names(df)
colnames(df) <- gsub("^f|^t|\\()", "", names)

#reorder and write clean data to csv file:
df <- df[order(df$subject, df$activity),]
df <- df[,c(80,81,1:79)]
write.csv(df, "./test_training-Mean_Sd.csv")

#create data frame of means by activity and subject:
meanbyactsub <- aggregate(df[,3:81], by=list(df$activity, df$subject), FUN = "mean")
colnames(meanbyactsub)[1:2] <- c("activity", "subject")

#write data of means to csv file:
write.csv(meanbyactsub, "./Means_by_Subject-Activity.csv")

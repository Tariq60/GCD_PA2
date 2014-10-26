
#if(!is.installed("data.table")) {   install.packages("data.table")  }

# 1. Merge training and tests sets to create one data set
testX  <- read.table("X_test.txt")
trainX <- read.table("X_train.txt")
dat <- merge(testX, trainX, all=TRUE)

# 2. Extract only the measurements on mean and sd for each measurement
features <- fread("features.txt")
#setnames(features, names(features), c("Num", "Name")
names(features) <- c("Num", "Name")
features <- features[grepl("mean\\(\\)|std\\(\\)", Name)]
dat <- subset(dat, select = features$Num)

# 3. Use desc activity names to name the activities in the data set
# 4. label the data set with dsec variable names
names(dat) <- features$Name

# Reading Subject IDs and merging 
subjectTrain = read.table("subject_train.txt") 
subjectTest =  read.table("subject_test.txt")
subjects <- rbind(subjectNamesTrain, subjectNamesTest) 
uSubject<-unique(subjects) 

# 5. Creating a tidy data set with means of variables per activity per subject
tidyDataSet <- matrix(ncol=length(names(dat)), nrow=length(uSubject)) 
rownames(tidyDataSet) <- uSubject 
colnames(tidyDataSet) <- names(dat) 

for(i in uSubject){ 
     matched <- which(subjects == i) 
     colMean <- colMeans(dat[matched,]) 
     tidyDataSet[i,] <- colMean 
} 
  
write.table(tidyDataSet,file="tidyDataSet.txt", row.names = FALSE) 

require(data.table)

##### Download the files
td <- tempdir()
tf <- tempfile(tmpdir = td, fileext=".zip")

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
              tf, method = "curl")

har.dataset.train <- read.table(unzip(tf, files=unzip(tf, list=TRUE)$Name[31], exdir=td, overwrite=TRUE))
har.dataset.train.labels <- read.table(unzip(tf, files=unzip(tf, list=TRUE)$Name[32], exdir=td, overwrite=TRUE))
subject.train <- read.table(unzip(tf, files=unzip(tf, list=TRUE)$Name[30], exdir=td, overwrite=TRUE))
har.dataset.test <- read.table(unzip(tf, files=unzip(tf, list=TRUE)$Name[17], exdir=td, overwrite=TRUE))
har.dataset.test.labels <- read.table(unzip(tf, files=unzip(tf, list=TRUE)$Name[18], exdir=td, overwrite=TRUE))
subject.test <- read.table(unzip(tf, files=unzip(tf, list=TRUE)$Name[16], exdir=td, overwrite=TRUE))
activity.labels <- read.table(unzip(tf, files=unzip(tf, list=TRUE)$Name[1], exdir=td, overwrite=TRUE))
features <- read.table(unzip(tf, files=unzip(tf, list=TRUE)$Name[2], exdir=td, overwrite=TRUE))

har.dataset.train <- data.table(har.dataset.train)
har.dataset.train.labels <- data.table(har.dataset.train.labels)
subject.train <- data.table(subject.train)
har.dataset.test <- data.table(har.dataset.test)
har.dataset.test.labels <- data.table(har.dataset.test.labels)
subject.test <- data.table(subject.test)
activity.labels <- data.table(activity.labels)
features <- data.table(features)

##### Set the column names for all of the datasets
setnames(activity.labels,1:2, c("activity.index", "activity.name"))
setnames(features, 1:2, c("feature.index", "feature.name"))
setnames(subject.test, 1, "subject.id")
setnames(subject.train, 1, "subject.id")
setnames(subject.train, 1, "subject.id")
setnames(har.dataset.test.labels, 1, "activity.index")
setnames(har.dataset.train.labels, 1, "activity.index")

## Convert from factor to character
features <- features[,feature.name:=as.character(feature.name)]

setnames(har.dataset.test, 1:561, features[,feature.name])
setnames(har.dataset.train, 1:561, features[,feature.name])

##### Add the subject ids to the test and train datasets
har.dataset.test <- har.dataset.test[,subject.id:=subject.test]
har.dataset.train <- har.dataset.train[,subject.id:=subject.train]

##### Add the activity index to the test and train datasets
har.dataset.test <- har.dataset.test[,activity.index:= har.dataset.test.labels]
har.dataset.train <- har.dataset.train[,activity.index:= har.dataset.train.labels]

##### Add activity labels to test and train datasets
setkey(har.dataset.test, activity.index)
setkey(har.dataset.train, activity.index)
setkey(activity.labels, activity.index)

har.dataset.test <- har.dataset.test[activity.labels]
har.dataset.train <- har.dataset.train[activity.labels]

##### Combine the test and train datasets
har.dataset.all <- rbind(har.dataset.test, har.dataset.train)

##### Filter for only mean() and std() features

column.pos.mean <- grep("mean()", colnames(har.dataset.all), fixed = TRUE)
column.pos.std <- grep("std()", colnames(har.dataset.all), fixed = TRUE)

# Keep the columns we added
columns.added <- c(1, 563, 564)

columns.to.keep <- c(columns.added, column.pos.mean, column.pos.std)

har.dataset.all.filtered <- har.dataset.all[,columns.to.keep, with=FALSE]

##### Fix the feature names
setnames(har.dataset.all.filtered, 1:69, 
         gsub("BodyBody", "Body",colnames(har.dataset.all.filtered), ignore.case=TRUE))
setnames(har.dataset.all.filtered, 1:69, 
         make.names(colnames(har.dataset.all.filtered), unique=TRUE))
setnames(har.dataset.all.filtered, 1:69, 
         gsub("Body", ".body.",colnames(har.dataset.all.filtered), ignore.case=TRUE))
setnames(har.dataset.all.filtered, 1:69, 
         gsub("Gravity", ".gravity.",colnames(har.dataset.all.filtered), ignore.case=TRUE))
setnames(har.dataset.all.filtered, 1:69, 
         gsub("Jerk", ".jerk.",colnames(har.dataset.all.filtered), ignore.case=TRUE))
setnames(har.dataset.all.filtered, 1:69, 
         gsub("Gyro", "gyro.",colnames(har.dataset.all.filtered), ignore.case=TRUE))
setnames(har.dataset.all.filtered, 1:69, 
         gsub("Acc", "acc.",colnames(har.dataset.all.filtered), ignore.case=TRUE))
setnames(har.dataset.all.filtered, 1:69, 
         gsub("std..", "std",colnames(har.dataset.all.filtered), fixed=TRUE))
setnames(har.dataset.all.filtered, 1:69, 
         gsub("mean..", "mean",colnames(har.dataset.all.filtered), fixed=TRUE))
setnames(har.dataset.all.filtered, 1:69, 
         gsub("..", ".",colnames(har.dataset.all.filtered), fixed=TRUE))
setnames(har.dataset.all.filtered, 1:69, 
         tolower(colnames(har.dataset.all.filtered)))

tidy.dataset <- har.dataset.all.filtered[,lapply(.SD, mean), by = list(subject.id, activity.name)]

setnames(tidy.dataset, 4:69, paste("mean.", colnames(tidy.dataset[,c(4:69), with=FALSE]), sep=""))

write.csv(tidy.dataset, "tidy_dataset.csv")

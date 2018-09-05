#Assignment; Getting Data, Week4

#set the directory
setwd("C:/Nick/07 R/6JohnHopkins/3 Getting Data/Assignment")

#download the file
file<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(file,destfile="Dataset.zip")

#unzip the file
zipF<- "C:/Nick/07 R/6JohnHopkins/3 Getting Data/Assignment/Dataset.zip"
unzip(zipF)

#import test
x_test<-fread("./UCI HAR Dataset/test/x_test.txt")
y_test<-fread("./UCI HAR Dataset/test/y_test.txt")
subject_test<-fread("./UCI HAR Dataset/test/subject_test.txt")

#import train
x_train<-fread("./UCI HAR Dataset/train/x_train.txt")
y_train<-fread("./UCI HAR Dataset/train/y_train.txt")
subject_train<-fread("./UCI HAR Dataset/train/subject_train.txt")

#look at the data
head(x_test)
tables()
head(y_test)
head(subject_test)

#merge the datasets
x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)

#get the mean/std variables only
x_names <- fread("./UCI HAR Dataset/features.txt") 
x_get <- as.vector(x_names$V1[grepl("mean()|std()",x_names$V2)])
x_clean<-x[,x_get,with=FALSE]

#activity labels in column y
y_names <- fread("./UCI HAR Dataset/activity_labels.txt")
names(y) <- "Activity" 
y$Activity <- factor(y$Activity, labels = as.factor(y_names$V2))

#names the variables in x
x_label <- x_names$V2[grepl("mean()|std()",x_names$V2)]
names(x_clean) <- x_label

#from x_clean, y, subject: create tidy data set
#average of each variable for each activity and each subject

#subject: gives 1-30 which subject did it come from
#y: gives 1-6 which activity did it come from
#x: gives the variables

#create a full data frame of each component (subect,X_clean,y)
names(subject)="Subject"
nrow(y);nrow(x_clean);nrow(subject);
full<-data.frame(subject, y, x_clean)
head(full)

#now create the summary
library(dplyr)
full_sum<-full %>% group_by(Subject, Activity) %>% summarise_all(funs(mean))
head(full_sum)
tail(full_sum)

#check the final table
write.table(full_sum, file = "./UCI HAR Dataset/tidydata.csv", row.names = FALSE, col.names = TRUE)

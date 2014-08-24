#Determins working directory for data set
cat("\nDetermining working directory...")
if(!file.exists("features.txt")){
Dir <- "./UCI HAR Dataset/"
while (!file.exists(file.path(Dir, "features.txt"), showWarnings=FALSE)) Dir <- readline(paste("No dataset found in\n",normalizePath(Dir),"\nPlease input path of 

dataset (folder which containts 'features.txt' etc.):"))
setwd(Dir);
}
cat("use '",getwd(),"' as working directory.")
#load all data needed into memory
cat("\nReading dataset...")
features <- read.table("features.txt", col.names=c("fid", "fname"))
activities <- read.table("activity_labels.txt", col.names=c("aid", "aname"))
X_train <- read.table("train/X_train.txt", col.names=features$fname,check.names=FALSE)
y_train <- read.table("train/y_train.txt", col.names=c("aid"))
subject_train <- read.table("train/subject_train.txt", col.names=c("subject"))
X_test <- read.table("test/X_test.txt", col.names=features$fname,check.names=FALSE)
y_test <- read.table("test/y_test.txt", col.names=c("aid"))
subject_test <- read.table("test/subject_test.txt", col.names=c("subject"))
cat("done.")
#1. Merges the training and the test sets to create one data set.
cat("\nMerging dataset...")
X<-rbind(X_train,X_test)
y<-rbind(y_train,y_test)
subject<-rbind(subject_train,subject_test)
cat("done.")
#2.Extracts only the measurements on the mean and standard deviation for each measurement
cat("\nExtracting mean and std...")
Xsub<-X[,grep("-(mean|std)\\(\\)",features$fname)]
cat("done.")
#3.Uses descriptive activity names to name the activities in the data set
cat("\nNaming activities...")
y[,"aname"]<-activities[y[,"aid"],"aname"]
cat("done.")
#4.Appropriately labels the data set with descriptive activity names.
cat("\nLabeling data set...")
dataset<-cbind(Xsub,y$aname,subject$subject)
cat("done.")
#5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
cat("\nCreating tidy data set...")
tidy<-aggregate(Xsub,list(subject=subject$subject, activity=y$aname), mean)
cat("done.")
#output tidy.txt for upload
cat("\nWriting tidy data set...")
write.table(tidy, "tidy.txt", sep="\t",row.names = FALSE)
cat("write to '",normalizePath("tidy.txt"),"' ok.")
cat("\nThanks for taking time to review my assignment.")

# Merge the training and the test sets to create one data set
# ------------------------------------------------------------

# define directories relative to 'UCI HAR Dataset'
main.dir <- "./UCI HAR Dataset/"
train.dir <- paste(main.dir,"train/",sep="")
test.dir <- paste(main.dir,"test/",sep="")
# sep = "" any whitespace as separator
# read all files into data frames
x.train <- read.csv(paste(train.dir,"X_train.txt",sep=""),header=FALSE,sep="")
x.test <- read.csv(paste(test.dir,"X_test.txt",sep=""),header=FALSE,sep="")
subject.train <- read.csv(paste(train.dir,"subject_train.txt",sep=""),header=FALSE,sep="")
subject.test <- read.csv(paste(test.dir,"subject_test.txt",sep=""),header=FALSE,sep="")
y.train <- read.csv(paste(train.dir,"y_train.txt",sep=""),header=FALSE,sep="")
y.test <- read.csv(paste(test.dir,"y_test.txt",sep=""),header=FALSE,sep="")

# add subject as a column
x.train.all <- cbind(x.train,subject.train)
x.test.all <-cbind(x.test,subject.test)

# read the activity labels
labels <- read.csv(paste(main.dir,"activity_labels.txt",sep=""),sep="",header=FALSE,colClasses="character")

# function to substitute activity labels for activity id. Used in lapply
convert.to.labels <- function(x) labels$V2[x]

# create y arrays using lapply on y.test and y.train
y.test.as.labels <- lapply(y.test,convert.to.labels)
y.train.as.labels <- lapply(y.train,convert.to.labels)

# add activity labels to x arrays
x.train.all <- cbind(x.train.all,y.train.as.labels)
x.test.all <- cbind(x.test.all,y.test.as.labels)

# combine the train and test data frames
x.combined <- rbind(x.train.all,x.test.all)

# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive activity names. 
# ----------------------------------------------------------------------

# read column names from file. File was created by changing parenthesis and hyphens to periods 
# can be changed to generate directly from features.txt using grep.

names <- read.csv(paste(main.dir,"names.txt",sep=""),sep="",header=FALSE,colClasses="character")


# add column names to x.combined
colnames(x.combined) <- names$V2
write.table(x.combined,file="x_combined.txt")

# create vector of mean-std columns
mean.std <- read.csv(paste(main.dir,"meanStd.txt",sep=""),sep="",header=FALSE,colClasses="character")
t1<-x.combined # just to shorten the typing

# melt t1
t1.melt <- melt(t1,id=c("subject","activity"))

# calculate the averages using dcast to aggregrate according to subject and activity.
# m1 is the resulting data frame.
m1<-dcast(t1.melt,subject+activity~variable,mean)






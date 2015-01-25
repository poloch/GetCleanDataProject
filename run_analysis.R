
###
# select features to read
###

features = read.table("UCI HAR Dataset//features.txt", 
                      sep=" ",
                      header=F , 
                      colClasses=c(NA,"character"),
                      col.names=c("id","name"))

v <- sapply(features$name,function(x) {strsplit(x,"-")})
features$signal <- unlist(lapply(v,function(x) x[1]))
features$measure <- unlist(lapply(v,function(x) x[2]))
features$params <- unlist(lapply(v,function(x) x[3]))

colToLoad <- features$measure %in% c("mean()","std()")
featureToLoad <- features[colToLoad,]

###
# the activityNames
###
actLabeling <- read.table("UCI HAR Dataset//activity_labels.txt", sep=" ", header=F, col.name=c("act_id","label"))

###
# read the data
###
colClasses <- ifelse(colToLoad,"numeric","NULL")
colLabels <- features$name[which(colToLoad)]

train_X = read.fwf("UCI HAR Dataset/train/X_train_extract100.txt",
#trainX = read.fwf("UCI HAR Dataset/train/X_train.txt", 
                  rep(16,562), 
                  colClasses=colClasses, 
                  col.names=c("id",features$name),
                  header=FALSE)


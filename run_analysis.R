library(sqldf)

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

selectDims <- paste("cast(substr(V1,",16*(featureToLoad$id-1)+1,",",16*featureToLoad$id,") as double) `",featureToLoad$name,"`", sep="")
selectStr <- paste ("select ",
                    paste(selectDims, collapse=", "), 
                    "from file",
                    collapse = " ")

load_motion_data = function(observation_file, action_file, subject_file) {
  df <- read.csv.sql(observation_file, sql=selectStr, header=F)
  df_Y <- read.csv(action_file, header=F, col.name="activity")
  df_Y <- merge(df_Y, actLabeling, by.x="activity", by.y="act_id")
  df$activity <- df_Y$label
  subject <- read.table(subject_file, header=F, col.name="id")
  df$subject <- subject$id    
  df
}
  
  
df <- load_motion_data("UCI HAR Dataset/train/X_train.txt", 
                       "UCI HAR Dataset/train/y_train.txt",
                       "UCI HAR Dataset//train/subject_train.txt")
write.csv(df,file="motion_data.csv", row.names=F)

df <- load_motion_data("UCI HAR Dataset/test/X_test.txt", 
                       "UCI HAR Dataset/test/y_test.txt",
                       "UCI HAR Dataset/test/subject_test.txt")
write.table(df,file="motion_data.csv", append=T, col.names=F, sep=",", row.names=F)



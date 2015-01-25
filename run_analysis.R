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
df <- read.csv.sql("UCI HAR Dataset/train/X_train.txt", sql=selectStr, header=F)
df_Y <- read.csv("UCI HAR Dataset//train/y_train.txt", header=F, col.name="activity")
df_Y <- merge(df_Y, actLabeling, by.x="activity", by.y="act_id")
df$activity <- df_Y$label

write.csv(df,file="motion_data.csv", row.names=F)

df <- read.csv.sql("UCI HAR Dataset/test/X_test.txt", sql=selectStr, header=F)
df_Y <- read.csv("UCI HAR Dataset//test/y_test.txt", header=F, col.name="activity")
df_Y <- merge(df_Y, actLabeling, by.x="activity", by.y="act_id")
df$activity <- df_Y$label

write.table(df,file="motion_data.csv", append=T, col.names=F, sep=",", row.names=F)
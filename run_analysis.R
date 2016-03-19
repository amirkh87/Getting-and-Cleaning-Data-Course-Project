library(tidyr)
library(dplyr)
#goal1
test_sub<-read.table("./UCI HAR Dataset/test/subject_test.txt",header=FALSE)
test_x<-read.table("./UCI HAR Dataset/test/X_test.txt",header = FALSE)
test_y<-read.table("./UCI HAR Dataset/test/y_test.txt",header=FALSE)
train_sub<-read.table("./UCI HAR Dataset/train/subject_train.txt",header=FALSE)
train_x<-read.table("./UCI HAR Dataset/train/X_train.txt",header=FALSE)
train_y<-read.table("./UCI HAR Dataset/train/y_train.txt",header=FALSE)
v_names<-read.table("./UCI HAR Dataset/features.txt",header=FALSE)
activity_names<-read.table("./UCI HAR Dataset/activity_labels.txt",header=FALSE)

comb_x<-rbind(test_x,train_x)
comb_y<-rbind(test_y,train_y)
comb_sub<-rbind(test_sub,train_sub)
names(comb_x)<-v_names[,2]
#goal2
mean_std<-comb_x[, grepl("std()",names(comb_x)) | 
                   grepl("mean()",names(comb_x))]
comb_y<-merge(activity_names,comb_y,by="V1",all.y=TRUE)
names(comb_y)<-c("y","activity")
names(comb_sub)<-"sub"
DF<-cbind(comb_y[,2],comb_sub,mean_std)
names(DF)[1]<-"activity"
DF<- group_by(DF,activity,sub)
DF<-tbl_df(DF)
DF[, 3:81] <- sapply(DF[, 3:81], as.numeric)
DF_means<-DF %>% group_by(activity,sub) %>% summarise_each(funs(mean))
DF_means<-arrange(DF_means,activity,sub)
write.table(DF_means,"DF_means.txt",row.names = FALSE)
rm(list=(c("activity_names","comb_sub","comb_x","comb_y","mean_std","test_sub",
          "test_x","test_y","train_sub","train_x","train_y","v_names","DF")))
View(DF_means)
write.table(names(DF_means),"names.txt")

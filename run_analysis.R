library("dplyr")
##Read both tables in

x<-read.table(file="./UCI HAR Dataset/test/X_test.txt")

y<-read.table(file="./UCI HAR Dataset/train/X_train.txt")

featurelist<-read.table(file= "./UCI HAR Dataset/features.txt")
##1.Merges the training and the test sets to create one data set.

total<-rbind(x,y)
namelist<-as.character(featurelist$V2)
sub("\\()","",namelist)
names(total)<-namelist
##2Extracts only the measurements on the mean and standard deviation
##for each measurement. 
result<-grepl("[Mm]ean|std",featurelist$V2)
total<-total[,result]

##3Uses descriptive activity names to name the activities 
##in the data set

xobs<-read.table(file="./UCI HAR Dataset/test/y_test.txt")
yobs<-read.table(file="./UCI HAR Dataset/train/y_train.txt")
obs<-rbind(xobs,yobs)
obs<-as.data.frame(sapply(obs, function(x) 
  {
  x<-gsub("1", "Walking", x)
  x<-gsub("2","Walking_upstairs",x)
  x<-gsub("3","Walking_downstairs",x)
  x<-gsub("4","Sitting",x)
  x<-gsub("5","Standing",x)
  x<-gsub("6","Laying",x)
  })
  )



total<-cbind(obs,total)

#Appropriately labels the data set with descriptive variable names. 
testsubject<-read.table(file="./UCI HAR Dataset/test/subject_test.txt")
trainsubject<-read.table(file="./UCI HAR Dataset/train/subject_train.txt")
subject<-rbind(testsubject,trainsubject)

total<-cbind(subject,total)

colnames(total)[2]<-"activity"
colnames(total)[1]<-"subject"

#5. creates a second, independent tidy data set with the average of each variable for each activity and each subject 
result<-total %>% group_by(subject,activity) %>% summarise_each(funs(mean))

#write to the file

write.table(result,file="./UCI HAR Dataset/tidydata.txt",row.names = FALSE)
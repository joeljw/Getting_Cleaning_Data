# R script for Getting and Cleaning Data
library(base)
library(utils)
library(data.table)

run_analysis = function () {
    setwd("~/Downloads/UCI HAR Dataset/")
    
    full_features = read.table("features.txt",col.names = c("Index", "Name"))
    # Only interested in the mean and std from the calculated features
    features = subset(full_features, grepl("-(mean|std)[(]", full_features$Name))
    
    # Retrieve Labels
    labels = read.table("activity_labels.txt",col.names = c("Level","Label"))
    
    # Forming data frame for Test set
    test_data = read.table("./test/X_test.txt", )
    test_label = read.table("./test/y_test.txt")
    test_subj = read.table("./test/subject_test.txt")

    colnames(test_data) = full_features$Name
    test_data = test_data[grepl("-(mean|std)[(]", colnames(test_data[]))]
    colnames(test_subj)="Subject"
    colnames(test_label)="Activity"
    fulltest.set = cbind(test_subj,test_label,test_data)
    
    # Begin forming data frame for training set
    train_data = read.table("./train/X_train.txt", )
    train_label = read.table("./train/y_train.txt")
    train_subj = read.table("./train/subject_train.txt")
    
    colnames(train_data) = full_features$Name
    train_data = train_data[grepl("-(mean|std)[(]", colnames(train_data[]))]
    colnames(train_subj)="Subject"
    colnames(train_label)="Activity"
    fulltrain.set = cbind(train_subj,train_label,train_data)
    
    # Combine both Train and Test sets
    full.dataset = rbind(fulltrain.set,fulltest.set)
    full.dataset$Activity = factor(full.dataset$Activity, label=labels$Label)
    
    mean.dataset = sapply(full.dataset,mean)
    sd.dataset = sapply(full.dataset,sd)
    tiny.set = rbind(mean.dataset,sd.dataset)
    rownames(tiny.set) = c("Mean","Std Dev")
    
    dir.create("combined")
    setwd("./combined")
    write.csv(full.dataset, file="combined-samsung.csv", row.names=FALSE)
    write.csv(tiny.set, file="mean-sd.csv", row.names=FALSE)
    tiny.set
}

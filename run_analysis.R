# Required libs

library(dplyr)


# The directory containing the unzipped data source files tree
# relative to the current workspace
baseDataSourceDir <- "./UCI HAR Dataset"


##
#   Get the header names for features from the features.txt file
##

featureNamesPath <- file.path(baseDataSourceDir, "features.txt")
featureHeaders <- read.table(featureNamesPath,
                       header = FALSE,
                       col.names = c("column", "name"),
                       sep = " ",
                       stringsAsFactors = FALSE)
# Substitute problematic characters from feature names with "_"
featureHeaders$name <- gsub("[\\(\\),-]+", "_" , featureHeaders$name)

##
#   Get the Activity id and label from activity_labels.txt
##

activityLabelsPath <- file.path(baseDataSourceDir, "activity_labels.txt")
activityLabels <- read.table(activityLabelsPath,
                             header = FALSE, sep = " ",
                             stringsAsFactors = FALSE)
names(activityLabels) <- c("activity_id", "activity_name")


##
#   Read and build the dataset
##

# Function that reads and marge the raw data files 
# this avoids duplicating code for reading training and test data
# `dir` is the base directory containing the training or test data
# `postfix` is the postfix string after each relavant file name
# i.e. "_train" or "_test"

tidyDataFor <- function(dir, postfix) {
    ##
    #   read subjects
    ##
    
    subjectFileName = sprintf("subject%s.txt", postfix)
    subjects <- read.table(file.path(dir, subjectFileName),
                           colClasses = c("numeric"),
                           header = FALSE,
                           col.names = c("subject")) %>%
                tbl_df() 
    
    ## 
    #   read features
    ##
    
    featuresFileName = sprintf("X%s.txt", postfix)
    features <- read.table(file.path(dir, featuresFileName),
                           colClasses = c(
                               rep("numeric", length(featureHeaders$name))
                               ),
                           header = FALSE,
                           col.names = featureHeaders$name
                           ) %>%
                tbl_df() %>%
                # select feature with "mean" or "std" enclosed between two ex 
                # problematic chars
                select(matches("_.*[mM]ean.*_|_.*[sS]td.*_"))
    
    
    ##
    #   read activity
    ##
    
    activityFileName = sprintf("y%s.txt", postfix)
    activity <- read.table(file.path(dir, activityFileName),
                           colClasses = c("numeric"),
                           header = FALSE,
                           col.names = c("activity_id")) %>%
                tbl_df() %>%
                # join activity_id with its name
                inner_join(activityLabels, by = "activity_id") %>%
                # activity_id is not required and could be redundant
                select(activity_name)
    
    ##
    #   Column bind all the data
    ##
    
    bind_cols(subjects, activity, features)
}


# Build the final dataset
trainingBaseDir <- file.path(baseDataSourceDir, "train")
testBaseDir <- file.path(baseDataSourceDir, "test")

dataset <- bind_rows(
                  tidyDataFor(trainingBaseDir, postfix = "_train"),
                  tidyDataFor(testBaseDir, postfix = "_test")
                )


##
#   Build the tidy table with all the features means groupped by 
#   activity and subject
##

groupedMeans <- group_by(dataset, activity_name, subject) %>%
                    summarize_each(funs(mean))

# export the result to a txt table file
write.table(groupedMeans, file = "groupedMeans.txt", row.names = FALSE)

##
# Clean up the work space
##

rm(list = c(
    "activityLabels",
    "activityLabelsPath",
    "baseDataSourceDir",
    "featureHeaders",
    "featureNamesPath",
    "testBaseDir",
    "tidyDataFor",
    "trainingBaseDir"
    )
)
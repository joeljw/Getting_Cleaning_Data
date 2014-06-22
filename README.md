# Getting and Cleaning Data Project

This repo contains project code for `Getting and Cleaning Data` course given by John Hopkins University on Coursera.

This script contains a set of commands to process the UCI HAR Dataset which contains a set of accelerometer readings from a Samsung Galaxy 2 phone.

The run_analysis function assumes you have a working directory set to the base of the UCI Dataset directory
The script does the following functions:
	* Sets the working directory to the UCI HAR Dataset
	* reads in the various files from the test and training sets
	* processes the files, first the test set then the training
	* combines the two sets together
	* strips out all of the data except for the mean and std measurements
	* sets the column names and adds the test subject code and activity appropriately
	* calculates a tiny dataset of means and standard deviation of the variables
	* cleans the variable names and writes the output of the combined set
	* creates a tiny dataset of the mean and standard deviation of the main dataset
	* writes both files to a combined directory under the UCI HAR Dataset directory

Invoke the function run_analysis within the directory of the UCI HAR Dataset

```r
source("path/to/run_analysis.R")
run_analysis()
```

Wait for function to process the files and the resultant output files will be in the combined directory under the `/UCI HAR Dataset Directory`.

See comments for any details about the steps within the processing of the files.
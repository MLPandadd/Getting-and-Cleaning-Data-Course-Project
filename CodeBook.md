This is the code book that describes the variables, the data, and any transformations that were performed to clean up the data.

####################### Preparation of data cleaning #######################

Libraries used for transformations: tidyverse  

Variable names were loaded from "features.txt", detailed explanation of variable name can be found in "features_info.txt" (not loaded in the script)

####################### Step 1 Load the Train Data Set #######################

1.1 load subject train, x_train and y_train with read_lines(), read_table() and read_lines() respectively, variables were renamed with features.

1.2 combing all into a training dataset (train_dataset) with tibble()

####################### Step 2 Load the test Data Set #######################

2.1 load subject test, x_test and y_test with read_lines(), read_table() and read_lines() respectively, variables were renamed with features.

2.2 combing all into a testing dataset (test_dataset) with tibble()

####################### Step 3 Combine two data sets #######################

3.1 clean up redundant variables environment, leaving only training and testing datasets.

3.2 create Dataset column to label data set as train or test, and give remaining columns uniform names in both datasets
(subject = subject_train, y = y_train;
 subject = subject_test, y = y_test)

3.3 Merge the training and the test sets

3.4 Update the value of activity labels with the following info
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

3.5 Generate Dataset 1: extracts only the measurements on the mean and standard deviation for each measurement. 
The following 2 types of columns are selected, meanFreq() is excluded.
mean(): Mean value
std(): Standard deviation

3.6 Ensure descriptive activity names are used to name the activities in the data set, which was done in step 3.4

3.7 Creates Dataset 2, with the average of each variable for each activity and each subject.


####################### Step 4 Generate output #######################

save two datasets into .csv files respectively
dataset_1_mean_and_std.csv
dataset_2_average_activity_subject.csv

####################### Variable tables #######################
variables in dataset_1_mean_and_std.csv

 [1] "Dataset" : data source: train or test                      
 [2] "subject" : subject ID 1 to 24                       
 [3] "activity_labels" :                 
 [4] "activities"   :
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

see features_info.txt for definition for the following variables.
 [5] "1 tBodyAcc-mean()-X"            
 [6] "2 tBodyAcc-mean()-Y"            
 [7] "3 tBodyAcc-mean()-Z"            
 [8] "4 tBodyAcc-std()-X"             
 [9] "5 tBodyAcc-std()-Y"             
[10] "6 tBodyAcc-std()-Z"             
[11] "41 tGravityAcc-mean()-X"        
[12] "42 tGravityAcc-mean()-Y"        
[13] "43 tGravityAcc-mean()-Z"        
[14] "44 tGravityAcc-std()-X"         
[15] "45 tGravityAcc-std()-Y"         
[16] "46 tGravityAcc-std()-Z"         
[17] "81 tBodyAccJerk-mean()-X"       
[18] "82 tBodyAccJerk-mean()-Y"       
[19] "83 tBodyAccJerk-mean()-Z"       
[20] "84 tBodyAccJerk-std()-X"        
[21] "85 tBodyAccJerk-std()-Y"        
[22] "86 tBodyAccJerk-std()-Z"        
[23] "121 tBodyGyro-mean()-X"         
[24] "122 tBodyGyro-mean()-Y"         
[25] "123 tBodyGyro-mean()-Z"         
[26] "124 tBodyGyro-std()-X"          
[27] "125 tBodyGyro-std()-Y"          
[28] "126 tBodyGyro-std()-Z"          
[29] "161 tBodyGyroJerk-mean()-X"     
[30] "162 tBodyGyroJerk-mean()-Y"     
[31] "163 tBodyGyroJerk-mean()-Z"     
[32] "164 tBodyGyroJerk-std()-X"      
[33] "165 tBodyGyroJerk-std()-Y"      
[34] "166 tBodyGyroJerk-std()-Z"      
[35] "201 tBodyAccMag-mean()"         
[36] "202 tBodyAccMag-std()"          
[37] "214 tGravityAccMag-mean()"      
[38] "215 tGravityAccMag-std()"       
[39] "227 tBodyAccJerkMag-mean()"     
[40] "228 tBodyAccJerkMag-std()"      
[41] "240 tBodyGyroMag-mean()"        
[42] "241 tBodyGyroMag-std()"         
[43] "253 tBodyGyroJerkMag-mean()"    
[44] "254 tBodyGyroJerkMag-std()"     
[45] "266 fBodyAcc-mean()-X"          
[46] "267 fBodyAcc-mean()-Y"          
[47] "268 fBodyAcc-mean()-Z"          
[48] "269 fBodyAcc-std()-X"           
[49] "270 fBodyAcc-std()-Y"           
[50] "271 fBodyAcc-std()-Z"           
[51] "345 fBodyAccJerk-mean()-X"      
[52] "346 fBodyAccJerk-mean()-Y"      
[53] "347 fBodyAccJerk-mean()-Z"      
[54] "348 fBodyAccJerk-std()-X"       
[55] "349 fBodyAccJerk-std()-Y"       
[56] "350 fBodyAccJerk-std()-Z"       
[57] "424 fBodyGyro-mean()-X"         
[58] "425 fBodyGyro-mean()-Y"         
[59] "426 fBodyGyro-mean()-Z"         
[60] "427 fBodyGyro-std()-X"          
[61] "428 fBodyGyro-std()-Y"          
[62] "429 fBodyGyro-std()-Z"          
[63] "503 fBodyAccMag-mean()"         
[64] "504 fBodyAccMag-std()"          
[65] "516 fBodyBodyAccJerkMag-mean()" 
[66] "517 fBodyBodyAccJerkMag-std()"  
[67] "529 fBodyBodyGyroMag-mean()"    
[68] "530 fBodyBodyGyroMag-std()"     
[69] "542 fBodyBodyGyroJerkMag-mean()"
[70] "543 fBodyBodyGyroJerkMag-std()"

vairables in dataset_2_average_activity_subject.csv


 [1] "subject": subject ID 1 to 24                        
 [2] "activity_labels"                
 [3] "activities"      

1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

see features_info.txt for definition for the following variables, values are mean vaule of the original ones per subject per activity.
 [4] "1 tBodyAcc-mean()-X"            
 [5] "2 tBodyAcc-mean()-Y"            
 [6] "3 tBodyAcc-mean()-Z"            
 [7] "4 tBodyAcc-std()-X"             
 [8] "5 tBodyAcc-std()-Y"             
 [9] "6 tBodyAcc-std()-Z"             
[10] "41 tGravityAcc-mean()-X"        
[11] "42 tGravityAcc-mean()-Y"        
[12] "43 tGravityAcc-mean()-Z"        
[13] "44 tGravityAcc-std()-X"         
[14] "45 tGravityAcc-std()-Y"         
[15] "46 tGravityAcc-std()-Z"         
[16] "81 tBodyAccJerk-mean()-X"       
[17] "82 tBodyAccJerk-mean()-Y"       
[18] "83 tBodyAccJerk-mean()-Z"       
[19] "84 tBodyAccJerk-std()-X"        
[20] "85 tBodyAccJerk-std()-Y"        
[21] "86 tBodyAccJerk-std()-Z"        
[22] "121 tBodyGyro-mean()-X"         
[23] "122 tBodyGyro-mean()-Y"         
[24] "123 tBodyGyro-mean()-Z"         
[25] "124 tBodyGyro-std()-X"          
[26] "125 tBodyGyro-std()-Y"          
[27] "126 tBodyGyro-std()-Z"          
[28] "161 tBodyGyroJerk-mean()-X"     
[29] "162 tBodyGyroJerk-mean()-Y"     
[30] "163 tBodyGyroJerk-mean()-Z"     
[31] "164 tBodyGyroJerk-std()-X"      
[32] "165 tBodyGyroJerk-std()-Y"      
[33] "166 tBodyGyroJerk-std()-Z"      
[34] "201 tBodyAccMag-mean()"         
[35] "202 tBodyAccMag-std()"          
[36] "214 tGravityAccMag-mean()"      
[37] "215 tGravityAccMag-std()"       
[38] "227 tBodyAccJerkMag-mean()"     
[39] "228 tBodyAccJerkMag-std()"      
[40] "240 tBodyGyroMag-mean()"        
[41] "241 tBodyGyroMag-std()"         
[42] "253 tBodyGyroJerkMag-mean()"    
[43] "254 tBodyGyroJerkMag-std()"     
[44] "266 fBodyAcc-mean()-X"          
[45] "267 fBodyAcc-mean()-Y"          
[46] "268 fBodyAcc-mean()-Z"          
[47] "269 fBodyAcc-std()-X"           
[48] "270 fBodyAcc-std()-Y"           
[49] "271 fBodyAcc-std()-Z"           
[50] "345 fBodyAccJerk-mean()-X"      
[51] "346 fBodyAccJerk-mean()-Y"      
[52] "347 fBodyAccJerk-mean()-Z"      
[53] "348 fBodyAccJerk-std()-X"       
[54] "349 fBodyAccJerk-std()-Y"       
[55] "350 fBodyAccJerk-std()-Z"       
[56] "424 fBodyGyro-mean()-X"         
[57] "425 fBodyGyro-mean()-Y"         
[58] "426 fBodyGyro-mean()-Z"         
[59] "427 fBodyGyro-std()-X"          
[60] "428 fBodyGyro-std()-Y"          
[61] "429 fBodyGyro-std()-Z"          
[62] "503 fBodyAccMag-mean()"         
[63] "504 fBodyAccMag-std()"          
[64] "516 fBodyBodyAccJerkMag-mean()" 
[65] "517 fBodyBodyAccJerkMag-std()"  
[66] "529 fBodyBodyGyroMag-mean()"    
[67] "530 fBodyBodyGyroMag-std()"     
[68] "542 fBodyBodyGyroJerkMag-mean()"
[69] "543 fBodyBodyGyroJerkMag-std()" 



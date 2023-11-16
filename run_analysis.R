#load all libraries
library(tidyverse)

# Prep for loading
# load features
features <- read_lines(
  file = paste0(getwd(), "/data/features.txt"))

####################### Step 1 Load the Train Data Set #######################

# file path of the train data set
train_file_path <- paste0(getwd(), "/data/train/")

# load subject train, x_train and y_train
subject_train <- read_lines(
  file = paste0(train_file_path, "subject_train.txt"))
  
x_train <- read_table(
  file = paste0(train_file_path, "X_train.txt"),
  col_names = F,
  col_types = cols(.default = col_double()) # only parsing numbers
) %>% 
  rename_with(~features, everything())


y_train <- read_lines(
  file = paste0(train_file_path, "y_train.txt"))  

# combing all into a training dataset
train_dataset <- tibble(subject_train = subject_train,
                        y_train = y_train,
                        x_train)

####################### Step 2 Load the test Data Set #######################

# file path of the test data set
test_file_path <- paste0(getwd(), "/data/test/")

# load subject test, x_test and y_test
subject_test <- read_lines(
  file = paste0(test_file_path, "subject_test.txt"))

x_test <- read_table(
  file = paste0(test_file_path, "X_test.txt"),
  col_names = F,
  col_types = cols(.default = col_double()) # only parsing numbers
) %>% 
  rename_with(~features, everything())


y_test <- read_lines(
  file = paste0(test_file_path, "y_test.txt"))  

# combing all into a testing dataset
test_dataset <- tibble(subject_test = subject_test,
                       y_test = y_test,
                       x_test)


####################### Step 3 Combine two data sets #######################

# clean up environment
rm(list = c("features", "subject_test", "subject_train",
            "test_file_path", "train_file_path", "x_test",
            "x_train", "y_test", "y_train"  ))

# create Dataset column to label data set as train or test, and give remaining columns uniform names in both datasets

train_dataset <- train_dataset %>% 
  mutate(Dataset = "train", .keep = "all") %>% 
  relocate(Dataset, .before = 1) %>% 
  rename(subject = subject_train, y = y_train)

test_dataset <- test_dataset %>% 
  mutate(Dataset = "test", .keep = "all") %>% 
  relocate(Dataset, .before = 1) %>% 
  rename(subject = subject_test, y = y_test)

# Q1 completed: Merge the training and the test sets to create one data set.
all_dataset <- bind_rows(train_dataset, test_dataset) %>% 
  rename(activity_labels = y) %>%  
# update the value of labels with the following info
# 1 WALKING
# 2 WALKING_UPSTAIRS
# 3 WALKING_DOWNSTAIRS
# 4 SITTING
# 5 STANDING
# 6 LAYING
  mutate(activities = recode_factor(
    activity_labels,
    `1` = "WALKING",
    `2` = "WALKING_UPSTAIRS",
    `3` = "WALKING_DOWNSTAIRS",
    `4` = "SITTING",
    `5` = "STANDING",
    `6` = "LAYING"
  )) %>% 
  relocate(activities, .after = activity_labels)


# Q2 Extracts only the measurements on the mean and standard deviation for each measurement. 
# the following 2 types of columns are selected, meanFreq() is excluded.
# mean(): Mean value
# std(): Standard deviation


all_mean_std <- all_dataset %>% 
  select(1:4, 
         colnames(all_dataset)[str_detect(string = colnames(all_dataset), 
                                          pattern = "mean|std") & 
                                 str_detect(string = colnames(all_dataset),
                                            pattern = "meanFreq", 
                                            negate = T
                                            ) ]
         )

# Q3: Use descriptive activity names to name the activities in the data set
# the step has been completed during combining datasets, columns "activity_labels" and "activities" capture the label and activities respectively

# q4 Appropriately labels the data set with descriptive variable names. 
# columns 1 to 4 are labeled with descriptive variable names. The rest of column names are from features, and are explained in features_info.


# q5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
average_activity_subject <- all_mean_std %>% 
  group_by(activity_labels, activities, subject) %>% 
  summarise(across(where(is.numeric), mean, na.rm = TRUE)) %>% 
  ungroup() %>% 
  arrange(activity_labels, as.integer(subject)) %>% 
  relocate(subject, .before = activity_labels)


  
####################### Step 4 Generate output #######################

write_csv(x = all_mean_std, file = paste0(getwd(), "/data/dataset_1_mean_and_std.csv"))

write_csv(x = average_activity_subject, file = paste0(getwd(), "/data/dataset_2_average_activity_subject.csv"))

write.table(x = average_activity_subject, file = paste0(getwd(), "/data/dataset_2_average_activity_subject.txt"),row.names = F)













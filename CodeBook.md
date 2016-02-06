# GetDataHARCourseProject
## Introduction
Goal of this project is to prepare tidy data for later analysis. The dataset I work with in this project contains sensor data from a smartphone which was recorded while a volunteer performes an activity. The intention of the recording was to train a machine learning algorithem to figure out which activity the volunteer is performing. The dataset description can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

These five steps should be performed by the `run_analysis.R` script:

0. Preparation
If you uncomment the download section the script loads the nessesary dataset. After downloading the script reads all files thar are used and sets the names of the features.

1. Merges the training and the test sets to create one data set.
To merge the datasets first the subjectIDs and activity types are concatinated with the measurements by using cbind. After that the test dataset and the train dataset are merged by using rbind.

2. Extracts only the measurements on the mean and standard deviation for each measurement.
As indicator if a column contains a mean or a sttandard deviation measurement the column name is used.

3. Uses descriptive activity names to name the activities in the data set
The activity IDs are replaced by the activity labels

4. Appropriately labels the data set with descriptive variable names.
A few regular expressions transform the labels to readable names.

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
To create the second dataset dcast is used to calculate the mean values by subject and activity of the melted dataset. Reshape2 is nessesary for this step. 
The dataset is written to `TidyData.txt`

## Units
  - Accelerometer values: The acceleration signal from the smartphone accelerometer in standard gravity units 'g'.
  - Gyroscope values: The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

## The resulting dataset

### Person and activity type
<pre>
 "Subjects"                                                     Integer ID of the Subject
 "Activity"                                                     Name of the Activity. Possible values :
                                                                  WALKING
                                                                  WALKING_UPSTAIRS
                                                                  WALKING_DOWNSTAIRS
                                                                  SITTING
                                                                  STANDING
                                                                  LAYING</pre>
### Time based features
<pre>
 "TimeBodyAccelerometerMeanX"                                    
 "TimeBodyAccelerometerMeanY"                              
 "TimeBodyAccelerometerMeanZ"                               
 "TimeBodyAccelerometerStandardDeviationX"                 
 "TimeBodyAccelerometerStandardDeviationY"                  
 "TimeBodyAccelerometerStandardDeviationZ"                 
 "TimeGravityAccelerometerMeanX"                            
 "TimeGravityAccelerometerMeanY"                           
 "TimeGravityAccelerometerMeanZ"                            
 "TimeGravityAccelerometerStandardDeviationX"              
 "TimeGravityAccelerometerStandardDeviationY"               
 "TimeGravityAccelerometerStandardDeviationZ"              
 "TimeBodyAccelerometerJerkMeanX"                           
 "TimeBodyAccelerometerJerkMeanY"                          
 "TimeBodyAccelerometerJerkMeanZ"                           
 "TimeBodyAccelerometerJerkStandardDeviationX"             
 "TimeBodyAccelerometerJerkStandardDeviationY"              
 "TimeBodyAccelerometerJerkStandardDeviationZ"             
 "TimeBodyGyroscopeMeanX"                                   
 "TimeBodyGyroscopeMeanY"                                  
 "TimeBodyGyroscopeMeanZ"                                   
 "TimeBodyGyroscopeStandardDeviationX"                     
 "TimeBodyGyroscopeStandardDeviationY"                      
 "TimeBodyGyroscopeStandardDeviationZ"                     
 "TimeBodyGyroscopeJerkMeanX"                              
 "TimeBodyGyroscopeJerkMeanY"                              
 "TimeBodyGyroscopeJerkMeanZ"                               
 "TimeBodyGyroscopeJerkStandardDeviationX"                 
 "TimeBodyGyroscopeJerkStandardDeviationY"                  
 "TimeBodyGyroscopeJerkStandardDeviationZ"                 
 "TimeBodyAccelerometerMagnitudeMean"                       
 "TimeBodyAccelerometerMagnitudeStandardDeviation"         
 "TimeGravityAccelerometerMagnitudeMean"                    
 "TimeGravityAccelerometerMagnitudeStandardDeviation"      
 "TimeBodyAccelerometerJerkMagnitudeMean"                   
 "TimeBodyAccelerometerJerkMagnitudeStandardDeviation"     
 "TimeBodyGyroscopeMagnitudeMean"                           
 "TimeBodyGyroscopeMagnitudeStandardDeviation"             
 "TimeBodyGyroscopeJerkMagnitudeMean"                       
 "TimeBodyGyroscopeJerkMagnitudeStandardDeviation"</pre>
### Frequency based features
<pre>
 "FrequencyBodyAccelerometerMeanX"                          
 "FrequencyBodyAccelerometerMeanY"                         
 "FrequencyBodyAccelerometerMeanZ"                          
 "FrequencyBodyAccelerometerStandardDeviationX"            
 "FrequencyBodyAccelerometerStandardDeviationY"             
 "FrequencyBodyAccelerometerStandardDeviationZ"            
 "FrequencyBodyAccelerometerJerkMeanX"                      
 "FrequencyBodyAccelerometerJerkMeanY"                     
 "FrequencyBodyAccelerometerJerkMeanZ"                      
 "FrequencyBodyAccelerometerJerkStandardDeviationX"        
 "FrequencyBodyAccelerometerJerkStandardDeviationY"        
 "FrequencyBodyAccelerometerJerkStandardDeviationZ"        
 "FrequencyBodyGyroscopeMeanX"                              
 "FrequencyBodyGyroscopeMeanY"                             
 "FrequencyBodyGyroscopeMeanZ"                              
 "FrequencyBodyGyroscopeStandardDeviationX"                
 "FrequencyBodyGyroscopeStandardDeviationY"                 
 "FrequencyBodyGyroscopeStandardDeviationZ"                
 "FrequencyBodyAccelerometerMagnitudeMean"                  
 "FrequencyBodyAccelerometerMagnitudeStandardDeviation"    
 "FrequencyBodyAccelerometerJerkMagnitudeMean"              
 "FrequencyBodyAccelerometerJerkMagnitudeStandardDeviation"
 "FrequencyBodyGyroscopeMagnitudeMean"                      
 "FrequencyBodyGyroscopeMagnitudeStandardDeviation"        
 "FrequencyBodyGyroscopeJerkMagnitudeMean"                  
 "FrequencyBodyGyroscopeJerkMagnitudeStandardDeviation"</pre>
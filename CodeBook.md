# Getting And Cleaning Data Project Code Book

## Introduction

This code book pertains to the Getting And Cleaning Data Project. It describes the raw data, the final tidy data, analysis script (run_analysis.R) to transform the raw data into the tidy data, and the final output file resulting from the analysis script.


## Project description

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 

You should create one R script called run_analysis.R that does the following. 
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names. 
- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## The Experiment

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

**For each record it is provided:**

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

## Raw data

The raw data is available from the following link:
<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip> 

A full description of the raw is available at the site where the data was obtained:
<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

The file can be downloaded by executing the following:

**This action only needs to be completed once**

```r
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 
destfile <- ("./UCI HAR Dataset.zip")
download.file(url, destfile = destfile, method = "curl")
```

Unzip the downloaded file

**This action only needs to be completed once**

```r
unzip("UCI HAR Dataset.zip")
```

The files of interest are: 

- UCI HAR Dataset/activity_labels.txt
- UCI HAR Dataset/features_info.txt 
- UCI HAR Dataset/train/X_train.txt
- UCI HAR Dataset/y_train.txt 
- UCI HAR Dataset/subject_train.txt
- UCI HAR Dataset/test/X_test.txt 
- UCI HAR Dataset/test/y_test.txt
- UCI HAR Dataset/test/subject_test.txt

The subjectID in the subject_train.txt and subject_test.txt identifies a participant taking part in the experiment. There are 30 participants, taking part in 6 activities. These activities are listed in "activity_labels.txt" along with its corresponding ID number. 
The y_train.txt and y_test.txt files identifies the activity being carried out by the participant for each record. 

Whilst performing an activity the following measurements are taken:

```
##   [1] tBodyAcc-mean()-X                   
##   [2] tBodyAcc-mean()-Y                   
##   [3] tBodyAcc-mean()-Z                   
##   [4] tBodyAcc-std()-X                    
##   [5] tBodyAcc-std()-Y                    
##   [6] tBodyAcc-std()-Z                    
##   [7] tBodyAcc-mad()-X                    
##   [8] tBodyAcc-mad()-Y                    
##   [9] tBodyAcc-mad()-Z                    
##  [10] tBodyAcc-max()-X                    
##  [11] tBodyAcc-max()-Y                    
##  [12] tBodyAcc-max()-Z                    
##  [13] tBodyAcc-min()-X                    
##  [14] tBodyAcc-min()-Y                    
##  [15] tBodyAcc-min()-Z                    
##  [16] tBodyAcc-sma()                      
##  [17] tBodyAcc-energy()-X                 
##  [18] tBodyAcc-energy()-Y                 
##  [19] tBodyAcc-energy()-Z                 
##  [20] tBodyAcc-iqr()-X                    
##  [21] tBodyAcc-iqr()-Y                    
##  [22] tBodyAcc-iqr()-Z                    
##  [23] tBodyAcc-entropy()-X                
##  [24] tBodyAcc-entropy()-Y                
##  [25] tBodyAcc-entropy()-Z                
##  [26] tBodyAcc-arCoeff()-X,1              
##  [27] tBodyAcc-arCoeff()-X,2              
##  [28] tBodyAcc-arCoeff()-X,3              
##  [29] tBodyAcc-arCoeff()-X,4              
##  [30] tBodyAcc-arCoeff()-Y,1              
##  [31] tBodyAcc-arCoeff()-Y,2              
##  [32] tBodyAcc-arCoeff()-Y,3              
##  [33] tBodyAcc-arCoeff()-Y,4              
##  [34] tBodyAcc-arCoeff()-Z,1              
##  [35] tBodyAcc-arCoeff()-Z,2              
##  [36] tBodyAcc-arCoeff()-Z,3              
##  [37] tBodyAcc-arCoeff()-Z,4              
##  [38] tBodyAcc-correlation()-X,Y          
##  [39] tBodyAcc-correlation()-X,Z          
##  [40] tBodyAcc-correlation()-Y,Z          
##  [41] tGravityAcc-mean()-X                
##  [42] tGravityAcc-mean()-Y                
##  [43] tGravityAcc-mean()-Z                
##  [44] tGravityAcc-std()-X                 
##  [45] tGravityAcc-std()-Y                 
##  [46] tGravityAcc-std()-Z                 
##  [47] tGravityAcc-mad()-X                 
##  [48] tGravityAcc-mad()-Y                 
##  [49] tGravityAcc-mad()-Z                 
##  [50] tGravityAcc-max()-X                 
##  [51] tGravityAcc-max()-Y                 
##  [52] tGravityAcc-max()-Z                 
##  [53] tGravityAcc-min()-X                 
##  [54] tGravityAcc-min()-Y                 
##  [55] tGravityAcc-min()-Z                 
##  [56] tGravityAcc-sma()                   
##  [57] tGravityAcc-energy()-X              
##  [58] tGravityAcc-energy()-Y              
##  [59] tGravityAcc-energy()-Z              
##  [60] tGravityAcc-iqr()-X                 
##  [61] tGravityAcc-iqr()-Y                 
##  [62] tGravityAcc-iqr()-Z                 
##  [63] tGravityAcc-entropy()-X             
##  [64] tGravityAcc-entropy()-Y             
##  [65] tGravityAcc-entropy()-Z             
##  [66] tGravityAcc-arCoeff()-X,1           
##  [67] tGravityAcc-arCoeff()-X,2           
##  [68] tGravityAcc-arCoeff()-X,3           
##  [69] tGravityAcc-arCoeff()-X,4           
##  [70] tGravityAcc-arCoeff()-Y,1           
##  [71] tGravityAcc-arCoeff()-Y,2           
##  [72] tGravityAcc-arCoeff()-Y,3           
##  [73] tGravityAcc-arCoeff()-Y,4           
##  [74] tGravityAcc-arCoeff()-Z,1           
##  [75] tGravityAcc-arCoeff()-Z,2           
##  [76] tGravityAcc-arCoeff()-Z,3           
##  [77] tGravityAcc-arCoeff()-Z,4           
##  [78] tGravityAcc-correlation()-X,Y       
##  [79] tGravityAcc-correlation()-X,Z       
##  [80] tGravityAcc-correlation()-Y,Z       
##  [81] tBodyAccJerk-mean()-X               
##  [82] tBodyAccJerk-mean()-Y               
##  [83] tBodyAccJerk-mean()-Z               
##  [84] tBodyAccJerk-std()-X                
##  [85] tBodyAccJerk-std()-Y                
##  [86] tBodyAccJerk-std()-Z                
##  [87] tBodyAccJerk-mad()-X                
##  [88] tBodyAccJerk-mad()-Y                
##  [89] tBodyAccJerk-mad()-Z                
##  [90] tBodyAccJerk-max()-X                
##  [91] tBodyAccJerk-max()-Y                
##  [92] tBodyAccJerk-max()-Z                
##  [93] tBodyAccJerk-min()-X                
##  [94] tBodyAccJerk-min()-Y                
##  [95] tBodyAccJerk-min()-Z                
##  [96] tBodyAccJerk-sma()                  
##  [97] tBodyAccJerk-energy()-X             
##  [98] tBodyAccJerk-energy()-Y             
##  [99] tBodyAccJerk-energy()-Z             
## [100] tBodyAccJerk-iqr()-X                
## [101] tBodyAccJerk-iqr()-Y                
## [102] tBodyAccJerk-iqr()-Z                
## [103] tBodyAccJerk-entropy()-X            
## [104] tBodyAccJerk-entropy()-Y            
## [105] tBodyAccJerk-entropy()-Z            
## [106] tBodyAccJerk-arCoeff()-X,1          
## [107] tBodyAccJerk-arCoeff()-X,2          
## [108] tBodyAccJerk-arCoeff()-X,3          
## [109] tBodyAccJerk-arCoeff()-X,4          
## [110] tBodyAccJerk-arCoeff()-Y,1          
## [111] tBodyAccJerk-arCoeff()-Y,2          
## [112] tBodyAccJerk-arCoeff()-Y,3          
## [113] tBodyAccJerk-arCoeff()-Y,4          
## [114] tBodyAccJerk-arCoeff()-Z,1          
## [115] tBodyAccJerk-arCoeff()-Z,2          
## [116] tBodyAccJerk-arCoeff()-Z,3          
## [117] tBodyAccJerk-arCoeff()-Z,4          
## [118] tBodyAccJerk-correlation()-X,Y      
## [119] tBodyAccJerk-correlation()-X,Z      
## [120] tBodyAccJerk-correlation()-Y,Z      
## [121] tBodyGyro-mean()-X                  
## [122] tBodyGyro-mean()-Y                  
## [123] tBodyGyro-mean()-Z                  
## [124] tBodyGyro-std()-X                   
## [125] tBodyGyro-std()-Y                   
## [126] tBodyGyro-std()-Z                   
## [127] tBodyGyro-mad()-X                   
## [128] tBodyGyro-mad()-Y                   
## [129] tBodyGyro-mad()-Z                   
## [130] tBodyGyro-max()-X                   
## [131] tBodyGyro-max()-Y                   
## [132] tBodyGyro-max()-Z                   
## [133] tBodyGyro-min()-X                   
## [134] tBodyGyro-min()-Y                   
## [135] tBodyGyro-min()-Z                   
## [136] tBodyGyro-sma()                     
## [137] tBodyGyro-energy()-X                
## [138] tBodyGyro-energy()-Y                
## [139] tBodyGyro-energy()-Z                
## [140] tBodyGyro-iqr()-X                   
## [141] tBodyGyro-iqr()-Y                   
## [142] tBodyGyro-iqr()-Z                   
## [143] tBodyGyro-entropy()-X               
## [144] tBodyGyro-entropy()-Y               
## [145] tBodyGyro-entropy()-Z               
## [146] tBodyGyro-arCoeff()-X,1             
## [147] tBodyGyro-arCoeff()-X,2             
## [148] tBodyGyro-arCoeff()-X,3             
## [149] tBodyGyro-arCoeff()-X,4             
## [150] tBodyGyro-arCoeff()-Y,1             
## [151] tBodyGyro-arCoeff()-Y,2             
## [152] tBodyGyro-arCoeff()-Y,3             
## [153] tBodyGyro-arCoeff()-Y,4             
## [154] tBodyGyro-arCoeff()-Z,1             
## [155] tBodyGyro-arCoeff()-Z,2             
## [156] tBodyGyro-arCoeff()-Z,3             
## [157] tBodyGyro-arCoeff()-Z,4             
## [158] tBodyGyro-correlation()-X,Y         
## [159] tBodyGyro-correlation()-X,Z         
## [160] tBodyGyro-correlation()-Y,Z         
## [161] tBodyGyroJerk-mean()-X              
## [162] tBodyGyroJerk-mean()-Y              
## [163] tBodyGyroJerk-mean()-Z              
## [164] tBodyGyroJerk-std()-X               
## [165] tBodyGyroJerk-std()-Y               
## [166] tBodyGyroJerk-std()-Z               
## [167] tBodyGyroJerk-mad()-X               
## [168] tBodyGyroJerk-mad()-Y               
## [169] tBodyGyroJerk-mad()-Z               
## [170] tBodyGyroJerk-max()-X               
## [171] tBodyGyroJerk-max()-Y               
## [172] tBodyGyroJerk-max()-Z               
## [173] tBodyGyroJerk-min()-X               
## [174] tBodyGyroJerk-min()-Y               
## [175] tBodyGyroJerk-min()-Z               
## [176] tBodyGyroJerk-sma()                 
## [177] tBodyGyroJerk-energy()-X            
## [178] tBodyGyroJerk-energy()-Y            
## [179] tBodyGyroJerk-energy()-Z            
## [180] tBodyGyroJerk-iqr()-X               
## [181] tBodyGyroJerk-iqr()-Y               
## [182] tBodyGyroJerk-iqr()-Z               
## [183] tBodyGyroJerk-entropy()-X           
## [184] tBodyGyroJerk-entropy()-Y           
## [185] tBodyGyroJerk-entropy()-Z           
## [186] tBodyGyroJerk-arCoeff()-X,1         
## [187] tBodyGyroJerk-arCoeff()-X,2         
## [188] tBodyGyroJerk-arCoeff()-X,3         
## [189] tBodyGyroJerk-arCoeff()-X,4         
## [190] tBodyGyroJerk-arCoeff()-Y,1         
## [191] tBodyGyroJerk-arCoeff()-Y,2         
## [192] tBodyGyroJerk-arCoeff()-Y,3         
## [193] tBodyGyroJerk-arCoeff()-Y,4         
## [194] tBodyGyroJerk-arCoeff()-Z,1         
## [195] tBodyGyroJerk-arCoeff()-Z,2         
## [196] tBodyGyroJerk-arCoeff()-Z,3         
## [197] tBodyGyroJerk-arCoeff()-Z,4         
## [198] tBodyGyroJerk-correlation()-X,Y     
## [199] tBodyGyroJerk-correlation()-X,Z     
## [200] tBodyGyroJerk-correlation()-Y,Z     
## [201] tBodyAccMag-mean()                  
## [202] tBodyAccMag-std()                   
## [203] tBodyAccMag-mad()                   
## [204] tBodyAccMag-max()                   
## [205] tBodyAccMag-min()                   
## [206] tBodyAccMag-sma()                   
## [207] tBodyAccMag-energy()                
## [208] tBodyAccMag-iqr()                   
## [209] tBodyAccMag-entropy()               
## [210] tBodyAccMag-arCoeff()1              
## [211] tBodyAccMag-arCoeff()2              
## [212] tBodyAccMag-arCoeff()3              
## [213] tBodyAccMag-arCoeff()4              
## [214] tGravityAccMag-mean()               
## [215] tGravityAccMag-std()                
## [216] tGravityAccMag-mad()                
## [217] tGravityAccMag-max()                
## [218] tGravityAccMag-min()                
## [219] tGravityAccMag-sma()                
## [220] tGravityAccMag-energy()             
## [221] tGravityAccMag-iqr()                
## [222] tGravityAccMag-entropy()            
## [223] tGravityAccMag-arCoeff()1           
## [224] tGravityAccMag-arCoeff()2           
## [225] tGravityAccMag-arCoeff()3           
## [226] tGravityAccMag-arCoeff()4           
## [227] tBodyAccJerkMag-mean()              
## [228] tBodyAccJerkMag-std()               
## [229] tBodyAccJerkMag-mad()               
## [230] tBodyAccJerkMag-max()               
## [231] tBodyAccJerkMag-min()               
## [232] tBodyAccJerkMag-sma()               
## [233] tBodyAccJerkMag-energy()            
## [234] tBodyAccJerkMag-iqr()               
## [235] tBodyAccJerkMag-entropy()           
## [236] tBodyAccJerkMag-arCoeff()1          
## [237] tBodyAccJerkMag-arCoeff()2          
## [238] tBodyAccJerkMag-arCoeff()3          
## [239] tBodyAccJerkMag-arCoeff()4          
## [240] tBodyGyroMag-mean()                 
## [241] tBodyGyroMag-std()                  
## [242] tBodyGyroMag-mad()                  
## [243] tBodyGyroMag-max()                  
## [244] tBodyGyroMag-min()                  
## [245] tBodyGyroMag-sma()                  
## [246] tBodyGyroMag-energy()               
## [247] tBodyGyroMag-iqr()                  
## [248] tBodyGyroMag-entropy()              
## [249] tBodyGyroMag-arCoeff()1             
## [250] tBodyGyroMag-arCoeff()2             
## [251] tBodyGyroMag-arCoeff()3             
## [252] tBodyGyroMag-arCoeff()4             
## [253] tBodyGyroJerkMag-mean()             
## [254] tBodyGyroJerkMag-std()              
## [255] tBodyGyroJerkMag-mad()              
## [256] tBodyGyroJerkMag-max()              
## [257] tBodyGyroJerkMag-min()              
## [258] tBodyGyroJerkMag-sma()              
## [259] tBodyGyroJerkMag-energy()           
## [260] tBodyGyroJerkMag-iqr()              
## [261] tBodyGyroJerkMag-entropy()          
## [262] tBodyGyroJerkMag-arCoeff()1         
## [263] tBodyGyroJerkMag-arCoeff()2         
## [264] tBodyGyroJerkMag-arCoeff()3         
## [265] tBodyGyroJerkMag-arCoeff()4         
## [266] fBodyAcc-mean()-X                   
## [267] fBodyAcc-mean()-Y                   
## [268] fBodyAcc-mean()-Z                   
## [269] fBodyAcc-std()-X                    
## [270] fBodyAcc-std()-Y                    
## [271] fBodyAcc-std()-Z                    
## [272] fBodyAcc-mad()-X                    
## [273] fBodyAcc-mad()-Y                    
## [274] fBodyAcc-mad()-Z                    
## [275] fBodyAcc-max()-X                    
## [276] fBodyAcc-max()-Y                    
## [277] fBodyAcc-max()-Z                    
## [278] fBodyAcc-min()-X                    
## [279] fBodyAcc-min()-Y                    
## [280] fBodyAcc-min()-Z                    
## [281] fBodyAcc-sma()                      
## [282] fBodyAcc-energy()-X                 
## [283] fBodyAcc-energy()-Y                 
## [284] fBodyAcc-energy()-Z                 
## [285] fBodyAcc-iqr()-X                    
## [286] fBodyAcc-iqr()-Y                    
## [287] fBodyAcc-iqr()-Z                    
## [288] fBodyAcc-entropy()-X                
## [289] fBodyAcc-entropy()-Y                
## [290] fBodyAcc-entropy()-Z                
## [291] fBodyAcc-maxInds-X                  
## [292] fBodyAcc-maxInds-Y                  
## [293] fBodyAcc-maxInds-Z                  
## [294] fBodyAcc-meanFreq()-X               
## [295] fBodyAcc-meanFreq()-Y               
## [296] fBodyAcc-meanFreq()-Z               
## [297] fBodyAcc-skewness()-X               
## [298] fBodyAcc-kurtosis()-X               
## [299] fBodyAcc-skewness()-Y               
## [300] fBodyAcc-kurtosis()-Y               
## [301] fBodyAcc-skewness()-Z               
## [302] fBodyAcc-kurtosis()-Z               
## [303] fBodyAcc-bandsEnergy()-1,8          
## [304] fBodyAcc-bandsEnergy()-9,16         
## [305] fBodyAcc-bandsEnergy()-17,24        
## [306] fBodyAcc-bandsEnergy()-25,32        
## [307] fBodyAcc-bandsEnergy()-33,40        
## [308] fBodyAcc-bandsEnergy()-41,48        
## [309] fBodyAcc-bandsEnergy()-49,56        
## [310] fBodyAcc-bandsEnergy()-57,64        
## [311] fBodyAcc-bandsEnergy()-1,16         
## [312] fBodyAcc-bandsEnergy()-17,32        
## [313] fBodyAcc-bandsEnergy()-33,48        
## [314] fBodyAcc-bandsEnergy()-49,64        
## [315] fBodyAcc-bandsEnergy()-1,24         
## [316] fBodyAcc-bandsEnergy()-25,48        
## [317] fBodyAcc-bandsEnergy()-1,8          
## [318] fBodyAcc-bandsEnergy()-9,16         
## [319] fBodyAcc-bandsEnergy()-17,24        
## [320] fBodyAcc-bandsEnergy()-25,32        
## [321] fBodyAcc-bandsEnergy()-33,40        
## [322] fBodyAcc-bandsEnergy()-41,48        
## [323] fBodyAcc-bandsEnergy()-49,56        
## [324] fBodyAcc-bandsEnergy()-57,64        
## [325] fBodyAcc-bandsEnergy()-1,16         
## [326] fBodyAcc-bandsEnergy()-17,32        
## [327] fBodyAcc-bandsEnergy()-33,48        
## [328] fBodyAcc-bandsEnergy()-49,64        
## [329] fBodyAcc-bandsEnergy()-1,24         
## [330] fBodyAcc-bandsEnergy()-25,48        
## [331] fBodyAcc-bandsEnergy()-1,8          
## [332] fBodyAcc-bandsEnergy()-9,16         
## [333] fBodyAcc-bandsEnergy()-17,24        
## [334] fBodyAcc-bandsEnergy()-25,32        
## [335] fBodyAcc-bandsEnergy()-33,40        
## [336] fBodyAcc-bandsEnergy()-41,48        
## [337] fBodyAcc-bandsEnergy()-49,56        
## [338] fBodyAcc-bandsEnergy()-57,64        
## [339] fBodyAcc-bandsEnergy()-1,16         
## [340] fBodyAcc-bandsEnergy()-17,32        
## [341] fBodyAcc-bandsEnergy()-33,48        
## [342] fBodyAcc-bandsEnergy()-49,64        
## [343] fBodyAcc-bandsEnergy()-1,24         
## [344] fBodyAcc-bandsEnergy()-25,48        
## [345] fBodyAccJerk-mean()-X               
## [346] fBodyAccJerk-mean()-Y               
## [347] fBodyAccJerk-mean()-Z               
## [348] fBodyAccJerk-std()-X                
## [349] fBodyAccJerk-std()-Y                
## [350] fBodyAccJerk-std()-Z                
## [351] fBodyAccJerk-mad()-X                
## [352] fBodyAccJerk-mad()-Y                
## [353] fBodyAccJerk-mad()-Z                
## [354] fBodyAccJerk-max()-X                
## [355] fBodyAccJerk-max()-Y                
## [356] fBodyAccJerk-max()-Z                
## [357] fBodyAccJerk-min()-X                
## [358] fBodyAccJerk-min()-Y                
## [359] fBodyAccJerk-min()-Z                
## [360] fBodyAccJerk-sma()                  
## [361] fBodyAccJerk-energy()-X             
## [362] fBodyAccJerk-energy()-Y             
## [363] fBodyAccJerk-energy()-Z             
## [364] fBodyAccJerk-iqr()-X                
## [365] fBodyAccJerk-iqr()-Y                
## [366] fBodyAccJerk-iqr()-Z                
## [367] fBodyAccJerk-entropy()-X            
## [368] fBodyAccJerk-entropy()-Y            
## [369] fBodyAccJerk-entropy()-Z            
## [370] fBodyAccJerk-maxInds-X              
## [371] fBodyAccJerk-maxInds-Y              
## [372] fBodyAccJerk-maxInds-Z              
## [373] fBodyAccJerk-meanFreq()-X           
## [374] fBodyAccJerk-meanFreq()-Y           
## [375] fBodyAccJerk-meanFreq()-Z           
## [376] fBodyAccJerk-skewness()-X           
## [377] fBodyAccJerk-kurtosis()-X           
## [378] fBodyAccJerk-skewness()-Y           
## [379] fBodyAccJerk-kurtosis()-Y           
## [380] fBodyAccJerk-skewness()-Z           
## [381] fBodyAccJerk-kurtosis()-Z           
## [382] fBodyAccJerk-bandsEnergy()-1,8      
## [383] fBodyAccJerk-bandsEnergy()-9,16     
## [384] fBodyAccJerk-bandsEnergy()-17,24    
## [385] fBodyAccJerk-bandsEnergy()-25,32    
## [386] fBodyAccJerk-bandsEnergy()-33,40    
## [387] fBodyAccJerk-bandsEnergy()-41,48    
## [388] fBodyAccJerk-bandsEnergy()-49,56    
## [389] fBodyAccJerk-bandsEnergy()-57,64    
## [390] fBodyAccJerk-bandsEnergy()-1,16     
## [391] fBodyAccJerk-bandsEnergy()-17,32    
## [392] fBodyAccJerk-bandsEnergy()-33,48    
## [393] fBodyAccJerk-bandsEnergy()-49,64    
## [394] fBodyAccJerk-bandsEnergy()-1,24     
## [395] fBodyAccJerk-bandsEnergy()-25,48    
## [396] fBodyAccJerk-bandsEnergy()-1,8      
## [397] fBodyAccJerk-bandsEnergy()-9,16     
## [398] fBodyAccJerk-bandsEnergy()-17,24    
## [399] fBodyAccJerk-bandsEnergy()-25,32    
## [400] fBodyAccJerk-bandsEnergy()-33,40    
## [401] fBodyAccJerk-bandsEnergy()-41,48    
## [402] fBodyAccJerk-bandsEnergy()-49,56    
## [403] fBodyAccJerk-bandsEnergy()-57,64    
## [404] fBodyAccJerk-bandsEnergy()-1,16     
## [405] fBodyAccJerk-bandsEnergy()-17,32    
## [406] fBodyAccJerk-bandsEnergy()-33,48    
## [407] fBodyAccJerk-bandsEnergy()-49,64    
## [408] fBodyAccJerk-bandsEnergy()-1,24     
## [409] fBodyAccJerk-bandsEnergy()-25,48    
## [410] fBodyAccJerk-bandsEnergy()-1,8      
## [411] fBodyAccJerk-bandsEnergy()-9,16     
## [412] fBodyAccJerk-bandsEnergy()-17,24    
## [413] fBodyAccJerk-bandsEnergy()-25,32    
## [414] fBodyAccJerk-bandsEnergy()-33,40    
## [415] fBodyAccJerk-bandsEnergy()-41,48    
## [416] fBodyAccJerk-bandsEnergy()-49,56    
## [417] fBodyAccJerk-bandsEnergy()-57,64    
## [418] fBodyAccJerk-bandsEnergy()-1,16     
## [419] fBodyAccJerk-bandsEnergy()-17,32    
## [420] fBodyAccJerk-bandsEnergy()-33,48    
## [421] fBodyAccJerk-bandsEnergy()-49,64    
## [422] fBodyAccJerk-bandsEnergy()-1,24     
## [423] fBodyAccJerk-bandsEnergy()-25,48    
## [424] fBodyGyro-mean()-X                  
## [425] fBodyGyro-mean()-Y                  
## [426] fBodyGyro-mean()-Z                  
## [427] fBodyGyro-std()-X                   
## [428] fBodyGyro-std()-Y                   
## [429] fBodyGyro-std()-Z                   
## [430] fBodyGyro-mad()-X                   
## [431] fBodyGyro-mad()-Y                   
## [432] fBodyGyro-mad()-Z                   
## [433] fBodyGyro-max()-X                   
## [434] fBodyGyro-max()-Y                   
## [435] fBodyGyro-max()-Z                   
## [436] fBodyGyro-min()-X                   
## [437] fBodyGyro-min()-Y                   
## [438] fBodyGyro-min()-Z                   
## [439] fBodyGyro-sma()                     
## [440] fBodyGyro-energy()-X                
## [441] fBodyGyro-energy()-Y                
## [442] fBodyGyro-energy()-Z                
## [443] fBodyGyro-iqr()-X                   
## [444] fBodyGyro-iqr()-Y                   
## [445] fBodyGyro-iqr()-Z                   
## [446] fBodyGyro-entropy()-X               
## [447] fBodyGyro-entropy()-Y               
## [448] fBodyGyro-entropy()-Z               
## [449] fBodyGyro-maxInds-X                 
## [450] fBodyGyro-maxInds-Y                 
## [451] fBodyGyro-maxInds-Z                 
## [452] fBodyGyro-meanFreq()-X              
## [453] fBodyGyro-meanFreq()-Y              
## [454] fBodyGyro-meanFreq()-Z              
## [455] fBodyGyro-skewness()-X              
## [456] fBodyGyro-kurtosis()-X              
## [457] fBodyGyro-skewness()-Y              
## [458] fBodyGyro-kurtosis()-Y              
## [459] fBodyGyro-skewness()-Z              
## [460] fBodyGyro-kurtosis()-Z              
## [461] fBodyGyro-bandsEnergy()-1,8         
## [462] fBodyGyro-bandsEnergy()-9,16        
## [463] fBodyGyro-bandsEnergy()-17,24       
## [464] fBodyGyro-bandsEnergy()-25,32       
## [465] fBodyGyro-bandsEnergy()-33,40       
## [466] fBodyGyro-bandsEnergy()-41,48       
## [467] fBodyGyro-bandsEnergy()-49,56       
## [468] fBodyGyro-bandsEnergy()-57,64       
## [469] fBodyGyro-bandsEnergy()-1,16        
## [470] fBodyGyro-bandsEnergy()-17,32       
## [471] fBodyGyro-bandsEnergy()-33,48       
## [472] fBodyGyro-bandsEnergy()-49,64       
## [473] fBodyGyro-bandsEnergy()-1,24        
## [474] fBodyGyro-bandsEnergy()-25,48       
## [475] fBodyGyro-bandsEnergy()-1,8         
## [476] fBodyGyro-bandsEnergy()-9,16        
## [477] fBodyGyro-bandsEnergy()-17,24       
## [478] fBodyGyro-bandsEnergy()-25,32       
## [479] fBodyGyro-bandsEnergy()-33,40       
## [480] fBodyGyro-bandsEnergy()-41,48       
## [481] fBodyGyro-bandsEnergy()-49,56       
## [482] fBodyGyro-bandsEnergy()-57,64       
## [483] fBodyGyro-bandsEnergy()-1,16        
## [484] fBodyGyro-bandsEnergy()-17,32       
## [485] fBodyGyro-bandsEnergy()-33,48       
## [486] fBodyGyro-bandsEnergy()-49,64       
## [487] fBodyGyro-bandsEnergy()-1,24        
## [488] fBodyGyro-bandsEnergy()-25,48       
## [489] fBodyGyro-bandsEnergy()-1,8         
## [490] fBodyGyro-bandsEnergy()-9,16        
## [491] fBodyGyro-bandsEnergy()-17,24       
## [492] fBodyGyro-bandsEnergy()-25,32       
## [493] fBodyGyro-bandsEnergy()-33,40       
## [494] fBodyGyro-bandsEnergy()-41,48       
## [495] fBodyGyro-bandsEnergy()-49,56       
## [496] fBodyGyro-bandsEnergy()-57,64       
## [497] fBodyGyro-bandsEnergy()-1,16        
## [498] fBodyGyro-bandsEnergy()-17,32       
## [499] fBodyGyro-bandsEnergy()-33,48       
## [500] fBodyGyro-bandsEnergy()-49,64       
## [501] fBodyGyro-bandsEnergy()-1,24        
## [502] fBodyGyro-bandsEnergy()-25,48       
## [503] fBodyAccMag-mean()                  
## [504] fBodyAccMag-std()                   
## [505] fBodyAccMag-mad()                   
## [506] fBodyAccMag-max()                   
## [507] fBodyAccMag-min()                   
## [508] fBodyAccMag-sma()                   
## [509] fBodyAccMag-energy()                
## [510] fBodyAccMag-iqr()                   
## [511] fBodyAccMag-entropy()               
## [512] fBodyAccMag-maxInds                 
## [513] fBodyAccMag-meanFreq()              
## [514] fBodyAccMag-skewness()              
## [515] fBodyAccMag-kurtosis()              
## [516] fBodyBodyAccJerkMag-mean()          
## [517] fBodyBodyAccJerkMag-std()           
## [518] fBodyBodyAccJerkMag-mad()           
## [519] fBodyBodyAccJerkMag-max()           
## [520] fBodyBodyAccJerkMag-min()           
## [521] fBodyBodyAccJerkMag-sma()           
## [522] fBodyBodyAccJerkMag-energy()        
## [523] fBodyBodyAccJerkMag-iqr()           
## [524] fBodyBodyAccJerkMag-entropy()       
## [525] fBodyBodyAccJerkMag-maxInds         
## [526] fBodyBodyAccJerkMag-meanFreq()      
## [527] fBodyBodyAccJerkMag-skewness()      
## [528] fBodyBodyAccJerkMag-kurtosis()      
## [529] fBodyBodyGyroMag-mean()             
## [530] fBodyBodyGyroMag-std()              
## [531] fBodyBodyGyroMag-mad()              
## [532] fBodyBodyGyroMag-max()              
## [533] fBodyBodyGyroMag-min()              
## [534] fBodyBodyGyroMag-sma()              
## [535] fBodyBodyGyroMag-energy()           
## [536] fBodyBodyGyroMag-iqr()              
## [537] fBodyBodyGyroMag-entropy()          
## [538] fBodyBodyGyroMag-maxInds            
## [539] fBodyBodyGyroMag-meanFreq()         
## [540] fBodyBodyGyroMag-skewness()         
## [541] fBodyBodyGyroMag-kurtosis()         
## [542] fBodyBodyGyroJerkMag-mean()         
## [543] fBodyBodyGyroJerkMag-std()          
## [544] fBodyBodyGyroJerkMag-mad()          
## [545] fBodyBodyGyroJerkMag-max()          
## [546] fBodyBodyGyroJerkMag-min()          
## [547] fBodyBodyGyroJerkMag-sma()          
## [548] fBodyBodyGyroJerkMag-energy()       
## [549] fBodyBodyGyroJerkMag-iqr()          
## [550] fBodyBodyGyroJerkMag-entropy()      
## [551] fBodyBodyGyroJerkMag-maxInds        
## [552] fBodyBodyGyroJerkMag-meanFreq()     
## [553] fBodyBodyGyroJerkMag-skewness()     
## [554] fBodyBodyGyroJerkMag-kurtosis()     
## [555] angle(tBodyAccMean,gravity)         
## [556] angle(tBodyAccJerkMean),gravityMean)
## [557] angle(tBodyGyroMean,gravityMean)    
## [558] angle(tBodyGyroJerkMean,gravityMean)
## [559] angle(X,gravityMean)                
## [560] angle(Y,gravityMean)                
## [561] angle(Z,gravityMean)                
## 477 Levels: angle(tBodyAccJerkMean),gravityMean) ...
```



# The run_analysis.R script

The script run_analysis.R processes the raw data in the UCI HAR Dataset directory to generate the a tidy data set. It completes the steps outlined in the Project Description (but not necesarily in the order that was listed).

**Note:** run_analysis.R relies upon the library (plyr) being installed.


```r
library(plyr)
```

### Step 0: load the raw data


```r
# Load raw data

# Load test and training data
testData <- read.table("UCI HAR Dataset/test/X_test.txt", header=FALSE)
trainData <- read.table("UCI HAR Dataset/train/X_train.txt", header=FALSE)

# Load activity labels for test and training data
activityTest <- read.table("UCI HAR Dataset/test/y_test.txt", header=FALSE,
	     col.names="activityID")
activityTrain <- read.table("UCI HAR Dataset/train/y_train.txt", header=FALSE,
	      col.names="activityID")

# Load activity label descriptions
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt",
	       header = FALSE, col.names=c("activityID","activity"))

# Load feature names for the test and training data
featureLabels <- read.table("UCI HAR Dataset/features.txt",
	      header=FALSE, col.names=c("featureID","featureName"))                                                                      

# Load subject data for test and training data
subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt", header=FALSE,
	    col.names = "subjectID",colClasses = "factor")
subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt", header=FALSE,
		col.names = "subjectID", colClasses = "factor")
```


### Step 1: Uses descriptive activity names to name the activities in the data set

Executed this step by utilising the package plyr and the 'join' command. These commands cross-matches and assigns the descriptive labels for the activities (e.g. "WALKING") to the activity ID in the test (1st command) and training (2nd command) set.


```r
# Assign activity description to the corresponding activity label for the test and training sets
# joins on activityID

activityTest <- join(activityTest, activityLabels, type ="inner")
```

```
## Joining by: activityID
```

```r
activityTrain <- join(activityTrain, activityLabels, type ="inner")
```

```
## Joining by: activityID
```

### Step 2: Appropriately labels the data set with descriptive variable names.  

This step takes the feature names and makes them more descriptive and appropriate for 'tidy' data. 

The requirements for 'tidy' variable names are that they should be:
all lower case where possible, descriptive, not duplicated, not have underscores, dots, or white spaces.

Note, the meta data for the column names contain duplicated names but as these columns are meta-data and not retained in the final tidy data set, so are left as is. The variable names for the final tidy data set obey the rules above.



```r
# Generate `tidy' column names for the test and training data.
# Note, feature names should be:
# all lower case where possible, descriptive, not duplicated,
# not have underscores or dot or white spaces. 

dataLabels <- as.character(featureLabels$featureName)
dataLabels <- gsub("-","",dataLabels)
dataLabels <- gsub(",","",dataLabels)
dataLabels <- gsub("\\(","",dataLabels)
dataLabels <- gsub("\\)","",dataLabels)
dataLabels <- gsub("Acc","accelerometer",dataLabels)
dataLabels <- gsub("Gyro","gyroscope",dataLabels)
```

These variable names are assigned to both the test and train data sets.


```r
# Assign tidy column names to the test and training data.
colnames(testData) <- dataLabels
colnames(trainData) <- dataLabels
```


### Step 3: Merges the training and the test sets to create one data set.

To merge the raw data into a complete data set, we must first combine the activity data (using the descriptive names assigned above, i.e. the 'activity' column) and the subject ID information. The activity and subject ID for the test and train data are added to their corresponding data set.  And the resulting test and train data sets are merged to generate teh complete data set.  


```r
# Create a merged data set for the test and training data.
# Merge data for the training set
trainData$subjectID <- subjectTrain$subjectID
trainData$activity <- activityTrain$activity

# Merge data for the test set
testData$subjectID <- subjectTest$subjectID
testData$activity <- activityTest$activity

# Merge the test and training sets 
allData <- rbind(trainData,testData)
```

### Step 4: Extracts only the measurements on the mean and standard deviation for each measurement. 

Select from the whole data set only those variables which are mean and standard deviation measurements. 
Used grep to identify all instances of columns (in the complete data set) with the expressions 'mean or std' within their descriptive variables names.
Also retained the activity and subject information in the data set. 
Extracted only the columns meeting those critera to create a smaller, selected, data set. 


```r
# Create a trimmed data set extracting only the columns with
# Mean and Standard Deviation measurements in the merged data set.

selectedLabels <- grepl("Mean|mean|std|activity|subject", dataLabels)
trimmedData <- allData[selectedLabels]
```

### Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Executed this step by utilising the package plyr and the ddply command. 
The input data set is the one outputted by 'Step 4'. It is grouped by both activity and subject (subjectID).  The data is summarized to calculate the average for each variable (those containing mean and standard deviation measurements), grouped by activity and subject.  


```r
# Summarize the trimmed data set to calculate the average of each variable, grouped by both activity and subject. 
summarizedData <- ddply(trimmedData,.(activity,subjectID),numcolwise(mean,na.rm=TRUE))
```

# The tidy data



The output from Step 5 comprises the final tidy data set. It is a 180 column by 88 row table. It contains the average value of each variable (those containing only mean and standard deviation measurements in the UCI HAR Dataset), grouped by activity and subject.  

The variables in the tidy data are as follows:

```
##  [1] "activity"                                  
##  [2] "subjectID"                                 
##  [3] "tBodyaccelerometermeanX"                   
##  [4] "tBodyaccelerometermeanY"                   
##  [5] "tBodyaccelerometermeanZ"                   
##  [6] "tBodyaccelerometerstdX"                    
##  [7] "tBodyaccelerometerstdY"                    
##  [8] "tBodyaccelerometerstdZ"                    
##  [9] "tGravityaccelerometermeanX"                
## [10] "tGravityaccelerometermeanY"                
## [11] "tGravityaccelerometermeanZ"                
## [12] "tGravityaccelerometerstdX"                 
## [13] "tGravityaccelerometerstdY"                 
## [14] "tGravityaccelerometerstdZ"                 
## [15] "tBodyaccelerometerJerkmeanX"               
## [16] "tBodyaccelerometerJerkmeanY"               
## [17] "tBodyaccelerometerJerkmeanZ"               
## [18] "tBodyaccelerometerJerkstdX"                
## [19] "tBodyaccelerometerJerkstdY"                
## [20] "tBodyaccelerometerJerkstdZ"                
## [21] "tBodygyroscopemeanX"                       
## [22] "tBodygyroscopemeanY"                       
## [23] "tBodygyroscopemeanZ"                       
## [24] "tBodygyroscopestdX"                        
## [25] "tBodygyroscopestdY"                        
## [26] "tBodygyroscopestdZ"                        
## [27] "tBodygyroscopeJerkmeanX"                   
## [28] "tBodygyroscopeJerkmeanY"                   
## [29] "tBodygyroscopeJerkmeanZ"                   
## [30] "tBodygyroscopeJerkstdX"                    
## [31] "tBodygyroscopeJerkstdY"                    
## [32] "tBodygyroscopeJerkstdZ"                    
## [33] "tBodyaccelerometerMagmean"                 
## [34] "tBodyaccelerometerMagstd"                  
## [35] "tGravityaccelerometerMagmean"              
## [36] "tGravityaccelerometerMagstd"               
## [37] "tBodyaccelerometerJerkMagmean"             
## [38] "tBodyaccelerometerJerkMagstd"              
## [39] "tBodygyroscopeMagmean"                     
## [40] "tBodygyroscopeMagstd"                      
## [41] "tBodygyroscopeJerkMagmean"                 
## [42] "tBodygyroscopeJerkMagstd"                  
## [43] "fBodyaccelerometermeanX"                   
## [44] "fBodyaccelerometermeanY"                   
## [45] "fBodyaccelerometermeanZ"                   
## [46] "fBodyaccelerometerstdX"                    
## [47] "fBodyaccelerometerstdY"                    
## [48] "fBodyaccelerometerstdZ"                    
## [49] "fBodyaccelerometermeanFreqX"               
## [50] "fBodyaccelerometermeanFreqY"               
## [51] "fBodyaccelerometermeanFreqZ"               
## [52] "fBodyaccelerometerJerkmeanX"               
## [53] "fBodyaccelerometerJerkmeanY"               
## [54] "fBodyaccelerometerJerkmeanZ"               
## [55] "fBodyaccelerometerJerkstdX"                
## [56] "fBodyaccelerometerJerkstdY"                
## [57] "fBodyaccelerometerJerkstdZ"                
## [58] "fBodyaccelerometerJerkmeanFreqX"           
## [59] "fBodyaccelerometerJerkmeanFreqY"           
## [60] "fBodyaccelerometerJerkmeanFreqZ"           
## [61] "fBodygyroscopemeanX"                       
## [62] "fBodygyroscopemeanY"                       
## [63] "fBodygyroscopemeanZ"                       
## [64] "fBodygyroscopestdX"                        
## [65] "fBodygyroscopestdY"                        
## [66] "fBodygyroscopestdZ"                        
## [67] "fBodygyroscopemeanFreqX"                   
## [68] "fBodygyroscopemeanFreqY"                   
## [69] "fBodygyroscopemeanFreqZ"                   
## [70] "fBodyaccelerometerMagmean"                 
## [71] "fBodyaccelerometerMagstd"                  
## [72] "fBodyaccelerometerMagmeanFreq"             
## [73] "fBodyBodyaccelerometerJerkMagmean"         
## [74] "fBodyBodyaccelerometerJerkMagstd"          
## [75] "fBodyBodyaccelerometerJerkMagmeanFreq"     
## [76] "fBodyBodygyroscopeMagmean"                 
## [77] "fBodyBodygyroscopeMagstd"                  
## [78] "fBodyBodygyroscopeMagmeanFreq"             
## [79] "fBodyBodygyroscopeJerkMagmean"             
## [80] "fBodyBodygyroscopeJerkMagstd"              
## [81] "fBodyBodygyroscopeJerkMagmeanFreq"         
## [82] "angletBodyaccelerometerMeangravity"        
## [83] "angletBodyaccelerometerJerkMeangravityMean"
## [84] "angletBodygyroscopeMeangravityMean"        
## [85] "angletBodygyroscopeJerkMeangravityMean"    
## [86] "angleXgravityMean"                         
## [87] "angleYgravityMean"                         
## [88] "angleZgravityMean"
```

# Output file
The output file from the run_analysis.R script is the resulting tidy data set (from step 5) written to a tab separated text file. It is a 180 column by 88 row table. It contains the average value of each variable (those containing only mean and standard deviation measurements in the UCI HAR Dataset), grouped by activity and subject.  

This file is outputted to the working directory. 


```r
# output the tidy data set using row.names = FALSE
write.table(summarizedData, "tidy.txt", sep="\t", row.names =FALSE)
```

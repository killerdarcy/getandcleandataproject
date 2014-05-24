CodeBook.md
========================================================

##Methodology

The data [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) was extracted and feature names, activity names, and subjects were appended to the
test and training sets.  Then, the test and training sets were combined to create on
data element.  Only mean and standard deviation calculated observations were retained.
Finally, the mean was applied to the grouping of subject and activity to create
the final tidy dataset (tidy_dataset.csv).

##Features

#Subject and Activity

The trial was comprised of 30 subjects who were measured while performing 6 activities:

1. Walking
2. Walking Upstairs
3. Walking Downstairs
4. Sitting
5. Standing
6. Laying

|ID |Name                            |Description                                      |
|:--|:-------------------------------|:------------------------------------------------|
|1	|subject.id                      |The ID of the subject in the study               |
|2	|activity.name                   |The activity the subject was performing          |
|3	|activity.index                  |An index value 1-6 matching to the activity names|

##Formula for understanding the following names

>mean. - In this data, all the names begin with mean. This is indicating that this value is a
mean of all of the observations of this type for each subject and activity that subject
was performing.

The measurements for these features were originally derived from accelerometers and
gyroscopes from 3-axial raw signals tAcc-XYZ and tGyro-XYZ, with XYZ referring to the
three dimensions in space.

#Time-Based or Fast Fourier Transformed

>t. - Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). These 
signals were captured at a constant rate of 50 Hz.

>f. - Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag.

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

#Body vs. Gravity

>body. - the acceleration signal was based on body movement

>gravity. - the acceleration signal was based on gravity

#Linear Acceleration vs. Angular Velocity

>acc.jerk. - jerk derived from accelerometer

>gyro.jerk. - jerk derived from gyroscope

#Magnitude

>mag. - a calucation of the magintude of the three-dimensional signal calculated using the Euclidean norm.

#Direction

>x, y, or z - the one-dimensional direction of the force


|ID |Name                           |
|:--|:-----------------------------:|
|4	|mean.t.body.acc.mean.x         | 
|5	|mean.t.body.acc.mean.y         |
|6	|mean.t.body.acc.mean.z         |
|7	|mean.t.gravity.acc.mean.x      |
|8	|mean.t.gravity.acc.mean.y      |
|9	|mean.t.gravity.acc.mean.z      |
|10	|mean.t.body.acc.jerk.mean.x    |
|11	|mean.t.body.acc.jerk.mean.y    |
|12	|mean.t.body.acc.jerk.mean.z    |
|13	|mean.t.body.gyro.mean.x        |
|14	|mean.t.body.gyro.mean.y        |
|15	|mean.t.body.gyro.mean.z        |
|16	|mean.t.body.gyro.jerk.mean.x   |
|17	|mean.t.body.gyro.jerk.mean.y   |
|18	|mean.t.body.gyro.jerk.mean.z   |
|19	|mean.t.body.acc.mag.mean       |
|20	|mean.t.gravity.acc.mag.mean    |
|21	|mean.t.body.acc.jerk.mag.mean  |
|22	|mean.t.body.gyro.mag.mean      |
|23	|mean.t.body.gyro.jerk.mag.mean |
|24	|mean.f.body.acc.mean.x         |
|25	|mean.f.body.acc.mean.y         |
|26	|mean.f.body.acc.mean.z         |
|27	|mean.f.body.acc.jerk.mean.x    |
|28	|mean.f.body.acc.jerk.mean.y    |
|29	|mean.f.body.acc.jerk.mean.z    |
|30	|mean.f.body.gyro.mean.x        |
|31	|mean.f.body.gyro.mean.y        |
|32	|mean.f.body.gyro.mean.z        |
|33	|mean.f.body.acc.mag.mean       |
|34	|mean.f.body.acc.jerk.mag.mean  |
|35	|mean.f.body.gyro.mag.mean      |
|36	|mean.f.body.gyro.jerk.mag.mean |
|37	|mean.t.body.acc.std.x          |
|38	|mean.t.body.acc.std.y          |
|39	|mean.t.body.acc.std.z          |
|40	|mean.t.gravity.acc.std.x       |
|41	|mean.t.gravity.acc.std.y       |
|42	|mean.t.gravity.acc.std.z       |
|43	|mean.t.body.acc.jerk.std.x     |
|44	|mean.t.body.acc.jerk.std.y     |
|45	|mean.t.body.acc.jerk.std.z     |
|46	|mean.t.body.gyro.std.x         |
|47	|mean.t.body.gyro.std.y         |
|48	|mean.t.body.gyro.std.z         |
|49	|mean.t.body.gyro.jerk.std.x    |
|50	|mean.t.body.gyro.jerk.std.y    |
|51	|mean.t.body.gyro.jerk.std.z    |
|52	|mean.t.body.acc.mag.std        |
|53	|mean.t.gravity.acc.mag.std     |
|54	|mean.t.body.acc.jerk.mag.std   |
|55	|mean.t.body.gyro.mag.std       |
|56	|mean.t.body.gyro.jerk.mag.std  |
|57	|mean.f.body.acc.std.x          |
|58	|mean.f.body.acc.std.y          |
|59	|mean.f.body.acc.std.z          |
|60	|mean.f.body.acc.jerk.std.x     |
|61	|mean.f.body.acc.jerk.std.y     |
|62	|mean.f.body.acc.jerk.std.z     |
|63	|mean.f.body.gyro.std.x         |
|64	|mean.f.body.gyro.std.y         |
|65	|mean.f.body.gyro.std.z         |
|66	|mean.f.body.acc.mag.std        |
|67	|mean.f.body.acc.jerk.mag.std   |
|68	|mean.f.body.gyro.mag.std       |
|69	|mean.f.body.gyro.jerk.mag.std  |


#This is the codebook explaining the code in the run_analysis.R

First:
testing and training data are read and merged in one data set (dat)

Second:
reading the features (features) and choosing only features with mean or std_div
subsetting (dat) to get mean and std_div

Third/Forth:
Naming the columns in (dat) with names from (features)
Reading test and train subjects and merging them in one data set (subjects)
'uSubjects' <- has unique subject numbers in (subject)

Fifth:
'tidayDataSet' <- matrix with 66 columns (# of columns in dat) 
			and 30 rows (# of numbers in uSubject)

Then, the for loop is created to get the averages per subject per activity
'matched' <- vector of subject numbers that equal to the unique subject number in i
'colMean' <- means of columns in corresponding subjects in 'matched'

Finaly, writing the result in txt format.


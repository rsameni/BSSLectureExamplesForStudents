# BSSPackage
Simplified illustration of blind-source separation algorithms

### Student Name: Jiwoong Jason Jeong
### Student Email: jjjeon3@emory.edu
***
### Question 1:
##### Part A and B 
See attached picture 'BMI500_lab11_q1.JPG'
***
### Question 2:
##### Part A
I created a simple power method calculation of the eigenvalues as 
'powerMethod.m'. Using that code, when you run the following:
>> powerMethod([1;1],C,1/100)
you get the eigenvalues to be 3.9069 and 2.4614.

I didn't see that there was a power analysis code provided but it does
the same thing.
##### Part B
See attached figure 'BMI_lab11_q2b.jpg'
***
### Question 3:
##### Part A
###### Ex01
I didn't change the code that much at all other than changing to a 
different example (example 2: SampleECG2) and test turning on or off the
lowpass filter. Example 2 is different from the first example but the 
biggest change was from the lowpass filter. When the lowpass filter was 
removed, the time variant aspect of the signal was not filtered out and the
final plots were not on a uniform/horizontal axis. When the lowpass filter
is on, all plots are normalized/had the time variance removed and was much
easier to see the harmonic signals.
###### Ex02
It was a simple power method of analyzing the eigenvalues so I just changed
the number of channels to 2. As expected, changing the number of channels
changes it to a 2x2 matrix and 2x1 eigenvector. Additionally, the number of
iterations was changed to 1000. The accuracy of the power method increased
as the number of iterations increased, which was expected.
###### Ex03
I only changed the sampling frequency (fs) from 500 to 1000 and the results
were changed as we expected. The signal length was doubled from 1,500 to 
3,000. Other than that, there really wasn't any unexpected changes. I also
changed the g ('pow3', 'tanh', 'gauss', 'skew') and didn't see much
differences between them except for the 'skew' where the signals were very
different. Which seems to indicate that choosing the nonlinearity is fairly
important.
###### Ex04
Ran the code by halving the sampling frequency (fs) from 250 to 125 but did
not see much of a difference if at all which may suggest that the code is
robust to sampling frequency. I did run a second dataset (EEGdata2) but it
was too much for my computer to handle so I stopped it early. However, the
second dataset seemed to look more interesting as there were time variances
within the dataset. JADE seems to be a BSS method or implementation.
###### Ex05
I ran the last example for my ex05. As I understand, denoises the mixed
maternal and fetal signals and then analyzes each based on the different 
components of the signal using different algorithms like JADE. Beyond this,
I did not understand the code very well.
***
### Question 4:
##### Part A
Chosen paper: 
A comparison of PCA, KPCA and ICA for dimensionality 
reduction in support vector machine

Summary: The paper discussed and showed the effectiveness of applying 
different component analyses namely, principal component analysis (PCA), 
kernel principal component analysis (KPCA) and independent component 
analysis (ICA) on a failry simple machine learning model (support vector
machine (SVM)). While machine learning methods extract features, the 
importance of those features may be questionable and sometimes may be 
confounding noise. These component analysis methods allow the extraction
of the most relevant features for the model to analyze and learn for their 
tasks. They have shown in their paper that KPCA performed the best which
makes sense as in deep learning models, convolutional layers with kernels
are used to extract features like edges. As I understand, the KPCA allows
the extraction of specific principle components which can not be linearly
separated. This increases the accuracy of SVM.

As for the pseudo code of the KPCA algorithm, it's pretty much the same as
linear PCA (eigen analysis) but with the addition of the kernel that
converts the data into a "feature space" to perform the linear PCA on.


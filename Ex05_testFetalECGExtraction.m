% Extracting fetal ECG signals using various ICA algorithms
%
% BMI500 Course
% Lecture:  An Introduction to Blind Source Separation and Independent Component Analysis
%           By: R. Sameni
%           Department of Biomedical Informatics, Emory University, Atlanta, GA, USA
%           Fall 2020
%
% Dependency: The open-source electrophysiological toolbox (OSET):
%       https://github.com/alphanumericslab/OSET.git
%   OR
%       https://gitlab.com/rsameni/OSET.git
%

% Uncomment the following lines to run advanced demos
%testPCAICAPiCAfECGExtraction % Call this demo from the OSET package
 %testECGICAPCAPiCAPlot1

% testECGICAPCAPiCAPlot1
 testAveragefECGbyDeflationAndKF
% testICAPiCAAfterMECGCancellation % (using the deflation algorithm + Kalman filter)
% testPCAICAPiCAfECGDenoising % (denoising using BSS and semi-BSS methods)


% this script appears to be using several model estimation techniques to
% fit a polynomial curve onto the the ECG signal.  It allows for an
% interective interpretatatio nof the data which i find quite useful.
% Interestingly enough we can get an ok fit with just 2 parameters to be
% fit producing an error of 1.82% 
% meanwhile for the 
%Zahara Wang zahara.wang@emory.edu
% Independent component analysis using classical methods
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

clc
clear
close all

example = 3;
switch example
    case 1 % A sample EEG from the OSET package
        load EEGdata textdata data % Load a sample EEG signal
        fs = 250;
        x = data'; % make the data in (channels x samples) format
        % Check the channel names
        disp(textdata)
    case 2 % A sample ECG from the OSET package
        load SampleECG2 data % Load a sample ECG signal
        fs = 1000;
        x = data(:, 2:end)'; % make the data in (channels x samples) format
        x = x - LPFilter(x, 1.0/fs); % remove the lowpass baseline
    case 3 % A synthetic signal
        fs = 500;
        len = round(3.0*fs);
        s1 = sin(2*pi*7.0/fs * (1 : len));
        s2 = 2*sin(2*pi*1.3/fs * (1 : len) + pi/7);
        period = 76.0;
        s3 = (mod(1:len, 76.0) - period/2)/(period/2);
        A = rand(3);
        noise = 0.01*randn(3, len);
        x = A * [s1 ; s2 ; s3] + noise;
    otherwise
        error('unknown example');
end

N = size(x, 1); % The number of channels
T = size(x, 2); % The number of samples per channel

approach = "symm"; 
g = "tanh";
lastEigfastica = N; 
numOfIC = N; 
interactivePCA = 'off';
[s_fastica, A_fastica, W_fastica] = fastica(x, 'approach', approach, ...
        'g', g, 'lastEig', lastEigfastica, 'numOfIC', numOfIC, ...
        'interactivePCA', interactivePCA);
    
Cs = cov(s_fastica');

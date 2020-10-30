% Principal component analysis
%
% Melanie Zhao: zhiyue.zhao@emory.edu
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

example = 1;
switch example
    case 1 % Load a sample EEG signal
        load EEGdata textdata data % A sample EEG from the OSET package
        fs = 250;
        x = data'; % make the data in (channels x samples) format
        % Check the channel names
        disp(textdata)
    case 2 % Load a sample ECG signal
        load SampleECG2 data % A sample ECG from the OSET package
        fs = 1000;
        x = data(:, 2:end)'; % make the data in (channels x samples) format
        x = x - LPFilter(x, 1.0/fs); % remove the lowpass baseline
    otherwise
        error('unknown example');
end

N = size(x, 1); % The number of channels
T = size(x, 2); % The number of samples per channel

% plot the channels
% eog1 eog2 eog3-23 24 25 
%ecg 26 
PlotECG(x,4,'b',fs,'Raw Data Channel')

% remove the channel means
x_demeaned=x-mean(x,2) * ones(1,size(x,2));

Cx = cov(x_demeaned');

% eIGENVALUE DECOMPOSITION
[V,D]=eig(Cx,'Vector');


x_var = var(x_demeaned,[],2);
x_var2=diag(Cx);

y=V' * x_demeaned;
Cy= cov(y');
y_var = diag(Cy);


x_total_energy = sum(x_var)
Cx_trace=trace(Cx)
eigenvale_sum=sum(D)
Cy_trace = trace(Cy)

x_partial_energy = 100.0 * cumsum(D(end:-1:1))./x_total_energy


th=99.9;

N_eigs_to_keep = find(x_partial_energy <= th,1,'last')


% first 19 eigenvalue, re compress the x



x_compressed = V(:,N-N_eigs_to_keep +1 :N)* y(N-N_eigs_to_keep + 1 :N,:)






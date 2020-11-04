% Principal component analysis
% Jiwoong Jason Jeong
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

example = 2; % just changed the test example to see the second one.
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
        %x = x - LPFilter(x, 1.0/fs); % remove the lowpass baseline
        %(removed lowpass filter)
    otherwise
        error('unknown example');
end

N = size(x, 1); % The number of channels
T = size(x, 2); % The number of samples per channel

% plot raw data
PlotECG(x,4,'b',fs,'Raw data channels'); 

% remove the mean to make mean = 0
x_demeaned = x - mean(x,2)*ones(1,size(x,2)); 

% getting the covariants of the zero mean data
Cx = cov(x_demeaned'); 

% getting the eigenvectors of the covariants of x
[V,D] = eig(Cx,'vector');

% plotting the eigenvalues
figure
subplot(1,2,1)
plot(D(end:-1:1)) 
grid 
xlabel('Index')
ylabel('Eigenvalues');
title('Eighenvalues in linear scale')
subplot(122)
plot(10*log10(D(end:-1:1)/D(end)) ) 
grid 
xlabel('Index');
ylabel('Eigenvalue ratios in dB')
title('Normalzied eighenvalues in log scale')


x_var = var(x_demeaned,[] ,2 ) %formula 1 
x_var2 = diag(Cx); % formula 2 
% decorrelate the channels 
y = V' * x_demeaned; 
Cy = cov(y'); 
y_var = diag(Cy)

%check total energy match 
x_total_energy = sum(x_var) 
Cx_trace = trace(Cx) 
eigenvale_sum = sum(D) 
Cy_trace = trace(Cy); 

%these values should all be the same as the rotaion doesn't change relative
%distances we are still looking at the same distances. 
x_partial_energy = 100.0 * cumsum(D(end:-1:1))./x_total_energy; 

th = 99.9; 
N_eighs_to_keep = find(x_partial_energy <= th,1,'last') 

x_compressed = V(:,N - N_eighs_to_keep + 1:N)*y(N-N_eighs_to_keep + 1:N,:); 


t = (0: T-1)/fs; 

for ch = 1:N
   figure 
   hold on 
   plot(t,x(ch,:)); 
   plot(t,x_compressed(ch,:));
   legend(['channel ',num2str(ch),'compressed'])
end
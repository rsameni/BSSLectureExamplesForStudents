% The power method for eigenvalue decomposition
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


%note that eigs gives you the first few eigenvectors. i guess we can
%estimate this 
%  i think we have to do power method of slide 57 
%keep doing this to converge onto the eigen vectors 
%  this converges onto the first eigen vector.
close all;
clear
clc;

% Build a random signal
N = 3;
T = 1000;
a = randn(1, N);
x = diag(a) * randn(N, T);
% Cx = x * x';
Cx = cov(x');


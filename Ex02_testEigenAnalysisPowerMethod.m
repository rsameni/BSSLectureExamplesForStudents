% Boyang Bao (bbao5@emory.edu)
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

[V,D] = eig(Cx)

Itr = 100;

v0 = rand(N,1);
v1 = EigenAnalysisPowerMethod(Cx, v0, Itr);
scale1 = (Cx*v1) ./v1;
lambda1 = mean(scale1);

C = Cx - lambda1 * (v1 * v1');
v2 = EigenAnalysisPowerMethod(C, v0, Itr);
scale2 = (Cx*v2)./v2;
lambda2 = mean(scale2);

C = C - mean(lambda2) * (v2 * v2');


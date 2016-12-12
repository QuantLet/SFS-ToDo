% ---------------------------------------------------------------------
% Book:         SFS
% ---------------------------------------------------------------------
% Quantlet:     SFStailGEV
% ---------------------------------------------------------------------
% Description:  SFStailGEV fits Generalized Extreme Value Distribution 
%               to the negative log-returns of portfolio (Bayer, BMW, 
%               Siemens), time period: from 1992-01-01 to 2006-09-21, 
%               and produces QQ-plot and PP-plot.
% ---------------------------------------------------------------------
% Usage:       SFStailGEV 
% ---------------------------------------------------------------------
% Inputs:       None
% ---------------------------------------------------------------------
% Output:       QQ, PP plot with Generalized Extreme Value Distribution.
% ---------------------------------------------------------------------
% Example:      -
% ---------------------------------------------------------------------
% Author:       Barbara Choros 20080709
% ---------------------------------------------------------------------

function SFStailGEV
clc;
close all;
clear all;
a = load('Bay9906_close_2kPoints.txt','-ascii');
b = load('Bmw9906_close_2kPoints.txt','-ascii');
c = load('Sie9906_close_2kPoints.txt','-ascii');
d = a+b+c;
x = log(d(1:end-1))-log(d(2:end));%negative log-returns
T = length(x);
n = 20;
k = T/n;
for j=1:k
    r    = x((j-1)*n+1:j*n);
    z(j) = max(r);
end;
parmhat = gevfit(z);
w       = sort(z);

K     = parmhat(1);%shape parameter
sigma = parmhat(2);%scale parameter
mu    = parmhat(3);%location parameter

t = (1:k)/(k+1);
y = gevinv(t,K,sigma,mu);

hold on
plot(y,y,'r','LineWidth',2)
scatter(w,y,'.')
title('QQ plot, Generalized Extreme Value Distribution')
hold off
%---------------------------------------------------------------------
figure
y = gevcdf(w,K,sigma,mu);
hold on
plot(y,y,'r','LineWidth',2)
scatter(y,t,'.')
title('PP plot, Generalized Extreme Value Distribution')
hold off
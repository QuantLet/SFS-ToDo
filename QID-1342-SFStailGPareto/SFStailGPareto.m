% ---------------------------------------------------------------------
% Book:         SFS
% ---------------------------------------------------------------------
% Quantlet:     SFStailGPareto
% ---------------------------------------------------------------------
% Description:  SFStailGPareto estimates the parameters of Generalized 
%               Pareto Distribution for the negative log-returns of 
%               portfolio (Bayer, BMW, Siemens), time period: from 
%               1992-01-01 to 2006-09-21, and produces QQ-plot and 
%               PP-plot.
% ---------------------------------------------------------------------
% Usage:        -
% ---------------------------------------------------------------------
% Inputs:       None
% ---------------------------------------------------------------------
% Output:       QQ-plot and PP-plot with Generalized Pareto 
%               Distribution.
% ---------------------------------------------------------------------
% Example:      -
% ---------------------------------------------------------------------
% Author:       Barbara Choros 20080709
% ---------------------------------------------------------------------

clc;
close all;
clear all;

a=load('Bay9906_close_2kPoints.txt','-ascii');
b=load('Bmw9906_close_2kPoints.txt','-ascii');
c=load('Sie9906_close_2kPoints.txt','-ascii');
d=a+b+c;

x=log(d(1:end-1))-log(d(2:end));%negative log-returns

n=100;
zb=sort(x);
theta=zb(end-n);
z=zb(end-n+1:end)-theta;
params=gpfit(z);

K=params(1);
sigma=params(2);

t=(1:n)/(n+1);
y= gpinv(t,K,sigma);

hold on
plot(y,y,'r','LineWidth',2)
scatter(z,y,'.')
title('QQ plot, Generalized Pareto Distribution')
hold off
%---------------------------------------------------------------------
figure
y= gpcdf(z,K,sigma);
hold on
plot(y,y,'r','LineWidth',2)
scatter(y,t,'.')
title('PP plot, Generalized Pareto Distribution')
hold off

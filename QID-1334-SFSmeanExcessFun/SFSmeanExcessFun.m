% ---------------------------------------------------------------------
% Book:         
% ---------------------------------------------------------------------
% Quantlet:     SFSmeanExcessFun
% ---------------------------------------------------------------------
% Description:  SFSmeanExcessFun plots the empirical mean excess 
%               function, the mean excess function of generalized 
%               Pareto distribution, the mean excess function of Pareto 
%               distribution with parameter estiamted with Hill 
%               estimator for the negative log-returns of portfolio 
%               (Bayer, BMW, Siemens), time period: from 1992-01-01 to 
%               2006-09-21.
% ---------------------------------------------------------------------
% Usage:        SFSmeanExcessFun
% ---------------------------------------------------------------------
% Inputs:       None
% ---------------------------------------------------------------------
% Output:       Plot of the empirical mean excess function, the mean 
%               excess function of generalized Pareto distribution, the 
%               mean excess function of Pareto distribution with 
%               parameter estiamted with Hill estimator.
% ---------------------------------------------------------------------
% Example:     
% ---------------------------------------------------------------------
% Author:       Barbara Choros 20080730
% ---------------------------------------------------------------------

clc;
close all;

a  = load('Bay9906_close_2kPoints.txt','-ascii');
b  = load('Bmw9906_close_2kPoints.txt','-ascii');
c  = load('Sie9906_close_2kPoints.txt','-ascii');

d  = a+b+c;
x  = log(d(1:end-1))-log(d(2:end));%negative log-returns
n  = length(x)
x  = sort(x,'descend');%from positive losses to negative profits
k  = 100;
x1 = x(1:k,:);

%empirical mean excess function
t = x(1:k+1);%t must be >0
for i=1:length(t)
    y      = x(find( x > t(i)));
    MEF(i) = mean(y-t(i));
end

plot(t,MEF,'Linewidth',1.5)

%mean excess function of generalized Pareto distribution, theorem 18.8
theta  = x(k+1);
z      = x(1:k)-theta;
params = gpfit(z);
K      = params(1)
sigma  = params(2);
gpme   = (sigma+K*(t-mean(t)))./(1-K);

hold on
plot(t,gpme,'k','Linewidth',1.5,'Linestyle',':')

%Hill estimator, mean excess function of Pareto distribution
alphaH = (mean(log(x1))-log(x1(k)))^(-1)
sigmaH = x1(k)*(k/n)^(1/alphaH);
gp1me  = t./(alphaH-1)

plot(t,gp1me,'r','Linewidth',1.5,'Linestyle','--')
title('Mean Excess Functions')
xlabel('u')
ylabel('e(u)')
hold off


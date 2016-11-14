% ---------------------------------------------------------------------
% Book:        SFS
% ---------------------------------------------------------------------
% Quantlet:    SFS_mef_frechet
% ---------------------------------------------------------------------
% Description: SFS_mef_frechet plots the theoretical (red line) and empirical 
%               (blue) Mean excess function e(u) of the Frech�t 
%               distribution with alpha = 2
% ---------------------------------------------------------------------
% Usage:       SFS_mef_frechet
% ---------------------------------------------------------------------
% Inputs:      none
% ---------------------------------------------------------------------
% Output:      Plot of mean excess function for Frechet distriubtion.
% ---------------------------------------------------------------------
% Example:     -
% ---------------------------------------------------------------------
% Author:      Barbara Choros 
% ---------------------------------------------------------------------
% 

% Simulate Frechet Distribution
clear
clc
close all

nsim =  1000;
    urv=rand(nsim,1);
    rv=ones(nsim,1)./((-log(urv)).^(1./2*ones(nsim,1)));
    k =999;
    
% Calculate the empirical mean excess function 
    rv=sort(rv,'descend');
    t =rv(1:k+1);%t must be >0
for i=1:length(t)
    y=rv(find(rv>t(i)));
    MEF(i)=mean(y-t(i));
end
plot(t(3:k+1),MEF(3:k+1),'.','MarkerSize',10);
hold on;
plot(t(3:k+1),t(3:k+1),'LineWidth',2,'Color','r');
title('Plot Mean Excess Function');
xlabel('u');
ylabel('e(u)');
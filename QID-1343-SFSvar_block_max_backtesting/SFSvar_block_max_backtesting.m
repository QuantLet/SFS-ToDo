% ---------------------------------------------------------------------
% Book:         SFS
% ---------------------------------------------------------------------
% Quantlet:     SFSvar_block_max_backtesting
% ---------------------------------------------------------------------
% Description:  SFSvar_block_max_backtesting provides backtesting 
%               results for Value-at-Risk with Block Maxima Model. Refers to exercise 16.9 in SFS.
% ---------------------------------------------------------------------
% Usage:        var_block_max_backtesting(x,y,z,v,h)
% ---------------------------------------------------------------------
% Inputs:       x,y,z - vector of returns
%               v - values of Value at Risk
%               h - size of the window
% ---------------------------------------------------------------------
% Output:       p - number of exceedances for Value at Risk
% ---------------------------------------------------------------------
% Example:      -
% ---------------------------------------------------------------------
% Reference     Franke, J., Haerdle, W. and Hafner, Ch.(2004)
%               Statistics of Financial Markets: An Introduction
% ---------------------------------------------------------------------
% Author:       Barbara Choros, 31.10.2007
% ---------------------------------------------------------------------

%function p=SFSvar_block_max_backtesting
clear;
clc;
close all
x=load('Bay9906_close_2kPoints.txt','-ascii');
y=load('Bmw9906_close_2kPoints.txt','-ascii');
z=load('Sie9906_close_2kPoints.txt','-ascii');
h=250;
v=load('VaR9906_bMax_Portf.txt','-ascii');
p=var_block_max_backtesting(x,y,z,v,h);
title('Block Maxima Model','FontSize',16,'FontWeight','Bold')

    % to save the plot in pdf or png please uncomment next 2 lines:
 % print -painters -dpdf -r600 SFSvar_block_max_backtesting.pdf
 % print -painters -dpng -r600 SFSvar_block_max_backtesting.png



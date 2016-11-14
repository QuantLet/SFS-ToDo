% ---------------------------------------------------------------------
% Book:         SFS
% ---------------------------------------------------------------------
% Quantlet:     SFSvar_pot_backtesting
% ---------------------------------------------------------------------
% Description:  SFSvar_pot_backtesting provides backtesting results for
%               Value at Risk computed with Peaks Over Treshold model 
%               with generalized Pareto distribution.
% ---------------------------------------------------------------------
% Usage:        var_pot_backtesting(x,y,z,v,h)
% ---------------------------------------------------------------------
% Inputs:       x,y,z - vector of returns
%               v - values of Value at Risk
%               h - size of the window
% ---------------------------------------------------------------------
% Output:       p - number of exceedances for Value at Risk
% ---------------------------------------------------------------------
% Result:       Number of exceedances for Value at Risk computed with
%               Peaks Over Treshold model with generalized Pareto
%               distribution.
% ---------------------------------------------------------------------
% Example:      -
% ---------------------------------------------------------------------
% Reference:    McNeil, A. (1999) Extreme Value Theory for Risk Managers
% ---------------------------------------------------------------------
% Author:       Barbara Choros, 14.10.2007
% ---------------------------------------------------------------------


clear;
clc;
close all

x = load('Bay9906_close_2kPoints.txt','-ascii');
y = load('Bmw9906_close_2kPoints.txt','-ascii');
z = load('Sie9906_close_2kPoints.txt','-ascii');

h = 250;
v = load('VaR9906_pot_Portf.txt','-ascii');
p = var_pot_backtesting(x,y,z,v,h)
title('Peaks Over Threshold Model','FontSize',16,'FontWeight','Bold')


    % to save the plot in pdf or png please uncomment next 2 lines:
 % print -painters -dpdf -r600 SFSvar_pot_backtesting.pdf
 % print -painters -dpng -r600 SFSvar_pot_backtesting.png

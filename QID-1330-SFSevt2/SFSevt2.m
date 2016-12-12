% ---------------------------------------------------------------------
% Book:         SFS
% ---------------------------------------------------------------------
% Quantlet:     SFSevt2
% ---------------------------------------------------------------------
% Description:  SFSevt2 generates CDFs for normal distribution of a 
%               pseudo random variable with extreme value (Gumbel, 
%               Frechet and Weibull) and a randomnormal distributed 
%               variable.   
% ---------------------------------------------------------------------
% Usage:        -
% ---------------------------------------------------------------------
% Inputs:       None
% ---------------------------------------------------------------------
% Output:       PP plot.
% ---------------------------------------------------------------------
% Example:      PP plot - 1. Gumbel
%               PP plot - 2. Frechet
%               PP plot - 3. Weibull
% ---------------------------------------------------------------------
% Author:       Juergen Franke 20030501
% ---------------------------------------------------------------------

clear
clc
close all

n = 100;

% Gumbel
gumb1 = gevrnd(0,1,0,100,1);
gumb2 = sort(gumb1);
gumb  = normcdf(gumb2,0,1);

t = (1:n)/(n+1);

hold on
figure(1)
plot(t,t,'r','LineWidth',2)
scatter(gumb,t,'.','b')
hold off
title('PP Plot of Extreme Value - Gumbel')

% Frechet
frec1 = gevrnd(0.5,0.5,1,100,1);
frec2 = sort(frec1);
frec  = normcdf(frec2,0,1);

t = (1:n)/(n+1);

figure(2)
hold on
plot(t,t,'r','LineWidth',2)
scatter(frec,t,'.','b')
hold off
xlim([0 1])
ylim([0 1])
title('PP Plot of Extreme Value - Frechet')

% Weibull
weib1 = gevrnd(-0.5,0.5,-1,100,1);
weib2 = sort(weib1);
weib  = normcdf(weib2,0,1);

t = (1:n)/(n+1);

figure(3)
hold on
plot(t,t,'r','LineWidth',2)
scatter(weib,t,'.','b')
hold off
xlim([0 1])
ylim([0 1])
title('PP Plot of Extreme Value - Weibull')
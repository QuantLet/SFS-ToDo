% ---------------------------------------------------------------------
% Book:        SFS
% ---------------------------------------------------------------------
% Quantlet:    SFSheavytail
% ---------------------------------------------------------------------
% Description: Simulation of 500 random normal (left) and 1.5-stable
%              (right) normal variables with 25% and 75% quantiles 
%              (black lines) and 2.5% and 97.5% quantiles (red lines) 
%              of the distributions.
% ---------------------------------------------------------------------
% Usage:       SFSheavytail
% ---------------------------------------------------------------------
% Inputs:      none
% ---------------------------------------------------------------------
% Output:      Plot of the simulated random normal variables with 
%              different quantiles. 
% ---------------------------------------------------------------------
% Example:     -
% ---------------------------------------------------------------------
% Author:      Barbara Choros
% ---------------------------------------------------------------------
% 
clear
clc
close all
n = 500;
nor = stabrnd(2, 0, 1,0, n, 1);
sta = stabrnd(1.5, 0, 1,0,n, 1);
sumnor = quantile(nor,[.025 .25 .50 .75 .975]);
noru   = sumnor(2)*ones(n,1);
norl   = sumnor(4)*ones(n,1);
noruu   = sumnor(1)*ones(n,1);
norll   = sumnor(5)*ones(n,1);
sumsta = quantile(sta,[.025 .25 .50 .75 .975]);
stau   = sumsta(2)*ones(n,1);
stal   = sumsta(4)*ones(n,1);
stauu   = sumsta(1)*ones(n,1);
stall   = sumsta(5)*ones(n,1);
subplot(1,2,1);
plot(nor,'o')
hold on;
plot(noru,'Color','black','LineWidth',3);
hold on;
plot(norl,'Color','black','LineWidth',3);
hold on;
plot(noruu,'Color','red','LineWidth',3);
hold on;
plot(norll,'Color','red','LineWidth',3);
axis([0  n -10 10])
title('Normal random variables','FontSize',16,'FontWeight','Bold')
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold');
box on

subplot(1,2,2);

plot(sta,'o')
hold on;
plot(stau,'Color','black','LineWidth',3);
hold on;
plot(stal,'Color','black','LineWidth',3);
hold on;
plot(stauu,'Color','red','LineWidth',3);
hold on;
plot(stall,'Color','red','LineWidth',3);
axis([0  n -10 10])
title('1.5 stable random variables','FontSize',16,'FontWeight','Bold')
set(gca,'LineWidth',1.6,'FontSize',16,'FontWeight','Bold');
box on


    
    % to save the plot in pdf or png please uncomment next 2 lines:
% print -painters -dpdf -r600 SFSheavytail.pdf
% print -painters -dpng -r600 SFSheavytail.png

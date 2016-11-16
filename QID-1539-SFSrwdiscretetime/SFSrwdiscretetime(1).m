% ---------------------------------------------------------------------
% Book:        SFS
% ---------------------------------------------------------------------
% Quantlet:    SFSrwdiscretetime
% ---------------------------------------------------------------------
% Description: simulates a random stock price movement based on the 
%	           geometric BM
% ---------------------------------------------------------------------
% Usage:       -
% ---------------------------------------------------------------------
% Inputs:      None
% ---------------------------------------------------------------------
% Output:      plot of simulated log price series
% ---------------------------------------------------------------------
% Example:     -
% ---------------------------------------------------------------------
% Author:       
% ---------------------------------------------------------------------
% SFSrwdiscretetime(250,2000,0.13,0.2,49)
% function  SFSrwdiscretetime(N1,N2,miu, sigma, m) 
%  
N1=250; 
N2=2000;
miu=0.13;
sigma=0.2;
m=49;

i = 0; 
delta1 = 1/N1; 
delta2 = 1/N2;

s1=zeros(N1,1);
s2=zeros(N2,1);

s1(1) = m;  		
s2(1) = m;
while(i<N1)
  i = i+1; 
  seed=normrnd(0,1); 
  %Simulate a geometric brownian motion with dt=delta1.
  d1 = s1(i)* exp((miu - (1/2)*(sigma^2))*delta1 + sigma*sqrt(delta1)*seed); 
  s1(i+1) = d1 ;      
end

i=0;
while(i<N2)
  i = i+1; 
  seed=normrnd(0,1); 
  %Simulate a geometric brownian motion with dt=delta2.
  d2 = s2(i)*exp((miu - (1/2)*(sigma^2))*delta2 + sigma*sqrt(delta2)*seed); 
  s2(i+1) = d2;
end
s1=s1(2:length(s1));
s2=s2(2:length(s2));
x1=[1/N1:1/N1:1];
x2=[1/N2:1/N2:1];


subplot(2,1,1);
plot(x1,s1,'LineWidth',2.5); xlabel('Time'); ylabel('Stock Price'); 
subplot(2,1,2);
plot(x2,s2,'LineWidth',2.5); xlabel('Time'); ylabel('Stock Price');

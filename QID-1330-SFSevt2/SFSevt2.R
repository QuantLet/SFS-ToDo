# ------------------------------------------------------------------------------
# Book:         SFS
# ------------------------------------------------------------------------------
# Quantlet:     SFSevt2
# ------------------------------------------------------------------------------
# Description:  SFSevt2 generates CDFs for normal distribution of a pseudo
#               random variable with extreme value (Gumbel, Frechet and Weibull)
#               and a random normal distributed variable.
# ------------------------------------------------------------------------------
# Usage:        -
# ------------------------------------------------------------------------------
# Inputs:       None
# ------------------------------------------------------------------------------
# Output:       PP plots
# ------------------------------------------------------------------------------
# Example:      PP plot - 1. Gumbel
#               PP plot - 2. Frechet
#               PP plot - 3. Weibull
# ------------------------------------------------------------------------------
# Author:       Lasse Groth 20091013
# ------------------------------------------------------------------------------
 
#Load library
install.packages("QRMlib")
library(QRMlib)
 
#Close all plots and clear variables
graphics.off()
rm(list=ls(all=TRUE))
 
n=100;
 
# Gumbel
gumb1 = rGEV(100, xi=0, mu=0, sigma=1)
gumb2 = sort(gumb1);
gumb  = pnorm(gumb2,0,1);
 
t = (1:n)/(n+1);
 
dev.new()
plot(gumb,t,col="blue",pch=23,bg="blue",xlab=c(""),ylab=c(""))
lines(t,t,type="l",col="red",lwd=2)
title('PP Plot of Extreme Value - Gumbel')
 
# Frechet
frec1 = rGEV(100, xi=0.5, sigma=0.5, mu=1)
frec2 = sort(frec1);
frec  = pnorm(frec2,0,1);
 
t = (1:n)/(n+1);
 
dev.new()
plot(frec,t,col="blue",pch=23,bg="blue",xlab=c(""),ylab=c(""),xlim=c(0,1),ylim=c(0,1))
lines(t,t,type="l",col="red",lwd=2)
title('PP Plot of Extreme Value - Frechet')
 
# Weibull
weib1 = rGEV(100,xi=-0.5,sigma=0.5,mu=-1)
weib2 = sort(weib1)
weib  = pnorm(weib2,0,1)
 
t = (1:n)/(n+1);
 
dev.new()
plot(weib,t,col="blue",pch=23,bg="blue",xlab=c(""),ylab=c(""),xlim=c(0,1),ylim=c(0,1))
lines(t,t,type="l",col="red",lwd=2)
title('PP Plot of Extreme Value - Weibull')
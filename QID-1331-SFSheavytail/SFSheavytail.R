# ------------------------------------------------------------------------------
# Book:        SFS
# ------------------------------------------------------------------------------
# Quantlet:    SFSheavytail
# ------------------------------------------------------------------------------
# Description: Simulation of 500 random normal (left) and 1.5-stable (right)
#              normal variables with 25% and 75% quantiles (black lines and 2.5%
#              and 97.5% quantiles (red lines) of the distributions.
#              Refers to exercise 16.1 in SFS.
# ------------------------------------------------------------------------------
# Usage:       -
# ------------------------------------------------------------------------------
# Inputs:      None
# ------------------------------------------------------------------------------
# Output:      Plot of the simulated normal random variables with different
#              quantiles.
# ------------------------------------------------------------------------------
# Example:     -
# ------------------------------------------------------------------------------
# Author:      Lasse Groth 20091112
# ------------------------------------------------------------------------------
#
 
#Load library
install.packages("QRMlib")
library(QRMlib)
 
#Close all plots and clear variables
graphics.off()
rm(list=ls(all=TRUE))
 
n = 500
 
#Simulate random normal variables and stable normal variable.
nor = rnorm(n,0,1)
sta = rstable(n,1.5,0)
 
#Determine the quantiles
sumnor = quantile(nor,c(.025,.25,.50,.75,.975))
noru   = sumnor[2]*matrix(1,n,1)
norl   = sumnor[4]*matrix(1,n,1)
noruu   = sumnor[1]*matrix(1,n,1)
norll   = sumnor[5]*matrix(1,n,1)
 
sumsta = quantile(sta,c(.025,.25,.50,.75,.975))
stau   = sumsta[2]*matrix(1,n,1)
stal   = sumsta[4]*matrix(1,n,1)
stauu   = sumsta[1]*matrix(1,n,1)
stall   = sumsta[5]*matrix(1,n,1)
 
#Plot the random variables
par(mfrow=c(1,2))
plot(nor,col="Blue",xlim=c(0,n),ylim=c(-10,10),xlab="",ylab="")
title("Normal random variables")
 
lines(noru,col="black",lwd=3)
lines(norl,col="black",lwd=3)
lines(noruu,col="red",lwd=3)
lines(norll,col="red",lwd=3)
 
 
plot(sta,col="Blue",xlim=c(0,n),ylim=c(-10,10),xlab="",ylab="")
title("1.5 stable random variables")
 
lines(stau,col="black",lwd=3)
lines(stal,col="black",lwd=3)
lines(stauu,col="red",lwd=3)
lines(stall,col="red",lwd=3)
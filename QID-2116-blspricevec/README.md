[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **blspricevec** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of QuantLet: blspricevec

Published in: 'Statistics of Financial Markets : Exercises and Solutions'

Description: 'Black Scholes formula for vector inputs, MatLab function needed for SFSstoploss.'

Keywords: 'asset, black-scholes, call, cost, delta, european-option, financial, hedging, option, option-price, price, simulation, stock-price, strategy'

See also: SFSstoploss

Author: Derrick Kanngiesser

Submitted: Mon, December 12 2016 by Monique Reiske

```

### MATLAB Code
```matlab

%Author: Maria Osipenko
function [Call Put] = blspricevec(S,K,r,sigma,tau)
%Black Scholes formula for vector inputs

if tau == 0 
    t = 1;
else
    t = 0;
end

y = (log(S./K)+(r-sigma.^2/2).*tau)/(sigma.*sqrt(tau)+t);

cdfn = normcdf(y+sigma.*sqrt(tau));
    
if t == 0 
    t_l = 1;
else
    t_l = 0;
end 
    
    

    Call = S.*(cdfn.*t_l+t)-K.*exp(-r.*tau).*normcdf(y).*t_l+t;

    Put = K.*exp(-r.*tau).*(normcdf(-y)).*t_l+t-S.*(normcdf(-y-sigma.*sqrt(tau)).*t_l+t);
```

automatically created on 2018-05-28
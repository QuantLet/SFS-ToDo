<div style="margin: 0; padding: 0; text-align: center; border: none;">
<a href="https://quantlet.com" target="_blank" style="text-decoration: none; border: none;">
<img src="https://github.com/StefanGam/test-repo/blob/main/quantlet_design.png?raw=true" alt="Header Image" width="100%" style="margin: 0; padding: 0; display: block; border: none;" />
</a>
</div>

```
Name of QuantLet: SFSvar_pot_backtesting

Published in: Statistics of Financial Markets : Exercises and Solutions

Description: Provides backtesting results for Value at Risk computed with Peaks Over Treshold model with generalized Pareto distribution. Corresponds to exercise 16.9 in SFS.

Keywords: POT, VaR, pareto, portfolio, historical moving window, backtest, backtesting

See also: SFEdenport, SFSevt2, SFSheavytail, SFSmeanExcessFun, SFSportfolio, SFStailGEV, SFStailGPareto, SFStailport, SFSvar_block_max_backtesting, SFSvar_block_max_params, SFSvar_pot_params, SFSvarblockmaxbacktesting

Author: Lasse Groth

Submitted: Sat, October 01 2011 by Awdesch Melzer

Datafile: Bay9906_close_2kPoints.txt, Bmw9906_close_2kPoints.txt, Sie9906_close_2kPoints.txt, VaR9906_pot_Portf.txt

Example: var_pot_backtesting(x,y,z,v,h) where x,y,z are vectors of return; h is the size of the window and v is values of Value at Riskp produces p the number of exceedances for Value at Risk and a

Value-at-Risk estimation at 0.05 level for portfolio: Bayer, BMW, Siemens with size of moving window 250. Backtesting result alpha = 0.0571.

```
<div align="center">
<img src="https://raw.githubusercontent.com/QuantLet/SFS-ToDo/master/QID-1344-SFSvar_pot_backtesting/plotR.png" alt="Image" />
</div>

<div align="center">
<img src="https://raw.githubusercontent.com/QuantLet/SFS-ToDo/master/QID-1344-SFSvar_pot_backtesting/plotm.png" alt="Image" />
</div>


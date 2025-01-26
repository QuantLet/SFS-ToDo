<div style="margin: 0; padding: 0; text-align: center; border: none;">
<a href="https://quantlet.com" target="_blank" style="text-decoration: none; border: none;">
<img src="https://github.com/StefanGam/test-repo/blob/main/quantlet_design.png?raw=true" alt="Header Image" width="100%" style="margin: 0; padding: 0; display: block; border: none;" />
</a>
</div>

```
Name of QuantLet: SFSvar_block_max_backtesting

Published in: Statistics of Financial Markets : Exercises and Solutions

Description: Provides backtesting results for Value-at-Risk with Block Maxima Model. Corresponds to exercise 16.9 in SFS.

Keywords: VaR, backtest, backtesting, block-maxima, portfolio, historical moving window

See also: SFEdenport, SFSevt2, SFSheavytail, SFSmeanExcessFun, SFSportfolio, SFStailGEV, SFStailGPareto, SFStailport, SFSvar_block_max_params, SFSvar_pot_backtesting, SFSvar_pot_params, SFSvarpotbacktesting

Author: Lasse Groth

Submitted: Sat, October 01 2011 by Awdesch Melzer

Datafile: Bay9906_close_2kPoints.txt, Bmw9906_close_2kPoints.txt, Sie9906_close_2kPoints.txt, VaR9906_bMax_Portf.txt

Example: var_block_max_backtesting(x,y,z,v,h) where x,y,z are vectors of return; v is values of Value at Risk and h is size of the window, produces p the number of exceedances for Value at Risk

and this plot of a Value-at-Risk estimation at 0.05 level for portfolio: Bayer, BMW, Siemens with size of moving window 250, size of block 16. Backtesting result alpha = 0:0514.

```
<div align="center">
<img src="https://raw.githubusercontent.com/QuantLet/SFS-ToDo/master/QID-1343-SFSvar_block_max_backtesting/plotR.png" alt="Image" />
</div>

<div align="center">
<img src="https://raw.githubusercontent.com/QuantLet/SFS-ToDo/master/QID-1343-SFSvar_block_max_backtesting/plotm.png" alt="Image" />
</div>


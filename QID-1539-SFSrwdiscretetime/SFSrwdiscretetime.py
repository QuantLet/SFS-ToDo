"""SFSrwdiscretetime: one GBM path on daily and hourly trading grids.

Original QuantLet authors: Weining Wang and Dedy Dwi Prastyo.
Run this file in Spyder (F5) or with Python. Requires NumPy and Matplotlib.
"""

from pathlib import Path

import matplotlib.pyplot as plt
import numpy as np


# %% Parameters: edit these values and run the file in Spyder.
MIU = 0.11             # Expected return per year (GBM drift).
SIGMA = 0.20           # Volatility per year.
M = 49.0               # Initial stock price.
SEED = 1539            # Reproducible example; use None for a new realization.
TRADING_DAYS = 250
HOURS_PER_DAY = 8
OUTPUT_DIR = Path(__file__).resolve().parent


# %% Simulation
def simulate_gbm(miu=MIU, sigma=SIGMA, m=M, seed=SEED):
    """Return daily time/prices and hourly time/prices, including time zero.

    Use the exact GBM solution S(t) = m exp((miu-sigma²/2)t + sigma W(t)).
    A year contains 250 trading days and 2000 trading hours. Daily prices
    are sampled every eight hours from the same Brownian realization.
    """
    if not np.all(np.isfinite([miu, sigma, m])):
        raise ValueError("miu, sigma and m must be finite numbers.")
    if sigma < 0:
        raise ValueError("sigma must be nonnegative.")
    if m <= 0:
        raise ValueError("m must be positive.")

    n_hours = TRADING_DAYS * HOURS_PER_DAY
    dt = 1.0 / n_hours
    rng = np.random.default_rng(seed)
    increments = np.sqrt(dt) * rng.standard_normal(n_hours)
    brownian = np.concatenate(([0.0], np.cumsum(increments)))
    time_hourly = np.linspace(0.0, 1.0, n_hours + 1)
    price_hourly = m * np.exp(
        (miu - 0.5 * sigma**2) * time_hourly + sigma * brownian
    )
    time_daily = time_hourly[::HOURS_PER_DAY].copy()
    price_daily = price_hourly[::HOURS_PER_DAY].copy()
    return time_daily, price_daily, time_hourly, price_hourly


# %% Plotting
def plot_paths(time_daily, price_daily, time_hourly, price_hourly):
    """Create the original two-panel comparison with a common price scale."""
    fig, axes = plt.subplots(
        2, 1, figsize=(10, 8), sharex=True, sharey=True,
        constrained_layout=True, facecolor="none",
    )
    series = (
        (time_daily, price_daily, "Daily sampling · 250 trading days", "#1965A6"),
        (time_hourly, price_hourly, "Hourly sampling · 2000 trading hours", "#C45A25"),
    )
    for ax, (time, price, title, color) in zip(axes, series):
        ax.plot(time, price, color=color, linewidth=3)
        ax.set(title=title, ylabel="Stock price", xlim=(0, 1))
        ax.set_facecolor("none")
        ax.grid(False, which="both")
        ax.spines["top"].set_visible(False)
        ax.spines["right"].set_visible(False)
        ax.tick_params(top=False, right=False)
    axes[-1].set_xlabel("Time (years)")
    fig.suptitle("Geometric Brownian motion · one path, two sampling grids")
    return fig


# %% Run, export and display (also leaves arrays in Spyder's workspace).
if __name__ == "__main__":
    time_daily, price_daily, time_hourly, price_hourly = simulate_gbm()
    fig = plot_paths(time_daily, price_daily, time_hourly, price_hourly)
    OUTPUT_DIR.mkdir(parents=True, exist_ok=True)
    output_file = OUTPUT_DIR / "SFSrwdiscretetime.png"
    fig.savefig(output_file, dpi=300, transparent=True, bbox_inches="tight")
    print(f"Saved transparent plot: {output_file}")
    plt.show()

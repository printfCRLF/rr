library(zoo)
library(xts)
library(PerformanceAnalytics)
library(quantmod)

asset_returns <- edhec
rp <- readRDS("./data/rp_fi_lo_ret.rds")

single_optimization <- function(asset_returns) {
    # Run a single period optimization using random portfolios as the optimization method
    opt <- optimize.portfolio(R = asset_returns, portfolio = port_spec, optimize_method = "random", rp = rp, trace = TRUE)

    # Print the output of the single-period optimization
    print(opt)
}

optimize_with_periodic_rebalancing <- function(asset_returns, rp) {
    # Run the optimization backtest with quarterly rebalancing
    opt_rebal <- optimize.portfolio.rebalancing(R = asset_returns, portfolio = port_spec, optimize_method = "random", rp = rp, trace = TRUE, search_size = 1000, rebalance_on = "quarters", training_period = 60, rolling_window = 60)

    # Print the output of the optimization backtest
    print(opt_rebal)
}

single_optimization(asset_returns)
optimize_with_periodic_rebalancing(asset_returns, rp)


single_optimization <- function() {
    # Run a single period optimization using random portfolios as the optimization method
    opt <- optimize.portfolio(R = asset_returns, portfolio = port_spec, optimize_method = "random", rp = rp, trace = TRUE)

    # Print the output of the single-period optimization
    print(opt)
}

optimize_with_periodic_rebalancing <- function() {
    # Run the optimization backtest with quarterly rebalancing
    opt_rebal <- optimize.portfolio.rebalancing(R = asset_returns, portfolio = port_spec, optimize_method = "random", rp = rp, trace = TRUE, search_size = 1000, rebalance_on = "quarters", training_period = 60, rolling_window = 60)

    # Print the output of the optimization backtest
    print(opt_rebal)
}



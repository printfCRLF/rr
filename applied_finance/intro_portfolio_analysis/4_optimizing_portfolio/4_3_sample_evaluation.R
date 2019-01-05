
split_sample_evaluation <- function() {
    # Create returns_estim 
    returns_estim <- window(returns, start = "1991-01-01", end = "2003-12-31")

    # Create returns_eval
    returns_eval <- window(returns, start = "2004-01-01", end = "2015-12-31")

    # Create vector of max_weights
    max_weights <- rep(0.1, ncol(returns))

    # Create portfolio with estimatioan sample 
    pf_estim <- portfolio.optim(returns_estim, reshigh = max_weights)

    # Create portfolio with evaluation sample
    pf_eval <- portfolio.optim(returns_eval, reshigh = max_weights)

    # Create a scatter plot with evaluation portfolio weights on the vertical axis
    plot(pf_estim$pw, pf_eval$pw)
    abline(a = 0, b = 1, lty = 3)
}

out_of_sample_performance_evaluation <- function() {
    # Create returns_pf_estim
    returns_pf_estim <- Return.portfolio(returns_estim, pf_estim$pw, rebalance_on = "months")

    # Create returns_pf_eval
    returns_pf_eval <- Return.portfolio(returns_eval, pf_estim$pw, rebalance_on = "months")

    # Print a table of your estimation sample returns 
    table.AnnualizedReturns(returns_pf_estim)

    # Print a table of your evaluation sample returns
    table.AnnualizedReturns(returns_pf_eval)
}



split_sample_evaluation()
out_of_sample_performance_evaluation()



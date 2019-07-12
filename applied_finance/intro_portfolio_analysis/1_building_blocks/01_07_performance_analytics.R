library(zoo)
library(xts)
library(PerformanceAnalytics)
library(quantmod)
library(stringr)

# prices <- as.xts(readRDS("./data/aapl_msft.RData"))
wd <- str_trim(getwd())
file_path <- paste(wd, "/intro_portfolio_analysis/data/aapl_msft.RData", sep="")
prices <- as.xts(readRDS(file_path))
colnames(prices) <- c("AAPL", "MSFT")

time_series_of_assest_returns <- function(prices) {
    result <- head(prices)
    print(result)
    result <- tail(prices)
    print(result)

    # Create the variable returns using Return.calculate()  
    returns <- Return.calculate(prices)
    print(head(returns))
    returns <- returns[-1,]
    returns
}

time_series_of_portfolio_returns <- function(returns) {
    # Create the weights
    eq_weights <- c(0.5, 0.5)

    # Create a portfolio using buy and hold
    pf_bh <- Return.portfolio(R = returns, weights = eq_weights)

    # Create a portfolio rebalancing monthly 
    pf_rebal <- Return.portfolio(R = returns, rebalance_on = "months")

    # Plot the time-series
    par(mfrow = c(2, 1), mar = c(2, 4, 2, 2))
    plot.zoo(pf_bh)
    plot.zoo(pf_rebal)

}

time_series_of_weights <- function(returns) {
    # Create the weights
    eq_weights <- c(0.5, 0.5)

    # Create a portfolio using buy and hold
    pf_bh <- Return.portfolio(returns, weights = eq_weights, verbose = TRUE)

    # Create a portfolio that rebalances monthly
    pf_rebal <- Return.portfolio(returns, weights = eq_weights, rebalance_on = "months", verbose = TRUE)

    # Create eop_weight_bh
    eop_weight_bh <- pf_bh$EOP.Weight

    # Create eop_weight_rebal
    eop_weight_rebal <- pf_rebal$EOP.Weight

    # Plot end of period weights
    par(mfrow = c(2, 1), mar = c(2, 4, 2, 2))
    plot.zoo(eop_weight_bh$AAPL)
    plot.zoo(eop_weight_rebal$AAPL)
}

returns <- time_series_of_assest_returns(prices)
time_series_of_portfolio_returns(returns)
# time_series_of_weights(returns)
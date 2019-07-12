library(zoo)
library(xts)
library(PerformanceAnalytics)
library(quantmod)

setwd("E:/IT/github/rr/applied_finance/intro_portfolio_analysis")
sp500 <- as.xts(readRDS("./data/daily_sp500.RData"))
sp500_before2000 <- sp500["1986-01/1999-12"]
rf <- getSymbols("TB1YR", src = "FRED", auto.assign = FALSE)
rf <- rf["1986-01/1999-12"]

exploring_the_monthly_sp500_returns <- function(sp500) {
    sp500_monthly <- to.monthly(sp500)
    sp500_returns <- Return.calculate(sp500_monthly[, 4])
    sp500_returns
}

excess_return_and_sharpe_ratio <- function(rf, sp500_returns) {
    # Compute the annualized risk free rate
    annualized_rf <- (1 + rf) ^ 12 - 1

    # Plot the annualized risk free rate
    plot.zoo(annualized_rf)

    # Compute the series of excess portfolio returns 
    sp500_excess <- sp500_returns - rf

    # Compare the mean of sp500_excess and sp500_returns 
    result <- mean(sp500_excess)
    print(paste("sp500_excess: ", result))
    result <- mean(sp500_returns)
    print(paste("sp500_returns: ", result))

    # Compute the Sharpe ratio
    sp500_sharpe <- mean(sp500_excess) / sd(sp500_returns)
    print(paste("sp500_sharpe: ", sp500_sharpe))
}

annualized_mean_and_volatility <- function(sp500_returns) {
    # Compute the annualized mean
    Return.annualized(sp500_returns, scale = 12)

    # Compute the annualized standard deviation
    StdDev.annualized(sp500_returns, scale = 12)

    # Compute the annualized Sharpe ratio: ann_sharpe
    ann_sharpe <- Return.annualized(sp500_returns, scale = 12) / StdDev.annualized(sp500_returns, scale = 12)

    # Compute all of the above at once using table.AnnualizedReturns()
    table.AnnualizedReturns(sp500_returns, scale = 12)
}

sp500_returns_before2000 <- exploring_the_monthly_sp500_returns(sp500_before2000)
sp500_returns_before2000 <- sp500_returns[-1,]

sp500_returns <- exploring_the_monthly_sp500_returns(sp500)
sp500_returns <- sp500_returns[-1,]

excess_return_and_sharpe_ratio(rf, sp500_returns_before2000)
annualized_mean_and_volatility(sp500_returns)

library(zoo)
library(xts)
library(PerformanceAnalytics)
library(quantmod)

setwd("E:/IT/github/rr/applied_finance/intro_portfolio_analysis")
prices <- as.xts(readRDS("./data/daily_sp500.RData"))

exploring_the_monthly_sp500_returns <- function(sp500) {
    # Convert the daily frequency of sp500 to monthly frequency: sp500_monthly
    sp500_monthly <- to.monthly(sp500)

    # Print the first six rows of sp500_monthly
    head(sp500_monthly, 6)

    # Create sp500_returns using Return.calculate using the closing prices
    sp500_returns <- Return.calculate(sp500_monthly[, 4])

    # Time series plot
    plot.zoo(sp500_returns)

    # Produce the year x month table
    table.CalendarReturns(sp500_returns)
    return(sp500_returns)
}

the_monthly_mean_and_volatility <- function(sp500_returns) {
    sp500_returns <- sp500_returns[-1, ]
    # Compute the mean monthly returns 
    result <- mean(sp500_returns)
    print(result)

    # Compute the geometric mean of monthly returns
    result <- mean.geometric(sp500_returns)
    print(result)

    # Compute the standard deviation
    result <- sd(sp500_returns)
    print(result)
}

sp500_returns <- exploring_the_monthly_sp500_returns(prices)
the_monthly_mean_and_volatility(sp500_returns)
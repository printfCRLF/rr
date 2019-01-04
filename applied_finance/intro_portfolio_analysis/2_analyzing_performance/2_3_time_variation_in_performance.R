library(zoo)
library(xts)
library(PerformanceAnalytics)
library(quantmod)

sp500 <- as.xts(readRDS("./data/daily_sp500.RData"))
sp500_before2000 <- sp500["1986-01/1999-12"]
rf <- getSymbols("TB1YR", src = "FRED", auto.assign = FALSE)
rf <- rf["1986-01/1999-12"]

exploring_the_monthly_sp500_returns <- function(sp500) {
    sp500_monthly <- to.monthly(sp500)
    sp500_returns <- Return.calculate(sp500_monthly[, 4])
    sp500_returns
}

rolling_annualized_mean_and_volatility <- function(sp500_returns, rf) {
    # Calculate the mean, volatility, and sharpe ratio of sp500_returns
    returns_ann <- Return.annualized(sp500_returns, scale = 12)
    sd_ann <- StdDev.annualized(sp500_returns, scale = 12)
    sharpe_ann <- SharpeRatio.annualized(sp500_returns, rf, scale = 12)

    # Plotting the 12-month rolling annualized mean
    chart.RollingPerformance(R = sp500_returns, width = 12, scale = 12, FUN = "Return.annualized")

    # Plotting the 12-month rolling annualized standard deviation
    chart.RollingPerformance(R = sp500_returns, width = 12, scale = 12, FUN = "StdDev.annualized")

    # Plotting the 12-month rolling annualized Sharpe ratio
    chart.RollingPerformance(R = sp500_returns, Rf = rf, width = 12, scale = 12, FUN = "SharpeRatio.annualized")
}

subperiod_performance_analysis <- function(sp500_returns) {
    # Fill in window for 2008
    sp500_2008 <- window(sp500_returns, start = "2008-01-01", end = "2008-12-31")

    # Create window for 2014
    sp500_2014 <- window(sp500_returns, start = "2014-01-01", end = "2014-12-31")

    # Plotting settings
    par(mfrow = c(1, 2), mar = c(3, 2, 2, 2))
    names(sp500_2008) <- "sp500_2008"
    names(sp500_2014) <- "sp500_2014"

    # Plot histogram of 2008
    chart.Histogram(sp500_2008, methods = c("add.density", "add.normal"))

    # Plot histogram of 2014
    chart.Histogram(sp500_2014, methods = c("add.density", "add.normal"))

}

#sp500_returns_before2000 <- exploring_the_monthly_sp500_returns(sp500_before2000)
#sp500_returns_before2000 <- sp500_returns[-1,]
#rolling_annualized_mean_and_volatility(sp500_returns_before2000, rf)

sp500_returns <- exploring_the_monthly_sp500_returns(sp500)
sp500_returns <- sp500_returns[-1,]
subperiod_performance_analysis(sp500_returns)



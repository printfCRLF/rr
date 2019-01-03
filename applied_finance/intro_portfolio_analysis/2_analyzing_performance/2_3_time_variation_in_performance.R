rolling_annualized_mean_and_volatility <- function() {
    # Calculate the mean, volatility, and sharpe ratio of sp500_returns
    returns_ann <- Return.annualized(sp500_returns)
    sd_ann <- StdDev.annualized(sp500_returns)
    sharpe_ann <- SharpeRatio.annualized(sp500_returns, rf)

    # Plotting the 12-month rolling annualized mean
    chart.RollingPerformance(R = sp500_returns, width = 12, FUN = "Return.annualized")

    # Plotting the 12-month rolling annualized standard deviation
    chart.RollingPerformance(R = sp500_returns, width = 12, FUN = "StdDev.annualized")

    # Plotting the 12-month rolling annualized Sharpe ratio
    chart.RollingPerformance(R = sp500_returns, Rf = rf, width = 12, FUN = "SharpeRatio.annualized")
}

subperiod_performance_analysis <- function() {
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



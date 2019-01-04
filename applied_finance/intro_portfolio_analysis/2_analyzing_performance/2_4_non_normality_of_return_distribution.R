library(zoo)
library(xts)
library(PerformanceAnalytics)
library(quantmod)

sp500 <- as.xts(readRDS("./data/daily_sp500.RData"))

exploring_the_monthly_sp500_returns <- function(sp500) {
    sp500_monthly <- to.monthly(sp500)
    sp500_returns <- Return.calculate(sp500_monthly[, 4])
    sp500_returns
}

skewness_and_kurtosis <- function() {
    #  Compute the skewness 
    skewness(sp500_daily)
    skewness(sp500_monthly)

    # Compute the excess kurtosis 
    kurtosis(sp500_daily)
    kurtosis(sp500_monthly)
}

downside_risk_measures <- function() {
    # Calculate the SemiDeviation
    SemiDeviation(sp500_monthly)

    # Calculate the value at risk
    VaR(sp500_monthly, p = 0.05)
    VaR(sp500_monthly, p = 0.025)

    # Calculate the expected shortfall
    ES(sp500_monthly, p = 0.05)
    ES(sp500_monthly, p = 0.025)
}

drawdowns <- function(sp500_monthly) {
    # Table of drawdowns
    result <- table.Drawdowns(sp500_monthly)
    print(result)

    # Plot of drawdowns
    chart.Drawdown(sp500_monthly)

}

#sp500_returns <- exploring_the_monthly_sp500_returns(sp500)
#sp500_returns <- sp500_returns[-1,]

sp500_returns <- Return.calculate(sp500)
drawdowns(sp500_returns)


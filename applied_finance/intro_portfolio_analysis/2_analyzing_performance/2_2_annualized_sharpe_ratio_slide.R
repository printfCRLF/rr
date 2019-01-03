library(zoo)
library(xts)
library(PerformanceAnalytics)
library(quantmod)

sample_returns <- c(-0.02, 0.00, 0.00, 0.06, 0.02, 0.03, -0.01, 0.04)

monthly_sharpe_ratio <- function(returns) {
    arithmetric_mean <- mean(returns)
    print(paste("arithmetric_mean: ", arithmetric_mean))

    geometric_mean <- mean.geometric(returns)
    print(paste("geometric_mean: ", geometric_mean))

    volatility <- sd(returns)
    print(paste("volatility: ", volatility))

    risk_free_rate <- 0.004
    sharpe_ratio <- (arithmetric_mean - risk_free_rate) / volatility;
    print(paste("sharpe ratio: ", sharpe_ratio))
}

annualized_sharpe_ratio <- function(returns) {
    monthly_arithmetric_mean <- mean(returns)
    annualized_arithmetic_mean <- monthly_arithmetric_mean * 12
    annualized_arithmetic_mean2 <- Return.annualized(returns, scale = 12, geometric = FALSE)
    print(paste("monthly_arithmetric_mean: ", monthly_arithmetric_mean))
    print(paste("annualized_arithmetic_mean: ", annualized_arithmetic_mean))
    print(paste("annualized_arithmetic_mean2: ", annualized_arithmetic_mean2))

    monthly_geometric_mean <- mean.geometric(returns)
    annualized_geometric_mean <- prod(1 + returns) ^ (12 / length(returns)) - 1
    annualized_geometric_mean2 <- Return.annualized(returns, scale = 12)
    print(paste("monthly_geometric_mean: ", monthly_geometric_mean))
    print(paste("annualized_geometric_mean: ", annualized_geometric_mean))
    print(paste("annualized_geometric_mean2: ", annualized_geometric_mean2))

    monthly_volatility <- sd(returns)
    annualized_volatility <- monthly_volatility * sqrt(12)
    annualized_volatility2 <- StdDev.annualized(returns, scale = 12)
    print(paste("monthly_volatility: ", monthly_volatility))
    print(paste("annualized_volatility: ", annualized_volatility))
    print(paste("annualized_volatility2: ", annualized_volatility2))

    risk_free_rate <- 0.004
    monthly_sharpe_ratio <- (monthly_arithmetric_mean - risk_free_rate) / monthly_volatility;
    annualized_sharpe_ratio <- monthly_sharpe_ratio * sqrt(12)
    annualized_sharpe_ratio2 <- Return.annualized(returns, scale = 12) / StdDev.annualized(returns, scale = 12)

    dates <- seq(from = as.Date("2000-01-01"), to = as.Date("2000-08-01"), by = "months")
    rf <- xts(rep(risk_free_rate, length(returns)), order.by = dates)
    returns_xts <- xts(x = returns, order.by = dates)
    annualized_sharpe_ratio3 <- SharpeRatio.annualized(returns_xts, rf)

    print(paste("monthly_sharpe ratio: ", monthly_sharpe_ratio))
    print(paste("annualized_sharpe ratio: ", annualized_sharpe_ratio))
    print(paste("annualized_sharpe ratio2: ", annualized_sharpe_ratio2))
    print(paste("annualized_sharpe ratio3: ", annualized_sharpe_ratio3))
}

#monthly_sharpe_ratio(sample_returns)
annualized_sharpe_ratio(sample_returns)



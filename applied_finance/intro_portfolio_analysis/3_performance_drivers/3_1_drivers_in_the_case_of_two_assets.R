library(zoo)
library(xts)
library(PerformanceAnalytics)
library(quantmod)

prices_to_returns <- function(prices) {
    returns <- Return.calculate(prices)
    returns <- returns[-1,]
    returns
}

eq_prices <- as.xts(readRDS("./data/eq_prices.RData"))
returns_equities <- prices_to_returns(eq_prices)
bond_prices <- as.xts(readRDS("./data/bond_prices.RData"))
returns_bonds <- prices_to_returns(bond_prices)

driver2_choice_of_weights <- function(returns_equities, returns_bonds) {
    # Create a grid
    grid <- seq(from = 0, to = 1, by = 0.01)

    # Initialize an empty vector for sharpe ratios
    vsharpe <- rep(NA, times = length(grid))

    # Create a for loop to calculate Sharpe ratios
    for (i in 1:length(grid)) {
        weight <- grid[i]
        preturns <- weight * returns_equities + (1 - weight) * returns_bonds
        vsharpe[i] <- SharpeRatio.annualized(preturns)
    }

    # Plot weights and Sharpe ratio
    plot(y = vsharpe, x = grid, xlab = "Weights", ylab = "Ann. Sharpe ratio")
    abline(v = grid[vsharpe == max(vsharpe)], lty = 3)
}

interpreting_correlation <- function(returns_equities, returns_bonds) {
    # Create a scatter plot
    chart.Scatter(x = returns_bonds, y = returns_equities, xlab = "bond returns", ylab = "equity returns", main = "bond-equity returns")

    # Find the correlation
    cor(returns_bonds, returns_equities)

    # Merge returns_bonds and returns_equities 
    returns <- merge(returns_bonds, returns_equities)

    # Find and visualize the correlation using chart.Correlation
    chart.Correlation(returns)

    # Visualize the rolling estimates using chart.RollingCorrelation
    chart.RollingCorrelation(returns_bonds, returns_equities, width = 24)
}

#driver2_choice_of_weights(returns_equities, returns_bonds)
interpreting_correlation(returns_equities, returns_bonds)



driver2_choice_of_weights <- function() {
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

driver3_correlation_between_assest_returns <- function() {

}

driver2_choice_of_weights()
driver3_correlation_between_assest_returns()


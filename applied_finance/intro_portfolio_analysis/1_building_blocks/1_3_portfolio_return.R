calculation_of_portfolio_returns <- function() {
    # Vector of initial value of the assets
    in_values <- c(1000, 5000, 2000)

    # Vector of final values of the assets
    fin_values <- c(1100, 4500, 3000)

    # Weights as the proportion of total value invested in each assets
    weights <- in_values / sum(in_values)

    # Vector of simple returns of the assets 
    returns <- (fin_values - in_values) / in_values

    # Compute portfolio return using the portfolio return formula
    preturns <- sum(returns * weights)
}









calculation_of_portfolio_returns()

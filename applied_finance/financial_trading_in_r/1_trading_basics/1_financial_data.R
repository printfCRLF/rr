

plotting_financial_data <- function() {
    # Get SPY from yahoo
    getSymbols("SPY",
           from = "2000-01-01",
           to = "2016-06-30",
           src = "yahoo",
           adjust = TRUE)

    # Plot the closing price of SPY
    plot(Cl(SPY))
}

adding_a_moving_average <- function() {
    # Plot the closing prices of SPY
    plot(Cl(SPY))

    # Add a 200-day SMA using lines()
    lines(SMA(Cl(SPY), n = 200), col = "red")
}

plotting_financial_data()
adding_a_moving_average()
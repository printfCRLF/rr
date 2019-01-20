

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


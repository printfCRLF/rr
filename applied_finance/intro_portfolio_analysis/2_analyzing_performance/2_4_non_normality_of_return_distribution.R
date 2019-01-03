
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

drawdowns <- function() {
    # Table of drawdowns
    table.Drawdowns(sp500_monthly)

    # Plot of drawdowns
    chart.Drawdown(sp500_monthly)

}
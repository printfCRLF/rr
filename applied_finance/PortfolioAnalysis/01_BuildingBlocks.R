library(Quandl)
library(xts)
library(zoo)

api_key <- "PzZExr22s64m_hmxHZ_W"
Quandl.api_key(api_key)

weight1 <- function() {
    values <- c(4000, 4000, 2000)
    weights <- values / sum(values)
    weights
}

#weight1()

weight2 <- function() {
    # Define marketcaps
    marketcaps <- c(5, 8, 9, 20, 25, 100, 100, 500, 700, 2000)

    # Compute the weights
    weights <- marketcaps / sum(marketcaps)

    # Inspect summary statistics
    summary(weights)

    # Create a barplot of weights
    barplot(weights)
}

#weight2()

returns1 <- function() {
    in_values <- c(1000, 5000, 2000)
    fin_values <- c(1100, 4500, 3000)

    weights <- in_values / sum(in_values)

    returns <- (fin_values - in_values) / in_values
    preturns <- sum(returns * weights)
}

#print(returns1())

rebalance <- function() {
    aapl <- Quandl("EOD/AAPL", start_date = "2010-01-01", type = "xts")
    aapl <- aapl[, c("Date", "Adj_Close")]
    msft <- Quandl("EOD/MSFT", start_date = "2010-01-01", type = "xts")
    msft <- msft[, c("Date", "Adj_Close")]

    prices <- merge(aapl, msft)
    colnames(prices) <- c("AAPL", "MSFT")

    # Create the variable returns using Return.calculate()  
    returns <- Return.calculate(prices)

    # Print the first six rows of returns. Note that the first observation is NA, because there is no prior price.
    print(head(returns))

    # Remove the first row of returns
    returns <- returns[-1,]

    # Create the weights
    eq_weights <- c(0.5, 0.5)

    # Create a portfolio using buy and hold
    pf_bh <- Return.portfolio(returns, weights = eq_weights, verbose = TRUE)

    # Create a portfolio that rebalances monthly
    pf_rebal <- Return.portfolio(returns, weights = eq_weights, rebalance_on = "months", verbose = TRUE)

    # Create eop_weight_bh
    eop_weight_bh <- pf_bh$EOP.Weight

    # Create eop_weight_rebal
    eop_weight_rebal <- pf_rebal$EOP.Weight

    # Plot end of period weights
    par(mfrow = c(2, 1), mar = c(2, 4, 2, 2))
    plot.zoo(eop_weight_bh$AAPL)
    plot.zoo(eop_weight_rebal$AAPL)
}

rebalance()
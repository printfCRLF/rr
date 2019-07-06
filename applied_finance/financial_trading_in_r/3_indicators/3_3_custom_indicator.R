# Write the calc_RSI_avg function
calc_RSI_avg <- function(price, n1, n2) {

    # RSI 1 takes an input of the price and n1
    RSI_1 <- RSI(price = price, n = n1)

    # RSI 2 takes an input of the price and n2
    RSI_2 <- RSI(price = price, n = n2)

    # RSI_avg is the average of RSI_1 and RSI_2
    RSI_avg <- (RSI_1 + RSI_2) / 2

    # Your output of RSI_avg needs a column name of RSI_avg
    colnames(RSI_avg) <- "RSI_avg"
    return(RSI_avg)
}

# Add this function as RSI_3_4 to your strategy with n1 = 3 and n2 = 4
add.indicator(strategy.st, name = "calc_RSI_avg", arguments = list(price = quote(Cl(mktdata)), n1 = 3, n2 = 4), label = "RSI_3_4")


runPercentRank <- function(x, n = 260, cumulative = FALSE, exact.multiplier = 0.5) {
    x <- try.xts(x, error = as.matrix)
    if (n < 1 || n > NROW(x))
        stop(sprintf("n = %d is outside valid range: [1, %d]",
            n, NROW(x)))
    if (exact.multiplier < 0 || exact.multiplier > 1)
        stop(sprintf("exact.multiplier = %d is outside valid range: [0, 1]",
            exact.multiplier))
    NAs <- sum(is.na(x))
    if (NAs > 0) {
        if (any(is.na(x[-(1:NAs)])))
            stop("Series contains non-leading NAs")
    }
    if (identical(as.integer(n), 1L)) {
        result <- double(NROW(x))
        result[] <- exact.multiplier
    }
    else {
        result <- .Call("ttr_rollPercentRank", x, n, isTRUE(cumulative),
            exact.multiplier, PACKAGE = "TTR")
    }
    reclass(result, x)
}

# Declare the DVO function
DVO <- function(HLC, navg = 2, percentlookback = 126) {

    # Compute the ratio between closing prices to the average of high and low
    ratio <- Cl(HLC) / ((Hi(HLC) + Lo(HLC)) / 2)

    # Smooth out the ratio outputs using a moving average
    avgratio <- SMA(ratio, n = navg)

    # Convert ratio into a 0-100 value using runPercentRank()
    out <- runPercentRank(avgratio, n = percentlookback, exact.multiplier = 1) * 100
    colnames(out) <- "DVO"
    return(out)
}

# Add the DVO indicator to your strategy
add.indicator(strategy = strategy.st, name = "DVO",
              arguments = list(HLC = quote(HLC(mktdata)), navg = 2, percentlookback = 126),
              label = "DVO_2_126")

# Use applyIndicators to test out your indicators
test <- applyIndicators(strategy = strategy.st, mktdata = OHLC(SPY))

# Subset your data between Sep. 1 and Sep. 5 of 2013
test_subset <- test["2013-09-01/2013-09-05"]
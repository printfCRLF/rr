library(PerformanceAnalytics)
data(edhec)
eq_mkt <- edhec$"Equity Market Neutral"

rolling <- function() {
    edhec_years <- split.xts(edhec, f = "years")
    edhec_ytd <- lapply(edhec_years, FUN = cumsum)
    edhec_xts <- do.call(rbind, edhec_ytd)

    print("first 5 observations of edhec")
    print(head(edhec))

    print("cummulative sum of each year")
    print(head(edhec_xts))

    # Use rollapply to calculate the rolling 3 period sd of eq_mkt
    eq_sd <- rollapply(eq_mkt, width = 3, FUN = sd)
    print("3 month standard deviation")
    print(eq_sd)
}

rolling();
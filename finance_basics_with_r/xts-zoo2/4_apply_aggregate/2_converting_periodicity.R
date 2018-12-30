library(PerformanceAnalytics)

usd_eur_csv <- read.csv("USDEUR.csv")
usd_eur <- as.xts(usd_eur_csv)

convert_univariates_to_ohlc <- function() {
    print("Convert to weekly, print length")
    usd_eur_weekly <- to.period(usd_eur, period = "weeks")
    print(length(usd_eur_weekly))

    print("Convert to monthly, print length")
    usd_eur_monthly <- to.period(usd_eur, period = "months")
    print(length(usd_eur_monthly))

    # Convert usd_eur to yearly univariate and assign to usd_eur_yearly
    print("Convert to yearly")
    usd_eur_yearly <- to.period(usd_eur, period = "years", OHLC = FALSE)
    print(usd_eur_yearly)
}

convert_to_lower_frequency <- function() {
    data(edhec)
    #print(str(edhec))

    eq_mkt <- edhec$"Equity Market Neutral"
    #print(str(eq_mkt))

    # Convert eq_mkt to quarterly OHLC
    mkt_quarterly <- to.period(eq_mkt, period = "quarters")
    print(mkt_quarterly)

    # Convert eq_mkt to quarterly using shortcut function
    mkt_quarterly2 <- to.quarterly(eq_mkt, name = "edhec_equity", indexAt = "firstof")
    print(mkt_quarterly2)
}

#convert_univariates_to_ohlc()
convert_to_lower_frequency()


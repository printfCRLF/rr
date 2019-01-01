
handle_missing_values <- function() {
    # fill NA using last observation carried forward
    locf <- na.locf(DGS10)

    # fill NA using linear interpolation
    approx <- na.approx(DGS10)

    # fill NA using spline interpolation
    spline <- na.spline(DGS10)

    # merge into one object
    na_filled <- merge(locf, approx, spline)

    # plot combined object
    plot(na_filled, col = c("black", "red", "green"))
}

visualize_imported_data <- function() {
    # Look at the last few rows of AAPL data
    tail(AAPL)

    # Plot close price
    plot(AAPL$AAPL.Close)

    # Plot adjusted close price
    plot(AAPL$AAPL.Adjusted)
}

cross_reference <- function() {
    # Look at first few rows of aapl_raw
    head(aapl_raw)

    # Look at first few rows of aapl_split
    head(aapl_split_adjusted)

    # Plot difference between adjusted close and split-adjusted close
    plot(Ad(aapl_raw) - Cl(aapl_split_adjusted))

    # Plot difference between volume from the raw and split-adjusted sources
    plot(Vo(aapl_raw) - Vo(aapl_split_adjusted))
}

handle_missing_values()
visualize_imported_data()
cross_reference()


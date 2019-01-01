library(quantmod)

adjust_for_stock_split_and_divident <- function() {
    # Look at first few rows of AAPL
    head(AAPL)

    # Adjust AAPL for splits and dividends
    aapl_adjusted <- adjustOHLC(AAPL)

    # Look at first few rows of aapl_adjusted
    head(aapl_adjusted)
}

download_split_and_dividend_data <- function() {
    # Download AAPL split data
    splits <- getSplits("AAPL")

    # Download AAPL dividend data
    dividends <- getDividends("AAPL")

    # Look at the first few rows of dividends
    head(dividends)

    # Download unadjusted AAPL dividend data
    raw_dividends <- getDividends("AAPL", split.adjust = FALSE)

    # Look at the first few rows of raw_dividends
    head(raw_dividends)
}

adjust_univariate_data_for_splits_and_dividends <- function() {
    # Calculate split and dividend adjustment ratios
    ratios <- adjRatios(splits = splits, dividends = raw_dividends, close = Cl(AAPL))

    # Calculate adjusted close for AAPL
    aapl_adjusted <- Cl(AAPL) * ratios[, "Split"] * ratios[, "Div"]

    # Look at first few rows of Yahoo adjusted close
    head(Ad(AAPL))

    # Look at first few rows of aapl_adjusted
    head(aapl_adjusted)
}

adjust_for_stock_split_and_divident()
download_split_and_dividend_data()
adjust_univariate_data_for_splits_and_dividends()
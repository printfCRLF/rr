library(Quandl)
library(quantmod)

use_quandl_to_download_weekly_returns_data <- function() {
    quandl_codes <- c("CME/CLH2016", "CME/BZH2016")
    # Download quarterly CL and BZ prices
    qtr_price <- Quandl(code = quandl_codes, type = "xts", collapse = c("quarterly"))

    # View the high prices for both series
    Hi(qtr_price)

    # Download quarterly CL and BZ returns
    qtr_return <- Quandl(code = quandl_codes, type = "xts", collapse = c("quarterly"), transform = "rdiff")

    # View the settle price returns for both series
    getPrice(qtr_return, prefer = "Settle")
}


combine_many_instruments_into_one_object <- function() {
    # Call head on each object in data_env using eapply
    data_list <- eapply(data_env, head)

    # Merge all the list elements into one xts object
    data_merged <- do.call(merge, data_list)

    # Ensure the columns are ordered: open, high, low, close
    data_ohlc <- OHLC(data_merged)
}

extract_close_column_from_many_instruments <- function() {
    symbols <- c("AAPL", "MSFT", "IBM")

    # Create new environment
    data_env <- new.env()

    # Load symbols into data_env
    getSymbols(symbols, env = data_env)

    # Extract the close column from each object and combine into one xts object
    close_data <- do.call(merge, eapply(data_env, Cl))

    # View the head of close_data
    head(close_data)
}

#use_quandl_to_download_weekly_returns_data()
#combine_many_instruments_into_one_object()
extract_close_column_from_many_instruments()


library(Quandl)
library(quantmod)


set_a_default_data_source <- function() {
    # Set the default to pull data from Alpha Vantage
    setDefaults(getSymbols, src = "av")

    # Get GOOG data
    getSymbols("GOOG")

    # Verify the data was actually pulled from Alpha Vantage
    str(GOOG)
}

set_default_arguments <- function() {
    # Look at getSymbols.yahoo arguments
    args(getSymbols.yahoo)

    # Set default 'from' value for getSymbols.yahoo
    setDefaults(getSymbols.yahoo, from = "2000-01-01")

    # Confirm defaults were set correctly
    getDefaults("getSymbols.yahoo")
}


set_a_default_data_source()
set_default_arguments()


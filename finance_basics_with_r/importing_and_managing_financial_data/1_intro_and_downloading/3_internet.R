
find_stock_ticker_from_yahoo_finance <- function() {
    symbol <- "PFE"
    getSymbols(symbol)
    head(PFE)
}

oanda <- function() {
    # Create a currency_pair object
    currency_pair <- "GBP/CAD"

    # Load British Pound to Canadian Dollar exchange rate data
    getSymbols(currency_pair, src = "oanda")

    # Examine object using str()
    str(GBPCAD)

    # Try to load data from 190 days ago
    getSymbols(currency_pair, from = Sys.Date() - 190, to = Sys.Date(), src = "oanda")
}

unemployment_rate_from_fred <- function() {
    # Create a series_name object
    series_name <- "UNRATE"

    # Load the data using getSymbols
    getSymbols(series_name, src = "FRED")

    # Create a quandl_code object
    quandl_code <- "FRED/UNRATE"

    # Load the data using Quandl
    unemploy_rate <- Quandl(quandl_code)
}

#find_stock_ticker_from_yahoo_finance()
#oanda()
unemployment_rate_from_fred()

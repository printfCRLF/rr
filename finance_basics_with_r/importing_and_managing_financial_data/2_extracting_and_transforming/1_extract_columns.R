library(Quandl)
library(quantmod)

DC <- getSymbols("DC", src = "RData", extension = "RData", auto.assign = FALSE)
Sys.setenv(TZ = 'GMT')

extract_one_column <- function(DC) {
    head(DC)

    dc_close <- Cl(DC)
    head(dc_close)

    dc_volume <- Vo(DC)
    head(dc_volume)
}

extract_multiple_columns_from_one_instrument <- function(DC) {
    # Extract the high, low, and close columns
    dc_hlc <- HLC(DC)

    # Look at the head of dc_hlc
    head(dc_hlc)

    # Extract the open, high, low, close, and volume columns
    dc_ohlcv <- OHLCV(DC)

    # Look at the head of dc_ohlcv
    head(dc_ohlcv)
}

use_get_price <- function() {
    # Download CME data for CL and BZ as an xts object
    oil_data <- Quandl(code = c("CME/CLH2016", "CME/BZH2016"), type = "xts")

    # Look at the column names of the oil_data object
    colnames(oil_data)

    # Extract the Open price for CLH2016
    cl_open <- getPrice(oil_data, symbol = "CLH2016", prefer = "Open$")

    # Look at January, 2016 using xts' ISO-8601 subsetting
    cl_open["201601"]
}

#extract_one_column(DC)
#extract_multiple_columns_from_one_instrument(DC)
use_get_price()

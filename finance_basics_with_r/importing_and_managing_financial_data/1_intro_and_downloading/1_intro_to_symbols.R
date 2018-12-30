# Load the quantmod package
library(quantmod)

intro_getSymbols <- function() {
    # Import QQQ data from Yahoo! Finance
    getSymbols(Symbols = "QQQ", auto.assign = TRUE)

    # Look at the structure of the object getSymbols created
    str(QQQ)

    # Look at the first few rows of QQQ
    head(QQQ)
}

data_sources <- function() {
    # Import QQQ data from Alpha Vantage
    QQQ <- getSymbols("QQQ", src = "av")
    str(QQQ)

    # Import GDP data from FRED
    GDP <- getSymbols("GDP", src = "FRED")
    str(GDP)
}

make_getSymbols_return_data <- function() {
    # Assign SPY data to 'spy' using auto.assign argument
    spy <- getSymbols("SPY", auto.assign = FALSE)
    str(spy)

    # Assign JNJ data to 'jnj' using env argument
    jnj <- getSymbols("JNJ", env = NULL)
    str(jnj)
}

#intro_getSymbols()
#data_sources()

make_getSymbols_return_data()


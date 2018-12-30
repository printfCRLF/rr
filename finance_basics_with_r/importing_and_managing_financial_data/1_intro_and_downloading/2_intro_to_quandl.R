library(Quandl)

intro_quandl <- function() {
    gdp <- Quandl(code = "FRED/GDP")
    str(gdp)
}

return_data_type <- function() {
    # Import GDP data from FRED as xts
    gdp_xts <- Quandl("FRED/GDP", type = "xts")

    # Look at the structure of gdp_xts
    str(gdp_xts)

    # Import GDP data from FRED as zoo
    gdp_zoo <- Quandl("FRED/GDP", type = "zoo")

    # Look at the structure of gdp_zoo
    str(gdp_zoo)

}






intro_quandl()
return_data_type()


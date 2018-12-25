library(Quandl)

intro_quandl <- function() {
    gdp <- Quandl("FRED/GDP")
    print(str(gdp))

}

quadl_different_data_type <- function() {
    gdp_xts <- Quandl("FRED/GDP", type = "xts")
    print(str(gdp_xts))

    gdp_zoo <- Quandl("FRED/GDP", type = "zoo")
    print(str(gdp_zoo))

}

#intro_quandl()
quadl_different_data_type()

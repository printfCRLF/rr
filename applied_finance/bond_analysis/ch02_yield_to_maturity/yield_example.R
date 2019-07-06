library(Quandl)
library(quantmod)

yield_on_moody_baa_index <- function() {
    baa <- Quandl("FED/RIMLPBAAR_N_M")
    baa_yield <- subset(baa, baa$Date == "2016-09-30")
    baa_yield$Value <- baa_yield$Value / 100
    return(baa_yield)
}

bondprc <- function(p, r, ttm, y) {
    cf <- c(rep(p * r, ttm - 1), p * (1 + r))
    cf <- data.frame(cf)

    cf$t <- as.numeric(rownames(cf))
    cf$pv_factor <- 1 / (1 + y) ^ cf$t
    cf$pv <- cf$cf * cf$pv_factor
    pv <- sum(cf$pv)
    return(pv)
}

plotting_us_treasury_yield <- function() {
    t10yr <- getSymbols(Symbols = "DGS10", src = "FRED", auto.assign = FALSE)
    t10yr <- t10yr["200601/201609"]
    plot(x = index(t10yr), y = t10yr$DGS10,
     xlab = "Date", ylab = "Yield (%)",
     type = "l", col = "red", main = "10-Year US Treasury Yields")
}

#yield <- yield_on_moody_baa_index()
#print(yield)

#v <- bondprc(100, 0.05, 5, yield$Value)
#print(v)

plotting_us_treasury_yield()



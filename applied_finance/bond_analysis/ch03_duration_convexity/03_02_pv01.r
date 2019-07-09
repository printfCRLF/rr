bondprc <- function(p, r, ttm, y) {
    cf <- c(rep(p * r, ttm - 1), p * (1 + r))
    cf <- data.frame(cf)

    cf$t <- as.numeric(rownames(cf))
    cf$pv_factor <- 1 / (1 + y) ^ cf$t
    cf$pv <- cf$cf * cf$pv_factor
    pv <- sum(cf$pv)
    return (pv)
}

# Calculate the PV01
abs(bondprc(p = 100, r = 0.10, ttm = 20, y = 0.1001) 
  - bondprc(p = 100, r = 0.10, ttm = 20, y = 0.10))

abs(bondprc(p = 100, r = 0.10, ttm = 20, y = 0.1002) 
  - bondprc(p = 100, r = 0.10, ttm = 20, y = 0.1001))

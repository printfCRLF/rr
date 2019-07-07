# ----------------------------------------------------------------
# 1 the yield on Moody's Baa index
# Load Quandl package
library(Quandl)

# Obtain Moody's Baa index data
baa <- Quandl("FED/RIMLPBAAR_N_M")

# Identify 9/30/16 yield
baa_yield <- subset(baa, baa$Date == "2016-09-30")

# Convert yield to decimals and view
baa_yield <- baa_yield$Value / 100 
baa_yield

# ----------------------------------------------------------------
# 2 value of the 5% bond using the Baa yield you found
# par value, coupon rate, time to maturity, yield
bondprc <- function(p, r, ttm, y) {
    cf <- c(rep(p * r, ttm - 1), p * (1 + r))
    cf <- data.frame(cf)

    cf$t <- as.numeric(rownames(cf))
    cf$pv_factor <- 1 / (1 + y) ^ cf$t
    cf$pv <- cf$cf * cf$pv_factor
    pv <- sum(cf$pv)
    return (pv)
}

bondprc(p = 100, r = 0.05, ttm = 5, y = 0.0429)

# ----------------------------------------------------------------
# 3 plotting price / yield relationship
# Generate prc_yld
prc_yld <- seq(0.02, 0.40, 0.01)

# Convert prc_yld to data frame
prc_yld <- data.frame(prc_yld)

# Calculate bond price given different yields
for (i in 1:nrow(prc_yld)) {
    prc_yld$price[i] <- bondprc(100, 0.10, 20, prc_yld$prc_yld[i])  
}

# Plot P/YTM relationship
plot(prc_yld,
    type = "l",
    col = "blue",
    main = "Price/YTM Relationship")


# Load Quandl package
library(Quandl)

find_aaa_bond_yield <- function () {
    # Obtain Moody's Aaa yield
    aaa <- Quandl("FED/RIMLPAAAR_N_M")

    # identify yield on September 30, 2016
    aaa_yield <- subset(aaa, aaa$Date == "2016-09-30")

    # Convert yield into decimals
    aaa_yield <- as.numeric(aaa_yield$Value) / 100
    aaa_yield
}

aaa_yield <- find_aaa_bond_yield()

bond_valuation <- function (aaa_yield) {
    # Layout the bond's cash flows
    cf <- c(3, 3, 3, 3, 3, 3, 3, 103)

    # Convert to data.frame
    cf <- data.frame(cf)

    # Add time indicator
    cf$t <- seq(1, 8, 1)

    # Calculate PV factor
    cf$pv_factor <- 1 / (1 + aaa_yield)^cf$t

    # Calculate PV
    cf$pv <- cf$cf * cf$pv_factor

    # Price bond
    sum(cf$pv)
}

bond_valuation(aaa_yield)

cash_flow_generator <- function () {
    # Code cash flow function
    alt_cf <- function(r, p, ttm) {
    c(rep(p * r, ttm - 1), p * (1 + r))
    }

    # Generate cf vector
    alt_cf(r = 0.03, p = 100, ttm = 8)

}

cash_flow_generator()

calculat_duration <- function () {
    # Calculate bond price when yield increases
    px_up <- bondprc(p = 100, r = 0.03, ttm = 8, y = aaa_yield + 0.01)

    # Calculate bond price when yield decreases
    px_down <- bondprc(p = 100, r = 0.03, ttm = 8, y = aaa_yield - 0.01)

    # Calculate duration
    duration <- (px_down - px_up) / (2 * px * 0.01)

    # Calculate percentage effect of duration on price
    duration_pct_change <- -duration * 0.01
    duration_pct_change

    # Calculate dollar effect of duration on price
    duration_dollar_change <- duration_pct_change * px
    duration_dollar_change
}

calculate_convexity <- function () {
    # Calculate convexity measure
    convexity <- (px_up + px_down - 2 * px ) / (px * 0.01 ^ 2)

    # Calculate percentage effect of convexity on price
    convexity_pct_change <- 0.5 * convexity * (0.01) ^ 2
    convexity_pct_change

    # Calculate dollar effect of convexity on price
    convexity_dollar_change <- convexity_pct_change * px
    convexity_dollar_change
}

estimate_price_change <- function () {
    # Estimate price_change
    price_change <- duration_dollar_change + convexity_dollar_change
    price_change

    # Estimate new_price
    new_price <- px + duration_dollar_change + convexity_dollar_change
    new_price
}

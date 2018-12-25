library(purrr)

relational_practice <- function() {
    # Stock prices
    apple <- 48.99
    micr <- 77.93

    # Apple vs Microsoft
    apple > micr

    # Not equals
    apple != micr

    # Dates - today and tomorrow
    today <- as.Date(Sys.Date())
    tomorrow <- as.Date(Sys.Date() + 1)

    # Today vs Tomorrow
    tomorrow < today
}

date <- map(c("2017-01-20", "2017-01-23", "2017-01-24", "2017-01-25"), as.Date)
ibm <- c(170.55, 171.03, 175.90, 178.29)
panera <- c(216.65, 216.06, 213.55, 212.22)

stocks <- data.frame(date, ibm, panera)
colnames(stocks) <- c("date", "ibm", "panera")

vectorized_operations <- function(stocks) {
    stocks$ibm_buy <- stocks$ibm < 175
    stocks$panera_sell <- stocks$panera > 213
    stocks$ibm_vs_panera <- stocks$ibm > stocks$panera

    print(stocks)
}

and_or <- function(stocks) {
    stocks$ibm_buy_range <- stocks$ibm > 171 & stocks$ibm < 176
    stocks$panera_spike <- stocks$panera < 213.20 | stocks$panera > 216.50
    stocks$good_dates <- stocks$date > as.Date("2017-01-21") & stocks$date < as.Date("2017-01-25")

    print(stocks)
}

#relational_practice()
#vectorized_operations(stocks)
and_or(stocks)



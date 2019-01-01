library(quantmod)
library(xts)
library(zoo)

london_idx <- as.POSIXct(c("2010-01-06 06:00:00 GMT", "2010-01-11 16:00:00 GMT", "2010-01-11 19:00:00 GMT", "2010-01-11 20:00:00 GMT",
"2010-01-14 08:00:00 GMT"))

london <- xts(x = 1:5, order.by = london_idx, tzone = "Europe/London")
colnames(london) <- "London"

chicago_idx <- as.POSIXct(c("2010-01-06 00:00:00 CST", "2010-01-11 10:00:00 CST", "2010-01-11 13:00:00 CST", "2010-01-11 14:00:00 CST", "2010-01-14 02:00:00 CST"))
chicago <- xts(x = 1: 5, order.by = chicago_idx)
colnames(chicago) <- "Chicago"

combine_data_that_have_timezones <- function(london, chicago) {
    # Create merged object with a Europe/London timezone
    tz_london <- merge(london, chicago)

    # Look at tz_london structure
    str(tz_london)

    # Create merged object with a America/Chicago timezone
    tz_chicago <- merge(chicago, london)

    # Look at tz_chicago structure
    str(tz_chicago)
}

make_irregular_intra_day_regular <- function() {
    # Create a regular date-time sequence
    regular_index <- seq(as.POSIXct("2010-01-04 09:00"), as.POSIXct("2010-01-08 16:00"), by = "30 min")

    # Create a zero-width xts object
    regular_xts <- xts(, order.by = regular_index)

    # Merge irregular_xts and regular_xts, filling NA with their previous value
    merged_xts <- merge(irregular_xts, regular_xts, fill = na.locf)

    # Subset to trading day (9AM - 4PM)
    trade_day <- merged_xts['T09:00/T16:00']
}

filling_missing_value_by_trading_day <- function() {
    # Split trade_day into days
    daily_list <- split(trade_day, f = "days")

    # Use lapply to call na.locf for each day in daily_list
    daily_filled <- lapply(daily_list, FUN = na.locf)

    # Use do.call to rbind the results
    filled_by_trade_day <- do.call(rbind, daily_filled)
}

aggregate_irregular_intraday_data <- function() {
    # Convert raw prices to 5-second prices
    xts_5sec <- to.period(intraday_xts, period = "seconds", k = 5)

    # Convert raw prices to 10-minute prices
    xts_10min <- to.period(intraday_xts, period = "minutes", k = 10)

    # Convert raw prices to 1-hour prices
    xts_1hour <- to.period(intraday_xts, period = "hours", k = 1)
}

combine_data_that_have_timezones(london, chicago)
make_irregular_intra_day_regular()
filling_missing_value_by_trading_day()
aggregate_irregular_intraday_data()


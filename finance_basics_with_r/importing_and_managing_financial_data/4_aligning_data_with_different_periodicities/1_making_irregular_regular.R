library(xts)
library(zoo)

dates <- as.Date(c("2016-01-02", "2016-01-05", "2016-01-07", "2016-01-11"))
numbers <- c(4, 21, 1, 34)
irregular_xts <- xts(numbers, dates)

create_zero_width_xts <- function(irregular_xts) {
    # Extract the start date of the series
    start_date <- start(irregular_xts)

    # Extract the end date of the series
    end_date <- end(irregular_xts)

    # Create a regular date sequence
    regular_index <- seq(from = start_date, to = end_date, by = "day")

    # Create a zero-width xts object
    regular_xts <- xts(, order.by = regular_index)
    regular_xts
}

regularize <- function(irregular_xts, regular_xts) {
    # Merge irregular_xts and regular_xts
    merged_xts <- merge(irregular_xts, regular_xts)

    # Look at the first few rows of merged_xts
    head(merged_xts)

    # Use the fill argument to fill NA with their previous value
    merged_filled_xts <- merge(irregular_xts, regular_xts, fill = na.locf)

    # Look at the first few rows of merged_filled_xts
    head(merged_filled_xts)
}

regular_xts <- create_zero_width_xts(irregular_xts)
regularize(irregular_xts, regular_xts)


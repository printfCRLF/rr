data <- seq(1, 10)
dates_index <- seq(as.Date("2016-06-02"), length = 10, by = "days")
x <- xts(x = data, order.by = dates_index)
dates = c("2016-06-04", "2016-06-08")

print(x)

row_selection_with_objects <- function(x, dates) {
    print("subsetting x using vector dates")
    result <- x[dates]
    print(result)

    print("subsetting x using dates as POSIXct")
    result <- x[as.POSIXct(dates, tz = "UTC")]
    print(result)
}

update_and_replacement <- function(x, dates) {
    x[dates_index] <- NA
    x["2016-06-09/"] <- 0
    print("verify 2016-06-11 has value 0")
    result <- 0 == x["2016-06-11"]
    print(result)
}

#row_selection_with_objects(x, dates)
update_and_replacement(x, dates)


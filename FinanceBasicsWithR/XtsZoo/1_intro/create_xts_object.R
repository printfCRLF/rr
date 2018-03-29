library(xts)

# xts = matrix + times (as index)
# xts() constructor 
# x - for data and order.by for the index 
# x must be a vector or matrix, 
# order.by is a vector which must be the same length or number of rows as x

first_xts_object <- function() {
    data = rnorm(5)
    dates <- seq(as.Date("2016-01-01"), length = 5, by = "days")
    smith <- xts(x = data, order.by = dates)

    bday <- as.POSIXct("1899-05-08")

    # born = bday creats key-value pairs to hold custom metadata 
    hayek <- xts(x = data, order.by = dates, born = bday)

    print("return core data")
    hayek_core <- coredata(hayek)
    print(hayek_core)

    print("class(hayek_core)")
    print(class(hayek_core))

    print("index(hayek)")
    hayek_index <- index(hayek)
    print(hayek_index)
}

time_based_indices <- function() {
    dates <- as.Date("2016-01-01") + 0:4
    ts_a <- xts(x = c(1, 2, 3, 4, 5), order.by = dates)
    ts_b <- xts(x = c(1, 2, 3, 4, 5), order.by = as.POSIXct(dates))
    result <- ts_a[index(ts_b)]
    print(result)
    result <- ts_b[index(ts_a)]
    print(result)
}


#first_xts_object()
time_based_indices()


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

    hayek_core <- coredata(hayek)
    print(hayek_core)
}

first_xts_object()


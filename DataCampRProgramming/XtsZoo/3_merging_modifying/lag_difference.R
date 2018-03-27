
x_data = seq(5, 9)
x_index = as.Date("2018-03-22") + 0:4
x <- xts(x = x_data, order.by = x_index)
colnames(x) <- "x"

combine_leading_lagging_time_series <- function() {
    lead_x <- lag(x, k = -1)
    lag_x <- lag(x, k = 1)
    z <- merge.xts(lead_x, x, lag_x)
    print(z)
}

diff_example <- function() {
    airpass_csv <- read.csv("AirPass.csv")
    AirPass <- as.xts(airpass_csv)
    # Calculate the first difference of AirPass using lag and subtraction
    diff_by_hand <- AirPass - lag(AirPass)

    # Use merge to compare the first parts of diff_by_hand and diff(AirPass)
    merge.xts(head(diff_by_hand), head(diff(AirPass)))

    # Calculate the first order 12 month difference of AirPass
    diff.xts(AirPass, lag = 12, differences = 1)
    
}

#combine_leading_lagging_time_series()
diff_example()


right_here_right_now <- function() {
    
    today = Sys.Date()
    result <- unclass(today)
    print(result)

    now = Sys.time()
    result <- unclass(now)
    print(result)
}

create_format_dates <- function() {
    # Definition of character strings representing dates
    str1 <- "May 23, '96"
    str2 <- "2012-03-15"
    str3 <- "30/January/2006"

    # Convert the strings to dates: date1, date2, date3
    date1 <- as.Date(str1, format = "%b %d, '%y")
    date2 <- as.Date(str2)
    date3 <- as.Date(str3, format = "%d/%B/%Y")


    # Convert dates to formatted strings
    format(date1, "%A")
    format(date2, "%d")
    format(date3, "%b %Y")
}

create_format_times <- function() {
    str1 <- "May 23, '96 hours:23 minutes:01 seconds:45"
    str2 <- "2012-3-12 14:23:08"

    time1 <- as.POSIXct(str1, format = "%B %d, '%y hours:%H minutes:%M seconds:%S")
    time2 <- as.POSIXct(str2)

    result <- format(time1, "%M")
    print(result)
    result <- format(time2, "%I:%M %p")
    print(result)
}

calculation_with_dates <- function() {    
    day1 <- as.Date("2018-03-06")
    day2 <- as.Date("2018-03-08")
    day3 <- as.Date("2018-03-13")
    day4 <- as.Date("2018-03-19")
    day5 <- as.Date("2018-03-24")
    print(day5 - day1)

    pizza <- c(day1, day2, day3, day4, day5)
    day_diff = diff(pizza)
    mean <- mean(day_diff)
    print(mean)

}

#right_here_right_now()
#create_format_dates()
#create_format_times()
calculation_with_dates()


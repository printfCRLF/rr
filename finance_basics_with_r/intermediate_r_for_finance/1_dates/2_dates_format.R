
date_formats1 <- function() {
    # "08,30,30"
    as.Date("08,30,1930", format = "%m,%d,%Y")

    # "Aug 30,1930"
    as.Date("Aug 30,1930", format = "%b %d,%Y")

    # "30aug1930"
    as.Date("30aug1930", format = "%d%b%Y")
}

date_formats2 <- function() {
    # char_dates
    char_dates <- c("1jan17", "2jan17", "3jan17", "4jan17", "5jan17")

    # Create dates using as.Date() and the correct format 
    dates <- as.Date(char_dates, "%d%b%y")

    # Use format() to go from "2017-01-04" -> "Jan 04, 17"
    format(dates, "%b %d, %y")

    # Use format() to go from "2017-01-04" -> "01,04,2017"
    format(dates, "%m,%d,%Y")

}

subtraction_of_dates <- function() {
    # Dates
    dates <- as.Date(c("2017-01-01", "2017-01-02", "2017-01-03"))

    # Create the origin
    origin <- as.Date("1970-01-01")

    # Use as.numeric() on dates
    as.numeric(dates)

    # Find the difference between dates and origin
    dates - origin
}

weekdays_quarters <- function() {
    # dates
    dates <- as.Date(c("2017-01-02", "2017-05-03", "2017-08-04", "2017-10-17"))

    # Extract the months
    months(dates)

    # Extract the quarters
    quarters(dates)

    # dates2
    dates2 <- as.Date(c("2017-01-02", "2017-01-03", "2017-01-04", "2017-01-05"))

    # Assign the weekdays() of dates2 as the names()
    names(dates2) <- weekdays(dates2)

    # Print dates2
    print(dates2)
}


#date_formats1()
#date_formats2()
#subtraction_of_dates()
weekdays_quarters()


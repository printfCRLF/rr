
what_day_is_it <- function() {
    # What is the current date?
    Sys.Date()

    # What is the current date and time?
    Sys.time()

    # Create the variable today
    today <- Sys.Date()


    # Confirm the class of today
    class(today)
}

from_char_to_date <- function() {
    # Create crash
    crash <- as.Date("2008-09-29")

    # Print crash
    print(crash)

    # crash as a numeric
    as.numeric(crash)

    # Current time as a numeric
    as.numeric(Sys.time())

    # Incorrect date format
    as.Date("09/29/2008")

}

many_dates <- function() {
    # Create dates from "2017-02-05" to "2017-02-08" inclusive.
    dates <- c("2017-02-05", "2017-02-06", "2017-02-07", "2017-02-08")

    # Add names to dates
    names(dates) <- c("Sunday", "Monday", "Tuesday", "Wednesday")

    # Subset dates to only return the date for Monday
    dates["Monday"]
}

what_day_is_it()
from_char_to_date()
many_dates()



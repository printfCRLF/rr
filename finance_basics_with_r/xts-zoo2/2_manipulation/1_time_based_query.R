data(edhec, package = "PerformanceAnalytics")

video <- function() {
    # One & two sided intervals
    head(edhec["2007-01",])

    head(edhec["2007-01/2007-03", 1])

    # Truncated dates
    head(edhec["200701/03", 3])

    # Time support
    iday["20160808T2213"]

    #Repeating intraday intervals 
    iday["T05:30/T06:30"]
}

querying_for_dates <- function(x) {
    # Select all of 2016 from x
    x_2016 <- x["2016"]

    # Select January 1, 2016 to March 22, 2016
    jan_march <- x["2016/2016-03-22"]

    # Verify that jan_march contains 82 rows
    82 == length(jan_march)
}

intraday <- function(irret) {
    # Extract all data from irreg between 8AM and 10AM
    morn_2010 <- irreg["T08:00/T10:00"]

    # Extract the observations in morn_2010 for January 13th, 2010
    morn_2010["2010-01-13"]
}
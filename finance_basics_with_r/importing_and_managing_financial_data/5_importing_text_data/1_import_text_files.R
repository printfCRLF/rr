library(quantmod)

import_well_formatted <- function() {
    getSymbols("AMZN", src = "csv")
    str(AMZN)
}

import_using_zoo <- function() {
    # Import AMZN.csv using read.zoo
    amzn_zoo <- read.zoo("AMZN.csv", sep = ",", header = TRUE)

    # Convert to xts
    amzn_xts <- as.xts(amzn_zoo)

    # Look at the first few rows of amzn_xts
    result <- head(amzn_xts)
    print(result)
}

handle_date_and_time_in_seperate_columns <- function() {
    # Read data with read.csv
    une_data <- read.csv("UNE.csv", nrows = 5)

    # Look at the structure of une_data
    result <- str(une_data)
    print(result)

    # Read data with read.zoo, specifying index columns
    une_zoo <- read.zoo("UNE.csv", index.column = c("Date", "Time"), sep = ",", header = TRUE)

    # Look at first few rows of data
    result <- head(une_zoo)
    print(result)
}

read_text_file_containing_multiple_symbols <- function() {
    # Read data with read.csv
    two_symbols_data <- read.csv("two_symbols.csv", nrows = 5)

    # Look at the structure of two_symbols_data
    result <- str(two_symbols_data)
    print(result)
    # Read data with read.zoo, specifying index columns
    two_symbols_zoo <- read.zoo("two_symbols.csv", split = c("Symbol", "Type"), sep = ",", header = TRUE)

    # Look at first few rows of data
    result <- head(two_symbols_zoo)
    print(result)
}

#import_well_formatted()
#import_using_zoo()
#handle_date_and_time_in_seperate_columns()
read_text_file_containing_multiple_symbols()
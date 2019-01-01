library(Quandl)
library(quantmod)

access_object_using_get <- function() {
    # Load BRK-A data
    getSymbols("BRK-A")

    # Use backticks and head() to look at the loaded data
    head(`BRK-A`)

    # Use get() to assign the BRK-A data to an object named BRK.A
    BRK.A <- get("BRK-A")
}

create_valid_names <- function() {
    # Create BRK.A object
    BRK.A <- getSymbols("BRK-A", auto.assign = FALSE)

    # Create col_names object with the column names of BRK.A
    col_names <- colnames(BRK.A)

    # Set BRK.A column names to syntactically valid names
    colnames(BRK.A) <- make.names(col_names)
}


create_valid_names_for_multiple_instruments <- function() {
    # Set name for BRK-A to BRK.A
    setSymbolLookup(BRK.A = list(name = "BRK-A"))

    # Set name for T (AT&T) to ATT
    setSymbolLookup(ATT = list(name = "T"))

    # Load BRK.A and ATT data

    getSymbols(c("BRK.A", "ATT"))
}



access_object_using_get()
create_valid_names()
create_valid_names_for_multiple_instruments()


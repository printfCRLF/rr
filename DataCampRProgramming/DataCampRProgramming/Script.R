
useApplyWithBuiltInFunction <- function() {

    # The vector pioneers has already been created for you
    pioneers <- c("GAUSS:1777", "BAYES:1702", "PASCAL:1623", "PEARSON:1857")

    # Split names from birth year
    split_math <- strsplit(pioneers, split = ":")

    # Convert to lowercase strings: split_low
    split_low <- lapply(split_math, tolower)

    # Take a look at the structure of split_low
    str(split_low)
}

applyAndAnynomousFunction <- function() {
    pioneers <- c("GAUSS:1777", "BAYES:1702", "PASCAL:1623", "PEARSON:1857")
    split <- strsplit(pioneers, split = ":")
    split_low <- lapply(split, tolower)

    # transform by selecting the first element in using anonymous function 
    names <- lapply(split_low, function(x) { x[1] })
    str(names)

    years <- lapply(split_low, function(x) { x[2] })
    str(years)
}

#useApplyWithBuiltInFunction()
applyAndAnynomousFunction()

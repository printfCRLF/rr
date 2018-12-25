# lapply() stands for list apply 
# it applies a function over a list of vector

pioneers <- c("GAUSS:1777", "BAYES:1702", "PASCAL:1623", "PEARSON:1857")
split <- strsplit(pioneers, split = ":")

useApplyWithBuiltInFunction <- function() {
    # Split names from birth year
    split_math <- strsplit(pioneers, split = ":")

    # Convert to lowercase strings: split_low
    split_low <- lapply(split_math, tolower)

    # Take a look at the structure of split_low
    str(split_low)
}

applyAndAnynomousFunction <- function() {
    split_low <- lapply(split, tolower)
    # transform by selecting the first element in using anonymous function 
    names <- lapply(split_low, function(x) { x[1] })
    str(names)

    years <- lapply(split_low, function(x) { x[2] })
    str(years)
}


applyWithAdditionalArguments <- function() {
    select_el <- function(x, index) {
        x[index]
    }

    names <- lapply(split_low, select_el, 1)
    str(names)

    years <- lapply(split_low, select_el, 2)
    str(years)
}


#useApplyWithBuiltInFunction()
#applyAndAnynomousFunction()
applyWithAdditionalArguments()

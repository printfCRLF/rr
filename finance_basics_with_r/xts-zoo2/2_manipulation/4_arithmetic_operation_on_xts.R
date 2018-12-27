dates <- as.Date("2015-01-24") + 0:2

a <- xts(x = c(1, 1, 1), order.by = dates)
b <- xts(x = c(2), order.by = as.Date("2015-01-24"))

arithmetic_operation <- function(a, b) {
    print("a + b")
    print(a + b)

    print("a +  as.numeric(b)")
    print(a + as.numeric(b))
}

merge_example <- function() {
    # Add a to b, and fill all missing rows of b with 0
    result <- a + merge.xts(b, index(a), fill = 0)
    print(result)

    # Add a to b and fill NAs with the last observation
    result <- a + merge.xts(b, index(a), fill = na.locf)
    print(result)
}

#arithmetic_operation()
merge_example()

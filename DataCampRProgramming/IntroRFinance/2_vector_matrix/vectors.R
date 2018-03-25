
combine_example <- function() {
    # a vector can only be constructed using one data type

    ibm_stock <- c(159.82, 160.02, 159.84)
    finance <- c("stocks", "bonds", "investments")
    logic <- c(TRUE, FALSE, TRUE)

}

coerce_it <- function() {
    # lower ranking types will be coerced into higher ranking ones
    # logical < integer < numeric < character
    a <- c(1L, "I am a character")
    b <- c(TRUE, "Hello")
    c <- c(FALSE, 2)
    print(a)
    print(b)
    print(c)
}

names <- function() {
    ret <- c(5, 2, 3, 7, 8, 3, 5, 9, 1, 4, 6, 3)
    months <- c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")

    names(ret) <- months
    print(ret)
}

plotting <- function() {
    apple_stock <- c(109.49, 109.90, 109.11, 109.95, 111.03, 112.12, 113.95, 113.30, 115.19, 115.19, 115.82, 115.97, 116.64, 116.95, 117.06, 116.29, 116.52, 117.26, 116.76, 116.73, 115.82)

    # passing a vector to the parameter function will add the vector's value to the y-axis
    plot(apple_stock)
    plot(apple_stock, type = "l")
}


#combine_example()
#coerce_it()
#names()
plotting()
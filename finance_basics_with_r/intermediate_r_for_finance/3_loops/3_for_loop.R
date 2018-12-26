loop_over_a_vector <- function() {
    seq <- c(1:10)

    for (value in seq) {
        print(value)
    }

    sum <- 0
    for (value in seq) {
        sum <- sum + value
        print(sum)
    }

}

loop_over_dataframe <- function() {
    # Loop over stock rows
    for (row in 1:nrow(stock)) {
        price <- stock[row, "apple"]
        date <- stock[row, "date"]

        if (price > 116) {
            print(paste("On", date,
                    "the stock price was", price))
        } else {
            print(paste("The date:", date,
                    "is not an important day!"))
        }
    }

}

loop_over_matrix <- function() {
    # Print out corr


    # Create a nested loop
    for (row in 1:nrow(corr)) {
        for (col in 1:ncol(corr)) {
            print(paste(colnames(corr)[col], "and", rownames(corr)[row],
                    "have a correlation of", corr[row, col]))
        }
    }
}

break_and_next <- function() {
    # Print apple
    print(apple)

    # Loop through apple. Next if NA. Break if above 117.
    for (value in apple) {
        if (is.na(value)) {
            print("Skipping NA")
            next
        }

        if (value > 117) {
            print("Time to sell!")
            break
        } else {
            print("Nothing to do here!")
        }
    }
}

loop_over_a_vector()



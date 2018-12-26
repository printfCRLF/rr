repeat_loop <- function() {
    # Stock price
    stock_price <- 126.34

    repeat {
        # New stock price
        stock_price <- stock_price * runif(1, .985, 1.01)
        print(stock_price)

        # Check
        if (stock_price < 125) {
            print("Stock price is below 124.5! Buy it while it's cheap!")
            break
        }
    }
}

when_to_break <- function() {
    # Stock price
    stock_price <- 67.55

    repeat {
        # New stock price
        stock_price <- stock_price * .995
        print(stock_price)

        # Check
        if (stock_price < 66) {
            print("Stock price is below 66! Buy it while it's cheap!")
            break
        }

    }

}

#repeat_loop()
when_to_break()



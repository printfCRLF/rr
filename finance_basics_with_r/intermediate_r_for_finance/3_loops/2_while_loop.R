while_with_print <- function() {
    # Initial debt
    debt <- 5000

    # While loop to pay off your debt
    while (debt > 0) {
        debt <- debt - 500
        print(paste("Debt remaining", debt))
    }
}

while_with_plot <- function() {
    debt <- 5000 # initial debt
    i <- 0 # x axis counter
    x_axis <- i # x axis
    y_axis <- debt # y axis

    # Initial plot
    plot(x_axis, y_axis, xlim = c(0, 10), ylim = c(0, 5000))

    # Graph your debt
    while (debt > 0) {

        # Updating variables
        debt <- debt - 500
        i <- i + 1
        x_axis <- c(x_axis, i)
        y_axis <- c(y_axis, debt)

        # Next plot
        plot(x_axis, y_axis, xlim = c(0, 10), ylim = c(0, 5000))
    }
}

break_it <- function() {
    # debt and cash
    debt <- 5000
    cash <- 4000

    # Pay off your debt...if you can!
    while (debt > 0) {
        debt <- debt - 500
        cash <- cash - 500
        print(paste("Debt remaining:", debt, "and Cash remaining:", cash))

        if (cash == 0) {
            print("You ran out of cash!")
            break
        }
    }
}

#while_with_print()
#while_with_plot()
break_it()
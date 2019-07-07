

computing_bond_future_value <- function() {
    pv <- 100
    r <- 0.10
    fv1 <- pv * (1 + r)
    fv2 <- pv * (1 + r) ** 2
    print(fv2)
}

computing_bond_present_value <- function() {
    fv1 <- 110
    fv2 <- 121
    r <- 0.10
    pv1 <- fv1 / (1 + r)
    pv2 <- fv2 / (1 + r) ** 2
    print(pv1)
    print(pv2)
}

#computing_bond_future_value()
computing_bond_present_value();



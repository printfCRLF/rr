

big_x <- function(df, threshold) {
    # Write a check for x not being in df
    if (!is.element("x", colnames(df))) {
        stop("df must contain variable called x")
    }

    # Write a check for threshold being in df
    if (is.element("threshold", colnames(df))) {
        stop("df must not contain variable called threshold")
    }

    dplyr::filter(df, x > threshold)
}



errors <- c(1.9, -2.6, 4.0, -9.5, -3.4, 7.3)

mathematical_utilities <- function() {
    result <- sum(abs(round(errors)))
    print(result)
}

find_the_error <- function() {
    # Don't edit these two lines
    vec1 <- c(1.5, 2.5, 8.4, 3.7, 6.3)
    vec2 <- rev(vec1)

    # Fix the error
    result <- mean(c(abs(vec1), abs(vec2)))
    print(result)
}

data_utilities <- function() {
    # The linkedin and facebook lists have already been created for you
    linkedin <- list(16, 9, 13, 5, 2, 17, 14)
    facebook <- list(17, 7, 5, 16, 8, 13, 14)

    # Convert linkedin and facebook to a vector: li_vec and fb_vec
    li_vec <- as.vector(linkedin)
    fb_vec <- as.vector(facebook)

    # Append fb_vec to li_vec: social_vec
    social_vec = append(li_vec, fb_vec)

    # Sort social_vec
    result <- sort(unlist(social_vec), decreasing = TRUE)
    print(result)
}

find_the_error2 <- function() {
    result <- rep(seq(1, 7, by = 2), times = 7)
    print(result)
}

best_gauss_using_r <- function() {
    seq1 <- seq(1, 500, 3)
    seq2 <- seq(1200, 900, -7)

    result <- sum(seq1) + sum(seq2)
    print(result)
}

#mathematical_utilities()
#find_the_error()
#data_utilities()
best_gauss_using_r()
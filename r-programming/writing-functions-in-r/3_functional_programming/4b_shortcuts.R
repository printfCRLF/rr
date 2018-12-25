data(mtcars)
head(mtcars, 6)
cyl <- split(mtcars, mtcars$cyl)

solving_simple_problem_first <- function() {
    str(cyl)
    four_cyls <- cyl[[1]]
    lm(mpg ~ wt, four_cyls)
}

solving_simple_problem_first()

use_anonymous_function <- function() {
    fit_reg <- function(df) {
        lm(mpg ~ wt, data = df)
    }

    map(cyl, fit_reg)

    # Rewrite to call an anonymous function
    map(cyl, function(df) lm(mpg ~ wt, df))

    # Rewrite to use the formula shortcut instead
    map(cyl, ~ lm(mpg ~ wt, data = .))

    # Save the result from the previous exercise to the variable models
    models <- map(cyl, ~ lm(mpg ~ wt, data = .))
    # Use map and coef to get the coefficients for each model: coefs
    coefs <- map(models, coef)
    # Use string shortcut to extract the wt coefficient 
    map(coefs, "wt")

    # use map_dbl with the numeric shortcut to pull out the second element
    map_dbl(coefs, 2)

   
}

pipes <- function() {
    # Define models (don't change)
    models <- mtcars %>%
    split(mtcars$cyl) %>%
    map(~lm(mpg ~ wt, data = .))

    # Rewrite to be a single command using pipes 
    summaries <- map(models, summary)
    map_dbl(summaries, "r.squared")

    map(models, summary) %>%
    map_dbl("r.squared")
}

pipes()

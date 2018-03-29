library(quantmod)

intro <- function() {
    getSymbols(Symbols = "QQQ", auto.assign = TRUE)
    s <- str(QQQ)
    print(s)
    h <- head(QQQ)
    print(h)

}

data_sources <- function() {
    #getSymbols("QQQ", src = "google")
    #str(QQQ)

    getSymbols("GDP", src = "FRED")
    str(GDP)

}

turn_off_autoassign <- function() {
    spy <- getSymbols("SPY", auto.assign = FALSE)
    str(spy)
    jnj <- getSymbols("JNJ", env = NULL)
    str(jnj)
}

#intro()
#data_sources()
turn_off_autoassign()



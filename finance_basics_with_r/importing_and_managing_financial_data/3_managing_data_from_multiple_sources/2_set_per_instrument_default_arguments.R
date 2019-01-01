library(Quandl)
library(quantmod)

set_default_data_source_for_one_symbol <- function() {
    head(CP)

    setSymbolLookup(CP = "FRED")
    getSymbols("CP")
    head(CP)
}

save_load_symbol_lookup_table <- function() {
    # Save symbol lookup table
    saveSymbolLookup("my_symbol_lookup.rda")

    # Set default source for CP to "yahoo"
    setSymbolLookup(CP = "yahoo")

    # Verify the default source is "yahoo"
    getSymbolLookup(Symbols = "CP")

    # Load symbol lookup table
    loadSymbolLookup("my_symbol_lookup.rda")
}


#set_default_data_source_for_one_symbol()
save_load_symbol_lookup_table()



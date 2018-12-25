# ^ matches string at the beginning of the line
# $ matches string at the end of the line 

emails <- c("john.doe@ivyleague.edu", "education@world.gov", "dalai.lama@peace.org",
            "invalid.edu", "quant@bigdatacollege.edu", "cookie.monster@sesame.tv")

grepl_grep <- function() {

    grepl("edu", emails)
    hits = grep("edu", emails)
    result <- emails[hits]
    print(result)
}

grepl_grep2 <- function() {
    grepl("@.*\\.edu$", emails)
    hits = grep("@.*\\.edu$", emails)
    result <- emails[hits]
    print(result)

}

sub_gsub <- function() {
    result <- sub("@.*\\.edu$", "@datacamp.edu", emails)
    print(result)
}

#grepl_grep()
#grepl_grep2()
sub_gsub()



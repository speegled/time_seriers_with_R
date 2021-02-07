#!/usr/bin/env Rscript

library(stringr)

ff <- list.files("./")
ff <- ff[str_detect(ff, "Rmd")]
filename <- ff[3]
for(filename in ff) {
  cc <- paste0("./", filename)
  dd <- paste(readLines(cc), collapse = "\n")
  if(str_detect(dd, "\\.solution")) {
    writeLines(str_remove_all(dd, ":::\\s*\\{\\.solution[\\S\\s]*?:::"), con = cc)
  }
}

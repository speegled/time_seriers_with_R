#!/usr/bin/env Rscript

library(stringr)

ff <- list.files("./")
ff <- ff[str_detect(ff, "Rmd")]
ff <- ff[!str_detect(ff, "pre-chapter")]
filename <- ff[2]
for(filename in ff) {
  cc <- paste0("./", filename)
  dd <- paste(readLines(cc), collapse = "\n")
  dd <- paste0("# Exercises Chapter ", 
               as.integer(str_extract(filename, "[0-9]*")) + 1, 
               "\n```{r child = \'pre-chapter-script.Rmd\'}\n```", 
               str_remove_all(dd, "[\\S\\s]*?## Exercises"), 
               collapse = "")
  
  dd <- str_replace_all(dd, ":::\\s*\\{\\.solution #hide[\\S\\s]*?:::", "::: solution \n\n:::")
  
  #if(str_detect(dd, "\\.solution")) {
    writeLines(dd, con = cc)
  #}
}

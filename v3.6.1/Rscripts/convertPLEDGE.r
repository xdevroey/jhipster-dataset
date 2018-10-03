# R script to convert PLEDGE outputs 
# Reads a PLEDGE file describing a set of selected JHipster configurations and produces 
# a csv file with the corresponding JHipster lines of the dataset
# author: Xavier Devroey

library(dplyr)

source('convert.r')

# ------------------------------
# Main function definition
# ------------------------------

main <- function(args){
  if(length(args) < 3){
    cat("Wrong arguments:", args, "\n", sep = " ") # prints given arguments
    cat("Format: convertPLEDGE.r <input.csv> <pledge-selection.txt> <output.csv>", "\n")
    stop("Example: convertPLEDGE.r <jhipster3.6.1-full-results.csv> <pledge8.txt> <pledge8.csv>")
  }
  
  inputCsv <- read.csv(file=args[1], head=TRUE, sep=',', stringsAsFactors = FALSE)
  
  sample <- data.frame()
  
  con <- file(args[2], "r")
  line <- readLines(con, n = 1)
  features <- c()
  while (length(line) > 0) {
    cat("Processing line: ", line, '\n')
    # process natching line
    if(grepl('([0-9]+)->([A-Za-z0-9]+)', line)){
      p <- unlist(strsplit(line, "->"))
      features[as.integer(p[1])] <- p[2]
    } else { # process configuration line
      l <- unlist(strsplit(line, ";"))
      row <- data.frame(lapply(l, function(x){x > 0}))
      colnames(row) <- features
      sample <- rbind(sample, processRow(row, inputCsv))
    } 
    line <- readLines(con, n = 1)
  }
  
  write.csv(sample, file=args[3])
}

# ------------------------------
# Program
# ------------------------------

args <- commandArgs(trailingOnly = TRUE)

main(args)
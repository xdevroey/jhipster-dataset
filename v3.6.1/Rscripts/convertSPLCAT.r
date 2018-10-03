# R script to convert SPLCAT outputs 
# Reads a SPLCAT file describing a set of selected JHipster configurations and produces 
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
    cat("Format: convertSPLCAT.r <input.csv> <splcat-selection.csv> <output.csv>", "\n")
    stop("Example: convertSPLCAT.r <jhipster3.6.1-full-results.csv> <FM-3.6.1-refined.m.ca2.csv> <pairwise.csv>")
  }
  inputCsv <- read.csv(file=args[1], head=TRUE, sep=',', stringsAsFactors = FALSE)
  
  splcatCsv <- read.csv(file=args[2], head=FALSE, sep=';', stringsAsFactors = FALSE)
  splcatCsv[,ncol(splcatCsv)] <- NULL
  splcatCsv <- data.frame(t(splcatCsv), stringsAsFactors = FALSE)
  splcatCsv$X1 <- NULL
  colnames(splcatCsv) = splcatCsv[1, ] # the first row will be the header
  splcatCsv = splcatCsv[-1, ]          # removing the first row.
  toBoolean <- function(x) {
    case_when(
      x == "X" ~ TRUE,
      TRUE ~ FALSE)
  }
  splcatCsv <- splcatCsv %>%
    mutate_all(toBoolean)
  
  sample <- processRow(splcatCsv[1,], inputCsv)
  for(i in 2:nrow(splcatCsv)){
    cat("Processing row ", i, '\n')
    sample <- rbind(sample, processRow(splcatCsv[i,], inputCsv))
  }
  
  write.csv(sample, file=args[3])
}

# ------------------------------
# Program
# ------------------------------

args <- commandArgs(trailingOnly = TRUE)

main(args)

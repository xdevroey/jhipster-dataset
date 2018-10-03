# R script to do a random sampling
# 
# author: Xavier Devroey

library(dplyr)

# ------------------------------
# Main function definition
# ------------------------------

main <- function(){
	args <- commandArgs(trailingOnly = TRUE)
	if(length(args) < 4){
	  cat("Wrong arguments:", args, "\n", sep = " ") # prints given arguments
	  cat("Format: randomsampling.r <input.csv> <output.csv> <sample-size> <number-of-samples>", "\n")
	  stop("Example: randomsampling.r <jhipster3.6.1-full-results.csv> <random.csv> 8 1")
	}
	inputCsv <- read.csv(file=args[1], head=TRUE, sep=',', stringsAsFactors = FALSE)
	size <- as.integer(args[3])
	nb <- as.integer(args[4])
	for (i in 1:nb) {
	  samp <- inputCsv %>%
	    sample_n(size, replace = FALSE)
	  outputCsv <- paste(args[2],"/random", size, "-", i,".csv", sep = "")
	  write.csv(samp, file = outputCsv)
	}
}

# ------------------------------
# Program
# ------------------------------

main()
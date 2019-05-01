# Author:       Brian P. Steffes
# Date:         Wednesday 05/01/19
# Course:       R Programming - Johns Hopkins University
# Assignment:   1 - Air Polution (functions)

corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of  length 1 indicating
  ## the  location of the CSV files
  
  ## 'threshold' is a numveric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variablews) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
  
  
  my_files <- list.files(paste(getwd(),directory,sep="/"))
  aggregate_data <- c()
  
  for(i in my_files){
    
    # read file contents into dataframe
    temp_data <- read.csv(paste(directory,"/",i,sep=""))
    complete_obs_count <- nrow(subset(temp_data,!is.na(sulfate) & !is.na(nitrate)))
    if(complete_obs_count > threshold) {
      #produce correlation matrix and extract value for sulfate/nitrate
      present_correlation <- cor(temp_data[,2:3],use = "complete.obs")[1,2]
      aggregate_data <- c(aggregate_data,present_correlation)
    }
  }
  aggregate_data
}
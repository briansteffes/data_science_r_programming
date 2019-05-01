# Author:       Brian P. Steffes
# Date:         Wednesday 05/01/19
# Course:       R Programming - Johns Hopkins University
# Assignment:   1 - Air Polution (functions)

complete <- function(directory, id=1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of  the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id ' is the monitor ID number 'nobs' is the
  ## number of complete cases
  
  my_data <- data.frame(id=integer(),nobs=integer())
  for(i in id){
    
    #determine amount of 0's to prefix file name with
    prefix <- ""
    if(i < 10) {prefix <- "00"}
    else if(i < 100) {prefix <- "0"}
    
    # read file contents into datafram
    temp_data <- read.csv(paste(directory,"/",prefix,i,".csv",sep=""))
    complete_obs_count <- nrow(subset(temp_data,!is.na(sulfate) & !is.na(nitrate)))
    my_data <- rbind(my_data,data.frame(id=i,nobs=complete_obs_count))
    
  }
  
  my_data
  
}
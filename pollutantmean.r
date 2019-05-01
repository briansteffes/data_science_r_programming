# Author:       Brian P. Steffes
# Date:         Monday 04/29/19
# Course:       R Programming - Johns Hopkins University
# Assignment:   1 - Air Polution (functions)


pollutantmean <- function(directory,pollutant,id=1:332){
    # 'directory' is a character vector of length 1 indicating the location 
    # of the CSV files
    # 
    # 'pollutant' is a character vector of length 1 indicating the name of the
    # pollutant for which we will calculate the mean; either  'sulfat' or 'nitrate'
    # 
    # 'id' is an integer vector indicating the monitor ID numbers to bet used
    # 
    # Return the mean of the pollutant across all monitors list in the 'id' vector
    # (ignoring NA values)
    # NOTE: Do not round the result!
  
    
    # create a vector containing all the values appended
    aggregate_data <- c()
    for(i in id){
      
      prefix <- ""
      if(i < 10) {prefix <- "00"}
      else if(i < 100) {prefix <- "0"}
      
      temp_data <- read.csv(paste(directory,"/",prefix,i,".csv",sep=""))
      data_of_interest <- temp_data[[pollutant]]
      aggregate_data <- c(aggregate_data,data_of_interest)
    }
    mean(aggregate_data,na.rm=TRUE)
}
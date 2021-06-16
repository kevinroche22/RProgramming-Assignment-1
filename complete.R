# Write a function that reads a directory full of files and reports the number 
# of completely observed cases in each data file. The function should return a 
# data frame where the first column is the name of the file and the second 
# column is the number of complete cases.

library(tidyverse) # makes life easier

complete <- function(directory, id = 1:332) {
  
        ## Store needed files in csvList var
        csvList <- list.files(path = directory)[id]
  
        ## Read csvList var
        readCsvList <- lapply(csvList, read.csv) # applies read.csv to csvList
  
        ## Amalgamate into single file
        pollutantData <- do.call(rbind, readCsvList) # do.call passes rbind on selected csv's
  
        ## Include only complete cases and collapse the number of obs by ID
        completePollutantData <- pollutantData %>% 
                        na.omit() %>% # omits missing values
                        group_by(ID) %>% # groups by id
                        summarise(nobs = n()) # counts obs for desired id's
        return(completePollutantData)
}

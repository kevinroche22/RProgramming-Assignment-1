# Write a function named 'pollutantmean' that calculates the mean of a 
# pollutant (sulfate or nitrate) across a specified list of monitors.
# The function 'pollutantmean' takes three arguments: 'directory', 'pollutant', 
# and 'id'. Given a vector monitor ID numbers, 'pollutantmean' reads that
# monitors' particulate matter data from the directory specified in the
# 'directory' argument and returns the mean of the pollutant across all of the 
# monitors, ignoring any missing values coded as NA. 

pollutantMean <- function(directory, pollutant, id = 1:332) {
        ## Error message if user inputs invalid pollutant 
        if(pollutant != "sulfate" & pollutant != "nitrate") { 
                        print("Invalid pollutant entry - enter either 
                              sulfate or nitrate") # error message
                
        } else {
                        ## Store needed files in csvList var
                        csvList <- list.files(path = directory)[id]
                        
                        ## Read csvList var
                        readCsvList <- lapply(csvList, read.csv) # applies read.csv to csvList
                        
                        ## Amalgamate into single file
                        pollutantData <- do.call(rbind, readCsvList) # do.call passes rbind on selected csv's
                                
                        ## Remove NA values and calculate mean
                        mean(pollutantData[,pollutant], na.rm = TRUE)
                        }
}

            
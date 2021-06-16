# Write a function that takes a directory of data files and a threshold for 
# complete cases and calculates the correlation between sulfate and nitrate for 
# monitor locations where the number of completely observed cases (on all 
# variables) is greater than the threshold. The function should return a vector 
# of correlations for the monitors that meet the threshold requirement. If no 
# monitors meet the threshold requirement, then the function should return a 
# numeric vector of length 0. 

corr <- function(directory,threshold=0){
        
        ## Store needed files in csvList var
        csvList <- list.files(path = directory)
  
        ## Create empty vector that we will later store the correlation in
        correlation <- c()
        
        ## Create for loop that reads in files, checks if threshold is met, and
        ## either returns the correlation or 0 (if threshold not met)
        for(k in 1:332){ # We have 332 csv files
                pollutantData <- (read_csv(csvList[k])) # Loop through each file on csvlist and assign it to pollutantData
                completePollutantData <- pollutantData[complete.cases(pollutantData),] # Only keep complete cases
                if(nrow(completePollutantData)>threshold){ # Ensures threshold is met
                        correlation <- c(correlation, cor(completePollutantData$sulfate, completePollutantData$nitrate)) # Correlation calculation
                }
                else numeric(0) # If threshold not met, return 0
        } 
        correlation # Prints result
}

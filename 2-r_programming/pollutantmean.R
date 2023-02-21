pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## directory: character vector of length 1 indicating the location of the csv files
  ## pollutant: character vector of length 1 indicating name of pollutant, "sulfate" or "nitrate"
  ## 'id':      integer vector of ids to use
  
  readings = numeric()
  
  # loop over ids specified, append all readings to one vector
  for (i in id){
    poldata = read.csv(paste(directory, sprintf('/%03d.csv',i), sep = ''), header=TRUE)
    readings <-  append(readings, poldata[[pollutant]])
  }
  
  mean(readings, na.rm = TRUE)
  
}


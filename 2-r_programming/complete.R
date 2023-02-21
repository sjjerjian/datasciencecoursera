complete <- function(directory, ids = 1:332) {
  ## count of complete number of cases
  ## directory: character vector of length 1 indicating the location of the csv files
  
  # loop over ids
  nobs = numeric()
  for (i in ids){
    poldata = read.csv(paste(directory, sprintf('/%03d.csv',i), sep = ''), header=TRUE)
    nobs = append(nobs, sum(complete.cases(poldata)))
  }
  
  data.frame(id = ids, nobs = nobs)

}


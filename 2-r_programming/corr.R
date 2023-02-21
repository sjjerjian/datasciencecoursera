corr <- function(directory, threshold = 0) {
  ## directory: character vector of length 1 indicating the location of the csv files
  ## threshold: numeric vector of length 1 indicating number of completely observed observations (on all variables)
  ## required to compute the correlation between nitrate & sulfate
  
  completecases <- complete(directory)
  
  cor_ns = numeric()
  for (i in completecases$id){
    
    if (completecases$nobs[i] >= threshold) {
      poldata = read.csv(paste(directory, sprintf('/%03d.csv',i), sep = ''), header=TRUE)
      cor_ns  = append(cor_ns, cor(poldata$sulfate, poldata$nitrate, use = 'pairwise.complete.obs'))
        
    } 
    
  }
  cor_ns
}


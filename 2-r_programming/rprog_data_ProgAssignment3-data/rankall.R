rankall <- function(outcome, num = "best") {
        
        rankstate <- function(df,num){
                
                if (num =="best"){
                        num = 1
                }
                else if (num=="worst"){
                        num = nrow(df)
                }
                
                df[num,]
        }
        
        ## Read outcome data
        df <- read.csv("rprog_data_ProgAssignment3-data/outcome-of-care-measures.csv", 
                       na.strings = "Not Available", stringsAsFactors=FALSE)
        
        outcomes <- c("heart attack"=11, "heart failure"=17, "pneumonia"=23)

        ## Check that outcome is valid
        if (!(outcome %in% names(outcomes))){
                stop("invalid outcome")
        }
        
        ## order data  by state, outcome, hospital, omitting any rows with NA
        df <- na.omit(df[,c(2,7,outcomes[outcome])])
        colnames(df) <- c("hospital","state",outcome)
        
        df <- df[order(df[,"state"],df[,outcome],df[,"hospital"]),]
        
        ## Return a data frame with the hospital names and the state names for given ranking
        
        x <- sapply(split(df,df$state),rankstate,num)
        x <- t(as.data.frame(x))
        x
        
}

# should be able to run this...
#r <- rankall("heart failure", 10)
#as.character(subset(r, state == "NV")$hospital)



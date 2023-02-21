best <- function(state, outcome){

        ## Read outcome data
        df <- read.csv("rprog_data_ProgAssignment3-data/outcome-of-care-measures.csv", 
                         na.strings = "Not Available", stringsAsFactors=FALSE)
        
        states <- df[,7]
        outcomes <- c("heart attack"=11, "heart failure"=17, "pneumonia"=23)
        
       
        ## Check that state and outcome are valid
        if (!(state %in% states)){
                stop("invalid state")
        }
        if (!(outcome %in% names(outcomes))){
                stop("invalid outcome")
        }
        
        df <- df[,c(2,7,outcomes[outcome])]
        colnames(df) <- c("hospital","state",outcome)
        
        df <- df[order(df[,"state"],df[,outcome],df[,"hospital"]),]
        
        ## Return hospital name in that state with lowest 30-day death rate
        df[df$state==state,1][1]
        
        
}
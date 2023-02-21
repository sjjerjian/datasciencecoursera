rankhospital <- function(state, outcome, num = "best") {
        
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
        
        df <- na.omit(df[,c(2,7,outcomes[outcome])])
        colnames(df) <- c("hospital","state",outcome)
        
        df <- df[order(df[,"state"],df[,outcome],df[,"hospital"]),]
        
        ## Return hospital name in that state with the given rank
        ## 30-day death rate
        
        df_thisState <- df[df["State"]==state,]
        
        if (num =="best"){
                num = 1
        }
        else if (num=="worst"){
                num = nrow(df_thisState)
        }
        
        df_thisState[num,1]
        
}
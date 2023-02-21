
folder = "./3-getting_and_cleaning_data/data"
if (!file.exists(folder)) {
        dir.create(folder)
}

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv?accessType=DOWNLOAD"
download.file(fileURL, destfile = "./3-getting_and_cleaning_data/data/getdata_data_ss06hid.csv", method="curl")

dateDownloaded <- date()

housingData <- read.csv("./3-getting_and_cleaning_data/data/getdata_data_ss06hid.csv")

# Question 1:
# How many properties are worth $1m or more? 
# From code book, VAL column is property value, and 24 is code for $1m+
sum(housingData$VAL==24,na.rm=TRUE)


# Question 3:
# used readxl package here instead of xlsx

library(readxl)

dat <- read_excel("./3-getting_and_cleaning_data/data/getdata_data_DATA.gov_NGAP.xlsx",sheet=1,
                    range="G18:O25")
sum(dat$Zip*dat$Ext,na.rm=T)


# Question 4

library(XML)
fileURL  <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc      <- xmlTreeParse(fileURL,useInternal=TRUE)

# get the top level node, and then extract zipcodes as dataframe, using "relative path" with xpathSApply
response <- xmlRoot(doc)
zipcodes <- as.data.frame(xpathSApply(response,'//zipcode',xmlValue))
sum(zipcodes==21231)

# Question 5
library(data.table)
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv?accessType=DOWNLOAD"
file = "./3-getting_and_cleaning_data/data/getdata_data_ss06pid.csv"
download.file(fileURL, destfile = file, method="curl")

DT <- fread(file)
system.time(DT[,mean(pwgtp15),by=SEX])






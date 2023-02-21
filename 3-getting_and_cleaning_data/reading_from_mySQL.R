
library(RMySQL)
ucscDb <- dbConnect(MySQL(),user="genome",
                host="genome-mysql.cse.ucsc.edu")
result <- dbGetQuery(ucscDb,"show databases;"); dbDisconnect(ucscDb);


hg19 <- dbConnect(MySQL(),user="genome", db="hg19",
                    host="genome-mysql.cse.ucsc.edu")
allTables <- dbListTables(hg19)

# read fields in a specific table, and then get the number of rows
dbListFields(hg19, "affyU133Plus2") 
dbGetQuery(hg19, "select count(*) from affyU133Plus2")

affyData <- dbReadTable(hg19, "affyU133Plus2")
head(affyData)

# dbSendQuery "sends the query to the database, but fetch actually brings the result to local
# and fetch can select a small number of row using n, and then you can clear the query
query <- dbSendQuery(hg19, "select * from affyU133Plus2 where misMatches between 1 and 3")
affyMis <- fetch(query); quantile(affyMis$misMatches)

affyMisSmall <- fetch(query, n=10); dbClearResult(query)

dim(affyMisSmall)
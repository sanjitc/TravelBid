#####
### This is a sample R code that access the virtual table from Data Virtualization environment and create a treemap
### to visually displays mortgage default by residency type.
###
### Before execute the R script update URL, databaseUsernname and databasePassword variables according to your environment .
### Variable values can be found in ‘Collect -> Virtualized data -> Menu -> About’ section in Data Virtualization environment. 
#####

library(RJDBC)                                                    # Load the "RJDBC" package
library(treemap)                                                  # Call the TREEMAP package
library(dplyr)                                                    # Load DPLYR package

driverClassName <- "com.ibm.db2.jcc.DB2Driver"                    # Load JDBC driver using Class.forName method
driverPath <- "/dbdrivers/db2jcc4.jar"                            # Db2 JDBC driver path in RStudio docker image 

url <- "<JDBC Connecgion URL>"                                    # Update JDBC connection URL according to your
                                                                  # environment information in ‘Collect -> Virtualized 
                                                                  # data -> Menu -> About’

databaseUsername <- "<username>"                                  # Database user
databasePassword <- "password>"                                   # Database user password

drv <- JDBC(driverClassName, driverPath)                          # Initialize Java VM and load Java JDBC driver
conn <- dbConnect(drv, url, databaseUsername, databasePassword)   # Create JDBC connection using dbConnect()

selStr <- "SELECT * FROM ICP4D.MORTGAGE_CUSTOMER_DEFAULT 
           WHERE  \"mortgage_default\" = 'YES';"                  # Query string for retrieve dataset

md <- dbSendQuery(conn, selStr)                                   # Let’s run a query
mortgageData <- fetch(md, -1)                                     # Store query result in a data frame

mortgageData1 <- mortgageData %>%                                 # Expand residency type to meaningful name
  mutate(RESIDENCE = case_when(RESIDENCE == "O" ~ "Owner Occupier",
                               RESIDENCE == "P" ~ "Private Renting",  
                               RESIDENCE == "L" ~ "Living With Parents",
                               RESIDENCE == "S" ~ "Sheltered"))
    
head(mortgageData1)                                               # Return first parts of data frame

treemap(mortgageData1,                                            # Create a treemap to visually displays, 
        index = c("RESIDENCE"),                                   # mortgage default by residency type.
        vSize ="YRS_CURRENT_EMP",
        title = "Mortgage Default by Residency Type"
       )

dbDisconnect(conn)                                                # Disconnect and close the connection

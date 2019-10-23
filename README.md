# TravelBid

This is the repository for the ICP4D Tutorial Data and setup. ICP4D Tutorial is based on IBM ICP for Data v1.2.0. For more information on this exciting new Data Science Platform, please visit ibm.com. ICP for Data provides an end-to-end, integrated & governed data & analytics solution platform where Data Engineers Data Stewards, Data Scientists and Business Users collaborate to bring forward the best insights from the existing data in the enterprise.

Flow

Download and Load the core setup modules.
Import the dataset into IBM ICP4Data
Prepare and shape the dataset using Data Transform.
Using Imported Jupyter notebook , train a simple linear regression model.
Save the resulting model into ICP4Data.

Steps

Follow these steps to create the required services and run the notebook locally.

Clone the repo
List the Samples
Load the Samples
Create a Data Connection
Load Machine Learning Project

1. Clone the repo

Clone the TravelBid repository locally. In a terminal, run the following command:

$ git clone https://github.com/sanjitc/TravelBid.git
2. List Available Samples

$ ./load_samples.sh -l
- db2-travel-001
- mongo-travel-001

3. Load Samples

Depending on your interest of domain, you would pass the domain in the loader.

$  ./load_samples.sh -t mongo-travel-001

4. Create Data Connection

Connection Details for DB2:

Connection type = DB2
Host = Master1 IP 
Port  = 50000
Database = TRAVEL
Username = db2inst1
Password = password

JDBC URL =  jdbc:db2://<master 1 IP>:50000/TRAVEL

Connection Details for Mongo:

Connection type = Mongo
Host = Master1 IP (Use private IP, if it's on Fyre)
Port  = 27017
Database = icpd_mongo
Username = mongodbuser
Password = password

JDBC URL =  jdbc:ibm:mongodb://<master 1 IP>:27017;databaseName=icpd_mongo

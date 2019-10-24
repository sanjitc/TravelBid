# TravelBid

This is the repository for the TravelBid demo setup. It's based on Cloud Pak for Data v2.1. 

## Flow

Download and Load the core setup modules.
Import the dataset into Cloud Pak for Data
Prepare and shape the dataset using Data Transform.
Using Shiny R package build the TravelBid application.


# Steps
Follow these steps to create the required services and run the notebook locally.

1. [Clone the repo](#1-clone-the-repo)
2. [List the Samples](#2-list-vailable-samples)
3. [Load the Samples](#3-load-samples)
4. [Create a Data Connection](#4-create-data-connection)


### 1. Clone the repo

Clone the TravelBid repository locally. In a terminal, run the following command:

$ git clone https://github.com/sanjitc/TravelBid.git
### 2. List Available Samples

```
$ cd TravelBid/tutorials
$ ./load_samples.sh -l
- db2-travel-001
- mongo-travel-001
```

### 3. Load Samples

Depending on the data source, you would pass the domain in the loader.

$  ./load_samples.sh -t db2-travel-001
$  ./load_samples.sh -t mongo-travel-001

### 4. Create Data Connection

Connection Details for DB2:
```
Connection type = DB2
Host = Master1 IP 
Port  = 50000
Database = TRAVEL
Username = db2inst1
Password = password

JDBC URL =  jdbc:db2://<master 1 IP>:50000/TRAVEL
```

Connection Details for Mongo:
```
Connection type = Mongo
Host = Master1 IP (Use private IP, if it's on Fyre)
Port  = 27017
Database = icpd_mongo
Username = mongodbuser
Password = password

JDBC URL =  jdbc:ibm:mongodb://<master 1 IP>:27017;databaseName=icpd_mongo
```

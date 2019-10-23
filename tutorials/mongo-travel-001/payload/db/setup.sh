#!/bin/bash

#set -x

RIGHT_NOW=$(date +"%x %r %Z")
TIME_STAMP="Updated on $RIGHT_NOW by $USER"
PAYLOAD="/tmp/samples/payload"
MONGO_DOCKER_NAME="mongo-tutorial"
D=docker


##### Functions

__loadIFMXDocker()
{


   $D images > /dev/null 2>&1; rc=$?;
   if [[ $rc != 0 ]]; then
                echo "Docker Not Installed. Are you on ICP4D cluster environment ?"
                exit 1
   fi

   if [[ ! `docker images --quiet bitnami/mongodb:latest` ]]; then
        echo -e "\nLoading Docker $MONGO_DOCKER_NAME ..."
#        $D run -d -it --name $MONGO_DOCKER_NAME -p 27017:27017 \
#            -e MONGO_INITDB_ROOT_USERNAME=mongoadmin -e MONGODB_ROOT_PASSWORD=password \
#            -e MONGODB_USERNAME=admin -e MONGODB_PASSWORD=password -e MONGODB_DATABASE=icpd_mongo \
#            bitnami/mongodb:latest
        $D run -d -it --name $MONGO_DOCKER_NAME -p 27017:27017 \
            bitnami/mongodb:latest
        #Wait couple of minutes to make sure db2 instance started and online
        sleep 60
   fi

   echo -e "\nMaking some space for data"
   #make a sample directory
   $D   exec $MONGO_DOCKER_NAME bash -c  "mkdir -p $PAYLOAD"

   echo -e "\nMoving Payload to MongoDB"
   #push the payload
   $D cp data  $MONGO_DOCKER_NAME:$PAYLOAD
   $D cp load.sh  $MONGO_DOCKER_NAME:$PAYLOAD/data

   echo -e "\nMongoDB being loaded with data for you to try out"

   #run setup the payload
   $D exec $MONGO_DOCKER_NAME  bash -c "cd $PAYLOAD/data; ./load.sh"


}

__loadIFMXDocker

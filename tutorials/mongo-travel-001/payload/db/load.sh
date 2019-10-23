#!/bin/sh

export PAYLOAD=/tmp/samples/payload

#Create database and user
mongo << EOF
use icpd_mongo
db.createUser( { user: "mongodbuser", pwd: "password", roles: [ { role: "readWrite", db: "icpd_mongo" } ] })
quit()
EOF

#Load travel
mongoimport -u mongodbuser -p password -d icpd_mongo -c hotel --type CSV --file $PAYLOAD/data/Hotels3.csv --headerline
mongoimport -u mongodbuser -p password -d icpd_mongo -c rentalcar --type CSV --file $PAYLOAD/data/RentalCar1.csv --headerline

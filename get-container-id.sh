#! /bin/bash
container_id=`docker ps -a -f name=$1 --format '{{.ID}}'`
echo "CONTAINER ID: $container_id"
container_ip=`docker inspect -f '{{.NetworkSettings.IPAddress }}' $container_id`
echo "CONTAINER IP ADDRESS: $container_ip"
volumns=`docker inspect -f '{{.Mounts}}' $container_id |tr -d '['|tr -d ']'`
#echo $volumns
oldIFS=$IFS
IFS='{,}'
for item in $volumns
do
    echo $item|cut -d' ' -f 3,4
done
IFS=$oldIFS
#echo ${#volumns[@]}
#for item in $volumns
#do
#    echo $item
#    oldIFS=$IFS
#    IFS= 
#    attr=$item
#    echo "$attr[2] - $attr[3]"
#done
#IFS=$oldIFS


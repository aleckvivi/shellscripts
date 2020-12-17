#! /bin/bash
# $1 freeswtich的实际公网IP
# $2 docker 挂载的freeswitch 配置目录
# $3 docker 挂载的/etc目录，用于配置odbc.ini
# change docker ip from input args
if [ ! -n "$1" ] ;then
  sed -i "s/36.133.135.4/$1/g" ./freeswitch_config/vars.xml
  sed -i "s/36.133.135.4/$1/g" ./freeswitch_config/internal.xml
  echo "已替换为指定的IP地址:$1"
fi
# copy config file to docker 
DirPattern="^/var/lib/docker/volumes.*$"
if [[ $2=~ $DirPattern ]] && [[ $3=~ $DirPattern ]]
then
  cp ./freeswitch_conf/odbc.ini $3
  cp ./freeswitch_conf/vars.xml $2
  cp ./freeswitch_conf/acl.conf.xml $2"/autoload_configs"
  cp ./freeswitch_conf/db.conf.xml $2"/autoload_configs"
  cp ./freeswitch_conf/event_socket.conf.xml $2"/autoload_configs"
  cp ./freeswitch_conf/switch.conf.xml $2"/autoload_configs"
  cp ./freeswitch_conf/*ternal.xml $2"/sip_profiles"
  echo "初始化已完成，请重新加载docker restart freeswitch"
else
  echo "配置目录不合法:$2"
fi
cp 


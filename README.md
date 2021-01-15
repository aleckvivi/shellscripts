# 常用脚本
## init-freeswitch.sh
三个必要参数
+ $1 freeswtich的实际公网IP
+ $2 docker 挂载的freeswitch 配置目录
+ $3 docker 挂载的/etc目录，用于配置odbc.ini
### 作用：初始化freeswitch的运行配置

## get-container-id.sh
一个必要参数
+ $1  container name
### 作用：通过容器名字获取该容器的内部ip，以及挂载的目录情况。

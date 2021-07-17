#/bin/bash

#获取版本信息
ver="jdk_"`echo $1 | awk -F "-" '{print $2}'`
version=`echo $1 | awk -F "-" '{print $2}'`
#移动目录并解压
if [ ! -d "/opt/java" ]; then
  echo -e "\e[1;32m 已创建 /opt/java 目录 \e[0m"
  mkdir /opt/java
fi

if [ ! -f $1 ]; then
  echo -e "\e[1;31m 不存在 $1 , 请上传tar.gz文件到当前目录\e[0m"
  exit 1
else
  cp $1 /opt/java/$1
  echo -e "\e[1;32m 已移动 $1 到 /opt/java/$1\e[0m"
  echo -e "\e[1;32m 正在解压\e[0m"
  if [ ! -d "/opt/java/$ver"  ]; then
    mkdir "/opt/java/$ver"
  fi
  tar zxvf /opt/java/$1 -C /opt/java/$ver --strip-components 1 > /dev/null 2>&1
  rm /opt/java/$1
  echo -e "\e[1;32m 已删除 /opt/java/$1"
  echo -e "\e[1;32m 解压完成\e[0m"
fi

# 备份和设置环境变量
if [ -f "/etc/profile.bak"  ]; then
  rm /etc/profile
  cp /etc/profile.bak /etc/profile
  echo -e "\e[0;32m 已备份 /etc/profile \e[0m"
else
  cp /etc/profile /etc/profile.bak
fi
if [ -d "/opt/java/$ver" ]; then
  echo -e "\e[1;32m 正在设置环境变量\e[0m"
  echo "# $ver" >> /etc/profile
  echo "JAVA_HOME=/opt/java/$ver" >> /etc/profile
  echo "JAVA_BIN=/opt/java/$ver/bin" >> /etc/profile
  echo 'PATH=$PATH:${JAVA_BIN}' >> /etc/profile
  echo 'CLASSPATH=$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar' >> /etc/profile
  echo "export JAVA_HOME JAVA_BIN PATH CLASSPATH" >> /etc/profile
  source /etc/profile
fi
# 测试
echo -e "\e[0;33m 执行 java -version \e[0m" 
java -version

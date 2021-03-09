#!/bin/bash

#####################################
#		xsync - 自动化的 rsync		#
#	为了更方便的在Linux集群中同步文件	#
#	对rsync进行自动化脚本处理。			#
#-----------------------------------#
#	参数：文件名 机器名1 机器名2...		#
#	建议先配置集群之间无密码登陆		#
#####################################

pcount=$#
if ((pcount==0)); then
	echo "参数不能为空";
	exit;
fi

filename=""
hostsnames=""

if((pcount==1));then
	filename=$1
	read -p "请输入要发送的主机名，以空格分隔：" hostsnames
else
	i=0
	for arr in $*; do
		if((i==0));then
			filename=$arr
		else
			hostsnames=${hostsnames}" "${arr}
		fi
		((i++))
	done
fi

filename=`basename $filename`

pdir=`cd -P $(dirname $filename); pwd`

user=`whoami`

for item in ${hostsnames[*]}
do
 echo "== 正在发送到："$item
 echo "↕↕ 文件："$pdir/$filename
 rsync -av $pdir/$filename $user@$item:$pdir
 echo "== 发送完成 =========="
done

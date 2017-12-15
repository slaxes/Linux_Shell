#!/bin/awk
number=0
while getopts "n:d:" arg #getopts判断参数的选择
do 
	case $arg in
		n)
			if [ "$OPTARG" = "-d" ];then
				echo  usage: 4.file_size.sh [-n N] [-d DIR]
				exit 0
			fi
			number=$OPTARG
			;;
		d)
			if [ "$OPTARG" = "-n" ];then
				echo usage: 4.file_size.sh [-n N] [-d DIR]
				exit 0
			fi
			directory=$OPTARG
			cd $directory
			;;
	esac
done
A=$( pwd | awk '{print $1}' ) #获取输入的目录
echo The largest files/directories in $A are:
total=$(du -sh * | sort -rh | awk 'END{print NR}')
i=1
if [ "$number" -gt "$total" ]||[ "$number" -eq 0 ];then #-n不标准则全部输出
	for i in $(seq 1 $total)
	do
		data_sum=$(du -sh * | sort -rh | awk 'NR=='$i'{print $1}')
		data_name=$(du -sh * | sort -rh | awk 'NR=='$i'{print $2}')
		printf "%-3s %-5s %-20s\n" $i $data_sum $data_name
	done
	exit 0
elif [ "$number" -lt 0 ];then #小于0则反馈usage 
	echo usage: 4.file_size.sh [-n N] [-d DIR]
	exit 0
else #正常情况
	for i in $(seq 1 $number)
	do	
		data_sum=$(du -sh * | sort -rh | awk 'NR=='$i'{print $1}')
		data_name=$(du -sh * | sort -rh | awk 'NR=='$i'{print $2}')
		printf "%-3s %-5s %-20s\n" $i $data_sum $data_name
	done
	exit 0
fi

#!/bin/awk
myip=`ifconfig -a|grep broadcast|grep inet|awk '{print $2}'`
mynic=`ifconfig -a|grep -B 1 $myip|grep -v $myip|awk '{print $1}'|tr -d ":"`
if [ "$#" -eq 0 ];then
	printf "%-8s %-10s\n" "NIC" "IP Address"
	printf "%-8s %-10s\n" $mynic $myip
fi
while getopts "i:m:" arg
do
	case "$arg" in
		i)
			if [ "$OPTARG" = "-m" ];then
				echo "usage: ./3.myip.sh -i(ip) [IP ADDR] -m(mask) [MASK]"
				exit 0
			fi
			sudo ifconfig $mynic $OPTARG
			;;
		m)
			if [ "$OPTARG" = "-m" ];then
				echo "usage: ./3.myip.sh -i(ip) [IP ADDR] -m(mask) [MASK]"
				exit 0
			fi
			sudo ifconfig $mynic netmask $OPTARG
			;;
		?)
			echo "usage: ./3.myip.sh  -->  Show Your NIC and IP Address"
			echo "       ./3.myip.sh -i(ip) [IP ADDR] -m(mask) [MASK]"
			;;
	esac
done
exit 0


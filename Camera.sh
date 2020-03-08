#!/bin/sh
host="http://81.82.201.132/"
cmd1="timeout 5 zmcontrol.pl"
cmd2="--command=reset"
cmd3="|on+150|200|Automatique|Record"
cmd4="|off+10|0|Automatique|Stopped"

case "$1" in
	'reboot')
		$cmd1 --id=1 $cmd2
		echo Reboot ID 1 ZoneMinder IP Camera now.
		sleep 0.5
		$cmd1 --id=2 $cmd2
		echo Reboot ID 2 ZoneMinder IP Camera now.
		sleep 0.5
		$cmd1 --id=3 $cmd2
		echo Reboot ID 3 ZoneMinder IP Camera now.
		sleep 0.5
		$cmd1 --id=4 $cmd2
		echo Reboot ID 4 ZoneMinder IP Camera now.
		sleep 0.5
		$cmd1 --id=5 $cmd2
		echo Reboot ID 5 ZoneMinder IP Camera now.
		sleep 0.5
		$cmd1 --id=6 $cmd2
		echo Reboot ID 6 ZoneMinder IP Camera now.
		sleep 0.5
		$cmd1 --id=7 $cmd2
		echo Reboot ID 7 ZoneMinder IP Camera now.
		sleep 0.5
		echo All 7 ZoneMinder IP Cameras have been successfully rebooted.
	;;
	'rebootid')
		$cmd1 --id=$2 $cmd2
		echo Reboot ID $2 ZoneMinder IP Camera now.
	;;
	'record')
		( echo open $host $port
  		sleep 0.5
  		echo 1$cmd3
  		sleep 0.5
  		echo 2$cmd3
  		sleep 0.5
  		echo 3$cmd3
  		sleep 0.5
  		echo 4$cmd3
  		sleep 0.5
  		echo 5$cmd3
  		sleep 0.5
  		echo 6$cmd3
  		sleep 0.5
  		echo 7$cmd3
		sleep 0.5 ) | telnet
		sleep 0.5
		echo Record command sent to all 7 ZoneMinder IP Cameras.
	;;
	'recordid')
		( echo open $host $port
  		sleep 0.5
  		echo $2$cmd3
		sleep 0.5 ) | telnet
		sleep 0.5
		echo Record command sent to ID $2 ZoneMinder IP Camera.
	;;
	'stoprecord')
		( echo open $host $port
  		sleep 0.5
  		echo 1$cmd4
  		sleep 0.5
  		echo 2$cmd4
  		sleep 0.5
  		echo 3$cmd4
  		sleep 0.5
  		echo 4$cmd4
  		sleep 0.5
  		echo 5$cmd4
  		sleep 0.5
  		echo 6$cmd4
  		sleep 0.5
  		echo 7$cmd4
		sleep 0.5 ) | telnet
		sleep 0.5
		echo Stop record command sent to all 7 ZoneMinder IP Cameras.
	;;
	'stoprecordid')
		( echo open $host $port
  		sleep 0.5
  		echo $2$cmd4
		sleep 0.5 ) | telnet
		sleep 0.5
		echo Record command sent to ID $2 ZoneMinder IP Camera.
	;;
	'info')
		echo "Use reboot/record/stoprecord or rebootid/recordid/stoprecordid <ID> parameters to reboot or (stop)record IP Cameras manually"
	;;
	*)
		echo "Usage: $0 {reboot|rebootid|record|recordid|stoprecord|stoprecordid|info}"
		exit 1
	;;
esac

exit 0

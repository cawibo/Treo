#!/bin/bash -       
#title           :gentest.sh
#description     :Will bruteforce a failing test case on lab3.
#author		 :Erik Söderberg & Caroline Borg
#usage		 :bash gentest.sh, don't forget to change the path.
#==============================================================================

echo Starting flowgen...
while true; do
vert=$(($RANDOM%2000))
echo $vert
flow=$(./flowgen $vert $(($vert*2)) $(($RANDOM%100)))
echo Flowgraph generated

correct=$(echo $flow | ./maxflow | head -n 2 | tail -n 1 )
ours=$(echo $flow | path/to/your/maxflow | head -n 2 | tail -n 1)
echo Ran diff
if [[ $correct != $ours ]]; then
	echo "$flow" >flow_err.txt
	echo $correct != $ours
	echo Invalid maxflow!
	break
else
	echo Output same!
	echo $correct == $ours
fi
done

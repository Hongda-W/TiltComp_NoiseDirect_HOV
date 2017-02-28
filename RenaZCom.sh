#!/bin/bash
# Rename only the Z(BHZ) component data of those ocean stations to *.SAC_orig
cd /lustre/janus_scratch/howa1663/CC_JdF 
Mon_lst=`ls -d $PWD/20[0-9][0-9]'.'{JAN,FEB,MAR,APR,JUN,JUL,AUG,SEP,OCT,NOV,DEC} 2>> /dev/null`
na7D=`cat /lustre/janus_scratch/howa1663/Seis_Data/SEED/station.lst | gawk '{print $1}'` # All station names
for mons in $Mon_lst
do
	cd $mons
	YM=`pwd | gawk -F/ '{print $NF}'` # something like 2011.AUG
	Day_lst=`ls -d $YM'.'[0-9]*`
	for days in $Day_lst
	do
		cd $mons/$days
		YMD=`pwd | gawk -F/ '{print $NF}'` # something like 2011.AUG.1 
		ft_SAC_lst=`ls 'ft_'$YMD'.'*'.BHZ.SAC'`
		for ft_SAC in $ft_SAC_lst
		do
			staNa=`echo $ft_SAC | gawk -F'.' '{print $4}'` # extract station name from ft_*.SAC file
			[[ $staNa == `echo $na7D | sed 's/ /\n/g' | grep $staNa` ]] && rename .BHZ.SAC .BHZ.SAC_orig $ft_SAC && echo Rename done for $ft_SAC >> /projects/howa1663/Code/TiltComp_NoiseDirect_HOV/RenaZCom.log
		done
	done
done

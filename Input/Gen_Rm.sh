#!/bin/bash
# Generate input file for Tilting noises from the JdF Z component seismogram
Hydro=/lustre/janus_scratch/howa1663/Seis_Data/SAC_JdF/Hydrophone # directory for hydrophone data
Hori=/lustre/janus_scratch/howa1663/Seis_Data/SAC_JdF/Horizontal # directory for horizontal data
ZComp=/lustre/janus_scratch/howa1663/CC_JdF # directory for vertical data
for OrigZ_SAC in `cat ./OrigZ.lst`
do
	DateSta=` echo $OrigZ_SAC | gawk -F'_ori' '{print $1}' `
	echo $DateSta"_noise_coherences" $DateSta $DateSta"_rdAdm" $DateSta"_rdCoh" $DateSta"_interm" 
done

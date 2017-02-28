#!/bin/bash
# Generate input file for Tilting noises from the JdF Z component seismogram
Hydro=/lustre/janus_scratch/howa1663/Seis_Data/SAC_JdF/Hydrophone # directory for hydrophone data
Hori=/lustre/janus_scratch/howa1663/Seis_Data/SAC_JdF/Horizontal # directory for horizontal data
ZComp=/lustre/janus_scratch/howa1663/CC_JdF # directory for vertical data
for OrigZ_SAC in `cat ./OrigZ.lst`
do
    DateSta=` echo $OrigZ_SAC | gawk -F'/' 'BEGIN{OFS="/"} {print $(NF-2),$(NF-1),$NF}' | gawk -F'.' '{for(i=1;i<=NF-2;i++){printf "%s.", $i}; printf "\n"}' `
	Hydro_SAC=` ( [[ -e $Hydro/$DateSta"BDH.SAC" ]] && echo $Hydro/$DateSta"BDH.SAC" ) || ( [[ -e $Hydro/$DateSta"BXH.SAC" ]] && echo $Hydro/$DateSta"BXH.SAC" ) || ( [[ -e $Hydro/$DateSta"HDH.SAC" ]] && echo $Hydro/$DateSta"HDH.SAC" ) || ( [[ -e $Hydro/$DateSta"HXH.SAC" ]] && echo $Hydro/$DateSta"HXH.SAC" ) || echo $Hydro/$DateSta"BDH.SAC" `
	Hori_SAC_1=` ( [[ -e $Hori/$DateSta"BHN.SAC" ]] && echo $Hori/$DateSta"BHN.SAC" ) || ( [[ -e $Hori/$DateSta"BH1.SAC" ]] && echo $Hori/$DateSta"BH1.SAC" ) || ( [[ -e $Hori/$DateSta"HHN.SAC" ]] && echo $Hori/$DateSta"HHN.SAC" ) || ( [[ -e $Hori/$DateSta"HH1.SAC" ]] && echo $Hori/$DateSta"HH1.SAC" ) || echo $Hori/$DateSta"BHN.SAC" `
    Hori_SAC_2=` ( [[ -e $Hori/$DateSta"BHE.SAC" ]] && echo $Hori/$DateSta"BHE.SAC" ) || ( [[ -e $Hori/$DateSta"BH2.SAC" ]] && echo $Hori/$DateSta"BH2.SAC" ) || ( [[ -e $Hori/$DateSta"HHE.SAC" ]] && echo $Hori/$DateSta"HHE.SAC" ) || ( [[ -e $Hori/$DateSta"HH2.SAC" ]] && echo $Hori/$DateSta"HH2.SAC" ) || echo $Hori/$DateSta"BHE.SAC" `
    StaNam=` echo $DateSta | gawk -F'.' '{print $(NF-1)}' `
    StaDep=` grep $StaNam StaDepth.lst `
    WaterDep=` [ -z "$StaDep" ] && echo 0 || ( echo $StaDep | gawk '{print $2}' ) `
	echo $OrigZ_SAC $Hori_SAC_1 $Hori_SAC_2 $Hydro_SAC "1" $WaterDep "0" $ZComp/$DateSta"BHZ.SAC"
done

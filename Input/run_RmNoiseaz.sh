#!/bin/bash
#SBATCH -J Rm_Noise
#SBATCH -o Rm_Noise%j.out
#SBATCH -e Rm_Noise%j.err
#SBATCH -N 1
#SBATCH --ntasks-per-node=12
#SBATCH --time=12:00:00
#SBATCH --mem=MaxMemPerNode
module load gcc/5.1.0
dir=/projects/howa1663/Code/TiltComp_NoiseDirect_HOV
cd $dir
./NoiseDirectionalityList ./Input/JdF_Tilt_Z.segments_iter1az 0

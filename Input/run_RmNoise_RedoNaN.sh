#!/bin/bash
#SBATCH -J Rm_4_NaN
#SBATCH -o Rm_4_NaN%j.out
#SBATCH -e Rm_4_NaN%j.err
#SBATCH -N 1
#SBATCH --ntasks-per-node=12
#SBATCH --time=1:30:00
#SBATCH --mem=MaxMemPerNode
module load gcc/5.1.0
dir=/projects/howa1663/Code/TiltComp_NoiseDirect_HOV
cd $dir
./NoiseDirectionalityList ./Input/Redo_NaN.list 0

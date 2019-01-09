#!/bin/sh
# Grid Engine options (lines prefixed with #$)
#$ -cwd
#$ -l h_rt=01:00:00
#$ -l h_vmem=40G
#  These options are:
#  job name: -N
#  use the current working directory: -cwd
#  runtime limit of 1 hr: -l h_rt
#  memory limit of 40 Gbyte: -l h_vmem
# Initialise the environment modules
. /etc/profile.d/modules.sh

# Load Python
module load matlab/R2018a

# Run the program
matlab -nodesktop -nosplash -r "rsim"

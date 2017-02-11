#!/bin/bash

###Request number of nodes for the job
#SBATCH -N 2

###Requestion total tasks (could be MPI job ranks) 
#SBATCH -n 64

## Or you can specify number of tasks per node
#SBATCH --tasks-per-node 32

### stardard output and standard error
### both default slurm-%j.out
### where %j is job ID
#SBATCH -o my.%j.out
#SBATCH  -e my.%j.err

### Partion(queue) "cuth" or "cuth_short" default "cuth"
#SBATCH  -p cuth

### time requting for the job D-hh:mm:ss
#SBATCH -t 1:00:00

### you can choose specific nodes if you want:
#SBACTH -w cuth[25-26]

### choose node with features, or slurm will choose any nodes 
## eg those with 128GB memeory
## available now : 64G 128G 
##
#BATCH -C 64G

## job actually start here

#load enviroment 
#enviroment from submitting shell will be inherited 
#e.g. if you code was compiled with openmpi
module load openmpi/2.0.1

echo "JOBID is $SLURM_JOB_ID"
echo "JOB allocate nodes: $SLURM_JOB_NODELIST "
start_time=`date`
echo "JOB start on:  ${start_time}"

# some simple test

srun hostname
echo "now only run 2 process"
srun -n 2 hostname
srun sleep 60

end_time=`date`
echo "JOB end on:  ${end_time}"
echo 






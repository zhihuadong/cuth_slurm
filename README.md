# cuth_slurm
This is the breif instruction on how to use slurm resource manager on CUTH cluster :

slurm is a widely used resoruce manager 
Google slurm , slurm basic , slurm tutorial, PBS to slurm  will give many info.

On CUTH cluster jobs can be submitted from head node cuth00.phys.columbia.edu
or qcdserver[12-17]. 

Some commonly used basic commands:

**sinfo**     ---show slurm system information , nodes jobs , queues ...     

**squeue**    ---about queue's info , jobs etc..

**srun**      ---run a job from submit node or within batch

**sbatch**    --- submit batch job

**scancel**   --- cancel a running job

Example:

```
[root@qcdserver17 ~]# sinfo
PARTITION  AVAIL  TIMELIMIT  NODES  STATE NODELIST
debug         up    1:00:00      2   idle cuth[01-02]
cuth*         up   infinite     17  alloc cuth[03-19]
cuth*         up   infinite     11   idle cuth[20-30]
cuth_short    up   12:00:00      9  alloc cuth[03-11]
```
Or with customer output format:
```
[dong@qcdserver16 slurm_cu]$ sinfo -N -p cuth -o "%6n %10m %4c %15f %10e %8O %t" 
HOSTNA MEMORY     CPUS AVAIL_FEATURES  FREE_MEM   CPU_LOAD STATE
cuth03 64000      32   ib,64G,amd      59983      15.85    alloc
cuth04 64000      32   ib,64G,amd      53900      10.55    alloc
cuth05 64000      32   ib,64G,amd      58292      8.42     alloc
cuth06 64000      32   ib,64G,amd      58288      10.11    alloc
cuth07 128000     32   ib,128G,amd     122507     10.64    alloc
cuth08 128000     32   ib,128G,amd     120276     20.96    alloc
cuth09 128000     32   ib,128G,amd     122348     12.27    alloc
cuth10 128000     32   ib,128G,amd     122507     9.51     alloc
cuth11 128000     32   ib,128G,amd     122716     10.84    alloc
cuth12 128000     32   ib,128G,amd     122664     9.60     alloc
cuth13 64000      32   ib,64G,amd      58343      9.80     alloc
cuth14 64000      32   ib,64G,amd      57870      13.67    alloc
cuth15 64000      32   ib,64G,amd      57774      27.62    alloc
cuth16 64000      32   ib,64G,amd      57949      11.91    alloc
cuth17 64000      32   ib,64G,amd      58110      12.40    alloc
cuth18 64000      32   ib,64G,amd      57858      20.79    alloc
cuth19 64000      32   ib,64G,amd      57868      11.97    alloc
cuth20 64000      32   ib,64G,amd      61580      0.01     idle
cuth21 64000      32   ib,64G,amd      61755      0.01     idle
cuth22 64000      32   ib,64G,amd      61812      0.01     idle
cuth23 64000      32   ib,64G,amd      61876      0.01     idle
cuth24 64000      32   ib,64G,amd      61870      0.01     idle
cuth25 64000      32   ib,64G,amd      62006      0.01     idle
cuth26 64000      32   ib,64G,amd      62017      0.02     idle
cuth27 64000      32   ib,64G,amd      61957      0.02     idle
cuth28 64000      32   ib,64G,amd      62076      0.01     idle
cuth29 64000      32   ib,64G,amd      62097      0.01     idle
cuth30 64000      32   ib,64G,amd      62098      0.01     idle
```
Check Queue status:

```
[root@qcdserver17 ~]# squeue
             JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
              1138      cuth slurm-si   jt2798  R    4:36:29      1 cuth03
              1047      cuth  s2d88.p    arago  R 4-02:02:11     16 cuth[04-19]
```

Run a simple multi node test jobs with srun:

```
[dong@qcdserver17 ~]$ srun -N 2 -n4  hostname
cuth21
cuth21
cuth20
cuth20
```

Or test run a simple MPI program with srun:
``` C
[dong@qcdserver17 test]$ cat hello.cpp
#include <stdio.h>
#include <stdlib.h>
#include <mpi.h>
#include <iostream>

int main(int argc, char * argv[])
{
    int taskID = -1; 
    int NTasks = -1; 
    char name[20] ="" ;
    int intlen = 30 ;

    /* MPI Initializations */
    MPI_Init(&argc, &argv);
    MPI_Comm_rank(MPI_COMM_WORLD, &taskID);
    MPI_Comm_size(MPI_COMM_WORLD, &NTasks);
    MPI_Get_processor_name( name, &intlen) ;

    printf("Hello World from Task %i on %s \n", taskID, name);
        MPI_Finalize();
        return 0;
}
```

``` shell
[dong@qcdserver17 test]$ module load openmpi
[dong@qcdserver17 test]$ mpic++ -o hello hello.cpp
[dong@qcdserver17 test]$ srun -N2 -n4 hello
Hello World from Task 0 on cuth20 
Hello World from Task 2 on cuth21 
Hello World from Task 3 on cuth21 
Hello World from Task 1 on cuth20 
[dong@qcdserver17 test]$ 
```


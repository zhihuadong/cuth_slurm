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
[root@qcdserver17 ~]# 
```
Or with customer output format:
```
[dong@qcdserver16 slurm_cu]$ sinfo -N -p cuth -o "%6n %10m %4c %15f %10e %t"
HOSTNA MEMORY     CPUS AVAIL_FEATURES  FREE_MEM   STATE
cuth03 64000      32   ib,64G,amd      60029      alloc
cuth04 64000      32   ib,64G,amd      55603      alloc
cuth05 64000      32   ib,64G,amd      60689      alloc
cuth06 64000      32   ib,64G,amd      60641      alloc
cuth07 128000     32   ib,128G,amd     124864     alloc
cuth08 128000     32   ib,128G,amd     122720     alloc
cuth09 128000     32   ib,128G,amd     124839     alloc
cuth10 128000     32   ib,128G,amd     124866     alloc
cuth11 128000     32   ib,128G,amd     125092     alloc
cuth12 128000     32   ib,128G,amd     125029     alloc
cuth13 64000      32   ib,64G,amd      60774      alloc
cuth14 64000      32   ib,64G,amd      60295      alloc
cuth15 64000      32   ib,64G,amd      60130      alloc
cuth16 64000      32   ib,64G,amd      60304      alloc
cuth17 64000      32   ib,64G,amd      60452      alloc
cuth18 64000      32   ib,64G,amd      60215      alloc
cuth19 64000      32   ib,64G,amd      60188      alloc
cuth20 64000      32   ib,64G,amd      61579      idle
cuth21 64000      32   ib,64G,amd      61753      idle
cuth22 64000      32   ib,64G,amd      61811      idle
cuth23 64000      32   ib,64G,amd      61862      idle
cuth24 64000      32   ib,64G,amd      61859      idle
cuth25 64000      32   ib,64G,amd      61994      idle
cuth26 64000      32   ib,64G,amd      62005      idle
cuth27 64000      32   ib,64G,amd      61947      idle
cuth28 64000      32   ib,64G,amd      62075      idle
cuth29 64000      32   ib,64G,amd      62082      idle
cuth30 64000      32   ib,64G,amd      62099      idle
[dong@qcdserver16 slurm_cu]$ 
```


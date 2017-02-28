# cuth_slurm
This is the breif instruction on how to use slurm resource manager on CUTH cluster :

slurm is a widely used resoruce manager 
Google slurm , slurm basic , slurm tutorial, PBS to slurm  will give many info.

Some commonly used basic commands:

**sinfo**     ---show slurm system information , nodes jobs , queues ...     

**squeue**    ---about queue's info , jobs etc..

**srun**      ---run a job from submit node or within batch

**sbatch**    --- submit batch job

**scancel**   --- cancel a running job

Example:

`[root@qcdserver17 ~]# sinfo
PARTITION  AVAIL  TIMELIMIT  NODES  STATE NODELIST
debug         up    1:00:00      2   idle cuth[01-02]
cuth*         up   infinite     17  alloc cuth[03-19]
cuth*         up   infinite     11   idle cuth[20-30]
cuth_short    up   12:00:00      9  alloc cuth[03-11]
[root@qcdserver17 ~]# 
`


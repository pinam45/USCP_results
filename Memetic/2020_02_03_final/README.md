# 2020/02/03 Final benchmark

This is the final benchmark of the [USCP](https://github.com/pinam45/USCP) solver implementation of the Memetic algorithm, the results are compared to the [RWLS final benchmark](../../RWLS/2020_02_03_final).

## Solver output

The solver was run 100 times on each of the 98 instances with stopping criteria used in [Gao2015](../../References.md) except for the RAIL instances. The stopping criteria used are:
 - **3 * 10^7 steps** for base instances:
```
4.1,4.2,4.3,4.4,4.5,4.6,4.7,4.8,4.9,4.10,5.1,5.2,5.3,5.4,5.5,5.6,5.7,5.8,5.9,5.10,6.1,6.2,6.3,6.4,6.5,A.1,A.2,A.3,A.4,A.5,B.1,B.2,B.3,B.4,B.5,C.1,C.2,C.3,C.4,C.5,D.1,D.2,D.3,D.4,D.5,E.1,E.2,E.3,E.4,E.5,NRE.1,NRE.2,NRE.3,NRE.4,NRE.5,NRF.1,NRF.2,NRF.3,NRF.4,NRF.5,NRG.1,NRG.2,NRG.3,NRG.4,NRG.5,NRH.1,NRH.2,NRH.3,NRH.4,NRH.5
```
 - **10^8 steps** for unicost instances:
```
CLR10,CLR11,CLR12,CLR13,CYC6,CYC7,CYC8,CYC9,CYC10,CYC11,STS9,STS15,STS27,STS45,STS81,STS135,STS243,STS405,STS729,STS1215,STS2187
```
 - **10 000 seconds** for RAIL instances:
 ```
 RAIL507,RAIL516,RAIL582,RAIL2536,RAIL2586,RAIL4284,RAIL4872
 ```

See the first [RWLS complete benchmark](../2019_10_18_complete_benchmark) for more information and the scripts for details.

The script used to submit the 98 * 100 = 9800 repetitions to slurm is [submit_all.sh](./scripts/submit_all.sh). This script submit for each instance 25 jobs with the [run_steps_4.sh](./scripts/run_steps_4.sh)/[run_time_4.sh](./scripts/run_time_4.sh) scripts that run 4 repetitions in parallel. The script used depend on the stopping criterion (steps/time), see the scripts for details.

## Printer output

The document contains:
- instances information
- result for the Greedy, RWLS and Memetic algorithms

To generate the document, the printer was run using:
```
./printer --input=<repository_path>/Memetic/2020_02_03_final/solver_out,<repository_path>/RWLS/2020_02_03_final/solver_out
```

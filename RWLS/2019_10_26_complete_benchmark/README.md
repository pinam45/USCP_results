# 2019/10/26 Complete benchmark

In this benchmark, we wanted to check that we obtain experimental results similar to those reported in [Gao2015]. In the article the results are given for 10 repetitions, here 100 repetitions were made.

Results are:
 - For most of the instances, the best solution fitness correspond the article results
 - For some instances, we improved the BKS thanks to the higher repetitions number, the apparition frequency being inferior to 0.1 (NRG.3, NRG.4, NRG.5, NRH.1, NRH.2, NRH.3, NRH.4, NRH.5, CYC10)
 - For some instances, we improved the BKS but with a frequency of ~1/2 that should have appeared in the article results (NRG.1,NRG.2)

For more details, see the printer output.

## Solver output

The solver was run 100 times on each of the 96 instances with parameters used in [Gao2015] to be able to compare them with the authors results. For most instances the article give results with a time limit and with a steps limit, the steps limit was used here so the machine running the algorithm doesn't influence the results.

The script used to submit the 96 * 100 = 9600 jobs to slurm is [submit_all.sh](scripts/submit_all.sh). This script submit jobs with run scripts depending on the on the instance type, see below for details.

### Base instances (OR-Library base instances)

"*RWLS uses a maximum search iteration of $3 \times{} 10^7$ as its stopping criterion.*"[Gao2015]

In [Gao2015], they put a limit of **3 * 10^7 steps** as stopping criterion for these instances. Here the program was run with the same maximum steps number using the script [run_base.sh](scripts/run_base.sh).

Comma separated list of instances names:
```
4.1,4.2,4.3,4.4,4.5,4.6,4.7,4.8,4.9,4.10,5.1,5.2,5.3,5.4,5.5,5.6,5.7,5.8,5.9,5.10,6.1,6.2,6.3,6.4,6.5,A.1,A.2,A.3,A.4,A.5,B.1,B.2,B.3,B.4,B.5,C.1,C.2,C.3,C.4,C.5,D.1,D.2,D.3,D.4,D.5,E.1,E.2,E.3,E.4,E.5,NRE.1,NRE.2,NRE.3,NRE.4,NRE.5,NRF.1,NRF.2,NRF.3,NRF.4,NRF.5,NRG.1,NRG.2,NRG.3,NRG.4,NRG.5,NRH.1,NRH.2,NRH.3,NRH.4,NRH.5
```

### Unicost instances (OR-Library CYC CLR instances and Steiner triple covering problem instances)

"*For RWLS, the stopping criterion is set as a maximum iteration number of $1 \times{} 10^8$.*"[Gao2015]

In [Gao2015], they put a limit of **10^8 steps** as stopping criterion for these instances. Here the program was run with the same maximum steps number using the script [run_unicost.sh](scripts/run_unicost.sh).

Comma separated list of instances names:
```
CLR10,CLR11,CLR12,CLR13,CYC6,CYC7,CYC8,CYC9,CYC10,CYC11,STS9,STS15,STS27,STS45,STS81,STS135,STS243,STS405,STS729
```

### RAIL instances (OR-Library RAIL instances)

"*We set the maximum runtime for RWLS-R and 3FNLS to 100 seconds for instances RAIL507, RAIL516 and RAIL586, and 1000 seconds for RAIL2536, RAIL2586, RAIL4284 and RAIL4872 because of their larger sizes.*"[Gao2015]

In [Gao2015], they use a modified version of RWLS called RWLS-R (see the article for more details), this algorithm was not implemented and the basic RWLS was used, making these results not comparable with the authors results.

They put a limit of 100 seconds for RAIL507, RAIL516, RAIL586 and 1000 seconds for RAIL2536, RAIL2586, RAIL4284, as with a time limit the number of steps will depend on the machine running the solver, and the algorithm used is not the same, a time limit of **7200 seconds** was used.

The program was run using the script [run_rail.sh](scripts/run_rail.sh) for RAIL507, RAIL516, RAIL586 and using the script [run_rail_large.sh](scripts/run_rail_large.sh) for RAIL2536, RAIL2586, RAIL4284 which compile the program in Low Memory Footprint mode because of the large size of the instances.

Comma separated list of instances names:
```
RAIL507,RAIL516,RAIL582,RAIL2536,RAIL2586,RAIL4284,RAIL4872
```

## Printer output

The document contains:
- instances informations
- result for the Greedy and the RWLS algorithms
- statistics for RWLS repetitions

To generate this document, the printer was run using:
```
./solver --input=${HOME}/solver_out --rwls_stats
```

## References

```BibTeX
@Article{Gao2015,
  author       = {Chao Gao and Xin Yao and Thomas Weise and Jinlong Li},
  title        = {An efficient local search heuristic with row weighting for the unicost set covering problem},
  journaltitle = {European Journal of Operational Research},
  date         = {2015},
  volume       = {246},
  number       = {3},
  pages        = {750-761},
  issn         = {0377-2217},
  doi          = {10.1016/j.ejor.2015.05.038},
  groups       = {Local search, Reviewed},
  keywords     = {Combinatorial optimization, Unicost set covering problem, Row weighting local search},
}
```

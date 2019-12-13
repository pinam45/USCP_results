# 2019/11/14 Test of the subproblem_greedy crossover operator

In this benchmark, we wanted to test the Memetic algorithm with the most promising configuration found in the last [crossovers/generations comparison benchmark](../2019_11_12_crossovers_generations_comparison): the subproblem_greedy crossover operator with 100 generations.
 
As the Memetic algorithm uses RWLS as a local search, the results were compared to the results of the [RWLS complete benchmark](../../RWLS/2019_10_18_complete_benchmark). To be able to compare the algorithm with RWLS, the total number of steps is fixed to the same value as in [Gao2015](../../References.md) and the complete benchmark.

Results are:
 - It seems that a solution crossover alone doesn't bring improvement compared to RWLS "alone"
 - RWLS may not be influenced enough by the initial solution
 - RWLS may more rely on the information of the points weight

For more details, see the printer output.

## Solver output

The solver was run on the 22 most "improvable" instances, the NR\[E-H\].\[1-5\] and CYC\[10-11\] instances.

Comma separated list of instances names:
```
NRE.1,NRE.2,NRE.3,NRE.4,NRE.5,NRF.1,NRF.2,NRF.3,NRF.4,NRF.5,NRG.1,NRG.2,NRG.3,NRG.4,NRG.5,NRH.1,NRH.2,NRH.3,NRH.4,NRH.5,CYC10,CYC11
```

100 repetitions were launched but they were stopped before the end, each instance thus only have ~30 repetitions finished.

The script used to submit the 22 * 100 = 2200 jobs to slurm is [submit_special.sh](./scripts/submit_special.sh). This script submit jobs with run scripts depending on the on the instance type, see the [RWLS complete benchmark](../../RWLS/2019_10_18_complete_benchmark) for more information and the scripts for details.

## Printer output

The document contains:
- instances information
- result for the Greedy, RWLS and Memetic algorithms
- statistics for RWLS repetitions
- comparison of the results for the Memetic configurations

To generate this document, the printer was run using:
```
./printer --input=<repository_path>/RWLS/2019_10_18_complete_benchmark/solver_out,<repository_path>/Memetic/2019_11_14_subproblem_greedy/solver_out --rwls_stats --memetic_comparisons
```

# 2019/12/07 WCrossover comparison

In this benchmark, after the [Crossovers/WCrossover comparison benchmark](../2019_11_20_crossover_wcrossover_comparison), we wanted to test more RWLS points weights crossovers (wcrossover). 6 new wcrossover operators were implemented:
 - *min*: for each child, each point weight is the minimum of the point weights in the parents
 - *max*: for each child, each point weight is the maximum of the point weights in the parents
 - *minmax*: for the first child, each point weight is the minimum of the point weights in the parents, for the second child, each point weight is the maximum of the point weights in the parents
 - *add*: for each child, each point weight is the addition  of the point weights in the parents
 - *difference*: for each child, each point weight is the absolute value of the difference  of the point weights in the parents
 - *shuffle*: for each child, the points weights vector is shuffled

As the Memetic algorithm uses RWLS as a local search, the results were compared to the results of the [RWLS complete benchmark with weights](../../RWLS/2019_12_05_complete_benckmark_weights). To be able to compare the algorithm with RWLS, the total number of steps is fixed to the same value as in [Gao2015](../../References.md) and the complete benchmark.

The number of steps fixed, we tested the wcrossover operators with the subproblem_greedy crossover operator. The values tested are all the combinations of:
 - crossovers: subproblem_greedy
 - wcorssovers: mix_random, average, min, max, minmax, add, difference, shuffle

Results are:
 - It appear there is no globally better wcrossover operator, the operators are more or less efficient depending on the instances

For more details, see the printer output.

## Solver output

The solver was run on the 19 most "improvable" instances, the NR\[E,G,H\].\[1-5\] and CYC\[8-11\] instances with each of the 8 parameters combination. It should have had 100 repetition for each configuration but due to problems with slurm, the number of repetitions goes from 84 to 308.

The script used to submit the 8 * 19 * 100 = 15200 jobs to slurm is [submit_special.sh](./scripts/submit_special.sh). This script submit, for each configuration and instance, jobs arrays of size 25 with the [run_steps_4.sh](./scripts/run_steps_4.sh) script that run 4 repetitions in parallel, generating a total of 100 repetitions. The stopping criterion depend on the instance type, see the [RWLS complete benchmark](../../RWLS/2019_10_18_complete_benchmark) for more information and the scripts for details.

## Printer output

The document contains:
- instances information
- result for the Greedy, RWLS and Memetic algorithms
- statistics for RWLS repetitions
- comparison of the results for the Memetic configurations

To generate this document, the printer was run using:
```
./printer --input=<repository_path>/RWLS/2019_12_05_complete_benckmark_weights/solver_out,<repository_path>/Memetic/2019_12_07_wcrossovers_comparison/solver_out --rwls_stats --memetic_comparisons
```

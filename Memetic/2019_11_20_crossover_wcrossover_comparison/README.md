# 2019/11/20 Crossovers/WCrossover comparison

In this benchmark, we wanted to test the effect of a crossover on RWLS points weights (wcrossover). 4 wcrossover operators were implemented:
 - *reset*: for each child, each point weight is reset to 1, as if there was no crossover applied
 - *keep*: for each child, each point weight stay the same without modifications
 - *mix_random*: for each child, each point weight is taken randomly from one parent or the other
 - *average*: for each child, each point weight is the average of the point weights in the parents

As the Memetic algorithm uses RWLS as a local search, the results were compared to the results of the [RWLS complete benchmark](../../RWLS/2019_10_18_complete_benchmark). To be able to compare the algorithm with RWLS, the total number of steps is fixed to the same value as in [Gao2015](../../References.md) and the complete benchmark.

The number of steps fixed, we tested the wcrossover operators with a crossover operator (subproblem_greedy) and without (identity). The values tested are all the combinations of:
 - crossovers: identity, subproblem_greedy
 - wcorssovers: reset, keep, mix_random, average

Results are:
 - Generally the *subproblem_greedy/average* configuration give the best results

For more details, see the printer output.

## Solver output

The solver was run on the 19 most "improvable" instances, the NR\[E,G,H\].\[1-5\] and CYC\[8-11\] instances with each of the 8 parameters combination. Due to problems with slurm, repetitions were run until each configuration had at least 100 repetitions.

The script used to submit the 8 * 19 = 152 repetitions to slurm is [submit_special.sh](./scripts/submit_special.sh). This script submit jobs with run scripts depending on the on the instance type, see the [RWLS complete benchmark](../../RWLS/2019_10_18_complete_benchmark) for more information and the scripts for details.

## Printer output

The document contains:
- instances information
- result for the Greedy, RWLS and Memetic algorithms
- statistics for RWLS repetitions
- comparison of the results for the Memetic configurations

To generate this document, the printer was run using:
```
./printer --input=<repository_path>/RWLS/2019_10_18_complete_benchmark/solver_out,<repository_path>/Memetic/2019_11_20_crossover_wcrossover_comparison/solver_out --rwls_stats --memetic_comparisons
```

# 2019/11/12 Crossovers/generations comparison

In this benchmark, we wanted to select the best parameters for the Memetic algorithm. As the Memetic algorithm uses RWLS as a local search, the results were compared to the results of the [RWLS complete benchmark](../../RWLS/2019_10_18_complete_benchmark). To be able to compare the algorithm with RWLS, the total number of steps is fixed to the same value as in [Gao2015](../../References.md) and the complete benchmark.

The number of steps fixed, only the crossover operator and the number of crossover/generation to do is to be chosen. The values tested are all the combinations of:
 - crossovers: greedy_merge, merge, subproblem_greedy, subproblem_random
 - generations: 10, 100, 1 000, 10 000, 100 000

Results are:
 - Generally the subproblem_greedy crossover operator with 100 generations give the best results
 - There is not enough repetitions to determine if the crossover brings improvement (see [subproblem greedy benchmark](../2019_11_14_subproblem_greedy))

For more details, see the printer output.

## Solver output

The solver was run on each of the 96 instances with each of the 20 parameters combination. A second repetition was run but stopped before the end, each instance thus only have 1 or 2 repetitions by combinations finished.

The script used to submit the 96 * 20 = 1920 repetitions to slurm is [submit_all.sh](./scripts/submit_all.sh). This script submit jobs with run scripts depending on the on the instance type, see the [RWLS complete benchmark](../../RWLS/2019_10_18_complete_benchmark) for more information and the scripts for details.

## Printer output

The document contains:
- instances information
- result for the Greedy, RWLS and Memetic algorithms
- statistics for RWLS repetitions
- comparison of the results for the Memetic configurations

To generate this document, the printer was run using:
```
./printer --input=<repository_path>/RWLS/2019_10_18_complete_benchmark/solver_out,<repository_path>/Memetic/2019_11_12_crossovers_generations_comparison/solver_out --rwls_stats --memetic_comparisons
```

# 2019/11/15 CYC 36000 seconds

In this benchmark, we wanted to test the Memetic algorithm on unicost instances with the most promising configurations found in the [crossovers/generations comparison benchmark](../2019_11_12_crossovers_generations_comparison): the subproblem_greedy and the subproblem_random crossover operators with 100 generations. But contrary to the last [subproblem_greedy benchmark](../2019_11_14_subproblem_greedy) we do not limit the number of generations of steps with values from [Gao2015](../../References.md) and the [RWLS complete benchmark](../../RWLS/2019_10_18_complete_benchmark).

The number of generations is no longer limited, the number of steps by generation is set to 150 000 (as for the base instances in the [subproblem_greedy benchmark](../2019_11_14_subproblem_greedy)), and the time limit is set to 36000 seconds. The results were compared to the results of the [RWLS complete benchmark](../../RWLS/2019_10_18_complete_benchmark).

Results are:
 - Running the algorithm for a long time doesn't improve the results compared to the [subproblem_greedy benchmark](../2019_11_14_subproblem_greedy)

For more details, see the printer output.

## Solver output

The solver was run on the 4 most "improvable" unicost instances, the CYC\[8-11\] instances.

Comma separated list of instances names:
```
CYC8,CYC9,CYC10,CYC11
```

100 repetitions were launched for each crossover. The script used to submit the 4 * 2 * 100 = 800 jobs to slurm is [submit_special.sh](./scripts/submit_special.sh). This script submit jobs with the [run_unicost.sh](./scripts/run_unicost.sh) script, for details see the script.

## Printer output

The document contains:
- instances information
- result for the Greedy, RWLS and Memetic algorithms
- statistics for RWLS repetitions
- comparison of the results for the Memetic configurations

To generate this document, the printer was run using:
```
./printer --input=<repository_path>/RWLS/2019_10_18_complete_benchmark/solver_out,<repository_path>/Memetic/2019_11_15_CYC_36000seconds/solver_out --rwls_stats --memetic_comparisons
```

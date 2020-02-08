# 2019/12/05 Complete benchmark with weights

This benchmark is the same that the first [RWLS complete benchmark](../2019_10_18_complete_benchmark) but with the new RWLS implementation that is faster and include the initial and final RWLS points weights in the executions reports. With the points weights information in the reports, the printer have generated RWLS points weights plots to study the weights repartition in RWLS.

The results are similar to the first [RWLS complete benchmark](../2019_10_18_complete_benchmark), for more details, see the printer output.

## Solver output

The solver was run 100 times on each of the 96 instances with parameters used in [Gao2015](../../References.md) to be able to compare them with the authors results. The stopping criterion depend on the instance type, see the first [RWLS complete benchmark](../2019_10_18_complete_benchmark) for more information and the scripts for details.

The script used to submit the 96 * 100 = 9600 repetitions to slurm is [submit_all.sh](./scripts/submit_all.sh). This script submit for each instance:
 - 12 jobs with the [run_steps_8.sh](./scripts/run_steps_8.sh)/[run_time_8.sh](./scripts/run_time_8.sh) scripts that run 8 repetitions in parallel
 - 1 job with the [run_steps_4.sh](./scripts/run_steps_4.sh)/[run_time_4.sh](./scripts/run_time_4.sh) scripts that run 4 repetitions in parallel

The script used depend on the stopping criterion (steps/time), see the scripts for details.

## Printer output

The main document contains:
- instances information
- result for the Greedy and the RWLS algorithms
- statistics for RWLS repetitions
- if uncommented in [main.tex](./printer_out/main.tex): RWLS final points weights plots

For each instance, in the [plots](./printer_out/plots) subfolder:
 - **rwls_weights_\<instance_name\>.csv** contain the RWLS final points weights plots data
 - **rwls_weights_\<instance_name\>.tex** contain the RWLS final points weights plots that can be compiled as a standalone
 - **figure_rwls_weights_\<instance_name\>.tex** contain the code for generating the figure with the plot and can be ``\input{}`` in the main document to include the figure

To generate the documents, the printer was run using:
```
./printer --input=<repository_path>/RWLS/2019_12_05_complete_benckmark_weights/solver_out --rwls_stats --rwls_weights
```

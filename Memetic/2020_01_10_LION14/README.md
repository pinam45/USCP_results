# 2020/01/10 LION14 benchmark

This benchmark was made for our submission to the [14th Learning and Intelligent OptimizatioN Conference](http://www.caopt.com/LION14/) (LION14). In the paper the results are compared to those obtained by RWLS in [Gao2015](../../References.md) in which they made 10 repetitions.

To compare the algorithm with RWLS, we also made 10 repetitions and set the total number of steps to the same value as in [Gao2015](../../References.md) for all non-RAIL instances, meaning that the stopping criterion for these instances depend on the instance type, see the [RWLS complete benchmark](../../RWLS/2019_10_18_complete_benchmark) for more information and the scripts for details. The stopping criterion used for the RAIL instances is 10000 seconds.

For the results, see the printer output and the LION14 submission "**A memetic approach on the Unicost Set Cover Problem**" by

| Name                | Email                      | Institute |
|:--------------------|:---------------------------|:---------:|
| Maxime Pinard       | maxime.pin@live.fr         |    1,2    |
| Laurent Moalic      | laurent.moalic@uha.fr      |    1,2    |
| Mathieu Brévilliers | mathieu.brevilliers@uha.fr |    1,2    |
| Julien Lepagnot     | julien.lepagnot@uha.fr     |    1,2    |
| Lhassane Idoumghar  | lhassane.idoumghar@uha.fr  |    1,2    |

| Ref. | Institute                                                            |
|:----:|:---------------------------------------------------------------------|
|  1   | Université de Haute-Alsace, IRIMAS UR 7499, F-68100 Mulhouse, France |
|  2   | Université de Strasbourg, France                                     |

## Solver output

The solver was run 10 times on all instances used in [Gao2015](../../References.md) and the STS2187 instance.

The script used to submit the 10 * 98 = 980 repetitions to slurm is [submit_all.sh](./scripts/submit_all.sh). This script submit, for each instance, a jobs arrays of size 2 with the [run_steps_4.sh](./scripts/run_steps_4.sh)/[run_time_4.sh](./scripts/run_time_4.sh) scripts that run 4 repetitions in parallel and a job with the [run_steps_2.sh](./scripts/run_steps_2.sh)/[run_time_2.sh](./scripts/run_time_2.sh) scripts that run 2 repetitions in parallel, generating a total of 10 repetitions.

The script used depend on the stopping criterion which depend on the instance type, see the [RWLS complete benchmark](../../RWLS/2019_10_18_complete_benchmark) for more information for the non-RAIL instances and the scripts for details.

## Printer output

The document contains:
- instances information
- result for the Greedy and Memetic algorithms

To generate this document, the printer was run using:
```
./printer --input=<repository_path>/Memetic/2020_01_10_LION14/solver_out
```

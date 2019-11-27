#! /bin/bash

# Exit on error
set -e

# Path variables
slurmoutputfolder=${HOME}/slurm_out

# Define instances
instances_unicost="
CYC8
CYC9
CYC10
CYC11
"

crossover_operators="
subproblem_random
subproblem_greedy
"

# Submit jobs
for i in {1..100}
do
	for crossover_operator in ${crossover_operators}
	do
		mkdir -p "${slurmoutputfolder}/${crossover_operator}"
		for instance in ${instances_unicost}
		do
			echo "Submit unicost: ${instance}-${crossover_operator}"
			sbatch --job-name="${instance}-${crossover_operator}" --output="${slurmoutputfolder}/${crossover_operator}/${instance}-%j.out" ./run_unicost.sh "${crossover_operator}" "${instance}"
		done
	done
done

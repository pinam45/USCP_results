#! /bin/bash

# Exit on error
set -e

# Path variables
slurmoutputfolder=${HOME}/slurm_out

# Define instances
instances_base="
NRE.1
NRE.2
NRE.3
NRE.4
NRE.5
NRF.1
NRF.2
NRF.3
NRF.4
NRF.5
NRG.1
NRG.2
NRG.3
NRG.4
NRG.5
NRH.1
NRH.2
NRH.3
NRH.4
NRH.5
"

instances_unicost="
CYC10
CYC11
"

crossover_operators="
subproblem_greedy
"

generations="
100
"

# Submit jobs
for i in {1..100}
do
	for crossover_operator in ${crossover_operators}
	do
		for generation in ${generations}
		do
			mkdir -p "${slurmoutputfolder}"
			for instance in ${instances_base}
			do
				echo "Submit base: ${instance}-${crossover_operator}-${generation}g"
				sbatch --job-name="${instance}-${crossover_operator}-${generation}g" --output="${slurmoutputfolder}/${instance}-%j.out" ./run_base.sh "${crossover_operator}" "${generation}" "${instance}"
			done

			for instance in ${instances_unicost}
			do
				echo "Submit unicost: ${instance}-${crossover_operator}-${generation}g"
				sbatch --job-name="${instance}-${crossover_operator}-${generation}g" --output="${slurmoutputfolder}/${instance}-%j.out" ./run_unicost.sh "${crossover_operator}" "${generation}" "${instance}"
			done
		done
	done
done

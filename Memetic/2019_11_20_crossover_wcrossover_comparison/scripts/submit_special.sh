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
CYC8
CYC9
CYC10
CYC11
"

crossover_operators="
identity
subproblem_greedy
"

wcrossover_operators="
reset
keep
average
mix_random
"

# Submit jobs
for i in {1..10}
do
	for crossover_operator in ${crossover_operators}
	do
		for wcrossover_operator in ${wcrossover_operators}
		do
			mkdir -p "${slurmoutputfolder}/${crossover_operator}/${wcrossover_operator}"

			for instance in ${instances_base}
			do
				echo "Submit base: ${instance}-${crossover_operator}"
				sbatch --job-name="${instance}-${crossover_operator}" --output="${slurmoutputfolder}/${crossover_operator}/${wcrossover_operator}/${instance}-%j.out" ./run_base.sh "${crossover_operator}" "${wcrossover_operator}" "${instance}"
			done

			for instance in ${instances_unicost}
			do
				echo "Submit unicost: ${instance}-${crossover_operator}"
				sbatch --job-name="${instance}-${crossover_operator}" --output="${slurmoutputfolder}/${crossover_operator}/${wcrossover_operator}/${instance}-%j.out" ./run_unicost.sh "${crossover_operator}" "${wcrossover_operator}" "${instance}"
			done
		done
	done
done

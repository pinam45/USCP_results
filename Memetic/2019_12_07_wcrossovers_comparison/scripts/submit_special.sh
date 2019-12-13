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
subproblem_greedy
"

wcrossover_operators="
average
mix_random
add
difference
max
min
minmax
shuffle
"

# Submit jobs
for crossover_operator in ${crossover_operators}
do
	for wcrossover_operator in ${wcrossover_operators}
	do
		mkdir -p "${slurmoutputfolder}/${crossover_operator}/${wcrossover_operator}"

		for instance in ${instances_base}
		do
			echo "Submit 4 base: ${instance}-${crossover_operator}-${wcrossover_operator}"
			sbatch --array=0-24 --job-name="${instance}-${crossover_operator}-${wcrossover_operator}" --output="${slurmoutputfolder}/${crossover_operator}/${wcrossover_operator}/${instance}-%j.out" ./run_steps_4.sh "${crossover_operator}" "${wcrossover_operator}" "${instance}" "30000000"
		done

		for instance in ${instances_unicost}
		do
			echo "Submit 4 unicost: ${instance}-${crossover_operator}-${wcrossover_operator}"
			sbatch --array=0-24 --job-name="${instance}-${crossover_operator}-${wcrossover_operator}" --output="${slurmoutputfolder}/${crossover_operator}/${wcrossover_operator}/${instance}-%j.out" ./run_steps_4.sh "${crossover_operator}" "${wcrossover_operator}" "${instance}" "100000000"
		done
	done
done

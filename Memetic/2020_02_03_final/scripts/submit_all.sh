#! /bin/bash

# Exit on error
set -e

# Path variables
slurmoutputfolder=${HOME}/slurm_out

# Define instances
instances_base="
4.1
4.2
4.3
4.4
4.5
4.6
4.7
4.8
4.9
4.10
5.1
5.2
5.3
5.4
5.5
5.6
5.7
5.8
5.9
5.10
6.1
6.2
6.3
6.4
6.5
A.1
A.2
A.3
A.4
A.5
B.1
B.2
B.3
B.4
B.5
C.1
C.2
C.3
C.4
C.5
D.1
D.2
D.3
D.4
D.5
E.1
E.2
E.3
E.4
E.5
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
CLR10
CLR11
CLR12
CLR13
CYC6
CYC7
CYC8
CYC9
CYC10
CYC11
STS9
STS15
STS27
STS45
STS81
STS135
STS243
STS405
STS729
STS1215
STS2187
"

instances_rail="
RAIL507
RAIL516
RAIL582
RAIL2536
RAIL2586
RAIL4284
RAIL4872
"

crossover_operators="
subproblem_rwls
"

wcrossover_operators="
max
"

# Create output folder
mkdir -p "${slurmoutputfolder}"

# Submit jobs
for crossover_operator in ${crossover_operators}
do
	for wcrossover_operator in ${wcrossover_operators}
	do
		for instance in ${instances_base}
		do
			echo "Submit 25*4 base: ${instance}-${crossover_operator}-${wcrossover_operator}"
			until sbatch --array=0-24 --job-name="${instance}-${crossover_operator}-${wcrossover_operator}" --output="${slurmoutputfolder}/${instance}-%j.out" ./run_steps_4.sh "${crossover_operator}" "${wcrossover_operator}" "${instance}" "30000000"
			do
				echo "Try again in 10s"
				sleep 10
			done
		done

		for instance in ${instances_unicost}
		do
			echo "Submit 25*4 unicost: ${instance}-${crossover_operator}-${wcrossover_operator}"
			until sbatch --array=0-24 --job-name="${instance}-${crossover_operator}-${wcrossover_operator}" --output="${slurmoutputfolder}/${instance}-%j.out" ./run_steps_4.sh "${crossover_operator}" "${wcrossover_operator}" "${instance}" "100000000"
			do
				echo "Try again in 10s"
				sleep 10
			done
		done

		for instance in ${instances_rail}
		do
			echo "Submit 25*4 rail: ${instance}-${crossover_operator}-${wcrossover_operator}"
			until sbatch --array=0-24 --job-name="${instance}-${crossover_operator}-${wcrossover_operator}" --output="${slurmoutputfolder}/${instance}-%j.out" ./run_time_4.sh "${crossover_operator}" "${wcrossover_operator}" "${instance}" "10000"
			do
				echo "Try again in 10s"
				sleep 10
			done
		done
	done
done

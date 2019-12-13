#! /bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --threads-per-core=1
#SBATCH --cpus-per-task=8

# Exit on error
set -e

# Path variables
codefolder=${HOME}/git/USCP/code
cmakefolder=${HOME}/tmp/cmake-build-${SLURM_JOB_ID}
solveroutputfolder=${HOME}/solver_out

# Parameters
crossover_operator=${1}
wcrossover_operator=${2}
instance=${3}
total_rwls_steps=${4}
rwls_steps=150000
generations=$(expr ${total_rwls_steps} / ${rwls_steps} / 2)

# Load cmake an gcc modules
module load cmake/cmake-3.12.2
module load gcc/gcc-9

# Build PGO generate
mkdir -p "${cmakefolder}"
cd "${cmakefolder}"
cmake "${codefolder}" -DCMAKE_BUILD_TYPE=Release -DPROFILE_GUIDED_OPTIMIZATION=GENERATE
cmake --build . --config Release -- -j"$(nproc)"

# Generate PGO data
cd build/bin
./solver --memetic --memetic_rwls_time=12 --memetic_generations=6 --memetic_crossover="${crossover_operator}" --memetic_wcrossover="${wcrossover_operator}" --repetitions=1 --instances="${instance}"

# Build PGO generate
cd "${cmakefolder}"
cmake "${codefolder}" -DCMAKE_BUILD_TYPE=Release -DPROFILE_GUIDED_OPTIMIZATION=USE
cmake --build . --config Release -- -j"$(nproc)"

# Execute
cd build/bin
for i in {1..4}
do
	./solver --output_prefix="${solveroutputfolder}/${crossover_operator}/${wcrossover_operator}/${instance}_" --greedy --memetic --memetic_rwls_steps="${rwls_steps}" --memetic_generations="${generations}" --memetic_crossover="${crossover_operator}" --memetic_wcrossover="${wcrossover_operator}" --repetitions=1 --instances="${instance}" &
done
wait

rm -r "${cmakefolder}"

#! /bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --threads-per-core=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=16384

# Exit on error
set -e

# Path variables
codefolder=${HOME}/git/USCP/code
cmakefolder=${HOME}/tmp/cmake-build-${SLURM_JOB_ID}
solveroutputfolder=${HOME}/solver_out

# Parameters
crossover_operator=${1}
generations=${2}
instance=${3}
rwls_steps=$(expr 30000000 / ${generations} / 2)

# Comfigure OpemMP thread number
if [ -n "${SLURM_CPUS_PER_TASK}" ]; then
  current_threads=${SLURM_CPUS_PER_TASK}
else
  current_threads=1
fi
export OMP_NUM_THREADS=${current_threads}
export MKL_NUM_THREADS=${current_threads}
export OMP_PROC_BIND=true

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
./solver --memetic --memetic_rwls_time=12 --memetic_generations=6 --memetic_crossover="${crossover_operator}" --repetitions=1 --instances="${instance}"

# Build PGO generate
cd "${cmakefolder}"
cmake "${codefolder}" -DCMAKE_BUILD_TYPE=Release -DPROFILE_GUIDED_OPTIMIZATION=USE
cmake --build . --config Release -- -j"$(nproc)"

# Execute
cd build/bin
./solver --output_prefix="${solveroutputfolder}/${instance}-${crossover_operator}-${generations}g_" --greedy --memetic --memetic_generations="${generations}" --memetic_rwls_steps="${rwls_steps}" --memetic_crossover="${crossover_operator}" --repetitions=1 --instances="${instance}"

rm -r "${cmakefolder}"

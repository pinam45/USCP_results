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
instance=${1}
rwls_time=${2}

# Load cmake and gcc modules
module load cmake/cmake-3.12.2
module load gcc/gcc-9

# Build PGO generate
mkdir -p "${cmakefolder}"
cd "${cmakefolder}"
cmake "${codefolder}" -DCMAKE_BUILD_TYPE=Release -DPROFILE_GUIDED_OPTIMIZATION=GENERATE
cmake --build . --config Release -- -j"$(nproc)"

# Generate PGO data
cd build/bin
./solver --rwls --rwls_time=16 --repetitions=1 --instances="${instance}"

# Build PGO use
cd "${cmakefolder}"
cmake "${codefolder}" -DCMAKE_BUILD_TYPE=Release -DPROFILE_GUIDED_OPTIMIZATION=USE
cmake --build . --config Release -- -j"$(nproc)"

# Execute
cd build/bin
for i in {1..8}
do
	./solver --output_prefix="${solveroutputfolder}/${instance}_" --greedy --rwls --rwls_time="${rwls_time}" --repetitions=1 --instances="${instance}" &
done
wait

rm -r "${cmakefolder}"

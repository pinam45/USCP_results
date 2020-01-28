# Memetic algorithm

This directory contains the benchmark results for the instances with the [USCP](https://github.com/pinam45/USCP) solver implementation of a memetic algorithm with two individuals. The algorithm is an adaptation for the USCP of the HEAD algorithm from [Moalic2018](../References.md) using RWLS from [Gao2015](../References.md) as a local search.

**Warning**: The solver was run on the [Calculus center of the University of Strasbourg](https://services-numeriques.unistra.fr/les-services-aux-usagers/hpc.html) which have a lot of different machines with different processors and uses [slurm workload manager](https://slurm.schedmd.com/). Therefore the running scripts are given for completeness but contain slurm specific configuration and will always build the program before running it.

For each benchmarks:

 - The ``README`` contain additional information about the benchmark

 - The ``scripts`` directory contains the scripts used to run the solver, the ``submit_[...].sh`` scripts submit jobs to slurm, each job run a ``run_[...].sh`` script which compiles and run the solver with a specified configuration (see scripts files content for more information).

 - The ``solver_out`` directory contains the raw output of the solver, json files with the resolutions information (final solution, generations, steps,...), these files can be processed with the printer to generate results and statistics tables in a LaTeX document.

 - The ``printer_out`` directory contains the output of the printer, LaTeX tables and a ``main.tex`` to generate a document with all the tables.

To compile the LaTeX document to a PDF file, you will need a LaTeX distribution such as [TeX Live](http://tug.org/texlive) that include [LuaTeX](http://www.luatex.org/) installed on your system. A ``.latexmkrc`` is provided so the document can be compiled by running *latexmk* in the ``printer_out`` directory:
```
$ latexmk -silent
```

## Benchmarks

 - [2019_11_12_crossovers_generations_comparison](./2019_11_12_crossovers_generations_comparison)
 - [2019_11_14_subproblem_greedy](./2019_11_14_subproblem_greedy)
 - [2019_11_15_CYC_36000seconds](./2019_11_15_CYC_36000seconds)
 - [2019_11_20_crossover_wcrossover_comparison](./2019_11_20_crossover_wcrossover_comparison)
 - [2019_12_07_wcrossovers_comparison](./2019_12_07_wcrossovers_comparison)
 - [2020_01_10_LION14](./2020_01_10_LION14)

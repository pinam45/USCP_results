# Memetic algorithm

This directory contains the benchmark results for the instances with the [USCP](https://github.com/pinam45/USCP) solver implementation of a memetic algorithm with two individuals. The algorithm is an adaptation for the USCP of the HEAD algorithm from [Moalic2018] using RWLS from [Gao2015] as a local search.

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

 - [2019_11_14_crossovers_generations_comparison](./2019_11_14_crossovers_generations_comparison)

## References

```BibTeX
@Article{Moalic2018,
  author    = {Moalic, Laurent and Gondran, Alexandre},
  title     = {{Variations on memetic algorithms for graph coloring problems}},
  journal   = {Journal of Heuristics},
  year      = {2018},
  volume    = {24},
  number    = {1},
  month     = {2},
  pages     = {1--24},
  issn      = {1572-9397},
  doi       = {10.1007/s10732-017-9354-9},
  keywords  = {Combinatorial optimization, Metaheuristics, Coloring, Graph, Evolutionary},
  publisher = {Springer US},
}
@Article{Gao2015,
  author       = {Chao Gao and Xin Yao and Thomas Weise and Jinlong Li},
  title        = {An efficient local search heuristic with row weighting for the unicost set covering problem},
  journaltitle = {European Journal of Operational Research},
  date         = {2015},
  volume       = {246},
  number       = {3},
  pages        = {750-761},
  issn         = {0377-2217},
  doi          = {10.1016/j.ejor.2015.05.038},
  groups       = {Local search, Reviewed},
  keywords     = {Combinatorial optimization, Unicost set covering problem, Row weighting local search},
}
```

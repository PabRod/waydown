[![Build Status](https://github.com/PabRod/waydown/workflows/R-CMD-check/badge.svg?branch=master)](https://github.com/PabRod/waydown/actions)
[![codecov](https://codecov.io/gh/PabRod/waydown/graph/badge.svg)](https://codecov.io/gh/PabRod/waydown)
[![codecov](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.3763038.svg)](https://doi.org/10.5281/zenodo.3763038)
[![fair-software.eu](https://img.shields.io/badge/fair--software.eu-%E2%97%8F%20%20%E2%97%8F%20%20%E2%97%8B%20%20%E2%97%8F%20%20%E2%97%8B-orange)](https://fair-software.eu)

# waydown <img src="vignettes/img/logo.png" width="120" align="right" />
This package implements some methods for computing potential landscapes for non-gradient systems.

For a detailed overview of the underlying ideas, please refer to:

[Rodríguez-Sánchez P](https://pabrod.github.io) [![](https://orcid.org/sites/default/files/images/orcid_16x16.png)](https://orcid.org/0000-0002-2855-940X), van Nes EH, Scheffer M (2020) Climbing Escher’s stairs: A way to approximate stability landscapes in multidimensional systems. PLOS Computational Biology 16(4): e1007788. https://doi.org/10.1371/journal.pcbi.1007788

## Getting started

### Prerrequisites
This is an _R_ package. [_R_](https://www.r-project.org/) is required, [_RStudio_](https://rstudio.com/) is recommended.

### Installing

#### Latest stable version
Type `devtools::install_github("PabRod/waydown", ref = "master")` in your `R` command console.

#### Latest version
Type `devtools::install_github("PabRod/waydown", ref = "develop")` in your `R` command console.

#### Reproduce my manuscript
If you want to locally reproduce my manuscript [_Climbing Escher's stairs: a simple quasi-potential algorithm for weakly non-gradient systems_](https://arxiv.org/abs/1903.05615), follow these steps:

0. Type `devtools::install_github("PabRod/waydown", ref = "feature/reproducible")` to install `waydown` and the libraries needed to reproduce the manuscript
1. Clone or download the reproducible branch of this repository (shortcut: `git clone --single-branch --branch feature/reproducible https://github.com/PabRod/waydown.git`)
2. knit the file [`vignettes\manuscript.Rmd`](https://github.com/PabRod/waydown/blob/feature/reproducible/vignettes/manuscript.Rmd)

Rendering the figures requires `Python`, and the packages `matplotlib` and `numpy`.

### Running the tests
The integrity of this package can be checked by running the battery of tests available at `./tests`.

### Examples of usage
A vignette with examples of usage can be found in [inst/doc/examples.pdf](inst/doc/examples.pdf)

## Citation
If you use this software, the information below may help you citing it.
```
Rodríguez-Sánchez, P. (2019). PabRod/waydown: a package for computing pseudopotentials. https://doi.org/10.5281/zenodo.2591550
```

If you want to cite also the paper describing the algorithm used by this software, please use:

```
Rodríguez-Sánchez, P., van Nes, E. H., & Scheffer, M. (2020). Climbing Escher’s stairs: A way to approximate stability landscapes in multidimensional systems. PLOS Computational Biology, 16(4), e1007788. https://doi.org/10.1371/journal.pcbi.1007788
```

## Authors
- [Pablo Rodríguez-Sánchez](https://pabrod.github.io) [![](https://orcid.org/sites/default/files/images/orcid_16x16.png)](https://orcid.org/0000-0002-2855-940X)

## License
This project is licensed under the MIT License.

## Acknowledgements
This work was greatly inspired by the dicussions with [Cristina Sargent](https://www.researchgate.net/profile/Cristina-Sargent), [Iñaki Úcar](https://github.com/Enchufa2/), [Enrique Benito](https://sites.google.com/site/enriquebenitomatias/), [Tobias Oertel-Jäger](https://users.fmi.uni-jena.de/~tjaeger/), [Jelle Lever](https://www.researchgate.net/profile/J-Jelle-Lever), [Sanne J.P. van den Berg](https://www.researchgate.net/profile/Sanne-Van-Den-Berg-4) and [Els Weinans](https://www.wur.nl/es/Persons/Els-E-Els-Weinans-MSc.htm). This work was supported by funding from the European Union's _Horizon 2020_ research and innovation programme for the [_ITN CRITICS_](https://cordis.europa.eu/project/id/643073) under Grant Agreement Number _643073_.

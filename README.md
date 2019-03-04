[![Build Status](https://travis-ci.org/PabRod/consRvative.svg?branch=master)](https://travis-ci.org/PabRod/consRvative)
[![codecov](https://codecov.io/gh/PabRod/consRvative/branch/master/graph/badge.svg)](https://codecov.io/gh/PabRod/consRvative)

# consRvative <img src="vignettes/img/logo.png" width="120" align="right" />
This package implements some methods for computing potential landscapes for non-gradient systems.

For a detailed overview of the underlying ideas, please refer to the paper _Climbing Escher’s stairs, or how to estimate stability
landscapes for multidimensional deterministic systems_, by Pablo Rodríguez-Sánchez, Egbert van Nes and Marten Scheffer.

## Getting started

### Prerrequisites
This is a _R_ package. _R_ is required, _R studio_ is recommended.

### Installing
Type `devtools::install_github("PabRod/consRvative", ref = "develop")` in your `R` command console.

### Running the tests
The integrity of this package can be checked by running the battery of tests available at `./tests`.

### Examples of usage
A vignette with examples of usage can be found in [inst/doc/examples.pdf](inst/doc/examples.pdf)

## Authors
- [Pablo Rodríguez-Sánchez](https://pabrod.github.io)

## License
This project is licensed under the MIT License - see the [LICENSE.md](LICENSE) file for details

## Acknowledgements
This work was greatly inspired by the dicussions with [Cristina Sargent](https://www.researchgate.net/profile/Cristina_Sargent), [Iñaki Úcar](https://github.com/Enchufa2/), [Enrique Benito](https://sites.google.com/site/enriquebenitomatias/), [Tobias Oertel-Jäger](https://users.fmi.uni-jena.de/~tjaeger/), [Jelle Lever](https://www.linkedin.com/in/jellelever/) and [Els Weinans](https://www.wur.nl/es/Persons/Els-E-Els-Weinans-MSc.htm). This work was supported by funding from the European Union's _Horizon 2020_ research and innovation programme for the [_ITN CRITICS_](http://www.criticsitn.eu/wp/) under Grant Agreement Number _643073_.

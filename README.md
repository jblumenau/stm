##stm: An R Package for the Structural Topic Model

Website: www.structuraltopicmodel.com

Vignette: [Here](http://scholar.harvard.edu/files/bstewart/files/stmvignette.pdf)

Authors: [Molly Roberts](http://scholar.harvard.edu/mroberts), [Brandon Stewart](http://scholar.harvard.edu/bstewart) and [Dustin Tingley](http://scholar.harvard.edu/dtingley)

Please email all comments/questions to bstewart [AT] fas.harvard.edu

###Summary

This repository contains an early release for the stm package for R.  It implements variational EM algorithms for estimating topic models with covariates in a framework we call the Structural Topic Model (stm). Future releases will be available on CRAN but we are using the repository here to provide a soft release.

The package currently includes functionality to:
* ingest and manipulate text data
* estimate Structural Topic Models
* calculate covariate effects on latent topics with uncertainty
* estimate a graph of topic correlations
* create all the plots used in our various papers

###Other Resources

Have a large text corpus or need a language we don't provide support for?  See our sister project [txtorg](http://txtorg.org)

Papers on the Structural Topic Model:
* Roberts, Stewart and Airoldi. "Structural Topic Models"
* Roberts, Stewart, Tingley, and Airoldi. "The Structural Topic Model and Applied Social Science." *Advances in Neural Information Processing Systems Workshop on Topic Models: Computation, Application, and Evaluation*. 2013. Copy available [here](http://scholar.harvard.edu/files/bstewart/files/stmnips2013.pdf)
* Roberts, Stewart, Tingley, Lucas, Leder-Luis, Gadarian, Albertson, and Rand. "Structural topic models for open-ended survey responses." *American Journal of Political Science*. Forthcoming. Copy available [here](http://scholar.harvard.edu/files/dtingley/files/topicmodelsopenendedexperiments.pdf)
* Lucas, Nielsen, Roberts, Stewart, Storer, and Tingley. "Computer assisted text analysis for comparative politics." Copy available [here](http://scholar.harvard.edu/files/dtingley/files/comparativepoliticstext.pdf)

### Installation Instructions
Assuming you already have R installed (if not see http://www.r-project.org/), the easiest
approach is to use the devtools package to install directly from github.  First you have 
to install devtools using the following code.  Note that you only have to do this once
```  
if(!require(devtools)) install.packages("devtools")
```   
Then you can load the package and use the function `install_github`

```
library(devtools)
install_github("bstewart/stm",dependencies=TRUE)
```

Note that this will install all the packages suggested and required to run our package.  It may take a few minutes the first time, but this only needs to be done on the first use.  In the future you can update to the most recent development version using the same code. 

You can also grab the binaries or source files for the latest release here: (https://github.com/bstewart/stm/releases).  Then use `install.packages` with `repos=NULL` so that
```
install.packages(filepath, repos = NULL)
```    

### Getting Started
See the vignette for several example analyses.  The main function to estimate the model is `stm()` but there are a host of other useful functions.  If you have your documents already converted to term-document matrices you can ingest them using `readCorpus()`.  If you just have raw texts you will want to start with `textProcessor()`.

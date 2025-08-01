# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

ClinicoPathDescriptives is an R package for descriptive analysis in clinicopathological research with jamovi integration. It provides both standalone R functions and GUI modules for medical researchers.

## Common Development Commands

### Build and Check
```r
# Load development environment
devtools::load_all()

# Generate documentation from roxygen2 comments
devtools::document()

# Run comprehensive R CMD check
devtools::check()

# Build package
devtools::build()

# Install package locally
devtools::install()
```

### Documentation
```r
# Build pkgdown website locally
pkgdown::build_site()

# Build specific vignettes
devtools::build_vignettes()

# Preview documentation
pkgdown::preview_site()
```

### Testing
```r
# Run informal tests (no formal test suite currently)
# Check specific functions by running examples
example("tableone")
example("crosstable")

# Run R CMD check for comprehensive validation
devtools::check()
```

## Architecture Overview

### Module Structure
Each analysis module follows this pattern:
- `modulename.h.R` - Header file defining jamovi interface (Options/Results classes)
- `modulename.b.R` - Body file with R6 class implementation
- Both inherit from `jmvcore` base classes

### Key Design Patterns

1. **R6 Class Architecture**
   - All modules use R6 classes: `modulenameClass <- R6::R6Class("modulenameClass", inherit = modulenameBase, ...)`
   - Standard methods: `initialize()`, `.init()`, `.run()`
   - Results populated in `.run()` method

2. **Options-Results Pattern**
   ```r
   # Options define inputs
   moduleOptions <- jmvcore::Options$new(...)
   
   # Results define outputs (tables, plots, text)
   moduleResults <- jmvcore::Results$new(...)
   ```

3. **Utility Functions** (R/utils.R)
   - `extract_function_name()` - Extracts test names from formulas
   - `extract_kable()` - Processes gt/gtsummary tables
   - Diagnostic test statistics: `calcStats()`, `calcLikelihoodRatios()`, `oddsratio2x2()`
   - ROC analysis: `calcOptimalCutoff()`, `calcYouden()`

### Dependencies Management
Core dependencies are loaded via:
- Direct imports in NAMESPACE
- `@import` and `@importFrom` in roxygen2 comments
- Avoid adding new dependencies without careful consideration

## Adding New Modules

1. Create module definition in `jamovi/module.yaml`
2. Generate module files: `jmvtools::create("modulename")`
3. Implement R6 class following existing patterns
4. Add comprehensive roxygen2 documentation
5. Create vignette in `vignettes/`
6. Update `_pkgdown.yml` to include in documentation

## Documentation Standards

### Roxygen2 Comments
```r
#' @title Module Title
#' @importFrom pkg function
#' @import entirepackage
#' @export
#' @return Description of return value
#' @description Detailed description
#' @examples
#' # Example code
```

### Vignettes
- Use clinical examples with included datasets
- Show both R code and jamovi GUI usage
- Include interpretation of results
- Name format: `analysis_modulename.Rmd`

## Data Handling

### Available Datasets
22 clinical datasets in `data/` for examples and testing:
- Use `data("datasetname")` to load
- Datasets cover various clinical scenarios
- Both categorical and continuous variables included

### Variable Handling
- Clean names: `janitor::clean_names()`
- Preserve labels: Use `labelled` package functions
- Handle missing data explicitly with user options

## CI/CD Pipeline

### GitHub Actions
1. **R-CMD-check** - Runs on push/PR to master
   - Tests on Windows, macOS, Ubuntu
   - R release and devel versions
   
2. **pkgdown** - Deploys documentation
   - Triggered on push to master
   - Deploys to GitHub Pages

### Version Management
- Current: 0.0.3.90 (development)
- Update version in DESCRIPTION
- Use semantic versioning
- Document changes in NEWS.md

## Important Notes

- **No formal test suite**: Currently relies on R CMD check and examples
- **jamovi integration**: Test both R functions and jamovi GUI
- **Medical focus**: Maintain clinical relevance in all features
- **Documentation priority**: Comprehensive docs are essential for medical users
- **Clean code**: Follow tidyverse style guide
- **Error messages**: Make user-friendly for non-programmers
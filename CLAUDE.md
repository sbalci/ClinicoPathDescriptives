# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

ClinicoPathDescriptives is a hybrid R package that serves as both a standalone R package and a jamovi module for descriptive analysis in clinicopathological research. It provides 11 analysis functions covering descriptive statistics, visualizations, and specialized medical research tools.

## Architecture

### Dual Architecture Pattern
Each analysis function follows a three-file pattern:
- `.b.R` files: Business logic and implementation (e.g., `tableone.b.R`)
- `.h.R` files: jamovi interface definitions (auto-generated, don't edit manually)
- `.a.yaml` files: jamovi GUI configuration in `jamovi/` directory

### Key Directories
- `R/`: R source code with `.b.R` (implementation) and `.h.R` (interface) files
- `jamovi/`: YAML configurations for jamovi GUI (11 analysis modules)
- `data/`: Example datasets (`histopathology.rda`, `treatmentResponse.rda`)
- `man/`: Auto-generated documentation (via roxygen2)

### Analysis Functions
- `tableone`: Generate "Table One" descriptive summaries
- `summarydata`: Continuous variable summaries
- `reportcat`: Categorical variable summaries
- `crosstable`: Cross-tabulations with statistical tests
- `alluvial`: Alluvial diagrams for categorical relationships
- `agepyramid`: Age pyramid visualizations
- `benford`: Benford's law analysis for data quality
- `venn`: Venn diagrams and UpSet plots
- `vartree`: Variable tree summaries
- `waterfall`: Treatment response analysis (RECIST criteria)
- `swimmerplot`: Patient timeline visualizations

## Development Commands

### Standard R Package Development
```r
# Load package for testing
devtools::load_all()

# Generate documentation from roxygen2 comments
devtools::document()

# Run R CMD check
devtools::check()

# Build package
devtools::build()

# Build and install locally
devtools::install()

# Build vignettes
devtools::build_vignettes()

# Generate pkgdown website
pkgdown::build_site()
```

### Dependencies
- Core: tidyverse packages (`dplyr`, `ggplot2`, `tidyr`)
- Clinical research: `tableone`, `gtsummary`, `arsenal`, `finalfit`
- jamovi integration: `jmvcore`
- Visualization: `easyalluvial`, `ggvenn`, `DiagrammeR`

### Testing and Quality Assurance
No formal test suite exists. Testing is done through:
- `devtools::check()` for R CMD check
- Manual testing in jamovi GUI for module functionality
- GitHub Actions CI/CD on multiple platforms

### jamovi Development Notes
- jamovi YAML files in `jamovi/` must be manually maintained
- Analysis options in YAML must match R function parameters exactly
- The `0000.yaml` defines overall module structure and menu organization
- Test jamovi functionality requires jamovi installation and GUI testing

### Website and Documentation
- pkgdown site: https://www.serdarbalci.com/ClinicoPathDescriptives/
- Main repository: https://github.com/sbalci/ClinicoPathDescriptives/
- Issue tracking: https://github.com/sbalci/ClinicoPathJamoviModule/issues/
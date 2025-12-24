# ClinicoPathDescriptives 0.0.32.56 (2025-12-24)

## New Features

### New Data and Documentation

* **Data Checking Guide**: Added a comprehensive vignette/guide for data checking (`vignettes/ClinicoPathDescriptives-checkdata-guide.md`)
* **Test Datasets**: Added new datasets for `chisqposttest` and `alluvial` modules to support testing and examples
* **Legacy Vignettes**: Restored legacy vignettes and updated documentation links for better accessibility

## Enhanced Existing Modules

### Age Pyramid (`agepyramid`)

* Major enhancement to robustly handle single-gender cohorts
* Added detailed data quality and exclusion reporting
* Improved HTML summaries for clearer analysis results
* Enhanced plot and table logic for both standard and single-gender scenarios
* Added explicit selection for both female and male levels

## Package Infrastructure

* **Dependencies**: Updated dependencies to support new features
* **Documentation**: Updated `CLAUDE.md` and package documentation for AI-assisted development
* **Bug Fixes**: Improved error handling and sample size reporting across modules

---

# ClinicoPathDescriptives 0.0.31.84 (2025-10-03)

## New Features

### New Analysis Modules

* **Data Quality Assessment** (`dataquality`): Comprehensive data quality profiling with missing value analysis, distribution assessments, and validation checks
* **Data Checking** (`checkdata`): Interactive data validation and quality control tools
* **Outlier Detection** (`outlierdetection`): Multiple methods for detecting outliers including DBSCAN, robust statistics, and visualization tools
* **Chi-square Post-hoc Tests** (`chisqposttest`): Detailed post-hoc analysis for chi-square tests with pairwise comparisons

### Enhanced Existing Modules

* **Venn Diagrams** (`venn`): Major enhancement with full `ggVennDiagram` integration for 2-7 set comparisons with improved aesthetics and statistical output
* **Age Pyramid** (`agepyramid`): Enhanced visualization options and improved demographic analysis capabilities
* **Variable Tree** (`vartree`): Improved variable handling and hierarchical data structure visualizations
* **Cross-tabulation** (`crosstable`): Added q-value support for multiple comparison corrections with detailed explanations
* **Table One** (`tableone`): Enhanced baseline characteristics tables with improved statistical test selection
* **Alluvial Diagrams** (`alluvial`): Improved flow visualizations for categorical variable relationships
* **Benford's Law Analysis** (`benford`): Enhanced data quality assessment tools with additional diagnostic plots

## Module Migration to OncoPath

* **Swimmer Plot** (`swimmerplot`): Moved to the new **OncoPath** module for oncology-specific visualizations
* **Waterfall Plot** (`waterfall`): Moved to the new **OncoPath** module for oncology-specific visualizations

These oncology-focused visualization tools have been migrated to a dedicated module to better serve cancer research workflows. Users needing swimmer plots and waterfall plots should install the **OncoPath** package.

## Package Infrastructure

### Dependencies

* Added new dependencies: `dbscan`, `performance`, `robustbase`, `stringr`, `visdat`, `ggVennDiagram`
* Removed dependencies: `ggswim` (migrated to OncoPath)
* Updated all dependencies to latest compatible versions

### Documentation

* Added `CLAUDE.md` for AI-assisted development guidance
* Updated package description to reflect current feature set
* Enhanced roxygen2 documentation across all modules
* Improved inline help and examples

### Bug Fixes

* Fixed variable handling in multiple modules
* Improved error handling and user feedback
* Enhanced data validation across all analysis functions
* Resolved compatibility issues with jamovi interface

### Internal Changes

* Version bumped from 0.0.3.70 to 0.0.31.84
* Date updated to 2025-10-03
* Improved utility functions for data processing
* Enhanced test statistics calculations
* Better integration between R functions and jamovi modules

---

# ClinicoPathDescriptives 0.0.3.70 (2025-09-18)

## Features

* Initial comprehensive release with core descriptive analysis tools
* Full jamovi integration for GUI-based analysis
* 22 clinical datasets for examples and testing
* Comprehensive vignette collection
* pkgdown documentation website

## Core Modules

* Table One generation
* Cross-tabulation analysis
* Summary statistics
* Categorical data reporting
* Age pyramid visualizations
* Alluvial diagrams
* Benford's law analysis
* Variable trees

# ClinicoPathDescriptives

[![R-CMD-check](https://github.com/sbalci/ClinicoPathDescriptives/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/sbalci/ClinicoPathDescriptives/actions/workflows/R-CMD-check.yaml)
[![CRAN status](https://www.r-pkg.org/badges/version/ClinicoPathDescriptives)](https://CRAN.R-project.org/package=ClinicoPathDescriptives)
[![License: GPL v2](https://img.shields.io/badge/License-GPL%20v2-blue.svg)](https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html)

## Overview

**ClinicoPathDescriptives** is a comprehensive R package designed specifically for descriptive analysis in clinicopathological research. This toolkit bridges the gap between statistical analysis and medical research workflows by providing both programmatic R functions and an intuitive graphical interface through the jamovi statistical platform.

The package emphasizes reproducible research workflows, automated reporting capabilities, and natural language interpretation of statistical results, making advanced statistical analysis accessible to medical researchers regardless of their programming background. With over 50 comprehensive vignettes and extensive documentation, ClinicoPathDescriptives serves as both a powerful analytical tool and an educational resource for clinicopathological research.

## Key Features

### 📊 Descriptive Analysis Suite

- **Table One Generation** (`tableone`): Create publication-ready baseline characteristics tables with automatic variable type detection and appropriate statistical tests
- **Cross-tabulation Analysis** (`crosstable`): Generate comprehensive contingency tables with chi-square, Fisher's exact, and other appropriate statistical tests, including q-value corrections for multiple comparisons
- **Summary Statistics** (`summarydata`): Automated descriptive statistics with natural language interpretation and multiple output formats
- **Categorical Data Reporting** (`reportcat`): Specialized reporting tools for categorical variables with clinical context

### 📈 Advanced Visualizations

- **Age Pyramid Plots** (`agepyramid`): Population structure visualizations for demographic analysis
- **Alluvial Diagrams** (`alluvial`): Flow visualizations for tracking categorical variable relationships and patient pathways
- **Venn Diagrams** (`venn`): Set relationship visualizations with statistical overlap analysis
- **Swimmer Plots** (`swimmerplot`): Timeline visualizations for longitudinal clinical studies and treatment responses
- **Waterfall Plots** (`waterfall`): Treatment response and biomarker change visualizations
- **Variable Trees** (`vartree`): Hierarchical data structure visualizations for complex datasets

### 🔍 Data Quality & Validation

- **Benford's Law Analysis** (`benford`): Statistical data quality assessment and fraud detection using first-digit distribution analysis
- **Comprehensive Data Profiling**: Automated data quality reports with missing value analysis, distribution assessments, and outlier detection
- **Variable Validation**: Built-in checks for data consistency and clinical plausibility

### 🎯 Clinical Research Focus

- **Medical Terminology Integration**: Functions and outputs designed with clinical research workflows in mind
- **Journal-Ready Tables**: Multiple formatting options compatible with major medical journals (NEJM, Lancet, JAMA styles)
- **Statistical Best Practices**: Appropriate test selection based on data characteristics and clinical research standards
- **Natural Language Summaries**: Automated interpretation of statistical results in clinically meaningful language

### 🖥️ Dual Interface Design

- **R Programming Interface**: Full programmatic control with pipe-friendly syntax and tidy data principles
- **jamovi GUI Modules**: Point-and-click interface for researchers without programming experience
- **Reproducible Workflows**: All analyses generate reproducible code regardless of interface used

### 📚 Comprehensive Documentation

- **50+ Detailed Vignettes**: Step-by-step tutorials covering all package functions with clinical examples
- **22 Clinical Datasets**: Real-world medical research scenarios for testing and learning
- **Interactive Examples**: Hands-on tutorials with interpretation guidance
- **pkgdown Website**: Professional documentation at [serdarbalci.com/ClinicoPathDescriptives](https://www.serdarbalci.com/ClinicoPathDescriptives/)

## Installation

### Development Version

```r
# Install from GitHub
devtools::install_github("sbalci/ClinicoPathDescriptives")
```

### jamovi Module

Install the jamovi module from the jamovi library or visit [ClinicoPath jamovi Module](https://sbalci.github.io/ClinicoPathJamoviModule/).

## Quick Start

```r
library(ClinicoPathDescriptives)

# Load example clinical dataset
data("histopathology")

# Generate Table One for baseline characteristics
tableone_result <- tableone(
  data = histopathology,
  grouping_variable = "Treatment_Group",
  explanatory_variables = c("Age", "Gender", "Tumor_Size", "Grade")
)

# Create cross-tabulation with statistical tests
crosstable_result <- crosstable(
  data = histopathology,
  dependent_variable = "Response",
  explanatory_variables = c("Treatment_Group", "Biomarker_Status"),
  statistical_test = TRUE
)

# Generate alluvial diagram for treatment pathways
alluvial_plot <- alluvial(
  data = histopathology,
  variables = c("Initial_Treatment", "Response", "Second_Line_Treatment")
)
```

## Documentation & Support

- **Package Website**: [https://www.serdarbalci.com/ClinicoPathDescriptives/](https://www.serdarbalci.com/ClinicoPathDescriptives/)
- **GitHub Repository**: [https://github.com/sbalci/ClinicoPathDescriptives/](https://github.com/sbalci/ClinicoPathDescriptives/)
- **jamovi Module**: [https://sbalci.github.io/ClinicoPathJamoviModule/](https://sbalci.github.io/ClinicoPathJamoviModule/)
- **Issue Tracking**: [GitHub Issues](https://github.com/sbalci/ClinicoPathJamoviModule/issues/)

## Citation

If you use ClinicoPathDescriptives in your research, please cite the main ClinicoPath project:

```
Serdar Balci (2025). ClinicoPath jamovi Module. doi:10.5281/zenodo.3997188
[R package]. Retrieved from https://github.com/sbalci/ClinicoPathJamoviModule
```

## License

GPL (>= 2) - see [LICENSE](LICENSE) file for details.

## Contributing

Contributions are welcome! Please see our [contributing guidelines](CONTRIBUTING.md) and feel free to submit issues, feature requests, or pull requests.

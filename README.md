# ClinicoPathDescriptives

[![R-CMD-check](https://github.com/sbalci/ClinicoPathDescriptives/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/sbalci/ClinicoPathDescriptives/actions/workflows/R-CMD-check.yaml)
[![CRAN status](https://www.r-pkg.org/badges/version/ClinicoPathDescriptives)](https://CRAN.R-project.org/package=ClinicoPathDescriptives)
[![License: GPL v2](https://img.shields.io/badge/License-GPL%20v2-blue.svg)](https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html)
[![jamovi](https://img.shields.io/badge/jamovi-module-blue)](https://www.jamovi.org)

## Overview

**ClinicoPathDescriptives** is a comprehensive R package and jamovi module designed specifically for descriptive analysis, data profiling, and population visualization in clinicopathological research. As the descriptive analytics engine of the **ClinicoPath** ecosystem, it bridges statistical methodology and clinical research workflows through both programmatic R functions and an intuitive graphical interface in jamovi (under the **Exploration** menu).

The package emphasizes reproducible research workflows, publication-ready baseline tables, interactive data validation, and natural language interpretation of results—making advanced descriptive statistics accessible to clinicians, pathologists, and researchers.

---

## 🎯 Key Features & Analysis Suite (14 Analyses)

ClinicoPathDescriptives provides **14 distinct analyses** organized into four functional groups:

| Category | Analysis | Function | Key Clinical Features |
| :--- | :--- | :--- | :--- |
| **Descriptive Tables** | **Table One** | `tableone` | Publication-ready baseline patient characteristics with automatic variable type detection, parametric/non-parametric tests, SMD (standardized mean differences), and missing value reporting. |
| **Descriptive Tables** | **Cross-tabulation** | `crosstable` | Multi-way contingency tables with Pearson Chi-Square, Fisher's exact test, Likelihood Ratio, Cramer's V, and multiple comparison corrections. |
| **Descriptive Tables** | **Continuous Summaries** | `summarydata` | Comprehensive summary statistics for continuous variables with distribution diagnostics and natural language clinical summaries. |
| **Descriptive Tables** | **Categorical Summaries** | `reportcat` | Frequency and percentage distributions for categorical variables with clinical context and formatted summary text. |
| **Visualizations** | **Age Pyramid** | `agepyramid` | Demographic and cohort population pyramid plots with flexible age binning, split by gender or disease subgroup. |
| **Visualizations** | **Alluvial Diagrams** | `alluvial` | Categorical flow diagrams visualizing patient journeys, disease staging transitions, and multi-line therapy trajectories. |
| **Visualizations** | **Venn & Set Overlaps** | `venn` | High-resolution set intersection diagrams supporting 2 to 7 sets with statistical overlap counts and proportions via ggVennDiagram. |
| **Visualizations** | **Variable Tree** | `vartree` | Hierarchical data structure trees visualizing patient cohort stratification, inclusion/exclusion paths, and subgroup breakdowns. |
| **Data Quality** | **Data Quality Assessment** | `dataquality` | Multi-variable data health dashboard summarizing missingness patterns, variable types, distributions, and potential anomalies. |
| **Data Quality** | **Single Variable Check** | `checkdata` | Interactive data validation tool for screening individual variables for entry errors, boundary violations, and formatting issues. |
| **Data Quality** | **Outlier Detection** | `outlierdetection` | Multi-method outlier detection leveraging IQR, Z-scores, Mahalanobis distance, MCD (robust covariance), and DBSCAN clustering. |
| **Data Quality** | **Benford's Law Analysis** | `benford` | Digital data integrity, fraud, and anomaly screening using first- and second-digit Benford distribution conformance. |
| **Comparisons** | **Chi-Square Post-Hoc** | `chisqposttest` | Pairwise post-hoc proportion comparisons following significant chi-square tests with Bonferroni, Holm, or FDR adjustments. |
| **Data Preparation** | **Categorize Variables** | `categorize` | Flexible binning and recoding of continuous variables into clinically meaningful ordinal categories, percentiles, or custom intervals. |

---

## 🚀 Installation

### In jamovi (Recommended)

1. Open **jamovi** (>= 2.6).
2. Click the **Modules** button (**+**) in the top right corner.
3. Select **jamovi library**.
4. Search for **ClinicoPathDescriptives** (or browse under **Exploration**).
5. Click **Install**.

### As an R Package

```r
# Install development version from GitHub
remotes::install_github("sbalci/ClinicoPathDescriptives")
```

---

## 💡 Quick Start (R Interface)

```r
library(ClinicoPathDescriptives)

# Load included clinical histopathology dataset
data("histopathology", package = "ClinicoPathDescriptives")

# 1. Generate publication-ready Table One
tableone_result <- ClinicoPathDescriptives::tableone(
  data = histopathology,
  vars = vars(Age, Gender, Grade, Tumor_Size),
  showSummary = TRUE
)

# 2. Cross-tabulation with statistical tests
crosstable_result <- ClinicoPathDescriptives::crosstable(
  data = histopathology,
  vars = vars(Grade),
  group = "Sex",
  pcat = TRUE
)

# 3. Treatment pathway alluvial diagram
alluvial_plot <- ClinicoPathDescriptives::alluvial(
  data = histopathology,
  vars = vars(Sex, Grade, Stage)
)

# 4. Demographic age pyramid
pyramid_plot <- ClinicoPathDescriptives::agepyramid(
  data = histopathology,
  age = "Age",
  gender = "Sex"
)
```

---

## 📖 Documentation & Resources

- **Module Website & Vignettes**: [https://www.serdarbalci.com/ClinicoPathDescriptives/](https://www.serdarbalci.com/ClinicoPathDescriptives/)
- **ClinicoPath Umbrella Ecosystem**: [https://www.serdarbalci.com/ClinicoPathJamoviModule/](https://www.serdarbalci.com/ClinicoPathJamoviModule/)
- **GitHub Repository**: [https://github.com/sbalci/ClinicoPathDescriptives/](https://github.com/sbalci/ClinicoPathDescriptives/)
- **Issue Tracker & Feature Requests**: [GitHub Issues](https://github.com/sbalci/ClinicoPathJamoviModule/issues)

---

## Citation

If you use ClinicoPathDescriptives in your research or publications, please cite:

```bibtex
@manual{balci2026clinicopath,
  title  = {ClinicoPath: jamovi Module for Clinicopathological Research},
  author = {Serdar Balci},
  year   = {2026},
  url    = {https://www.serdarbalci.com/ClinicoPathJamoviModule/},
  doi    = {10.5281/zenodo.3997188}
}
```

## License

GPL (>= 2) — see the [LICENSE](LICENSE) file for details.

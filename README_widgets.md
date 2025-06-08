# README Widgets for ClinicoPathDescriptives

## Project Badges

### Core Status Badges
```markdown
[![R-CMD-check](https://github.com/sbalci/ClinicoPathDescriptives/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/sbalci/ClinicoPathDescriptives/actions/workflows/R-CMD-check.yaml)
[![CRAN status](https://www.r-pkg.org/badges/version/ClinicoPathDescriptives)](https://CRAN.R-project.org/package=ClinicoPathDescriptives)
[![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![R-universe status badge](https://sbalci.r-universe.dev/badges/ClinicoPathDescriptives)](https://sbalci.r-universe.dev/ClinicoPathDescriptives)
```

### jamovi Module Badges
```markdown
[![jamovi](https://img.shields.io/badge/jamovi-module-blue)](https://www.jamovi.org)
[![jamovi version](https://img.shields.io/badge/jamovi-≥1.6.0-brightgreen)](https://www.jamovi.org)
[![ClinicoPath Module](https://img.shields.io/badge/ClinicoPath-jamovi%20module-purple)](https://github.com/sbalci/ClinicoPathJamoviModule)
[![GUI Available](https://img.shields.io/badge/GUI-available-green)](https://sbalci.github.io/ClinicoPathJamoviModule/)
```

### Package Information Badges
```markdown
[![GitHub release (latest by date)](https://img.shields.io/github/v/release/sbalci/ClinicoPathDescriptives)](https://github.com/sbalci/ClinicoPathDescriptives/releases)
[![GitHub last commit](https://img.shields.io/github/last-commit/sbalci/ClinicoPathDescriptives)](https://github.com/sbalci/ClinicoPathDescriptives/commits/master)
[![GitHub issues](https://img.shields.io/github/issues/sbalci/ClinicoPathDescriptives)](https://github.com/sbalci/ClinicoPathDescriptives/issues)
[![License: GPL (>= 2)](https://img.shields.io/badge/License-GPL%20(>=2)-blue.svg)](https://www.gnu.org/licenses/gpl-2.0)
```

### Medical Research Domain Badges
```markdown
[![Medical Research](https://img.shields.io/badge/domain-medical%20research-red)](https://github.com/sbalci/ClinicoPathDescriptives)
[![Pathology](https://img.shields.io/badge/field-pathology-darkred)](https://github.com/sbalci/ClinicoPathDescriptives)
[![Clinical Data](https://img.shields.io/badge/data-clinical-lightblue)](https://github.com/sbalci/ClinicoPathDescriptives)
[![RECIST](https://img.shields.io/badge/supports-RECIST%20criteria-orange)](https://github.com/sbalci/ClinicoPathDescriptives)
```

### Technology Stack Badges
```markdown
[![R](https://img.shields.io/badge/R-≥4.1.0-blue?logo=r)](https://www.r-project.org/)
[![tidyverse](https://img.shields.io/badge/tidyverse-compatible-brightgreen?logo=tidyverse)](https://www.tidyverse.org/)
[![ggplot2](https://img.shields.io/badge/ggplot2-visualization-blue)](https://ggplot2.tidyverse.org/)
[![pkgdown site](https://img.shields.io/badge/docs-pkgdown-blue)](https://www.serdarbalci.com/ClinicoPathDescriptives/)
```

## Installation Widgets

### R Package Installation
```markdown
## Installation

### Install from GitHub
```r
# Install development version
if (!require("remotes")) install.packages("remotes")
remotes::install_github("sbalci/ClinicoPathDescriptives")
```

### Install as jamovi Module
Download the `.jmo` file from [Releases](https://github.com/sbalci/ClinicoPathDescriptives/releases) and install in jamovi via:
`jamovi menu > Modules > Install from file`
```

## Feature Highlight Widgets

### Analysis Functions Grid
```markdown
## Available Analyses

| Function | Description | Clinical Use |
|----------|-------------|--------------|
| 📊 **Table One** | Descriptive summary tables | Baseline characteristics |
| 📈 **Summary Data** | Continuous variable summaries | Biomarker analysis |
| 📋 **Report Categorical** | Categorical variable reports | Demographics |
| ⚡ **Cross Tables** | Cross-tabulations with tests | Association studies |
| 🌊 **Alluvial Diagrams** | Categorical relationships | Patient flow |
| 👥 **Age Pyramid** | Age-sex distributions | Population studies |
| 🔍 **Benford Analysis** | Data quality assessment | Fraud detection |
| ⭕ **Venn Diagrams** | Set relationships | Biomarker overlap |
| 🌳 **Variable Tree** | Hierarchical summaries | Data exploration |
| 📉 **Waterfall Plots** | Treatment response (RECIST) | Oncology trials |
| 🏊 **Swimmer Plots** | Patient timelines | Follow-up studies |
```

### Quick Start Widget
```markdown
## Quick Start

### In R
```r
library(ClinicoPathDescriptives)

# Load example data
data(histopathology)

# Generate Table One
tableone(data = histopathology, 
         vars = c("Age", "Sex", "Grade"),
         group = "Diagnosis")
```

### In jamovi
1. Install the ClinicoPath module
2. Open your data in jamovi
3. Navigate to `Exploration > ClinicoPath Descriptives`
4. Select your analysis function
```

## Citation Widget
```markdown
## Citation

```r
citation("ClinicoPathDescriptives")
```

**BibTeX:**
```bibtex
@Manual{ClinicoPathDescriptives,
  title = {ClinicoPathDescriptives: Descriptive Analysis Tools for Clinicopathological Research},
  author = {Serdar Balci},
  year = {2024},
  note = {R package version 0.0.3.21},
  url = {https://github.com/sbalci/ClinicoPathDescriptives},
}
```
```

## Support and Community Widgets
```markdown
## Support

- 📖 [Documentation](https://www.serdarbalci.com/ClinicoPathDescriptives/)
- 🐛 [Report Issues](https://github.com/sbalci/ClinicoPathJamoviModule/issues)
- 💬 [Discussions](https://github.com/sbalci/ClinicoPathDescriptives/discussions)
- 🌐 [jamovi Module Hub](https://sbalci.github.io/ClinicoPathJamoviModule/)

## Contributing

Contributions are welcome! Please see our [Contributing Guidelines](CONTRIBUTING.md) for details.

## Related Projects

- [ClinicoPath jamovi Module](https://github.com/sbalci/ClinicoPathJamoviModule) - Main jamovi module
- [ClinicoPath Website](https://sbalci.github.io/ClinicoPathJamoviModule/) - Documentation and tutorials
```

## Compact Badge Collection
```markdown
<!-- Compact version for minimal README -->
[![R-CMD-check](https://github.com/sbalci/ClinicoPathDescriptives/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/sbalci/ClinicoPathDescriptives/actions/workflows/R-CMD-check.yaml) [![jamovi](https://img.shields.io/badge/jamovi-module-blue)](https://www.jamovi.org) [![Medical Research](https://img.shields.io/badge/domain-medical%20research-red)](https://github.com/sbalci/ClinicoPathDescriptives) [![License: GPL (>= 2)](https://img.shields.io/badge/License-GPL%20(>=2)-blue.svg)](https://www.gnu.org/licenses/gpl-2.0)
```
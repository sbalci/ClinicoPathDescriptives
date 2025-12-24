# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

ClinicoPathDescriptives is an R package providing descriptive analysis tools for clinicopathological research with dual-interface design: standalone R functions and jamovi GUI modules. The package serves medical researchers with both programming and point-and-click interfaces.

## Common Development Commands

### Build and Check
```r
# Load development environment
devtools::load_all()

# Generate documentation from roxygen2 comments
devtools::document()

# Run comprehensive R CMD check
devtools::check()

# Build R package
devtools::build()

# Install package locally
devtools::install()
```

### jamovi Module Development
```r
# Install jmvtools if needed
install.packages('jmvtools', repos=c('https://repo.jamovi.org', 'https://cran.r-project.org'))

# Compile jamovi module from jamovi/ directory
jmvtools::install()

# Check jamovi module
jmvtools::check()
```

The jamovi module (.jmo file) is built separately and contains the GUI interface. Module definitions are in `jamovi/*.yaml` files.

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
# No formal test suite - relies on R CMD check and examples
# Test functions by running examples
example("tableone")
example("crosstable")

# Run R CMD check for comprehensive validation
devtools::check()
```

## Architecture Overview

### Dual-Interface Module System

Each analysis module has **two implementations** that must be kept in sync:

1. **R Function Interface** (for programmatic use):
   - Located in `R/modulename.b.R` and `R/modulename.h.R`
   - Exported functions in `R/00jmv.R`
   - Used directly in R scripts

2. **jamovi GUI Interface** (for point-and-click use):
   - Module definition: `jamovi/0000.yaml` (master module list)
   - Analysis definition: `jamovi/modulename.a.yaml` (UI controls)
   - Results definition: `jamovi/modulename.r.yaml` (output structure)
   - UI definition: `jamovi/modulename.u.yaml` (layout)

### Module File Structure

Each module consists of three paired files:

```
R/
  modulename.h.R  # Header: Options and Results classes (auto-generated)
  modulename.b.R  # Body: R6 class with implementation logic

jamovi/
  modulename.a.yaml  # Analysis options (UI inputs)
  modulename.r.yaml  # Results structure (output tables/plots)
  modulename.u.yaml  # UI layout (control arrangement)
```

**Critical**: The `.h.R` files are auto-generated from YAML definitions. NEVER edit them manually.

### R6 Class Implementation Pattern

All modules follow this standard structure:

```r
modulenameClass <- if (requireNamespace('jmvcore')) R6::R6Class(
    "modulenameClass",
    inherit = modulenameBase,
    private = list(
        .init = function() {
            # Initialize results structure
            # Set up tables, plots, text outputs
        },

        .run = function() {
            # Main analysis logic
            # Populate results with data
        }
    )
)
```

**Key methods**:
- `initialize()`: Called when module is created (inherited from base)
- `.init()`: Set up results structure, configure tables/plots
- `.run()`: Perform analysis and populate results

### Options-Results Architecture

```r
# Options (inputs) - defined in .a.yaml, generated in .h.R
self$options$variableName    # Access user-selected variables
self$options$checkboxName    # Access user settings

# Results (outputs) - defined in .r.yaml, configured in .init(), populated in .run()
self$results$tableName       # Access result tables
self$results$plotName        # Access result plots
self$results$textName        # Access text outputs
```

## Key Implementation Files

### R/00jmv.R
- **Purpose**: Main export file that wraps R6 classes into user-facing functions
- **Pattern**: Each exported function instantiates the R6 class and runs it
- **Auto-generated**: Do not edit manually - regenerated from YAML definitions

### R/utils.R
Shared utility functions organized by purpose:

**Operators**:
- `%||%` - Null-coalescing operator
- `%|%` - NA-coalescing operator
- `%notin%` and `%!in%` - Not-in operators
- `%>%` - Pipe operator (re-exported from magrittr)

**Diagnostic Test Statistics**:
- `calculate_sensitivity()`, `calculate_specificity()`
- `calcStats()` - Comprehensive diagnostic statistics
- `calcLikelihoodRatios()` - Positive and negative likelihood ratios
- `oddsratio2x2()` - Odds ratio from 2x2 tables

**ROC Analysis**:
- `calcOptimalCutoff()` - Find optimal threshold
- `calcYouden()` - Calculate Youden's index

**Table Processing**:
- `extract_function_name()` - Extract test names from formulas
- `extract_kable()` - Process gt/gtsummary tables for jamovi display

### jamovi/0000.yaml
Master module manifest defining:
- Package metadata (name, version, authors)
- All available analyses with menu structure
- Dataset examples
- jamovi compatibility requirements

### jamovi/00refs.yaml
Bibliography and references for statistical methods used in the package.

## Adding New Modules

**Complete workflow** to add a new analysis module:

1. **Define in master manifest**:
   ```yaml
   # Edit jamovi/0000.yaml
   analyses:
     - title: New Analysis Name
       name: newanalysis
       ns: ClinicoPathDescriptives
       menuGroup: Exploration
       menuSubgroup: ClinicoPath Descriptives
       menuTitle: New Analysis
   ```

2. **Create YAML definitions**:
   ```r
   # This generates the three .yaml files in jamovi/
   jmvtools::create("newanalysis")
   ```

   Then edit the generated files:
   - `jamovi/newanalysis.a.yaml` - Define input options
   - `jamovi/newanalysis.r.yaml` - Define output structure
   - `jamovi/newanalysis.u.yaml` - Define UI layout

3. **Generate R skeleton**:
   ```r
   # This creates .h.R and .b.R files in R/
   jmvtools::install()  # Regenerates header files
   ```

4. **Implement logic** in `R/newanalysis.b.R`:
   - Add roxygen2 documentation at top
   - Implement `.init()` to configure results
   - Implement `.run()` to perform analysis

5. **Add documentation**:
   - Comprehensive roxygen2 comments in `.b.R`
   - Create vignette in `vignettes/newanalysis_documentation.md`
   - Update `_pkgdown.yml` if needed

6. **Rebuild package**:
   ```r
   devtools::document()  # Update .Rd files
   devtools::check()     # Verify package integrity
   jmvtools::install()   # Update jamovi module
   ```

## Documentation Standards

### Roxygen2 Headers
```r
#' @title Short Title
#' @description Detailed description of what the function does.
#' Explain the statistical methods and clinical use cases.
#' @param paramname Description of parameter
#' @return Description of return value
#' @importFrom pkg function
#' @import packagename
#' @export
#' @examples
#' # Load example data
#' data("histopathology")
#' # Run analysis
#' result <- functionname(data = histopathology, ...)
```

### Vignettes
- Use realistic clinical examples from included datasets
- Show both R code usage and jamovi GUI instructions
- Include interpretation of statistical results in clinical context
- Format: Markdown (.md) or R Markdown (.Rmd)
- Naming: `modulename_documentation.md`

## Data Handling

### Available Datasets
22 clinical datasets in `data/` directory, including:
- `histopathology.rda` - Primary example dataset
- `chisqposttest_*.csv` - Chi-square test examples
- `outlierdetection_*.rda` - Outlier detection examples
- `colorectal_ihc_data.csv` - IHC staining data
- Dataset files: `.rda` (R data), `.csv` (raw data), `.omv` (jamovi data)

### Variable Handling Best Practices
- **Clean variable names**: Use `janitor::clean_names()` for consistency
- **Preserve labels**: Use `labelled` package to maintain variable metadata
- **Missing data**: Provide user options for handling NA values
- **Type checking**: Validate variable types (numeric, factor, etc.) in `.run()`

## Dependencies Management

### Core Dependencies
Listed in DESCRIPTION file. Key dependencies:
- `jmvcore` - jamovi integration framework
- `R6` - Object-oriented programming
- `dplyr`, `tidyr`, `tibble` - Data manipulation
- `ggplot2`, `ggcharts` - Visualization
- `gt`, `gtsummary`, `tableone` - Table generation
- `finalfit`, `arsenal` - Clinical tables

### Adding Dependencies
1. Add to `Imports:` in DESCRIPTION
2. Use `@import` (entire package) or `@importFrom pkg function` (specific functions) in roxygen2
3. Never use `library()` or `require()` in package code
4. For optional dependencies, use `requireNamespace("pkg", quietly = TRUE)`

## Version Management

Current version scheme: `0.0.32.56` (major.minor.patch.build)

**Update locations** when changing version:
1. `DESCRIPTION` - Package version field
2. `jamovi/0000.yaml` - Module version field
3. `NEWS.md` - Document changes

**Semantic versioning guidance**:
- Major (0.x): Breaking changes
- Minor (x.0): New features
- Patch (x.x.0): Bug fixes
- Build (x.x.x.0): Development iterations

## CI/CD Pipeline

### GitHub Actions Workflows

Located in `.github/workflows/`:

1. **check-standard.yaml** - R CMD check
   - Runs on: Manual dispatch (workflow_dispatch)
   - Platforms: macOS, Windows, Ubuntu
   - R versions: release, devel
   - Tests package integrity across platforms

2. **pkgdown.yaml** - Documentation deployment
   - Builds pkgdown website
   - Deploys to GitHub Pages
   - URL: https://www.serdarbalci.com/ClinicoPathDescriptives/

### Build Artifacts
- R package: Built with `devtools::build()`
- jamovi module: `.jmo` file (built with `jmvtools::install()`)
- Documentation: pkgdown website in `docs/`

## Important Conventions

### Medical Research Focus
- Use clinically meaningful terminology in all user-facing text
- Provide natural language interpretation of statistical results
- Design for non-programmer medical researchers
- Include clinical examples in all documentation

### Code Style
- Follow tidyverse style guide
- Use pipe-friendly function design
- Prefer explicit over implicit behavior
- Error messages should be user-friendly, not technical

### jamovi-Specific
- Welcome messages with HTML styling guide users on first open
- Data quality messages report exclusions and data issues
- Results update reactively when options change
- All plots should be publication-ready by default

### Statistical Best Practices
- Automatic test selection based on data characteristics
- Warn users about assumption violations
- Provide multiple comparison corrections where appropriate
- Include confidence intervals with point estimates

## Related Projects

**OncoPath**: Oncology-specific visualizations (swimmer plots, waterfall plots) have been moved to a separate package. Reference users to OncoPath for cancer research workflows.

## File Organization

```
ClinicoPathDescriptives/
├── R/
│   ├── 00jmv.R              # Exported functions (auto-generated)
│   ├── utils.R              # Shared utilities
│   ├── modulename.h.R       # Module headers (auto-generated from YAML)
│   └── modulename.b.R       # Module implementations
├── jamovi/
│   ├── 0000.yaml            # Master module manifest
│   ├── 00refs.yaml          # Bibliography
│   ├── modulename.a.yaml    # Analysis options
│   ├── modulename.r.yaml    # Results definitions
│   └── modulename.u.yaml    # UI layout
├── data/                    # Clinical datasets (.rda, .csv)
├── vignettes/               # Documentation and tutorials
├── man/                     # R documentation (auto-generated)
├── DESCRIPTION              # Package metadata
├── NAMESPACE                # Package exports (auto-generated)
└── _pkgdown.yml             # Website configuration
```

## Common Pitfalls

- **Don't edit .h.R files**: They are auto-generated from YAML definitions
- **Don't edit R/00jmv.R**: Auto-generated; edit YAML instead
- **Don't edit NAMESPACE**: Auto-generated from roxygen2 comments
- **Sync R and jamovi**: Changes to R functions require YAML updates and vice versa
- **Test both interfaces**: Changes affect both R function calls and jamovi GUI
- **Version consistency**: Update version in both DESCRIPTION and jamovi/0000.yaml


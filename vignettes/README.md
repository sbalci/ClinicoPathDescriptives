# ClinicoPathDescriptives Documentation

Welcome to the comprehensive documentation for the ClinicoPathDescriptives R package. This collection of guides, tutorials, and reference materials supports rigorous descriptive analysis in clinicopathological research.

## Documentation Overview

### Quick Start

- **[Getting Started Guide](01-getting-started.Rmd)** - Installation, basic usage, and introduction to package features

### Methodology Guides

#### Table One and Baseline Characteristics
- **[Table One Methodology Guide](tableone_methodology_guide.md)** ⭐ - Comprehensive guide to creating baseline characteristics tables
  - When to use Table One
  - Variable selection principles
  - Statistical testing controversy (CONSORT guidelines)
  - Reporting standards
  - **Note**: The `tableone()` function generates descriptive statistics **without group comparisons**. For statistical comparisons between groups, use the `crosstable()` function.

#### Statistical Methods
- **[Statistical Methods Reference](statistical_methods_reference.md)** ⭐ - Complete reference for statistical tests
  - Chi-square test and Fisher's exact test
  - Independent and paired t-tests
  - Mann-Whitney U and Wilcoxon signed-rank tests
  - ANOVA and Kruskal-Wallis test
  - Assumptions, interpretations, and reporting standards

#### Clinical Interpretation
- **[Clinical Interpretation Guide](clinical_interpretation_guide.md)** ⭐ - Practical guidance for clinicians
  - Choosing median vs. mean
  - Interpreting age pyramids for population health
  - Understanding alluvial diagrams for treatment pathways
  - Clinical significance of cross-tabulation results

### Module-Specific Documentation

Each analysis module has dedicated documentation covering features, usage, and interpretation:

#### Descriptive Statistics
- `tableone_documentation.md` - Baseline characteristics tables
- `summarydata_documentation.md` - Continuous variable summaries
- `reportcat_documentation.md` - Categorical variable summaries

#### Data Quality
- `checkdata_documentation.md` - Single variable quality checks
- `dataquality_documentation.md` - Multi-variable visual quality assessment
- `benford_documentation.md` - Benford's law analysis for fraud detection
- `outlierdetection_documentation.md` - Outlier detection methods

#### Descriptive Plots
- `agepyramid_documentation.md` - Age-sex population pyramids
- `alluvial_documentation.md` - Flow diagrams for categorical relationships
- `venn_documentation.md` - Set overlap visualization
- `vartree_documentation.md` - Hierarchical data structure visualization

#### Comparisons and Cross-Tabulation
- `crosstable_documentation.md` - Cross-tabulation with statistical tests
- `chisqposttest_documentation.md` - Post-hoc tests for chi-square analysis

## Key Features by Analysis Type

### Baseline Characteristics (`tableone`)
**Purpose**: Describe patient populations **without group comparisons**

**Key Points**:
- Generate comprehensive descriptive statistics
- Multiple table styles (tableone, gtsummary, arsenal)
- Automatic variable type detection
- Missing data handling
- **No statistical testing** - purely descriptive
- For comparisons, use `crosstable()`

**When to use**:
- Describing a single cohort
- Baseline characteristics for observational studies
- Population summaries without comparison groups

### Group Comparisons (`crosstable`)
**Purpose**: Compare groups with appropriate statistical tests

**Key Points**:
- Cross-tabulation with chi-square or Fisher's exact test
- Multiple comparison corrections (Bonferroni, Holm, FDR)
- Effect size calculations
- Detailed statistical output
- Post-hoc pairwise comparisons

**When to use**:
- Comparing treatment groups
- Testing associations between variables
- Stratified analyses

### Data Visualization

#### Age Pyramids
- Population structure by age and sex
- Single-gender cohort support
- Clinical age group presets (pediatric, geriatric, reproductive)
- Data quality reporting with exclusion counts

#### Alluvial Diagrams
- Treatment pathway visualization
- Disease progression tracking
- Patient flow through healthcare systems
- Categorical variable relationships

#### Venn Diagrams
- Set overlap (2-7 sets supported)
- Statistical significance testing
- UpSet plot alternatives for complex overlaps

## Statistical Best Practices

### Reporting Guidelines Compliance

**CONSORT** (Randomized Trials):
- No p-values in baseline tables for RCTs
- Differences are due to chance, not systematic bias
- Report descriptive statistics only

**STROBE** (Observational Studies):
- Statistical testing may be appropriate
- Document confounding variables
- Transparency about missing data

### Effect Sizes

Always report effect sizes with confidence intervals:
- **Cohen's d** for t-tests (0.2 = small, 0.5 = medium, 0.8 = large)
- **Cramér's V** for chi-square tests
- **Hazard ratios** for survival data
- **Odds ratios** for case-control studies

### Multiple Comparisons

When testing multiple hypotheses:
- **Bonferroni**: Divide α by number of tests (conservative)
- **Holm**: Sequential Bonferroni (less conservative)
- **FDR** (Benjamini-Hochberg): Control false discovery rate
- Clearly distinguish exploratory from confirmatory analyses

## Common Workflows

### Workflow 1: Descriptive Analysis of a Single Cohort

```r
library(ClinicoPathDescriptives)
data("histopathology")

# 1. Describe the overall cohort
tableone(
  data = histopathology,
  vars = c("Age", "Sex", "Grade", "TStage", "LVI", "PNI")
)

# 2. Visualize age distribution
agepyramid(
  data = histopathology,
  age = "Age",
  gender = "Sex"
)

# 3. Check data quality
checkdata(
  data = histopathology,
  var = "Age"
)
```

### Workflow 2: Comparing Groups

```r
# Compare groups with statistical tests
crosstable(
  data = histopathology,
  vars = c("Grade", "TStage", "LVI"),
  group = "Group"
)

# Post-hoc comparisons for significant results
chisqposttest(
  data = histopathology,
  row_var = "Grade",
  col_var = "Group"
)
```

### Workflow 3: Treatment Pathway Visualization

```r
# Visualize treatment sequences
alluvial(
  data = treatment_data,
  vars = c("FirstLine", "Response", "SecondLine", "Outcome")
)

# Examine overlap between biomarkers
venn(
  data = biomarker_data,
  var1 = "LVI_present",
  var2 = "PNI_present",
  var3 = "Grade_high"
)
```

## References and Citations

### Key Statistical References

**Baseline Characteristics**:
- Neely JG, Stewart MG, Hartman JM, et al. Tutorials in clinical research: Part VI. Descriptive statistics. *Laryngoscope*. 2002;112(9):1541-1549.
- Moher D, et al. CONSORT 2010 Explanation and Elaboration. *BMJ*. 2010;340:c869.

**Statistical Tests**:
- Fisher RA. On the interpretation of χ² from contingency tables. *J R Stat Soc*. 1922;85(1):87-94.
- Kruskal WH, Wallis WA. Use of ranks in one-criterion variance analysis. *JASA*. 1952;47(260):583-621.

**R Packages**:
- Sjoberg DD, et al. Reproducible summary tables with the gtsummary package. *R J*. 2021;13(1):570-580.
- Yoshida K, Bartel A. tableone: Create 'Table 1' to describe baseline characteristics. R package.

### Complete Bibliography

See `inst/REFERENCES.bib` for complete BibTeX bibliography of all cited works.

## Package Features by Module

### Core Descriptive Functions
- `tableone()` - Baseline characteristics (**no comparisons**)
- `summarydata()` - Continuous variable summaries
- `reportcat()` - Categorical variable reports
- `crosstable()` - Cross-tabulation (**with comparisons**)

### Data Quality
- `checkdata()` - Single variable quality checks
- `dataquality()` - Multi-variable visual quality
- `benford()` - Benford's law analysis
- `outlierdetection()` - Comprehensive outlier detection

### Visualization
- `agepyramid()` - Age-sex population pyramids
- `alluvial()` - Flow diagrams
- `venn()` - Venn diagrams and UpSet plots
- `vartree()` - Variable tree hierarchies

### Statistical Analysis
- `chisqposttest()` - Chi-square post-hoc tests

## Getting Help

### Documentation
- Function help: `?function_name`
- Vignettes: `browseVignettes("ClinicoPathDescriptives")`
- Package website: https://www.serdarbalci.com/ClinicoPathDescriptives/

### Support
- GitHub Issues: https://github.com/sbalci/ClinicoPathJamoviModule/issues
- Email: serdarbalci@serdarbalci.com

## Contributing

Contributions are welcome! Please see CONTRIBUTING.md for guidelines.

## Citation

If you use ClinicoPathDescriptives in your research, please cite:

```
Balci S (2025). ClinicoPathDescriptives: Descriptive Analysis Tools for
Clinicopathological Research. R package version 0.0.32.56.
https://www.serdarbalci.com/ClinicoPathDescriptives/
```

---

**Last Updated**: 2025-12-24

**Package Version**: 0.0.32.56

**Maintained by**: Serdar Balci (<serdarbalci@serdarbalci.com>)

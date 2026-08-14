# ClinicoPathDescriptives 1.0.52 (2026-08-13)

This release is the result of a release review of the fourteen analyses shipped by this module
(`agepyramid`, `alluvial`, `benford`, `categorize`, `checkdata`, `chisqposttest`, `crosstable`,
`dataquality`, `outlierdetection`, `reportcat`, `summarydata`, `tableone`, `vartree`, `venn`)
together with a documentation audit of all 62 vignettes. Each backend fix listed below was
verified against a hand computation or a reference implementation.

**Read the behaviour changes section first.** Several of the defects fixed here produced wrong
numbers or wrong verdicts, so an analysis saved under an earlier version can legitimately give a
different answer after upgrading.

## Behaviour changes — saved analyses may produce different results

- **`agepyramid`: age bands are now left-closed.** Bands were right-closed, so every boundary age
  fell into the band below it: a 65-year-old was classified into the `1-65` band under a preset
  titled *Geriatric (65+)*. The lowest band also absorbed an extra year, inflating the youngest bar
  by 20% on a uniform population. Bands are now left-closed (`[lower, upper)`), the WHO/UN
  convention. **Bar heights, the pyramid table and every preset's boundary membership change**;
  re-running an existing analysis will move counts near band edges.

- **`categorize`: manual break points are preserved instead of being overwritten.** User-entered
  break points were replaced by breaks derived from the data range. Entering the standard CKD eGFR
  cut-points 30/60/90 produced breaks of 12.26/60/109.21 — two of the three requested thresholds
  were deleted and four CKD stages were merged into two bins. Break points are now kept exactly as
  entered and the outer range is extended around them instead. **Any saved analysis using manual
  breaks will now produce the categories that were actually requested**, which is not what it
  displayed before.

- **`benford`: the conformity verdict now rests on the chi-square test.** Clean, genuinely
  Benford-distributed data was labelled *Nonconformity* and described as showing "potential
  manipulation" at the very sample sizes the module itself recommends: the MAD conformity cut-offs
  sit below the sampling-noise floor until n > 1301 for the default 2-digit analysis. The verdict
  is now taken from the chi-square test, which is calibrated at every n. Datasets previously
  flagged as non-conforming may now be reported as conforming.

- **`checkdata`: the modified Z-score outlier method was applying its scale correction twice.**
  This made the method labelled "most robust" the least sensitive of those offered — at a 3.5 SD
  threshold it flagged 0 of 900 simulated contaminants where the correct formula flags 325. The
  correction is now applied once, so this method will flag substantially more observations than
  before.

- **`tableone`: the default style now discloses missing values.** The default style reported the
  group size beside a statistic computed on a smaller set (n = 120 printed next to a mean taken
  over 112 observations). Missing values are now disclosed, so denominators shown in the table may
  differ from earlier output.

- **`reportcat`: missing values are no longer presented as a category.** Missing values were
  rendered as if they were a level, with a percentage computed as missing/valid, which could exceed
  100%. In addition, the reported level count now matches the levels actually listed, and the
  sparse-category warning no longer counts declared-but-empty factor levels. Percentages and level
  counts will change for any variable with missing values or unused levels.

- **`summarydata`: normality reporting is now internally consistent.** The diagnostics panel and
  the copy-ready sentence could return *opposite* normality verdicts for the same variable, because
  one compared the rounded p-value against the threshold and the other the exact p-value. The
  wording "Data showed normal distribution" no longer overstates what a non-significant test
  supports, p-values below 0.001 no longer print as `0`, and the decimal-places setting now applies
  to every panel rather than only the summary table.

- **`crosstable`: the categorical-test selector now takes effect.** The setting was ignored in four
  of the six table styles, including the default (NEJM) and gtsummary. gtsummary now honours an
  explicit Fisher request, and styles that cannot apply a given setting now say so rather than
  silently using their own default. Reported p-values may change where Fisher was requested but
  chi-square was actually run.

- **`chisqposttest`: the bootstrap confidence interval for phi is now reproducible.** The bootstrap
  was unseeded, so re-running the same analysis on the same data moved the interval. The interval
  is now stable across runs; it may differ from an interval recorded from an earlier run.

## Fixed

- **`tableone`: crash with the janitor style on a single variable.** Subsetting rows from a
  one-column frame dropped it to a vector. In addition, the janitor style no longer tabulates
  continuous variables one row per patient.

- **`checkdata`: the per-method flag columns were inverted.** A method that *did* detect an
  observation rendered a blank cell, and vice versa.

- **`benford`: the "Suspicious Data Points" panel listed the first rows of the dataset** rather
  than the rows actually flagged.

- **`outlierdetection`: the per-observation table never rendered for datasets over 100 rows**,
  while the summary told users to review the flagged observations "below". The plain-language
  summary also described a 5000-row subsample as "your dataset"; subsampling is now disclosed, and
  the resulting counts are presented as a lower bound.

- **`venn`: two variables whose names sanitise to the same syntactic name silently collapsed into a
  single set**, so two different sets were reported as identical. The membership table is also now
  bounded — it scaled quadratically and did not finish on 20000 rows.

- **`vartree`: pruning by minimum size removed branches without saying so**, leaving child counts
  that did not add up to their parent. The removed nodes and the number of cases they held are now
  reported.

- **`alluvial`: variables past the maximum-variables cap were discarded silently.**

- **`dataquality`: Little's MCAR test was unreachable for jamovi users.** It depends on `naniar`,
  which sat in `Suggests`; jamovi installs only a module's `Imports`, so the test could never run
  on a jamovi installation. `naniar` is now an `Imports` dependency. The "near-zero variance" flag
  has also been relabelled to describe what it actually detects: exactly constant variables.

## Documentation

All 62 vignettes were audited call-by-call against the shipped option inventory (the `.a.yaml`
option lists, the generated `R/*.h.R` wrapper signatures and the `.r.yaml` result items). The
recurring problem was documentation of an API this module does not have.

- **Arguments that do not exist were removed.** `summarydata(date_vars=, grvar=)` (in seven
  vignettes — `summarydata` has no grouping option at all), `tableone(explanatory=, dependent=)`,
  `crosstable(row_var=, col_var=, add_margins=, statistical_test=)`,
  `dataquality(missing_threshold=, outlier_detection=, generate_report=, visual_analysis=,
  visdat_type=, export_plots=)` and `agepyramid(color1=, color2=)`. Each call was rewritten with
  the real options; the `dataquality` visual options became the three real per-plot booleans
  (`plot_data_overview`, `plot_missing_patterns`, `plot_data_types`) across 15 call sites, and
  `agepyramid` colours became `female_color`/`male_color` with the required
  `color_palette = "custom"`.

- **Missing required arguments were added.** `Level`-type options cannot carry a default and are
  therefore always required arguments of the generated R wrapper. Every `agepyramid()` example was
  missing `male`, and every `venn()` example was missing `var5true`/`var6true`/`var7true`; those
  calls errored with `argument "male" is missing, with no default` before any analysis ran. The
  `dataquality()` examples were also missing the required `vars`.

- **Type and column errors were corrected.** `reportcat()` and `venn()` examples passed numeric
  columns to options that are `permitted: [factor]`; `venn()` recoded on factor levels that do not
  exist in `histopathology` (`Grade` has levels 1/2/3, not "High"); and several examples referenced
  columns that are not in the bundled data (`TumorSize`, `Size`).

- **Result accessors were corrected.** `benford$p_value` and `benford$digit_analysis` do not exist;
  `dataquality$plot` is really `$plotDataOverview` / `$plotMissingPatterns` / `$plotDataTypes`; and
  `venn$plot` / `$plot2` are `$plotGgvenn` / `$plotUpsetR`. Examples that subset a `Preformatted`
  result item as if it were a data frame were replaced.

- **Functions belonging to other modules are now attributed.** `waterfall()` and `swimmerplot()`
  (OncoPath), `agreement()` and `icccoeff()` (meddecide), and `groupsummary()`, `missingdata()`,
  `enhancedcrosstable()`, `coefplot()` (upstream development module) were being demonstrated as
  features of this module. Their sections are retained but marked "not in this module" with the
  owning module named. `jjalluvial()` was recommended by one vignette and exists nowhere. Datasets
  that this module does not ship (`colon`, from **survival**; `breast_agreement_data`; the five
  Benford example datasets) are now labelled as such and their chunks set to `eval = FALSE`.

- **Two vignettes document analyses that are not shipped** — `13-enhancedcrosstable.Rmd` and
  `16-coefficient-plots.Rmd`. Neither was deleted; both now open with a status note listing the
  fourteen analyses this module does ship and stating that the documented option names, defaults
  and levels are provisional. `16-coefficient-plots.Rmd` also gained the global
  `knitr::opts_chunk$set(eval = FALSE)` it was missing.

- **Statistical claims were tied to the options they depend on.** The Benford chi-square degrees of
  freedom were stated flatly as 8, which is true only for `digits = 1`; the default `digits = 2`
  gives 89. The MAD conformity cut-offs (0.006/0.012/0.015) were presented as universal; they are
  Nigrini's first-digit thresholds and are now labelled as such, with the first-two-digit
  magnitudes given alongside. The claim that "the `benford` function is designed for jamovi and
  won't work in R Markdown" was false and has been replaced with a real worked example plus a
  warning that a bare `benford()` may resolve to `benford.analysis::benford()`, which has a
  different signature.

- **Option reference tables are now complete.** The `alluvial` reference listed 9 of its 24 options
  (and the conclusion claimed "9 customizable parameters"); the function-signature block in
  `09-function-alluvial.Rmd` showed 10 of 24. `outlierdetection` and `checkdata` reference examples
  now list every option with its real default, and `agepyramid`'s colour section now lists the four
  real `color_palette` levels.

- **jamovi menu paths, help pointers and links were corrected.** Benford is under *Exploration >
  ClinicoPath Data Quality*, not *ClinicoPath Descriptives*; `dataquality` is titled
  *Multi-Variable Visual Quality*. `help(package = "ClinicoPath")` became
  `help(package = "ClinicoPathDescriptives")`, `ClinicoPath::` call prefixes became
  `ClinicoPathDescriptives::` or bare calls, the dead `clinicopath.org` link now points at
  <https://www.serdarbalci.com/ClinicoPathDescriptives/>, and ten "Related Vignettes" links that
  pointed at filenames not present in `vignettes/` were repointed at files that exist.

- **Known remaining issue.** `01-comprehensive-data-quality.Rmd` uses a non-existent operator
  `%&%` in 16 places inside helper functions. All affected chunks are `eval = FALSE`, so the
  vignette still builds, but a reader copying those helpers gets
  `could not find function "%&%"`. Not yet fixed.

## New options

Each of these was added alongside the corresponding fix above, so that a behaviour the analysis
previously imposed is now the user's choice. All defaults reproduce the previous behaviour.

- **`agepyramid`: WHO/UN standard age groupings.** `age_groups` gains two presets — `who`, the
  WHO World Standard Population five-year bands `0-4, 5-9, ... 80-84, 85+` (Ahmad OB *et al.*,
  *Age standardization of rates: a new WHO standard*, GPE Discussion Paper 31, WHO 2001), and
  `who_infant`, the WHO abridged life-table grouping `<1, 1-4, 5-9, ... 85+` which reports
  infants separately.

- **`agepyramid`: `age_interval` chooses which bin edge is closed.** `left` (default) gives
  left-closed bands `[lower, upper)`, the WHO/UN convention described under behaviour changes;
  `right` gives `(lower, upper]` and reproduces the pre-1.0.52 output for anyone who needs to
  match an earlier analysis. Note that `right` makes the lowest band one year wider than the
  others.

- **`categorize`: `excludeoutofrange`.** With `manual` breaks the outer range is extended so no
  case is lost (the default, `false`). Set it to `true` to keep the break points exactly as
  entered and drop observations outside them; the number excluded is reported, split by
  direction. Ignored for the computed methods, whose breaks already span the data.

- **`outlierdetection`: `sampleThreshold` and `sampleSize`.** The subsampling threshold and the
  number of rows retained were hard-coded at 10000 and 5000, so a user needing a complete
  outlier list on a large file had no way to get one. Both are now configurable; the defaults
  reproduce the previous behaviour.

## Known remaining issue

- **"Getting Started" panels stay visible after an analysis has run** — carried over from 1.0.4
  and now **fixed for the two analyses where it was reproduced**. A `visible:` expression in a
  `.r.yaml` beginning with `!` does not match jamovi's routing pattern, so it is treated as a
  plain non-empty string and is permanently true. `benford` (`!var`) and `agepyramid`
  (`!age || !gender`) now drive panel visibility from the backend instead. Only panel visibility
  was ever affected; no result, table or statistic was wrong.

# ClinicoPathDescriptives 1.0.4 (2026-08-07)

## Note

- **Version realignment only; no analysis shipped here was changed.** Between 1.0.2 and 1.0.4 the
  only differences in this module are the version and date strings in `DESCRIPTION`,
  `jamovi/0000.yaml`, the fourteen `jamovi/*.a.yaml` files and their generated `R/*.h.R` headers.
  No `.b.R` backend, `.r.yaml`, `.u.yaml`, shared utility, dataset, manual page or test file was
  touched. The 1.0.3/1.0.4 development cycle in the umbrella **ClinicoPath** package targeted the
  `meddecide`, `jsurvival` and `OncoPath` analysis families, none of which is distributed to this
  module.

- **Known issue: "Getting Started" panels stay visible after an analysis has run.** A module-wide review found
  that a `visible:` expression in a `.r.yaml` file which begins with `!` does not match jamovi's
  routing pattern, so the expression is never evaluated and is treated as a plain non-empty string —
  permanently true. The effect was reproduced here on `benford` (`!var`) and `agepyramid`
  (`!age || !gender`), where the introductory welcome panel therefore sits above a completed
  analysis instead of disappearing once the variables are assigned. Only panel visibility is
  affected; no result, table or statistic is wrong. The fix is tracked and not yet applied in this
  module. Note that `.u.yaml` visibility is evaluated by the jamovi front end, which handles `!`
  correctly, and is unaffected.

# ClinicoPathDescriptives 1.0.3 (2026-08-04)

## Note

- **Superseded version bump.** 1.0.3 was published to keep this module in step with the umbrella
  **ClinicoPath** package and was replaced by 1.0.4 a day later. Nothing shipped in this module
  changed between the two.

# ClinicoPathDescriptives 1.0.2 (2026-08-03)

## Fixed

- **Analysis variables were required arguments of the R function.** An option with no default in
  its jamovi definition compiles to a bare parameter, so calling the analysis from R without it
  failed with `argument "X" is missing, with no default` before the analysis's own validation
  could produce a usable message. Now defaulting to `NULL`: `agepyramid` (`age`, `gender`),
  `chisqposttest` (`rows`, `cols`), `crosstable` (`vars`, `group`) and `venn` (`var1`, `var2`).
  Behaviour in the jamovi GUI is unchanged; no statistical method was altered.


## Note

- The pre-release review pass carried out this release covered the survival-family and
  diagnostic-decision analyses (`jsurvival`, `meddecide`) and a package-wide `format()` namespace
  fix in the umbrella package. **No analysis shipped here was changed** — none of the affected
  files is distributed to this module.

## Added

- **Automated GitHub release (`.github/workflows/release.yaml`).** A push to the default branch
  touching `DESCRIPTION` or `jamovi/0000.yaml` cross-checks the two version strings, refuses to
  proceed if they disagree, and — if the tag does not already exist — tags `v<version>` and
  publishes a release whose notes are the matching section of this file.

# ClinicoPathDescriptives 1.0.0 (2026-07-13)

## jamovi library audit fixes

* Declared the `MASS` and `boot` runtime dependencies and moved Little's MCAR
  test from the archived `BaylorEdPsych` package to guarded `naniar` support.
* Repaired citation keys, exposed Benford's detailed output, and made
  cross-table missing-value invalidation complete.
* Added structured error handling for variable trees and table-generation
  failures, cached prepared alluvial plot data, and honored listwise exclusion
  consistently in standardized mean differences.
* Normalized option labels and collapsible UI groups, removed dead cross-table
  scaffolding, narrowed namespace imports, and strengthened dependency checks.
* Added regression coverage for schema contracts, generated R code, alluvial
  caching, chi-square chunking, and optional MCAR diagnostics.

# ClinicoPathDescriptives 0.0.47 (2026-07-05)

## Bug Fixes

* **Fixed a crash when a viridis colour palette is selected in the Venn/UpSet diagram.** `viridis::viridis()` (and `plasma`/`magma`/`inferno`/`cividis`) is used by `venn()`, but `viridis` was missing from the package `Imports`. Because jamovi installs only a package's `Imports`, selecting a viridis palette crashed on a clean install. `viridis` is now declared.
* Declared `classInt`, `DescTools`, and `pwr` (previously used via `::` but undeclared).

# ClinicoPathDescriptives 0.0.46 (2026-07-04)

This release consolidates development across the 0.0.33–0.0.46 cycle. Its focus is **security hardening**, **input robustness**, and a **major overhaul of the Age Pyramid module**. The version is realigned with the umbrella **ClinicoPath** package.

## Security & Robustness

* **HTML output escaping (module-wide)**: All dynamically generated HTML content is now passed through `htmltools::htmlEscape()` before rendering, preventing user-supplied variable names, factor labels, and free-text options from injecting markup into results. Applied across `agepyramid`, `alluvial`, `benford`, `categorize`, `checkdata`, `chisqposttest`, `crosstable`, `dataquality`, `outlierdetection`, `reportcat`, `summarydata`, `tableone`, `vartree`, `venn`, and shared utilities.
* **Safer variable-name handling**: Variable names containing spaces or special characters are now escaped with `jmvcore::composeTerm()` / `make.names()` when building formulas and are matched robustly against the dataset, preventing formula corruption and silent mismatch errors.
* **Consistent error handling**: User-facing validation failures (empty data, invalid bin width, unmatched variables) now use `jmvcore::reject()` for clear, non-fatal messages in the jamovi interface instead of ad-hoc error paths.

## Enhanced Existing Modules

### Age Pyramid (`agepyramid`) — major overhaul

* **Age group presets**: New *Age Group Presets* option with Pediatric (<18), Reproductive (15–50), Geriatric (65+), Life Course, and Custom (bin width) modes, plus user-defined *Custom Age Breaks*.
* **Color customization**: New *Color Palette* option (Standard Pink/Blue, Colorblind-Friendly, Grayscale, Custom) with dedicated Female/Male color pickers.
* **ggcharts rendering**: Optional *Enable GGCharts Pyramid* output with bar-sorting controls and deterministic formatting for reproducible plots.
* **Single-gender robustness**: Further hardening of single-gender cohort handling with explicit level selection, input validation, and data cleaning, surfaced through a new *Data Summary* table with exclusion reporting.
* **Backend migration**: Interactive logic moved out of client-side JavaScript (`agepyramid.events.js` removed) into the R backend for reliability.

### Table One (`tableone`)

* Reordered result outputs for a clearer reading flow (Copy-to-Manuscript → Summary → About → Data Quality & Assumptions).
* Fixed notice priority ordering so the most important messages surface first.

### Chi-square Post-hoc (`chisqposttest`)

* Added a **95% confidence interval for the Phi effect size**.
* Added **Residuals Interpretation Guidance** to aid interpretation of standardized residuals.
* Refined UI layout.

### User Notices

* Added dedicated *Important Information* notice panels to `alluvial`, `checkdata`, `chisqposttest`, and `vartree` for clearer in-analysis guidance and warnings.

## New & Updated Test Datasets

* Added ready-to-use example datasets (CSV + jamovi `.omv`) for `agepyramid`, `benford`, `checkdata`, `dataquality`, `reportcat`, `summarydata`, and `tableone`.
* Added scenario-specific age-pyramid datasets: cancer, geriatric, pediatric, reproductive, and unbalanced cohorts.
* Refreshed the bundled `histopathology` dataset.

## Package Infrastructure

* Regenerated all jamovi analysis definitions and roxygen/`man` documentation.
* Version realigned with the umbrella **ClinicoPath** package (0.0.33 → 0.0.46).
* Updated package references, dependency metadata, and UI text throughout.

---

# ClinicoPathDescriptives 0.0.32.60 (2025-12-28)

## Bug Fixes

* **Variable Selection**: Resolved variable renaming issues from `jmvcore::select` by differentiating actual and display names.

## Improvements

* **Menu Structure**: Updated the menu subgroup for better organization.

---

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

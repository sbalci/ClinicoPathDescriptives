# ClinicoPathDescriptives 1.0.82.03 (development version)

A short development build. Results that rest on random resampling are now reproducible and say
which random seed they used, two interface and message defects are fixed, and the module installs
one fewer package.

## Behaviour changes -- saved analyses may produce different results

- **`chisqposttest`: simulated Fisher's exact p-values are now reproducible.** When a table is too
  large for the exact Fisher calculation, its p-value is estimated by simulation (2,000 random
  tables). That simulation was not seeded, so the same data could give a slightly different p-value
  -- occasionally on the other side of 0.05 -- each time the analysis ran. It now uses the
  analysis's Random seed (default 42), for the overall test and for every pairwise comparison, so a
  saved analysis gives the same p-values every time it is opened. The first run after upgrading can
  differ from the last value you saw by simulation noise.

## New options

- **`categorize`: Random seed for natural breaks (Jenks).** Above 20,000 observations natural breaks
  are computed on a random subsample, using a seed that was fixed inside the analysis. The seed is
  now an option. Its default (20240101) is the old fixed value, so existing results do not change;
  a different seed shows how much the break points depend on the subsample. The Break Points table
  names the seed whenever it was used, and the generated R code uses the same seed.

## Changed -- results name the random seed behind them

- **`chisqposttest`:** the Random seed field is always available (it was greyed out unless
  bootstrap confidence intervals were ticked), because it now also drives the simulated Fisher
  p-values. The overall-test, post-hoc and export tables carry a "Random seed: N" note whenever they
  show a simulated p-value or a bootstrap interval.

- **`outlierdetection`:** the outlier table, the method comparison and the exclusion summary state
  "Random seed: N" whenever the flags depended on it -- when a large dataset was subsampled, or when
  the MCD or ICS methods, which use random draws, were run.

## Fixed

- **`outlierdetection`: method and threshold controls grey out when they do not apply.** The
  univariate and multivariate method lists and the composite, Z-score, IQR and confidence-level
  fields were linked to the detection category in a form jamovi does not recognise, so they stayed
  active whatever category was chosen, including where changing them had no effect.

- **`dataquality`: the Little's MCAR test note shows its numbers again.** When non-numeric variables
  were selected, the sentence explaining that the test covers only the numeric ones printed
  "{n_num}" and "{n_non}" instead of the counts. This came in with 1.0.81.

- **`venn`: the summary table keeps one row per selected variable.** A variable that cannot be
  turned into yes/no membership now leaves an empty row, with the explanatory notice, instead of
  silently dropping out of the table.

## Documentation and packaging

- DescTools is no longer a dependency (nothing in this module used it); withr is added.
- The References section of each analysis now also cites the R packages it relies on -- for example
  ggcharts in Age Pyramid, boot and pwr in Chi-Square Post-Hoc Tests, vtree and DiagrammeR in
  Variable Tree, and UpSetR, ComplexUpset, ggVennDiagram and ggvenn in Venn Diagram.
- The Turkish translation now ships only this module's own text (about 2,350 messages, labels and
  titles, four in five of them translated) instead of the whole ClinicoPath catalogue, which makes
  the download smaller. Coverage is unchanged.
- The README has a feature table and updated quick-start examples.

# ClinicoPathDescriptives 1.0.81 (2026-09-09)

All fourteen analyses went through a second round of checks and reviews. This release brings a
Turkish translation and seven new options, and corrects results that were wrong, incomplete or
different on every run.

**Read the behaviour changes section first.** Several fixes change a number, a label or a default,
so an analysis saved under 1.0.6.03 can give a different answer after upgrading.

## Behaviour changes -- saved analyses may produce different results

- **`benford`: the Assessment row reports a finding, not a level of concern.** "Low / Moderate /
  High concern" became "No departure detected / Departure detected / Not assessable / Limited
  evidence", and the fraud wording and "Recommendation" text gave way to a list of possible causes.
  Data spanning less than two orders of magnitude, where Benford's Law does not apply, are now "Not
  assessable" instead of receiving a verdict.
- **`benford`: the MAD conformity label needs a larger sample** -- about 1,000 observations at 1
  digit, 5,200 at 2 and 10,200 at 3 (was 250, 1,300 and 2,550). Below that the chi-square test
  decides. Under the old rule, data that followed Benford's Law perfectly were still rated worse
  than "Low" in up to 64% of samples.
- **`checkdata`: imperial units are no longer recognised.** The "Unit system for clinical checks"
  option is removed. Weight is checked in kg, height in cm (or metres when every value is 10 or
  less). A weight column in pounds is now flagged "Weight >200 kg", which lowers the quality grade.
- **`checkdata`: rare categories follow the "Rare category threshold (%)" option** (default 5% of
  complete cases) instead of a fixed "fewer than 5", so two tables no longer disagree. With 200
  cases a category is now rare below 10 cases.
- **`chisqposttest`: "Always Fisher's exact" now applies to the overall test too**, which showed
  chi-square before. Fractional frequency weights are refused. Tables needing more than 500
  pairwise comparisons skip them with a warning, and bootstrap intervals are left blank (and
  counted) for sub-tables above 2,000 observations. When the exact Fisher calculation fails, the
  simulated p-value uses 2,000 random tables instead of 100,000.
- **`crosstable`: new analyses start in the gtsummary style** (was NEJM), the only style that honours
  every option. **Empty levels of the grouping variable are dropped**: an unused group appeared as
  an all-zero column and made the chi-square test return NaN.
- **`dataquality`: the "Duplicate rows" option was renamed.** It was called `complete_cases_only` but
  never restricted anything to complete cases. A saved analysis that had it ticked opens with it
  unticked; tick it again. R scripts must use `row_level_duplicates`.
- **`dataquality`: missingness flags follow your threshold.** The "Moderate Missingness" band starts
  at your threshold, not a fixed 10%. The list of variables over the threshold compares exact
  counts, so 251 of 2,500 values missing (10.04%) is now listed at a 10% threshold instead of being
  rounded to 10.0% and missed. A numeric variable with one non-missing value is flagged "Constant".
- **`outlierdetection`: results are reproducible.** MCD, OPTICS and LOF use random draws that were
  not seeded, so the same data could flag 21 rows on one run and 22 on the next. They now use the
  Random seed option (default 123). Infinite values are dropped like missing values.
- **`outlierdetection`: robust Mahalanobis distance and ICS work.** Their packages now install with
  the module, so "Robust Mahalanobis" gives a result instead of "Method Not Available", and "All
  methods" includes both, which can change the composite flags.
- **`summarydata`: the guidance panels are off by default.** Clinical Interpretation, About This
  Analysis and Statistical Glossary appear only when the new "Interpretation guidance and glossary"
  option is ticked, including in saved analyses. Mean, median and SD in the visual summary follow
  Decimal places; Shapiro-Wilk p-values near 0.05 keep their deciding digits (0.0496, not 0.050);
  skewness and kurtosis are reported when Shapiro-Wilk is skipped above 5,000 observations.
- **`tableone`: the janitor style tabulates categorical variables only.** Numeric columns, including
  1-5 scores, are skipped with a note (set them to Nominal or Ordinal), and no longer drive
  missing-value exclusion, so N can rise. janitor hides unused levels; gtsummary rows for two-level
  variables name the counted level ("Sex = Male"); a true NA factor level counts as missing.
- **`venn`: Set Calculations lists every overlap.** With 4 sets it showed 7 rows instead of 11 (the
  3-way overlaps were missing). **The UpSet plot shows every selected set**: UpSetR silently kept
  the 5 largest, so 6- and 7-set plots had wrong bars.
- **`venn`: other corrections.** An explicit NA factor level counts as missing, not negative. The
  membership table's Row column gives the row number in your dataset, not 1..n of the analysed rows.
  With "Fill color mapping" unticked, ggVennDiagram regions are one flat colour.
- **`agepyramid`:** with a fixed bin width the top band is labelled by its width ("70-74"), not by
  the oldest patient ("70-73"), and very young cohorts read "0-4", not "0+".
- **`alluvial`:** in the condensation plot, numeric axis variables are drawn as their recorded values
  instead of five equal-width bins, and a numeric condensation variable may have up to 20 values.
- **`vartree`:** in pattern mode the hidden-branch counts count the whole patterns vtree drops, so the
  summary matches the figure.

## New options

- **`agepyramid`: Percentage base** (within each gender, the default, or of all observations so both
  columns together sum to 100%) **and Bar values** (counts or percentages on both pyramids).
- **`alluvial`: Flow table** -- one row per path through the plotted variables with cases and
  percent, largest first (by weight total under GG Alluvial with a weight). The "Bin labels" and
  "Custom bin labels" options are removed; they never had a visible effect.
- **`chisqposttest`: Random seed** for the bootstrap intervals. The default (42) is the value used
  before, so results do not change.
- **`crosstable`: Plain-language summary** -- a copy-ready paragraph with the sample size, groups,
  tests run, rows excluded and the variables that differed at p < 0.05 (q < 0.05 when adjusted). It
  sits with p-value adjustment and SMD in a new collapsed Advanced box.
- **`summarydata`: Interpretation guidance and glossary** (see above).
- **`vartree`: Colour palette** -- Default or Colour-blind safe (blue, orange, purple and brown
  instead of red/green).

## Changed -- messages

- **`crosstable`:** notes sit below the table, errors and warnings above. Rows removed by
  missing-value exclusion are counted, and the over-20%-missing warning is judged before exclusion
  (with exclusion on it could never fire). The low-expected-count warning matches the style, and
  none appears when Fisher's test is selected. Skewed variables shown as mean (SD) get a note. The
  Variable Name Warnings and Analysis Information panels are removed.
- **`chisqposttest`:** a strong warning when any expected count is below 1, a closing summary note
  ("3 pairwise comparisons with Holm adjustment, 1 significant"), and "fdr" written out as
  Benjamini-Hochberg (FDR).
- **`categorize`:** new notices for more than 20% missing values, empty custom labels, a new name
  equal to the source variable, a decimal comma in manual breaks, and a median split that cannot
  divide zero-heavy data. Under Quantiles the imbalance warning names the tied value ("60% of the
  observations equal 0") instead of advising quantiles.
- **`agepyramid`, `alluvial`, `vartree`, `venn`:** new warnings for unusable ages, too many fill
  categories, variables with more than 12 levels, prune/follow variables with no level chosen, and
  a variable positive in over 95% of cases. `alluvial` input problems are error notices instead of a
  separate panel.
- **`summarydata`:** "Report sentences" became "Draft report sentences" and asks you to add units,
  population and time point. **`tableone`:** says "cases", not "patients", warns that repeated
  records are not merged, and shows missingness as "23.75% (19/80)". **`reportcat`** uses jamovi's
  own error display.

## Fixed

- **`categorize`: a single manual cut-off works.** One threshold, the usual clinical case, gave
  "Insufficient break points" while the generated R code gave two categories. Infinite values are
  treated as missing instead of crashing the run, and empty percentage cells show blank, not "NaN".
- **`checkdata`, `dataquality`:** infinite values no longer stop the run; duplicated patterns are
  grouped by their real values; non-numeric variables show "-" instead of "NA" in outlier columns.
- **`crosstable`:** an all-missing or single-valued variable is named and left out instead of
  failing the whole table; the chi-square/Fisher choice is no longer greyed out for gtsummary.
- **`tableone`:** janitor no longer fails on a category named "Total"; the missing row is relabelled
  when the data hold a real "Unknown" or "NA" category; date and duration columns are left out.
- **`benford`:** the report sentence for fewer than 100 observations is no longer cut off, NaN values
  are counted as excluded, and saved files no longer store every observation for the plot.
- **`agepyramid`:** the Population Data table no longer doubles its rows when the title or colours
  change, and a gender column named "Age" is no longer overwritten by the ages.
- **`alluvial`:** GG Alluvial axes show variable names instead of 1.0, 1.5, 2.0, and right-to-left
  and top-to-bottom directions reverse the axis order.
- **`reportcat`, `summarydata`:** names containing `<`, `>` or `&` (e.g. "Ki-67 >20%") display
  correctly; `summarydata` tables are readable in the dark theme.
- **`vartree`:** a small missing-value node no longer triggers the few-cases warning.
  **`venn`:** the all-missing check covers variables 3 to 7.

## Documentation and packaging

- **Turkish translation.** Interface and results text can be shown in Turkish; about four in five of
  the module's messages, labels and titles are translated.
- Help text no longer overstates what an analysis does: `tableone` covers the whole cohort, with no
  p-values or confidence intervals; `benford` detects departures, not causes.
- New references: classInt and Royston, Altman and Sauerbrei (2006) in `categorize`, ggcharts in
  `agepyramid`, viridis and RColorBrewer in `venn`. R usage examples were added or restored.
- robustbase and vcd are no longer dependencies; bigutilsr, ICS and ICSOutlier are added.

# ClinicoPathDescriptives 1.0.6.03 (2026-08-22)

Every analysis this module ships was put through three passes: a structural audit, a statistical
code review, and an adversarial verification of the fixes those produced. 125 statistical and
correctness defects were fixed, along with the message-handling changes described further down.

**Read the behaviour changes section first.** Several defects fixed here produced a wrong number or
a wrong label, so an analysis saved under an earlier version can legitimately give a different
answer after upgrading.

## Behaviour changes -- saved analyses may produce different results

- **`venn`: "positive for X only" now counts cases positive for X and nothing else.** The
  copy-ready clinical summary computed this as positive-for-var1-and-not-var2, ignoring the third
  through seventh variables entirely. With three sets selected it reported 69 cases where the true
  exclusive count was 50, and contradicted the Set Calculations panel in the same output. Both
  panels now use one formula, so the numbers agree.

- **`venn`: diagram percentages share one denominator with the rest of the analysis.** Region
  labels expressed each region as a share of the union, while every table in the analysis used the
  total number of cases. Percentages on the diagram will change; they now match the tables.

- **`venn`: the set label colour is applied at its default.** The colour was only written when it
  differed from black, so choosing a red edge colour turned the set names red as well.

- **`vartree`: the pruning report no longer counts nodes that are still on screen.** vtree exempts
  NA-labelled nodes from the minimum-count pruning, which the report did not model, so it announced
  branches as hidden while they remained visible in the figure. It now reports what was actually
  removed.

- **`vartree`: percentages state which denominator is in force.** Depending on the display option a
  node percentage is taken from its parent, from the whole sample, or -- for the reference-level
  specification -- from a third quantity. The glossary described only one of these. The denominator
  actually used is now stated with the results.

- **`categorize`: the completion count reports categorised observations.** It previously reported
  non-missing source values, overstating the count whenever anything fell outside the break points.

- **`categorize`: uncategorised cases are labelled by cause.** Every such case was labelled "out of
  range", including cases lost at an open outer boundary, which is a different problem with a
  different remedy.

- **`chisqposttest`: a 2x2 table no longer produces post-hoc rows.** A 2x2 yielded two identical
  whole-table comparisons whose Bonferroni-doubled p-value could read "Significant: No" beside a
  significant overall test. There is nothing to decompose in a 2x2, so no comparisons are produced
  and the panel explains why.

- **`checkdata`: outlier severity has a floor again.** Any flagged point was labelled at least a
  mild outlier regardless of how small its robust deviation was.

- **`reportcat`: small percentages are no longer rounded to zero.** A single missing case in a large
  sample printed "Missing data: 1 cases (0%)".

- **`outlierdetection`: number formatting is correct throughout.** Inside this package `format()`
  resolved to jamovi's translation helper rather than base R's, which returned the input unchanged
  and silently discarded digit and trim settings.

## Changed -- results explain their own denominators

- **`reportcat` and `tableone` now state the denominator behind every percentage.** Percentages were
  taken from valid cases while counts were taken from all cases, with adjacent clauses in the same
  sentence using different bases and neither being named. Both panels now name the denominator
  inline, and the `tableone` legends distinguish Percent from Valid Percent.

- **`tableone`: the "all clear" data-quality sentence** claimed the sample size was below the
  thresholds the analysis flags, which is backwards.

- **`tableone`: continuous summaries are labelled `median [Q1, Q3]`** rather than `median [IQR]`,
  which named a different statistic from the one displayed.

## Changed -- messages guide instead of alarming

- **R warnings and errors were replaced by notices that say what to do.** jamovi surfaces
  `message()` and `warning()` to the user in an undifferentiated Analysis Notes panel, mixed in with
  chatter from third-party packages, so a bare warning named a failure without offering a way
  forward. Every such message in this module now states what happened, what it means for the result
  on screen, and what to try next. Where a plot could not be drawn the explanation is drawn into the
  plot area, since a failure detected at render time cannot reach a results panel.

- **Results no longer give clinical advice.** Text that ruled on fitness for patient care or
  recommended a course of action has been replaced by explanation of what was measured and how to
  read it. Guidance about running the analysis -- sample size, which test applies, assumption checks
  -- is unchanged.

## Fixed

- **`alluvial`: the reading notice no longer overstates how many rows are drawn**, and rows dropped
  for a missing weight are counted separately from rows dropped for incomplete data.

- **`alluvial`: the option description no longer claims a weight variable always sets ribbon width.**
  That is true of the GG Alluvial engine; Easy Alluvial always counts cases.

- **`checkdata`: the no-outliers message reports the thresholds actually used.** It hard-coded
  "flagged by 2 or more of the 3 methods", but the threshold drops below n = 10 and only two methods
  run when the median absolute deviation is unavailable.

- **`checkdata`: the skipped-log-transform note no longer recommends the square-root transform for
  negative data**, where that transform is equally unavailable.

- **`chisqposttest`: an analysis saved with a fixed residual cutoff** now says so on reopening
  rather than silently ignoring the stored value under the new criterion setting.

- **`benford`: `graphics` is declared as a dependency.** The plot's colour handling calls
  `graphics::par()`, which was absent from this module's imports and could not be resolved at run
  time on a user's machine.

## Documentation

- References were verified against CrossRef and OpenAlex before being cited. `checkdata` now cites
  Tukey (1977), Wald and Wolfowitz (1940), Wilson (1927) and Leys et al. (2013) for the methods it
  implements; `chisqposttest` cites Agresti (2013), Sharpe (2015), Holm (1979) and Benjamini and
  Hochberg (1995), together with the chisq.posthoc.test package that inspired its approach;
  `crosstable` cites Yang and Dalton (2012) for the standardised mean difference.

# ClinicoPathDescriptives 1.0.52 (2026-08-13)

This release is the result of a release review of the fourteen analyses shipped by this module
(`agepyramid`, `alluvial`, `benford`, `categorize`, `checkdata`, `chisqposttest`, `crosstable`,
`dataquality`, `outlierdetection`, `reportcat`, `summarydata`, `tableone`, `vartree`, `venn`)
together with a documentation audit of all 62 vignettes. Each backend fix listed below was
verified against a hand computation or a reference implementation.

**Read the behaviour changes section first.** Several of the defects fixed here produced wrong
numbers or wrong verdicts, so an analysis saved under an earlier version can legitimately give a
different answer after upgrading.

## Behaviour changes -- saved analyses may produce different results

- **`agepyramid`: age bands are now left-closed.** Bands were right-closed, so every boundary age
  fell into the band below it: a 65-year-old was classified into the `1-65` band under a preset
  titled *Geriatric (65+)*. The lowest band also absorbed an extra year, inflating the youngest bar
  by 20% on a uniform population. Bands are now left-closed (`[lower, upper)`), the WHO/UN
  convention. **Bar heights, the pyramid table and every preset's boundary membership change**;
  re-running an existing analysis will move counts near band edges.

- **`categorize`: manual break points are preserved instead of being overwritten.** User-entered
  break points were replaced by breaks derived from the data range. Entering the standard CKD eGFR
  cut-points 30/60/90 produced breaks of 12.26/60/109.21 -- two of the three requested thresholds
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
  This made the method labelled "most robust" the least sensitive of those offered -- at a 3.5 SD
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
  bounded -- it scaled quadratically and did not finish on 20000 rows.

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

- **Arguments that do not exist were removed.**`summarydata(date_vars=, grvar=)` (in seven
  vignettes -- `summarydata` has no grouping option at all), `tableone(explanatory=, dependent=)`,
  `crosstable(row_var=, col_var=, add_margins=, statistical_test=)`,
  `dataquality(missing_threshold=, outlier_detection=, generate_report=, visual_analysis=,
  visdat_type=, export_plots=)` and `agepyramid(color1=, color2=)`. Each call was rewritten with
  the real options; the `dataquality` visual options became the three real per-plot booleans
  (`plot_data_overview`, `plot_missing_patterns`, `plot_data_types`) across 15 call sites, and
  `agepyramid` colours became `female_color`/`male_color` with the required
  `color_palette = "custom"`.

- **Missing required arguments were added.**`Level`-type options cannot carry a default and are
  therefore always required arguments of the generated R wrapper. Every `agepyramid()` example was
  missing `male`, and every `venn()` example was missing `var5true`/`var6true`/`var7true`; those
  calls errored with `argument "male" is missing, with no default` before any analysis ran. The
  `dataquality()` examples were also missing the required `vars`.

- **Type and column errors were corrected.**`reportcat()` and `venn()` examples passed numeric
  columns to options that are `permitted: [factor]`; `venn()` recoded on factor levels that do not
  exist in `histopathology` (`Grade` has levels 1/2/3, not "High"); and several examples referenced
  columns that are not in the bundled data (`TumorSize`, `Size`).

- **Result accessors were corrected.**`benford$p_value` and `benford$digit_analysis` do not exist;
  `dataquality$plot` is really `$plotDataOverview` / `$plotMissingPatterns` / `$plotDataTypes`; and
  `venn$plot` / `$plot2` are `$plotGgvenn` / `$plotUpsetR`. Examples that subset a `Preformatted`
  result item as if it were a data frame were replaced.

- **Functions belonging to other modules are now attributed.**`waterfall()` and `swimmerplot()`
  (OncoPath), `agreement()` and `icccoeff()` (meddecide), and `groupsummary()`, `missingdata()`,
  `enhancedcrosstable()`, `coefplot()` (upstream development module) were being demonstrated as
  features of this module. Their sections are retained but marked "not in this module" with the
  owning module named. `jjalluvial()` was recommended by one vignette and exists nowhere. Datasets
  that this module does not ship (`colon`, from **survival**; `breast_agreement_data`; the five
  Benford example datasets) are now labelled as such and their chunks set to `eval = FALSE`.

- **Two vignettes document analyses that are not shipped** -- `13-enhancedcrosstable.Rmd` and
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

- **Known remaining issue.**`01-comprehensive-data-quality.Rmd` uses a non-existent operator
  `%&%` in 16 places inside helper functions. All affected chunks are `eval = FALSE`, so the
  vignette still builds, but a reader copying those helpers gets
  `could not find function "%&%"`. Not yet fixed.

## New options

Each of these was added alongside the corresponding fix above, so that a behaviour the analysis
previously imposed is now the user's choice. All defaults reproduce the previous behaviour.

- **`agepyramid`: WHO/UN standard age groupings.**`age_groups` gains two presets -- `who`, the
  WHO World Standard Population five-year bands `0-4, 5-9, ... 80-84, 85+` (Ahmad OB *et al.*,
  *Age standardization of rates: a new WHO standard*, GPE Discussion Paper 31, WHO 2001), and
  `who_infant`, the WHO abridged life-table grouping `<1, 1-4, 5-9, ... 85+` which reports
  infants separately.

- **`agepyramid`: `age_interval` chooses which bin edge is closed.**`left` (default) gives
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

- **"Getting Started" panels stay visible after an analysis has run** -- carried over from 1.0.4
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
  routing pattern, so the expression is never evaluated and is treated as a plain non-empty string --
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
  fix in the umbrella package. **No analysis shipped here was changed** -- none of the affected
  files is distributed to this module.

## Added

- **Automated GitHub release (`.github/workflows/release.yaml`).** A push to the default branch
  touching `DESCRIPTION` or `jamovi/0000.yaml` cross-checks the two version strings, refuses to
  proceed if they disagree, and -- if the tag does not already exist -- tags `v<version>` and
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

* **Fixed a crash when a viridis colour palette is selected in the Venn/UpSet diagram.**`viridis::viridis()` (and `plasma`/`magma`/`inferno`/`cividis`) is used by `venn()`, but `viridis` was missing from the package `Imports`. Because jamovi installs only a package's `Imports`, selecting a viridis palette crashed on a clean install. `viridis` is now declared.
* Declared `classInt`, `DescTools`, and `pwr` (previously used via `::` but undeclared).

# ClinicoPathDescriptives 0.0.46 (2026-07-04)

This release consolidates development across the 0.0.33-0.0.46 cycle. Its focus is **security hardening**, **input robustness**, and a **major overhaul of the Age Pyramid module**. The version is realigned with the umbrella **ClinicoPath** package.

## Security & Robustness

* **HTML output escaping (module-wide)**: All dynamically generated HTML content is now passed through `htmltools::htmlEscape()` before rendering, preventing user-supplied variable names, factor labels, and free-text options from injecting markup into results. Applied across `agepyramid`, `alluvial`, `benford`, `categorize`, `checkdata`, `chisqposttest`, `crosstable`, `dataquality`, `outlierdetection`, `reportcat`, `summarydata`, `tableone`, `vartree`, `venn`, and shared utilities.
* **Safer variable-name handling**: Variable names containing spaces or special characters are now escaped with `jmvcore::composeTerm()` / `make.names()` when building formulas and are matched robustly against the dataset, preventing formula corruption and silent mismatch errors.
* **Consistent error handling**: User-facing validation failures (empty data, invalid bin width, unmatched variables) now use `jmvcore::reject()` for clear, non-fatal messages in the jamovi interface instead of ad-hoc error paths.

## Enhanced Existing Modules

### Age Pyramid (`agepyramid`) -- major overhaul

* **Age group presets**: New *Age Group Presets* option with Pediatric (<18), Reproductive (15-50), Geriatric (65+), Life Course, and Custom (bin width) modes, plus user-defined *Custom Age Breaks*.
* **Color customization**: New *Color Palette* option (Standard Pink/Blue, Colorblind-Friendly, Grayscale, Custom) with dedicated Female/Male color pickers.
* **ggcharts rendering**: Optional *Enable GGCharts Pyramid* output with bar-sorting controls and deterministic formatting for reproducible plots.
* **Single-gender robustness**: Further hardening of single-gender cohort handling with explicit level selection, input validation, and data cleaning, surfaced through a new *Data Summary* table with exclusion reporting.
* **Backend migration**: Interactive logic moved out of client-side JavaScript (`agepyramid.events.js` removed) into the R backend for reliability.

### Table One (`tableone`)

* Reordered result outputs for a clearer reading flow (Copy-to-Manuscript -> Summary -> About -> Data Quality & Assumptions).
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
* Version realigned with the umbrella **ClinicoPath** package (0.0.33 -> 0.0.46).
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

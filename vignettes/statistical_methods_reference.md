# Statistical Methods Reference Guide for ClinicoPathDescriptives

*A comprehensive guide to statistical tests for descriptive analysis in clinical research*

---

## Introduction

This reference guide provides detailed information about the statistical tests implemented in the ClinicoPathDescriptives package. Each test is presented with clear guidance on when to use it, what assumptions must be met, how to interpret results, and how to report findings in accordance with contemporary standards for clinical research.

The tests covered here represent the core analytical toolkit for comparing groups and describing relationships in clinicopathological research. Understanding when and how to apply each test correctly is essential for producing valid, interpretable, and reproducible research findings.

## Test Selection Overview

### Decision Framework

The choice of statistical test depends primarily on three factors:

1. **Type of outcome variable**: Continuous (e.g., age, tumor size) or categorical (e.g., treatment response, disease stage)
2. **Number of groups being compared**: Two groups vs. three or more groups
3. **Distribution of data**: Normal (parametric tests) vs. non-normal (non-parametric tests)

### Quick Reference Table

| Situation | Parametric Test | Non-Parametric Alternative |
|-----------|----------------|---------------------------|
| **Continuous Outcome** | | |
| Two independent groups | Independent t-test | Mann-Whitney U test (Wilcoxon rank-sum) |
| Two paired groups | Paired t-test | Wilcoxon signed-rank test |
| 3+ independent groups | One-way ANOVA | Kruskal-Wallis test |
| 3+ paired groups | Repeated measures ANOVA | Friedman test |
| **Categorical Outcome** | | |
| Two or more groups | Chi-square test | Fisher's exact test (small samples) |

---

## Tests for Continuous Outcomes

### Independent Samples T-Test

#### Purpose and Applications

The independent samples t-test (also called the two-sample t-test) compares means between two independent groups. In clinical research, this test is commonly used to compare treatment groups in randomized trials, compare cases and controls in case-control studies, or compare exposed and unexposed groups in cohort studies.

**Clinical examples:**
- Comparing mean systolic blood pressure between treatment and control groups
- Comparing mean tumor size between patients with and without a specific mutation
- Comparing mean hospital length of stay between two surgical techniques

#### When to Use

Use the independent t-test when:
- You have **one continuous outcome variable** measured on an interval or ratio scale
- You have **one categorical grouping variable with exactly two levels** (e.g., treatment vs. control)
- Observations in one group are **independent** of observations in the other group
- The outcome is **approximately normally distributed** within each group (or sample sizes are large enough for Central Limit Theorem to apply)
- The **variances are approximately equal** between groups (homogeneity of variance)

#### Assumptions

1. **Independence of observations**: Each participant contributes data to only one group, and observations within and between groups are independent.

2. **Normality**: The outcome variable is approximately normally distributed within each group. This assumption can be checked using:
   - Shapiro-Wilk test (for formal testing)
   - Q-Q plots (visual assessment)
   - Histograms (visual assessment)

   **Robustness note**: The t-test is reasonably robust to modest departures from normality, especially with larger sample sizes (n > 30 per group). The Central Limit Theorem ensures that sampling distributions of means approach normality even when the underlying distribution is not perfectly normal.

3. **Homogeneity of variance** (homoscedasticity): The variance of the outcome is approximately equal in both groups. This can be assessed using:
   - Levene's test (formal testing)
   - Comparison of standard deviations (rule of thumb: ratio should not exceed 2:1)
   - Box plots (visual assessment)

   **Violation remedy**: If variances are unequal, use **Welch's t-test**, which does not assume equal variances and adjusts the degrees of freedom accordingly.

#### Test Statistic and Interpretation

The t-test computes a t-statistic that measures how many standard errors the difference between group means is from zero (the null hypothesis value):

**t = (M₁ - M₂) / SE_diff**

Where:
- M₁ and M₂ are the sample means for groups 1 and 2
- SE_diff is the standard error of the difference between means

**Interpretation:**
- **Null hypothesis (H₀)**: The population means are equal (μ₁ = μ₂)
- **Alternative hypothesis (H₁)**: The population means are not equal (μ₁ ≠ μ₂) for two-tailed tests

The p-value represents the probability of obtaining a difference as extreme as (or more extreme than) the observed difference if the null hypothesis were true. Conventional significance threshold: α = 0.05.

**Effect size**: Cohen's d quantifies the magnitude of the difference:
- **d = (M₁ - M₂) / SD_pooled**
- Small effect: |d| ≈ 0.2
- Medium effect: |d| ≈ 0.5
- Large effect: |d| ≈ 0.8

Always report effect sizes with confidence intervals to communicate both magnitude and precision of the estimated difference.

#### Reporting Standards

A complete report of an independent t-test should include:

**Descriptive statistics**: Sample sizes, means, and standard deviations for both groups
**Test results**: t-statistic, degrees of freedom, exact p-value (or p < .001 for very small values)
**Effect size**: Cohen's d with 95% confidence interval
**Assumption checks**: Statement about whether assumptions were met

**Example:**
> "Patients in the intervention group (n = 45, M = 128.3 mmHg, SD = 14.2) had significantly lower systolic blood pressure compared to the control group (n = 48, M = 138.7 mmHg, SD = 16.1), t(91) = 3.26, p = .002, d = 0.68, 95% CI [0.26, 1.09]. Assumptions of normality (Shapiro-Wilk test: intervention W = 0.97, p = .28; control W = 0.96, p = .15) and homogeneity of variance (Levene's F = 1.45, p = .23) were satisfied."

---

### Paired Samples T-Test

#### Purpose and Applications

The paired samples t-test (also called the dependent t-test or repeated measures t-test) compares means when the same participants are measured twice (e.g., before and after treatment) or when participants are matched in pairs.

**Clinical examples:**
- Comparing blood pressure before and after medication in the same patients
- Comparing tumor biomarker levels at diagnosis and after chemotherapy
- Comparing outcomes in matched case-control pairs

#### When to Use

Use the paired t-test when:
- You have **one continuous outcome variable**
- Measurements are taken **twice on the same individuals** (repeated measures) OR participants are **matched in pairs**
- The **differences between paired observations** are approximately normally distributed

#### Assumptions

1. **Paired observations**: Each measurement in one condition has a specific corresponding measurement in the other condition (e.g., same patient before and after treatment).

2. **Independence of pairs**: Different pairs are independent of each other (though measurements within pairs are dependent).

3. **Normality of differences**: The differences between paired observations should be approximately normally distributed. Check using:
   - Shapiro-Wilk test on the difference scores
   - Q-Q plot of the differences
   - Histogram of the differences

**Note**: We test normality of the *differences*, not the original measurements.

#### Test Statistic and Interpretation

The paired t-test analyzes the differences within each pair:

**t = M_diff / (SD_diff / √n)**

Where:
- M_diff is the mean of the paired differences
- SD_diff is the standard deviation of the paired differences
- n is the number of pairs

**Interpretation:**
- **Null hypothesis (H₀)**: The mean difference is zero (μ_diff = 0)
- **Alternative hypothesis (H₁)**: The mean difference is not zero (μ_diff ≠ 0)

**Effect size**: Cohen's d_z for paired data:
- **d_z = M_diff / SD_diff**

This represents the standardized mean difference and follows the same interpretation as independent samples Cohen's d (0.2 = small, 0.5 = medium, 0.8 = large).

#### Reporting Standards

**Example:**
> "Systolic blood pressure decreased significantly from baseline (M = 142.5 mmHg, SD = 13.8) to 8-week follow-up (M = 131.2 mmHg, SD = 12.6), t(44) = 4.87, p < .001, d_z = 0.85, 95% CI [0.50, 1.19]. The mean decrease was 11.3 mmHg (SD = 15.6). Differences were approximately normally distributed (Shapiro-Wilk W = 0.97, p = .19)."

---

### Mann-Whitney U Test (Wilcoxon Rank-Sum Test)

#### Purpose and Applications

The Mann-Whitney U test is the non-parametric alternative to the independent t-test. Instead of comparing means, it compares the distributions of two independent groups by analyzing the ranks of the data.

**Clinical examples:**
- Comparing median survival times between treatment groups when survival distributions are skewed
- Comparing pain scores (ordinal scale) between groups
- Comparing any continuous outcome when normality assumptions are violated

#### When to Use

Use the Mann-Whitney U test when:
- You have **one continuous or ordinal outcome variable**
- You have **two independent groups**
- **Normality assumptions are violated** and sample sizes are too small to rely on the Central Limit Theorem
- You have **ordinal data** (e.g., Likert scales, pain scores)
- You have **ranked data** or data with ties

#### Assumptions

1. **Independence of observations**: Observations within and between groups are independent.

2. **Ordinal or continuous measurement**: The outcome variable should be at least ordinal (can be ranked).

3. **Similar distributional shape** (for median interpretation): If you want to interpret the test as comparing medians, the distributions in both groups should have similar shapes (same variance and shape, just shifted location). If this assumption is violated, the test compares distributions more generally rather than specifically comparing medians.

**Important note**: The Mann-Whitney U test does NOT assume normality—this is its primary advantage over the t-test.

#### Test Statistic and Interpretation

The Mann-Whitney U test:
1. Combines all observations from both groups
2. Ranks them from smallest to largest
3. Computes the sum of ranks for each group
4. Calculates the U statistic based on these rank sums

**Interpretation:**
- **Null hypothesis (H₀)**: The distributions of the two groups are identical
- **Alternative hypothesis (H₁)**: The distributions differ in location (if shapes are similar, this means medians differ)

**Effect size**: Rank-biserial correlation or common language effect size
- **r = 1 - (2U)/(n₁ × n₂)** where U is the smaller of the two U statistics
- Interpretation: 0 = no effect, 1 = complete separation

#### Reporting Standards

**Example:**
> "Median survival time was significantly longer in the treatment group (Mdn = 18.5 months, IQR = 12.3-26.7) compared to the control group (Mdn = 13.2 months, IQR = 8.9-19.4), U = 1,847, p = .003, r = 0.38. Data were non-normally distributed (Shapiro-Wilk p < .001 for both groups), necessitating use of a non-parametric test."

---

### Wilcoxon Signed-Rank Test

#### Purpose and Applications

The Wilcoxon signed-rank test is the non-parametric alternative to the paired t-test. It compares two related samples by analyzing the ranks of the differences between paired observations.

**Clinical examples:**
- Comparing symptom scores before and after treatment when scores are ordinal
- Comparing biomarker levels at two time points when data are skewed
- Any repeated measures comparison when normality of differences is violated

#### When to Use

Use the Wilcoxon signed-rank test when:
- You have **two related/paired measurements** (repeated measures or matched pairs)
- The **differences are not normally distributed**
- You have **ordinal data** measured at two time points

#### Assumptions

1. **Paired observations**: Each observation in one condition is paired with a specific observation in the other condition.

2. **Ordinal or continuous measurement**: The outcome variable can be meaningfully ranked.

3. **Symmetry of differences** (for median interpretation): The distribution of differences should be approximately symmetric around the median. This allows interpretation as a test of median difference.

**Note**: Does NOT assume normality of differences—this is why it replaces the paired t-test when normality is violated.

#### Test Statistic and Interpretation

The Wilcoxon signed-rank test:
1. Calculates the difference for each pair
2. Ranks the absolute values of the differences (ignoring zero differences)
3. Assigns the original sign (+ or -) to each rank
4. Sums the positive and negative ranks separately
5. Uses the smaller of these sums as the test statistic

**Interpretation:**
- **Null hypothesis (H₀)**: The median difference is zero
- **Alternative hypothesis (H₁)**: The median difference is not zero

**Effect size**: Rank-biserial correlation for paired data
- **r = Z / √n** where Z is the standardized test statistic

#### Reporting Standards

**Example:**
> "Pain scores decreased significantly from baseline (Mdn = 7, IQR = 6-9) to post-treatment (Mdn = 4, IQR = 3-6), Z = -4.23, p < .001, r = 0.63. The paired differences were non-normally distributed (Shapiro-Wilk W = 0.88, p = .003), therefore a non-parametric test was used."

---

### One-Way Analysis of Variance (ANOVA)

#### Purpose and Applications

One-way ANOVA compares means across three or more independent groups. It tests whether at least one group mean differs from the others, extending the independent t-test to multiple groups.

**Clinical examples:**
- Comparing mean cholesterol levels across three diet intervention groups
- Comparing tumor response across multiple treatment arms in a clinical trial
- Comparing quality of life scores across disease severity categories (mild, moderate, severe)

#### When to Use

Use one-way ANOVA when:
- You have **one continuous outcome variable**
- You have **one categorical predictor with three or more levels** (groups)
- Groups are **independent** (between-subjects design)
- The outcome is **approximately normally distributed** within each group
- **Variances are approximately equal** across groups (homogeneity of variance)

#### Assumptions

1. **Independence of observations**: Observations are independent both within and between groups. Each participant appears in only one group.

2. **Normality**: The outcome variable is approximately normally distributed within each group. Check using:
   - Shapiro-Wilk test for each group
   - Q-Q plots for each group
   - Histograms for each group

   **Robustness**: ANOVA is fairly robust to violations of normality, especially with balanced designs and larger sample sizes.

3. **Homogeneity of variance**: Variance of the outcome is approximately equal across all groups. Check using:
   - Levene's test
   - Brown-Forsythe test (more robust to non-normality)
   - Visual comparison of box plots

   **Violation remedy**: Use Welch's ANOVA (does not assume equal variances) or Brown-Forsythe ANOVA when variances are heterogeneous.

#### Test Statistic and Interpretation

ANOVA partitions total variance into:
- **Between-groups variance**: Variability of group means around the grand mean
- **Within-groups variance**: Variability of individual observations around their group means

**F-ratio = MS_between / MS_within**

Where MS = mean square (variance estimate)

**Interpretation:**
- **Null hypothesis (H₀)**: All group means are equal (μ₁ = μ₂ = μ₃ = ... = μ_k)
- **Alternative hypothesis (H₁)**: At least one group mean differs from the others

**Important**: A significant F-test tells you that differences exist but does NOT tell you which specific groups differ. **Post-hoc tests** are required to identify which pairwise comparisons are significant.

**Effect size**: Eta-squared (η²) or partial eta-squared (η²_p)
- **η² = SS_between / SS_total**
- Small effect: η² ≈ 0.01
- Medium effect: η² ≈ 0.06
- Large effect: η² ≈ 0.14

#### Post-Hoc Comparisons

When ANOVA is significant, conduct post-hoc tests to determine which groups differ:

**Tukey's HSD (Honestly Significant Difference)**: Most common, controls family-wise error rate, requires equal sample sizes
**Games-Howell**: Recommended when variances are unequal, does not assume homogeneity of variance
**Bonferroni**: Conservative, divides α by number of comparisons
**Holm's method**: Less conservative than Bonferroni while controlling family-wise error

#### Reporting Standards

**Example:**
> "A one-way ANOVA revealed a significant effect of treatment group on LDL cholesterol levels, F(2, 117) = 12.45, p < .001, η² = 0.18. Post-hoc comparisons using Tukey's HSD indicated that the intensive diet group (M = 98.3 mg/dL, SD = 18.2) had significantly lower LDL than both the moderate diet group (M = 112.5 mg/dL, SD = 21.4, p = .008, d = 0.71) and the control group (M = 118.7 mg/dL, SD = 19.6, p < .001, d = 1.02). The moderate diet and control groups did not differ significantly (p = .28, d = 0.30). Assumptions of normality (Shapiro-Wilk p > .05 for all groups) and homogeneity of variance (Levene's F = 1.87, p = .16) were satisfied."

---

### Kruskal-Wallis Test

#### Purpose and Applications

The Kruskal-Wallis test is the non-parametric alternative to one-way ANOVA. It compares distributions across three or more independent groups using rank-based methods.

**Clinical examples:**
- Comparing median hospital length of stay across multiple diagnostic categories when distributions are skewed
- Comparing ordinal pain scores across treatment groups
- Comparing any continuous outcome across groups when ANOVA assumptions are violated

#### When to Use

Use the Kruskal-Wallis test when:
- You have **one continuous or ordinal outcome variable**
- You have **three or more independent groups**
- **Normality assumptions are violated** in one or more groups
- You have **ordinal data** (e.g., disease severity scores)
- Sample sizes are too small to rely on ANOVA's robustness to non-normality

#### Assumptions

1. **Independence of observations**: Observations are independent within and between groups.

2. **Ordinal or continuous measurement**: The outcome can be meaningfully ranked.

3. **Similar distributional shapes** (for median interpretation): If the distributions have similar shapes across groups, the test can be interpreted as comparing medians. If shapes differ, it tests whether distributions differ more generally.

**Note**: Does NOT assume normality or equal variances—these are its primary advantages over one-way ANOVA.

#### Test Statistic and Interpretation

The Kruskal-Wallis test:
1. Combines all observations from all groups
2. Ranks them from smallest to largest
3. Computes the sum of ranks for each group
4. Calculates the H statistic (chi-square approximation) based on these rank sums

**Interpretation:**
- **Null hypothesis (H₀)**: All groups have identical distributions
- **Alternative hypothesis (H₁)**: At least one group's distribution differs from the others

**Effect size**: Epsilon-squared (ε²)
- **ε² = H / ((n² - 1) / (n + 1))**
- Small effect: ε² ≈ 0.01
- Medium effect: ε² ≈ 0.06
- Large effect: ε² ≈ 0.14

#### Post-Hoc Comparisons

When Kruskal-Wallis is significant, conduct post-hoc pairwise comparisons:

**Dunn's test**: Most common post-hoc for Kruskal-Wallis, with adjustment for multiple comparisons (Bonferroni, Holm, etc.)
**Pairwise Mann-Whitney U tests**: With appropriate corrections (Bonferroni, FDR)

#### Reporting Standards

**Example:**
> "A Kruskal-Wallis test revealed a significant difference in median hospital length of stay across the three diagnostic groups, H(2) = 18.74, p < .001, ε² = 0.16. Median stay was 4 days (IQR = 3-7) for Group A, 6 days (IQR = 4-10) for Group B, and 9 days (IQR = 6-14) for Group C. Dunn's post-hoc tests with Bonferroni correction showed that Group C had significantly longer stays than both Group A (p < .001) and Group B (p = .009). Groups A and B did not differ significantly (p = .15). The Kruskal-Wallis test was used because data were positively skewed (Shapiro-Wilk p < .05 for all groups)."

---

## Tests for Categorical Outcomes

### Chi-Square Test of Independence

#### Purpose and Applications

The chi-square (χ²) test of independence examines whether two categorical variables are associated. It compares observed frequencies in a contingency table to frequencies expected under independence.

**Clinical examples:**
- Testing association between treatment group (A vs. B) and treatment response (responder vs. non-responder)
- Examining relationship between smoking status (smoker vs. non-smoker) and lung cancer diagnosis (yes vs. no)
- Assessing association between disease stage (I, II, III, IV) and molecular subtype (A, B, C)

#### When to Use

Use the chi-square test when:
- You have **two categorical variables** (can be binary or multi-category)
- Observations are **independent** (each participant contributes to only one cell)
- **Expected frequencies** are sufficiently large (see assumptions below)

#### Assumptions

1. **Independence of observations**: Each observation appears in only one cell of the contingency table. Participants are independent of each other.

2. **Expected frequency requirement**: All expected cell counts should be at least 5. For 2×2 tables, some sources require all expected counts ≥ 10 for greater reliability.
   - **Expected count** = (row total × column total) / grand total
   - If this assumption is violated, use **Fisher's exact test** instead

3. **Adequate sample size**: A general guideline is that the total sample size should exceed 20 for 2×2 tables and be larger for tables with more cells.

4. **Mutually exclusive categories**: Each observation can belong to only one category in each variable.

#### Test Statistic and Interpretation

The chi-square statistic measures the discrepancy between observed (O) and expected (E) frequencies:

**χ² = Σ [(O - E)² / E]**

Summed across all cells in the contingency table.

**Interpretation:**
- **Null hypothesis (H₀)**: The two variables are independent (no association)
- **Alternative hypothesis (H₁)**: The two variables are associated (dependent)

Degrees of freedom: **df = (rows - 1) × (columns - 1)**

**Effect size**: Cramér's V
- **V = √(χ² / (n × min(rows-1, columns-1)))**
- For 2×2 tables: Small V ≈ 0.10, Medium V ≈ 0.30, Large V ≈ 0.50
- For larger tables, benchmarks adjust based on df

**Post-hoc analysis**: For tables larger than 2×2, conduct pairwise chi-square tests or examine standardized residuals to identify which cells contribute most to the overall association.

#### Reporting Standards

**Example (2×2 table):**
> "There was a significant association between treatment group and response status, χ²(1, N = 200) = 8.94, p = .003, Cramér's V = 0.21. In the experimental group, 65.0% (65/100) were responders compared to 48.0% (48/100) in the control group. All expected cell frequencies exceeded 10, satisfying chi-square test assumptions."

**Example (larger table):**
> "Disease stage was significantly associated with molecular subtype, χ²(6, N = 315) = 24.67, p < .001, Cramér's V = 0.20. Examination of standardized residuals revealed that Stage IV disease was significantly over-represented in Subtype C (z = 3.42, p < .001 after Bonferroni correction) and under-represented in Subtype A (z = -2.89, p = .004)."

---

### Fisher's Exact Test

#### Purpose and Applications

Fisher's exact test examines the association between two categorical variables when sample sizes are small or expected frequencies are low, making the chi-square approximation unreliable.

**Clinical examples:**
- Testing association between treatment and rare adverse events (when events are infrequent)
- Examining relationship between rare genetic variant and disease status in small samples
- Any 2×2 contingency table with small expected cell counts

#### When to Use

Use Fisher's exact test when:
- You have **two categorical variables** forming a 2×2 contingency table
- **Expected frequencies are too small** for chi-square test (any expected count < 5)
- Sample size is small (total N < 40 is a conservative guideline)
- You want an **exact p-value** rather than approximation (can use for any 2×2 table)

**Extension**: Fisher's exact test can be extended to tables larger than 2×2, but computational demands increase rapidly. The Fisher-Freeman-Halton test handles larger tables but may be computationally intensive.

#### Assumptions

1. **Independence of observations**: Each observation contributes to only one cell.

2. **Fixed marginal totals**: Fisher's exact test conditions on the observed marginal totals (row and column sums). This is appropriate for many research designs but not all.

3. **Categorical variables**: Both variables must be categorical (nominal or ordinal).

**Important**: Fisher's exact test does NOT require any minimum expected frequency—this is its primary advantage over the chi-square test.

#### Test Statistic and Interpretation

Fisher's exact test calculates the exact probability of observing the given table (and all more extreme tables) under the null hypothesis of independence, given the fixed marginal totals.

For a 2×2 table:

```
         Group A   Group B   Total
Event        a         b      a+b
No Event     c         d      c+d
Total      a+c       b+d       n
```

The exact probability is calculated using the hypergeometric distribution.

**Interpretation:**
- **Null hypothesis (H₀)**: The two variables are independent
- **Alternative hypothesis (H₁)**: The two variables are associated

The p-value represents the exact probability (not an approximation) of obtaining the observed association or stronger, given the marginal totals.

**Effect size**: Odds ratio (OR) for 2×2 tables
- **OR = (a × d) / (b × c)**
- OR = 1: No association
- OR > 1: Positive association (event more likely in Group A)
- OR < 1: Negative association (event less likely in Group A)

Report OR with 95% confidence interval (use mid-p or exact methods for small samples).

#### Reporting Standards

**Example:**
> "Fisher's exact test revealed a significant association between treatment group and adverse event occurrence (p = .042, two-tailed). The experimental group had a higher rate of adverse events (15.0%, 3/20) compared to the control group (0%, 0/18). The estimated odds ratio was undefined due to zero cell count; the 95% confidence interval (mid-p method) was [1.12, ∞]. Fisher's exact test was used due to expected cell frequencies below 5."

**Example (with calculable OR):**
> "Treatment response differed significantly between genotype groups (Fisher's exact test p = .018, two-tailed). The AA genotype had a 72.7% response rate (8/11) compared to 35.0% (7/20) for the AB/BB genotypes combined (OR = 4.95, 95% CI [1.15, 23.4])."

---

## Special Considerations for Clinical Research

### Multiple Comparison Corrections

When conducting multiple statistical tests (e.g., comparing multiple outcomes or multiple subgroups), the probability of at least one false positive (Type I error) increases. Consider corrections such as:

**Bonferroni correction**: Divide α by the number of tests (conservative)
**Holm-Bonferroni**: Sequential Bonferroni (less conservative)
**False Discovery Rate (FDR)**: Control proportion of false discoveries (Benjamini-Hochberg)

**When to use**: Required for planned multiple comparisons. Consider for exploratory analyses but clearly label as exploratory.

### Clinical vs. Statistical Significance

A **statistically significant** result (p < .05) does not automatically mean the finding is **clinically meaningful**. Always consider:

1. **Effect size**: How large is the difference?
2. **Clinical relevance**: Is the magnitude clinically important?
3. **Confidence intervals**: What is the range of plausible effect sizes?
4. **Context**: Does this finding matter for patient care or outcomes?

**Example**: A drug reduces systolic blood pressure by 2 mmHg (p = .001). This is statistically significant but may not be clinically meaningful for most patients.

### Sample Size and Power

**Underpowered studies** may fail to detect true effects (Type II error). **Overpowered studies** may detect trivial effects as statistically significant. Report:

1. **A priori power analysis**: Planned sample size calculation
2. **Achieved power**: Post-hoc power (with caution about interpretation)
3. **Sensitivity**: Minimum detectable effect size given sample size

---

## Implementation in ClinicoPathDescriptives

The ClinicoPathDescriptives package implements all these statistical tests with appropriate assumption checking and effect size calculations. The package automatically:

1. **Checks normality**: Using Shapiro-Wilk test and visual diagnostics
2. **Checks homogeneity of variance**: Using Levene's test
3. **Selects appropriate tests**: Based on data characteristics
4. **Computes effect sizes**: With confidence intervals
5. **Generates complete reports**: Following reporting standards

**Example workflow:**

```r
library(ClinicoPathDescriptives)

# For continuous outcomes (2 groups)
# Package automatically checks assumptions and selects t-test vs. Mann-Whitney
result <- compare_groups(
  data = clinical_data,
  outcome = "cholesterol_change",
  group = "treatment_arm",
  test = "auto"  # Automatic selection based on assumptions
)

# For categorical outcomes
# Automatically selects chi-square vs. Fisher's exact based on expected frequencies
cross_result <- crosstable(
  data = clinical_data,
  row_var = "treatment",
  col_var = "response",
  test = "auto"
)
```

---

## Summary Checklist

Before conducting any statistical test, ensure:

- [ ] You understand your research question and hypotheses
- [ ] You have selected the appropriate test for your data type and design
- [ ] You have checked all relevant assumptions
- [ ] You understand what the test statistic and p-value mean
- [ ] You have calculated appropriate effect sizes
- [ ] You can interpret results in clinical context
- [ ] Your report includes all necessary information (descriptives, test results, effect sizes, assumption checks)

---

## References

Fisher RA. On the Interpretation of χ² from Contingency Tables, and the Calculation of P. *Journal of the Royal Statistical Society*. 1922;85(1):87-94. doi:10.2307/2340521

Kruskal WH, Wallis WA. Use of Ranks in One-Criterion Variance Analysis. *Journal of the American Statistical Association*. 1952;47(260):583-621. doi:10.1080/01621459.1952.10483441

Mann HB, Whitney DR. On a Test of Whether one of Two Random Variables is Stochastically Larger than the Other. *Annals of Mathematical Statistics*. 1947;18(1):50-60. doi:10.1214/aoms/1177730491

Neely JG, Stewart MG, Hartman JM, et al. Tutorials in clinical research: Part VI. Descriptive statistics. *Laryngoscope*. 2002;112(9):1541-1549. doi:10.1097/00005537-200209000-00002

Welch BL. The Generalization of 'Student's' Problem when Several Different Population Variances are Involved. *Biometrika*. 1947;34(1-2):28-35. doi:10.1093/biomet/34.1-2.28

Wilcoxon F. Individual Comparisons by Ranking Methods. *Biometrics Bulletin*. 1945;1(6):80-83. doi:10.2307/3001968

---

*This reference guide was developed for the ClinicoPathDescriptives package to support rigorous statistical analysis in clinicopathological research.*

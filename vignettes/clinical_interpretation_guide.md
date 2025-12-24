# Clinical Interpretation Guidelines for Descriptive Statistics in Pathology and Clinical Research

*A practical guide for clinicians and researchers*

---

## Introduction

Descriptive statistics form the foundation of clinical research and pathology reporting, yet their interpretation requires careful consideration of clinical context. This guide provides practical guidance for clinicians, pathologists, and clinical researchers on interpreting common descriptive statistical presentations, with emphasis on when different approaches are appropriate and what conclusions can be drawn.

Understanding the nuances of descriptive statistics enables clinicians to critically appraise research findings, recognize patterns in patient populations, and make evidence-informed decisions. This guide addresses four key areas: choosing between median and mean for summarizing data, interpreting age pyramids for population health assessment, understanding alluvial diagrams for visualizing treatment pathways, and drawing clinically meaningful conclusions from cross-tabulation analyses.

---

## 1. Choosing Between Median and Mean: Clinical Decision-Making

### When to Use Mean vs. Median

The choice between mean and median as measures of central tendency has important implications for clinical interpretation. Both describe the "typical" value in a dataset, but they respond differently to data distribution characteristics and outliers.

#### Understanding the Difference

The **mean** (arithmetic average) is calculated by summing all values and dividing by the number of observations. It incorporates information from every data point, making it sensitive to extreme values. The **median** is the middle value when data are ordered from smallest to largest (or the average of the two middle values for even-sized datasets). It represents the 50th percentile and is resistant to extreme values.

#### Clinical Scenarios Favoring the Mean

Use the mean when data are **approximately normally distributed** (bell-shaped, symmetric). In these situations, the mean and median will be similar, and the mean provides a more precise estimate because it uses information from all observations.

**Appropriate clinical applications:**

**Laboratory values in healthy populations**: Many physiological measurements follow approximately normal distributions in healthy individuals. Hemoglobin levels, serum sodium, body temperature at rest, and white blood cell counts in healthy populations are typically symmetric. For these variables, reporting mean ± standard deviation (SD) provides clinically meaningful information about the typical value and the expected range of variation.

*Example*: "Mean hemoglobin in healthy adult males was 15.2 g/dL (SD = 1.1), indicating that approximately 95% of healthy males have hemoglobin between 13.0 and 17.4 g/dL (mean ± 2 SD)."

**Anthropometric measurements**: Height, weight (in relatively homogeneous populations), and body mass index often follow normal distributions within defined demographic groups. Using means allows calculation of z-scores and percentiles, facilitating comparison with reference standards.

**Differences or changes from baseline**: When analyzing paired data (e.g., before-after treatment comparisons), the distribution of *differences* is often more symmetric than the original measurements, even if the measurements themselves are skewed. In this context, mean difference provides an interpretable measure of average treatment effect.

*Example*: "Mean reduction in systolic blood pressure after 8 weeks of treatment was 12.3 mmHg (SD = 8.5), indicating clinically significant blood pressure lowering."

**Quality of life scores and validated scales**: Many patient-reported outcome measures and functional assessment scales yield approximately normal distributions, particularly when well-validated and measured in large samples. For these instruments, means facilitate comparison across studies and populations.

#### Clinical Scenarios Favoring the Median

Use the median when data are **skewed** (asymmetric) or contain **outliers**. In these situations, the mean can be misleading because it is pulled toward extreme values, giving a distorted picture of the typical patient.

**Appropriate clinical applications:**

**Hospital length of stay**: Most patients are discharged within a few days, but some require extended hospitalization (weeks or months). The distribution is right-skewed with a long tail of high values. The mean is inflated by these few long-stay patients and does not represent typical patient experience.

*Example*: "Median length of stay was 4 days (IQR = 3-6) for uncomplicated appendectomy, compared to a mean of 5.8 days. The median better represents typical patient experience; the mean is inflated by rare cases requiring extended hospitalization due to complications."

**Survival time in oncology**: Survival data are inherently right-skewed. Some patients may survive many years while others have short survival times. Additionally, censoring (patients still alive at analysis) makes the mean problematic. Median survival time is the clinical standard.

*Example*: "Median overall survival was 16.5 months (95% CI: 13.2-19.8 months), meaning half of patients survived longer than 16.5 months and half survived less. This is more interpretable than mean survival for skewed, censored data."

**Laboratory values in diseased populations**: While physiological measurements may be normally distributed in healthy individuals, disease often introduces skewness. Tumor markers (e.g., CA 19-9, PSA), viral loads, and inflammatory markers (e.g., CRP, ferritin) are often right-skewed. A few patients with very high values pull the mean upward.

*Example*: "Median prostate-specific antigen (PSA) was 6.8 ng/mL (IQR = 4.2-12.5) in men with biopsy-proven prostate cancer. The mean was 23.4 ng/mL, inflated by 3 patients with PSA > 100 ng/mL. The median better represents the typical patient at diagnosis."

**Healthcare costs**: Cost data are notoriously right-skewed. Most patients incur modest costs, but a small proportion accounts for extremely high expenditures. The mean cost is driven by these outliers and poorly represents typical patient costs.

*Example*: "Median cost of treatment was $8,450 (IQR = $5,200-$14,800), while mean cost was $18,230. The median better reflects typical patient cost; the mean is inflated by 5% of patients with complications requiring intensive care."

**Tumor size and disease burden**: Tumor measurements, number of metastatic sites, and disease extent are often skewed. Small tumors are common, but occasional very large tumors skew the distribution.

**Time to event in non-survival contexts**: Time to symptom resolution, time to hospital readmission, and time to disease recurrence often follow skewed distributions, favoring the median.

### Reporting Standards for Clinical Context

When reporting central tendency in clinical research:

**Always report the measure of dispersion** alongside the measure of central tendency:
- For normally distributed data with mean: Report standard deviation (SD)
- For skewed data with median: Report interquartile range (IQR) or range

**Provide context for interpretation**:
- State why you chose mean vs. median
- For medians, the IQR conveys the spread of the middle 50% of observations
- For means, approximately 95% of observations fall within mean ± 2 SD (if normally distributed)

**Example of clear reporting**:
> "Median time to symptom resolution was 5 days (IQR = 3-8 days), indicating that half of patients experienced resolution within 5 days. The distribution was right-skewed (Shapiro-Wilk p < .001), with a small number of patients requiring 3-4 weeks for complete resolution. Therefore, median is reported rather than mean to avoid inflation by these outliers."

### Clinical Implications: Why This Matters

**Patient counseling**: When discussing expected outcomes with patients, the median often provides a more honest expectation than the mean for skewed outcomes like hospital stay or recovery time.

*Example*: Telling a patient "most people stay in the hospital 3-4 days" (median 3.5 days) is more accurate than "the average stay is 6 days" (mean inflated by complications) when the distribution is right-skewed.

**Resource planning**: Healthcare administrators making staffing or budgetary decisions need to understand both typical cases (median) and total burden (sum, which involves the mean). Using only the mean for planning can lead to overestimation of routine resource needs.

**Comparative effectiveness**: When comparing treatments, the choice of mean vs. median can affect conclusions. If one treatment has more outliers (extremely good or bad responses), the mean difference may be larger than the median difference, potentially misleading about the typical patient benefit.

**Reference ranges and clinical cutoffs**: Many laboratory reference ranges are based on mean ± 2 SD in healthy populations, implicitly assuming normality. For skewed biomarkers, percentile-based ranges (e.g., 2.5th to 97.5th percentile) are more appropriate.

---

## 2. Interpreting Age Pyramids for Population Health Assessment

### What Age Pyramids Show

An age pyramid is a population distribution visualization that displays the frequency or percentage of individuals within age groups (typically 5-year or 10-year intervals), separated by biological sex. The traditional format places males on the left side and females on the right side, with age increasing from bottom (youngest) to top (oldest), creating a pyramid-like shape when populations are growing.

Age pyramids reveal critical information about population structure that has direct implications for healthcare planning, disease epidemiology, and public health policy.

### Types of Age Pyramid Shapes and Their Meanings

#### Expansive Pyramid (Young, Growing Population)

**Shape**: Wide base that narrows progressively toward the top, forming a classic pyramid.

**Interpretation**: High birth rates, high proportion of children and young adults, relatively few elderly individuals. Characteristic of developing countries or populations with recent immigration of young adults.

**Clinical implications**:
- **Healthcare needs**: Greater demand for pediatric services, obstetric care, pediatric vaccinations
- **Disease burden**: Higher prevalence of infectious diseases, childhood illnesses, maternal health issues
- **Resource allocation**: Investment in childhood immunization programs, school health services, maternal-child health facilities
- **Workforce**: Growing working-age population can support healthcare system expansion

**Pathology patterns**: Lower age-related chronic disease burden (cardiovascular disease, cancer, dementia), higher burden of congenital anomalies, infections, and trauma.

#### Constrictive Pyramid (Aging, Declining Population)

**Shape**: Narrow base with a wide middle and top, appearing somewhat inverted or vase-shaped.

**Interpretation**: Low birth rates, aging population, shrinking younger cohorts. Characteristic of developed countries with low fertility and increasing longevity.

**Clinical implications**:
- **Healthcare needs**: Increased demand for geriatric services, chronic disease management, long-term care, palliative care
- **Disease burden**: High prevalence of age-related conditions (cardiovascular disease, cancer, osteoporosis, dementia, degenerative joint disease)
- **Resource allocation**: Expansion of geriatric specialties, nursing homes, hospice care, rehabilitation services
- **Workforce challenges**: Fewer working-age individuals to support healthcare for growing elderly population
- **Economic pressure**: Increasing healthcare expenditures with shrinking tax base

**Pathology patterns**: High burden of malignancies (breast, prostate, colorectal, lung), cardiovascular pathology (atherosclerosis, heart failure), neurodegenerative diseases.

#### Stationary Pyramid (Stable, Mature Population)

**Shape**: Relatively rectangular or column-like, with similar proportions across age groups until older ages when death causes narrowing.

**Interpretation**: Birth rates and death rates are balanced, population is relatively stable. Characteristic of some developed countries with replacement-level fertility.

**Clinical implications**:
- **Balanced healthcare demand**: Relatively predictable needs across pediatric, adult, and geriatric services
- **Chronic disease emergence**: As the population ages within this structure, chronic disease burden gradually increases
- **Planning stability**: More predictable healthcare resource needs facilitate long-term planning

### Gender Disparities in Age Pyramids

#### Interpreting Male vs. Female Distribution

**At birth**: Most populations show approximately 105 male births per 100 female births (sex ratio at birth ≈ 1.05). This biological constant results in slightly wider bars on the male side at the youngest ages.

**In young adulthood**: In populations affected by conflict, dangerous occupations, or high-risk behaviors, males may show excess mortality, causing the male side to narrow more than the female side. This is visible as a disproportionate thinning of the male bars in the 20-40 age range.

**In older age**: Females generally outlive males due to biological factors and historical differences in health behaviors. This creates a female-dominant top of the pyramid, often pronounced in the 75+ age groups.

**Clinical implications of gender disparities**:

- **Male excess mortality in young adults**: Suggests needs for injury prevention, mental health services (suicide prevention), occupational safety programs
- **Female longevity advantage**: Creates greater demand for elderly women's health services, including osteoporosis screening, long-term care facilities
- **Sex-specific disease patterns**: Male predominance in cardiovascular disease at younger ages; female predominance in autoimmune diseases and osteoporosis
- **Widow effect**: Large surplus of elderly widows has implications for social support, caregiver availability, mental health services

### Clinical Applications of Age Pyramid Interpretation

#### Healthcare Resource Planning

**Scenario**: A hospital system reviewing an age pyramid showing rapid growth in the 65+ age group over the next 10 years.

**Interpretation**: Aging population will increase demand for:
- Cardiology services (heart failure, coronary disease management)
- Oncology services (age is the primary risk factor for most cancers)
- Orthopedic services (hip/knee replacements, fracture management)
- Neurology (stroke management, dementia care)
- Geriatric medicine specialists

**Action**: Invest in expanding these specialties, train existing staff in geriatric competencies, develop multidisciplinary geriatric assessment programs, expand skilled nursing and rehabilitation facilities.

#### Disease Screening Program Planning

**Scenario**: An age pyramid shows a large cohort currently aged 50-64 years.

**Interpretation**: This cohort will soon enter the age range where cancer screening yields maximum benefit (colorectal cancer screening starting at 50, earlier lung cancer screening for high-risk individuals).

**Action**: Expand capacity for colonoscopy, implement organized screening programs, ensure adequate pathology and radiology services to handle increased screening volume.

#### Vaccine Program Targeting

**Scenario**: Age pyramid shows large pediatric population (0-10 years) and growing elderly population (65+ years).

**Interpretation**:
- Large pediatric cohort requires robust childhood vaccination infrastructure
- Growing elderly population needs annual influenza vaccination, pneumococcal vaccination, COVID-19 vaccination, and upcoming respiratory syncytial virus (RSV) vaccination

**Action**: Allocate resources for school-based vaccination programs (pediatric), establish community vaccination centers accessible to elderly (mobility considerations), implement pharmacist-delivered vaccination programs.

#### Understanding Disease Burden in Context

**Scenario**: A low-income country shows an expansive pyramid with large young population, yet age-standardized cancer incidence appears low.

**Interpretation**: Low crude cancer incidence may reflect young population structure rather than truly low cancer risk. Age-standardization is essential when comparing cancer rates between populations with different age structures.

**Caution**: Do not conclude that cancer is not a problem based solely on crude incidence. As the population ages, absolute cancer burden will increase dramatically even if age-specific rates remain constant.

### Age Pyramids in Pathology Practice

#### Patient Cohort Characterization

When reporting on a pathology series (e.g., 200 consecutive breast cancer cases), an age pyramid shows:
- Age distribution of cases by sex
- Whether certain age groups are over- or under-represented
- Whether the age distribution matches expected incidence patterns for that disease

*Example*: A breast cancer cohort showing a bimodal distribution (peaks at ages 45-49 and 65-69) suggests a mix of hormone receptor-positive (later peak) and potentially hereditary cases (earlier peak). This prompts consideration of BRCA testing for the younger cohort.

#### Comparing Institutional Populations

Comparing age pyramids of patient cohorts from different hospitals can reveal:
- **Referral patterns**: Academic centers may show older, more complex cases if they receive tertiary referrals
- **Community demographics**: Community hospitals reflect local population structures
- **Screening program effects**: Populations with robust screening may show cancer detection at younger ages (lead time)

### Limitations and Cautions

**Static snapshot**: Age pyramids represent a single time point. They do not directly show trends over time. Serial pyramids (e.g., every 10 years) are needed to visualize demographic transitions.

**Migration effects**: Immigration and emigration can distort age pyramids. Large influxes of working-age immigrants create bulges in the 20-40 age range.

**Cohort effects**: A bulge in one age group (e.g., baby boom generation) will move upward through the pyramid over time, creating moving waves of healthcare demand.

**Gender limitations**: Traditional pyramids use binary sex (male/female). Modern populations include transgender and non-binary individuals whose health needs may not align with their assigned sex at birth, complicating disease risk stratification.

**Aggregation masks heterogeneity**: A single age pyramid for an entire country may mask important regional, ethnic, or socioeconomic differences in age structure.

---

## 3. Understanding Alluvial Diagrams for Treatment Pathways in Clinical Research

### What Alluvial Diagrams Visualize

Alluvial diagrams (also called Sankey diagrams in some contexts) are flow-based visualizations that show how categorical variables change or how individuals move between states over time or across decision points. In clinical research, they are particularly valuable for visualizing treatment pathways, disease progression, and patient flow through healthcare systems.

The diagram consists of vertical axes representing time points or decision stages, with flowing "streams" connecting categories between stages. The width of each stream is proportional to the number or percentage of individuals in that flow, making it easy to identify dominant pathways and bottlenecks.

### Clinical Applications of Alluvial Diagrams

#### Visualizing Treatment Sequences in Oncology

**Scenario**: Tracking treatment lines in metastatic colorectal cancer from first-line through third-line therapy.

**Alluvial diagram structure**:
- **Axis 1 (First-line)**: FOLFOX+bevacizumab, FOLFIRI+cetuximab, CAPOX+bevacizumab
- **Axis 2 (Second-line)**: FOLFIRI+aflibercept, FOLFOX+ramucirumab, Regorafenib, Supportive care
- **Axis 3 (Third-line)**: TAS-102, Regorafenib, Clinical trial, Supportive care

**Interpretation**: The diagram reveals:
- Which first-line regimens most commonly lead to which second-line choices (identifying preferred sequences)
- The proportion of patients who do not progress to second-line (died or declined further treatment)
- Common treatment patterns (e.g., FOLFOX → FOLFIRI crossover)
- Drop-off rates between lines (what proportion continues to third-line therapy)
- Endpoint diversity (how many different terminal states exist: death, hospice, ongoing therapy)

**Clinical insights**:
- **Sequential regimen effectiveness**: If most patients on FOLFOX+bevacizumab progress to FOLFIRI second-line with good duration of treatment, this supports the current sequencing strategy.
- **Attrition identification**: If 40% of patients do not reach second-line therapy, this highlights the aggressive nature of the disease or the need for better first-line options.
- **Rare pathway detection**: Unusual flows (e.g., skipping second-line to go directly to third-line) may indicate protocol violations, patient refusal, or rapid progression requiring escalation.

#### Tracking Disease Stage Progression

**Scenario**: Visualizing how cervical dysplasia progresses or regresses over 5 years of surveillance.

**Alluvial diagram structure**:
- **Baseline**: Normal, ASCUS, LSIL, HSIL
- **Year 1**: Normal, ASCUS, LSIL, HSIL, CIN 1, CIN 2, CIN 3, Cancer
- **Year 3**: Normal, LSIL, HSIL, CIN 2, CIN 3, Cancer, Treated/excised
- **Year 5**: Normal, Persistent CIN, Cancer, Treated/cured, Lost to follow-up

**Interpretation**:
- **Regression rates**: Wide streams from LSIL back to Normal indicate high spontaneous regression (reassuring for clinical management)
- **Progression risk**: Thin streams from LSIL to HSIL/CIN 2-3 quantify progression risk, informing surveillance intervals
- **Treatment impact**: Flows into "Treated/cured" show the success of interventions (e.g., LEEP, cone biopsy)
- **Loss to follow-up**: Critical for identifying gaps in care and designing retention strategies

**Clinical insights**:
- **Risk stratification**: Patients with persistent HSIL at year 1 show much higher progression to CIN 3 by year 3, supporting more aggressive surveillance or treatment.
- **Surveillance intervals**: If most regressions occur within the first year, this supports annual surveillance with potential de-escalation for stable low-grade lesions.
- **Patient counseling**: Visual demonstration that "most low-grade lesions regress" becomes concrete when patients see that 70% of LSIL flows back to Normal.

#### Mapping Patient Flow Through Healthcare Settings

**Scenario**: Tracking patient transitions from emergency department through hospitalization, ICU, step-down units, and discharge.

**Alluvial diagram structure**:
- **ED arrival**: Triage level 1, 2, 3, 4, 5
- **Initial disposition**: Discharged home, Admitted to floor, Admitted to ICU, Transferred to another facility
- **48-hour status**: Remains on floor, Escalated to ICU, Transferred to step-down, Discharged
- **Final disposition**: Home, Skilled nursing facility, Rehabilitation, Deceased, Transfer

**Interpretation**:
- **Escalation of care**: Flows from floor to ICU indicate clinical deterioration; high rates suggest inadequate initial triage or disease severity underestimation
- **ICU utilization**: If many ICU patients quickly de-escalate to floor, this might suggest over-triage to ICU or effective rapid intervention
- **Discharge patterns**: Large flows to skilled nursing facilities indicate high care needs post-hospitalization (common in frail elderly)
- **Readmission risk**: Although not shown in a single diagram, comparing flows for readmitted vs. not readmitted cohorts reveals risk factors

**Clinical insights**:
- **Resource bottlenecks**: If large numbers flow from ED to floor but bed availability causes delays, this indicates need for bed capacity expansion.
- **Quality metrics**: High escalation rates from floor to ICU may trigger quality improvement initiatives (e.g., early warning scores, rapid response teams).
- **Capacity planning**: Understanding typical flow patterns informs staffing models and unit size optimization.

#### Visualizing Treatment Response and Subsequent Therapy

**Scenario**: Showing response to first-line chemotherapy and how response status influences second-line selection.

**Alluvial diagram structure**:
- **First-line therapy**: Regimen A, Regimen B, Regimen C
- **Best response**: Complete response, Partial response, Stable disease, Progressive disease
- **Second-line therapy**: Same regimen (if responding), Switch regimen, Clinical trial, Supportive care, Immunotherapy

**Interpretation**:
- **Response-dependent decision making**: Patients with progressive disease on first-line rarely receive the same regimen second-line (as expected)
- **Maintenance strategies**: Patients with complete or partial response may continue the same regimen (maintenance therapy)
- **Crossover patterns**: Patients progressing on Regimen A preferentially receive Regimen B or C second-line (informed by guideline recommendations)
- **Trial enrollment**: Progressive disease patients may flow into clinical trials if standard options are exhausted

**Clinical insights**:
- **Guideline adherence**: If guidelines recommend switching mechanisms of action after progression, adherence can be visually confirmed.
- **Unmet needs**: Large flows to supportive care after first progression indicate lack of effective second-line options.
- **Biomarker impact**: Separate diagrams for biomarker-positive vs. biomarker-negative cohorts can show how biomarkers influence therapy selection.

### Interpreting Complex Flows: What to Look For

#### Dominant Pathways

**Thick flows** represent common trajectories. In well-established treatment paradigms, thick flows should align with guideline recommendations. Deviations suggest either patient factors (contraindications, preferences), physician practice variation, or inadequate guideline dissemination.

*Example*: In HER2-positive metastatic breast cancer, a thick flow from first-line trastuzumab+pertuzumab+taxane to second-line T-DXd (trastuzumab deruxtecan) after progression aligns with evidence-based sequencing.

#### Unexpected or Aberrant Pathways

**Thin, counterintuitive flows** warrant investigation. Why would patients with complete response receive second-line therapy? Possible explanations:
- Disease recurrence/progression after initial response (expected)
- Toxicity prompting regimen change despite response (patient-driven)
- Protocol-driven switches (e.g., maintenance therapy transition)
- Data error or misclassification

#### Attrition and Drop-Off

**Narrowing streams** between time points indicate attrition. In oncology, this often represents:
- Death from disease progression
- Withdrawal from therapy due to toxicity or patient choice
- Loss to follow-up
- End-of-life transition to hospice care

**Clinical significance**: High attrition between first- and second-line therapy (e.g., only 40% of first-line patients receive second-line) indicates:
- Aggressive disease with rapid progression and death
- Limited fitness for further therapy
- Need for better supportive care or earlier palliative involvement

#### Convergence and Divergence

**Convergence** (multiple pathways feeding into one category) indicates a common endpoint or therapeutic funnel:
- Multiple first-line regimens all leading to the same second-line (suggests limited second-line options)
- Various disease states all progressing to terminal state (disease natural history)

**Divergence** (one category splitting into many) indicates decision complexity or heterogeneous outcomes:
- One first-line regimen leading to varied second-line choices (multiple valid options, personalization)
- One disease state leading to varied outcomes (heterogeneous disease biology)

### Limitations and Interpretation Cautions

**Temporal ambiguity**: Standard alluvial diagrams do not show *time between transitions*. Two patients may both flow from first-line to second-line therapy, but one might have 6 months of disease control while the other progresses in 6 weeks. Consider supplementing alluvial diagrams with time-to-event analyses.

**Causality not demonstrated**: Alluvial diagrams show associations and sequences but do not prove that one state *causes* another. Confounding factors may influence both the starting and ending states.

**Sample size considerations**: Thin flows can appear due to small sample sizes rather than true rarity. Always interpret in the context of absolute numbers, not just proportions.

**Aggregation and subgroup effects**: Alluvial diagrams aggregate across the entire population. Important subgroup differences (e.g., by age, biomarker status) may be masked. Consider stratified diagrams for key subgroups.

**Missing data representation**: Patients with incomplete follow-up or unknown outcomes may not appear in later stages, potentially biasing flow patterns. Sensitivity analyses should address missing data.

### Using Alluvial Diagrams in Clinical Communication

**For multidisciplinary team meetings**: Alluvial diagrams can show tumor board recommendations and actual treatment patterns, identifying concordance or discordance with consensus recommendations.

**For quality improvement**: By comparing observed flows with evidence-based pathways, gaps in care delivery can be identified (e.g., underuse of recommended second-line agents).

**For patient education**: Simplified alluvial diagrams showing "what happens next" for patients like them (similar stage, biomarkers) can help patients understand the treatment journey and set expectations.

**For research hypothesis generation**: Unusual flows may suggest research questions (e.g., why do some patients with partial response not continue therapy? What factors predict treatment sequence selection?).

---

## 4. Clinical Significance of Cross-Tabulation Results in Pathology and Clinical Research

### What Cross-Tabulation Reveals

Cross-tabulation (contingency table analysis) examines the relationship between two categorical variables by displaying their joint frequency distribution. In clinical research, cross-tabulation is fundamental for assessing associations between exposures and outcomes, biomarkers and clinical features, or treatments and responses.

### Interpreting Statistical Significance vs. Clinical Significance

One of the most common pitfalls in interpreting cross-tabulation results is conflating statistical significance (p < .05) with clinical significance (meaningful impact on patient care or outcomes). These are distinct concepts that both matter.

#### Statistical Significance Alone Is Not Sufficient

**Example: Treatment response by prior therapy status**

|                  | Responder | Non-responder | Total |
|------------------|-----------|---------------|-------|
| Prior therapy    | 142       | 108           | 250   |
| Treatment-naïve  | 155       | 95            | 250   |
| **Total**        | 297       | 203           | 500   |

**Statistical result**: χ²(1) = 4.21, p = .040

**Interpretation**: The p-value < .05 indicates a statistically significant association between prior therapy status and response. However, is this clinically meaningful?

**Calculate effect size**:
- Response rate in prior therapy group: 142/250 = 56.8%
- Response rate in treatment-naïve group: 155/250 = 62.0%
- Absolute difference: 5.2 percentage points
- Relative risk: 0.92 (95% CI: 0.84-1.00)

**Clinical significance judgment**: A 5.2% absolute difference in response rates is statistically significant but may not be large enough to change treatment recommendations. The 95% confidence interval for relative risk just touches 1.0, suggesting the effect size is small and the statistical significance is borderline.

**Conclusion**: While statistically significant, this finding has limited clinical significance. It would not justify withholding treatment from patients who have received prior therapy. However, it might inform patient counseling ("response rates are slightly lower if you've had prior treatment, but the difference is small").

#### Clinically Significant Findings May Lack Statistical Significance (Type II Error)

**Example: Rare adverse event by treatment group**

|                       | Adverse event | No adverse event | Total |
|-----------------------|---------------|------------------|-------|
| Experimental treatment| 8             | 42               | 50    |
| Standard treatment    | 2             | 48               | 50    |
| **Total**             | 10            | 90               | 100   |

**Statistical result**: Fisher's exact test p = .091 (two-tailed)

**Interpretation**: The p-value > .05 indicates no statistically significant association. However, is this clinically meaningful?

**Calculate effect sizes**:
- Adverse event rate in experimental: 8/50 = 16.0%
- Adverse event rate in standard: 2/50 = 4.0%
- Absolute difference: 12 percentage points
- Relative risk: 4.0 (95% CI: 0.88-18.2)

**Clinical significance judgment**: A 4-fold increase in adverse event rate (from 4% to 16%) is clinically concerning even though it does not reach statistical significance. The wide confidence interval reflects small sample size and uncertainty, but the point estimate suggests meaningful harm.

**Conclusion**: Lack of statistical significance does not prove safety. This finding warrants:
- Increased pharmacovigilance
- Larger studies with adequate power to detect safety signals
- Consideration of mechanism (is there biological plausibility for increased risk?)
- Patient counseling about potential risk even if not statistically "proven"

### Measures of Association: What They Mean Clinically

#### Relative Risk (Risk Ratio)

**Definition**: The ratio of the probability of an outcome in the exposed group to the probability in the unexposed group.

**RR = [a/(a+b)] / [c/(c+d)]**

Where a = exposed with outcome, b = exposed without outcome, c = unexposed with outcome, d = unexposed without outcome.

**Interpretation**:
- RR = 1: No association (exposure does not change risk)
- RR > 1: Positive association (exposure increases risk)
- RR < 1: Negative association (exposure decreases risk, protective effect)

**Clinical example**:

|                    | Disease | No Disease | Total |
|--------------------|---------|------------|-------|
| Biomarker positive | 45      | 55         | 100   |
| Biomarker negative | 20      | 80         | 100   |

**Calculation**:
- Risk in biomarker positive: 45/100 = 0.45
- Risk in biomarker negative: 20/100 = 0.20
- RR = 0.45 / 0.20 = 2.25

**Clinical interpretation**: Patients with the biomarker have 2.25 times the risk of disease compared to those without the biomarker. The biomarker is a risk factor.

**Important distinction**: Relative risk is interpretable only for cohort studies or randomized trials (where exposure is measured first, then outcome). In case-control studies, use odds ratio instead.

#### Odds Ratio

**Definition**: The ratio of the odds of an outcome in the exposed group to the odds in the unexposed group.

**OR = (a/b) / (c/d) = (a × d) / (b × c)**

**Interpretation**: Similar to RR for rare outcomes (<10%), but differs substantially when outcomes are common.

**When OR approximates RR**: When the outcome is rare (e.g., rare disease), OR ≈ RR. In this situation, OR can be interpreted as approximating relative risk.

**When OR and RR diverge**: When the outcome is common (>20%), OR overestimates RR. Always consider the baseline risk when interpreting OR.

**Clinical example (rare disease)**:

|                 | Cases (disease) | Controls (no disease) | Total |
|-----------------|-----------------|----------------------|-------|
| Mutation present| 18              | 32                   | 50    |
| Mutation absent | 12              | 88                   | 100   |

**Calculation**:
- Odds in mutation present: 18/32 = 0.56
- Odds in mutation absent: 12/88 = 0.14
- OR = 0.56 / 0.14 = 4.0 (or (18×88)/(32×12) = 4.0)

**Clinical interpretation**: The odds of disease are 4 times higher in individuals with the mutation compared to those without. Because disease is rare (30/150 = 20%), the OR approximates the relative risk: individuals with the mutation have approximately 4 times the risk of disease.

**Clinical application**: This OR magnitude (4.0) suggests a moderately strong association. If the mutation is prevalent and actionable, this finding supports:
- Genetic screening programs
- Enhanced surveillance for mutation carriers
- Research into mutation-targeted therapies

#### Absolute Risk Difference (Risk Difference, Attributable Risk)

**Definition**: The difference in risk between exposed and unexposed groups.

**ARD = [a/(a+b)] - [c/(c+d)]**

**Clinical relevance**: ARD is often more clinically meaningful than relative measures because it tells you the absolute change in outcome probability.

**Clinical example**:

|                 | Death | Survival | Total |
|-----------------|-------|----------|-------|
| Treatment A     | 10    | 90       | 100   |
| Treatment B     | 20    | 80       | 100   |

**Calculations**:
- Mortality in Treatment A: 10/100 = 0.10 (10%)
- Mortality in Treatment B: 20/100 = 0.20 (20%)
- RR = 0.10 / 0.20 = 0.50 (50% relative risk reduction)
- ARD = 0.10 - 0.20 = -0.10 (-10 percentage points)

**Clinical interpretation**:
- **Relative risk reduction**: Treatment A reduces mortality by 50% compared to Treatment B.
- **Absolute risk reduction**: Treatment A prevents 10 deaths per 100 patients treated.
- **Number needed to treat (NNT)**: 1/ARD = 1/0.10 = 10. Ten patients must be treated with A instead of B to prevent one death.

**Why both matter**: The relative risk reduction (50%) sounds impressive, but the absolute benefit (10 percentage points) contextualizes the magnitude. For a low-baseline-risk disease (e.g., 2% mortality), a 50% reduction yields only 1% ARD (NNT = 100), which may not justify treatment if it's costly or toxic. For high-baseline-risk disease (e.g., 40% mortality), the same 50% reduction yields 20% ARD (NNT = 5), which is highly clinically significant.

### Confounding and Stratified Analysis

Cross-tabulation of two variables does not account for confounding (third variables that influence both the exposure and outcome, creating a spurious association or masking a true association). Stratified analysis (creating separate cross-tables for different levels of a potential confounder) helps identify and control for confounding.

**Example: Simpson's Paradox**

**Crude analysis** (ignoring tumor stage):

|              | Response | No response | Response rate |
|--------------|----------|-------------|---------------|
| Drug A       | 120      | 80          | 60.0%         |
| Drug B       | 100      | 50          | 66.7%         |

**Crude conclusion**: Drug B appears superior (66.7% vs. 60.0% response).

**Stratified analysis by tumor stage**:

**Early stage**:

|        | Response | No response | Response rate |
|--------|----------|-------------|---------------|
| Drug A | 100      | 50          | 66.7%         |
| Drug B | 80       | 20          | 80.0%         |

**Advanced stage**:

|        | Response | No response | Response rate |
|--------|----------|-------------|---------------|
| Drug A | 20       | 30          | 40.0%         |
| Drug B | 20       | 30          | 40.0%         |

**Stratified conclusion**: Within each tumor stage, Drug B is either superior (early stage: 80.0% vs. 66.7%) or equivalent (advanced stage: 40.0% vs. 40.0%). The crude analysis was confounded by tumor stage distribution: Drug A was preferentially used in advanced-stage disease (where response rates are inherently lower), creating the illusion of inferiority.

**Clinical implication**: Always consider potential confounders (age, disease stage, comorbidities, performance status) when interpreting cross-tabulation results. Multivariable regression or propensity score matching may be needed to adjust for multiple confounders simultaneously.

### Sample Size and Power Considerations

Small sample sizes can produce both false negatives (Type II errors, missing true associations) and unstable estimates (wide confidence intervals).

**Example: Insufficient power to detect a clinically meaningful difference**

|           | Event | No event | Total | Event rate |
|-----------|-------|----------|-------|------------|
| Group A   | 5     | 20       | 25    | 20%        |
| Group B   | 2     | 23       | 25    | 8%         |

Fisher's exact test: p = .227

**Interpretation**: The p-value > .05 suggests no statistically significant difference, but the point estimates suggest a 2.5-fold difference in event rates (20% vs. 8%). The study is simply underpowered to detect this difference with only 25 patients per group.

**Clinical action**: This does not prove the groups are equivalent. A larger study or meta-analysis may be warranted if the event is clinically important.

### Multiple Comparisons and False Discovery

When conducting many cross-tabulations (e.g., testing association between each of 20 biomarkers and treatment response), the chance of finding at least one "significant" result by chance alone increases dramatically (family-wise error rate).

**Without correction**: At α = .05, testing 20 independent hypotheses yields approximately 64% probability of at least one false positive.

**Correction methods**:
- **Bonferroni correction**: Divide α by number of tests (conservative; α_corrected = 0.05/20 = 0.0025)
- **False discovery rate (FDR)**: Control proportion of false discoveries (less conservative, more powerful)

**Clinical application**: When exploring multiple biomarkers, distinguish **exploratory** (hypothesis-generating) from **confirmatory** (hypothesis-testing) analyses. Exploratory findings with p < .05 but p > .05 after correction should be labeled as preliminary and requiring validation.

### Reporting Best Practices for Cross-Tabulation Results

**Complete reporting includes**:
1. **Sample sizes**: Total N and cell counts
2. **Percentages**: Row percentages (comparing outcomes within exposure groups) or column percentages (comparing exposures within outcome groups) as appropriate
3. **Effect measures**: Relative risk or odds ratio with 95% confidence intervals
4. **Statistical test**: Chi-square, Fisher's exact, or other test with exact p-value
5. **Clinical significance**: Interpretation of absolute differences and their clinical relevance
6. **Confounding consideration**: Mention of potential confounders and whether adjustment was performed

**Example of complete reporting**:
> "Treatment response was significantly associated with biomarker status (Fisher's exact test p = .003). Among biomarker-positive patients, 72% (36/50) responded compared to 48% (24/50) of biomarker-negative patients (absolute difference 24 percentage points, relative risk 1.50, 95% CI 1.08-2.08). This effect remained significant after adjusting for age, disease stage, and prior therapy in multivariable logistic regression (adjusted OR 2.85, 95% CI 1.35-6.01, p = .006). The magnitude of effect (24% absolute difference) is clinically meaningful and supports biomarker-guided therapy selection."

---

## Summary and Key Takeaways

### Mean vs. Median Selection

- **Use mean** for normally distributed data; **use median** for skewed data or outliers
- The mean is sensitive to extremes; the median represents the typical patient
- Always report measures of dispersion (SD for mean, IQR for median)
- Clinical context matters: median survival, mean lab values, median hospital stay

### Age Pyramids

- Shape reveals population structure: expansive (young/growing), constrictive (aging/shrinking), stationary (stable)
- Healthcare planning depends on age distribution: pediatric services for young populations, geriatric services for aging populations
- Gender disparities inform sex-specific health needs
- Serial pyramids show demographic trends over time

### Alluvial Diagrams

- Visualize treatment pathways, disease progression, patient flow through systems
- Thick flows = common pathways; thin flows = rare transitions
- Attrition between stages indicates disease severity, patient dropout, or survival
- Useful for quality improvement (comparing actual vs. recommended pathways)
- Temporal information (time between transitions) is not shown; supplement with time-to-event analysis

### Cross-Tabulation

- **Statistical significance ≠ clinical significance**: small p-values can occur with trivial effect sizes; large effects can fail to reach significance in small samples
- Report both **relative** (RR, OR) and **absolute** measures (ARD, NNT)
- Consider **confounding**: stratified analysis or multivariable adjustment may be needed
- Multiple testing increases false positives; use corrections for exploratory analyses
- Always report effect sizes with confidence intervals, not just p-values

### General Principles for Clinical Interpretation

1. **Context is paramount**: Statistical findings must be interpreted in light of biological plausibility, prior evidence, and clinical relevance
2. **Effect size matters**: Magnitude of association determines clinical importance
3. **Precision matters**: Wide confidence intervals indicate uncertainty
4. **Confounding matters**: Unadjusted associations may be spurious
5. **Population matters**: Findings from one population may not generalize to others
6. **Communication matters**: Clear, accurate presentation enables evidence-informed decision-making

---

## References

Altman DG, Bland JM. Quartiles, quintiles, centiles, and other quantiles. *BMJ*. 1994;309(6960):996. doi:10.1136/bmj.309.6960.996

Altman DG. Practical Statistics for Medical Research. Chapman and Hall/CRC; 1990.

Moher D, Hopewell S, Schulz KF, et al. CONSORT 2010 Explanation and Elaboration: updated guidelines for reporting parallel group randomised trials. *BMJ*. 2010;340:c869. doi:10.1136/bmj.c869

Neely JG, Stewart MG, Hartman JM, et al. Tutorials in clinical research: Part VI. Descriptive statistics. *Laryngoscope*. 2002;112(9):1541-1549. doi:10.1097/00005537-200209000-00002

Rosvall M, Bergstrom CT. Mapping change in large networks. *PLoS ONE*. 2010;5(1):e8694. doi:10.1371/journal.pone.0008694

Szklo M, Nieto FJ. Epidemiology: Beyond the Basics. 4th ed. Jones & Bartlett Learning; 2018.

---

*This guide was developed for the ClinicoPathDescriptives package to support evidence-informed interpretation of descriptive statistics in clinical and pathology research.*

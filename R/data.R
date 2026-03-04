# Dataset documentation for ClinicoPathDescriptives
# This file provides roxygen2 documentation for all package datasets

# ============================================================================
# PRIMARY DATASETS (.rda)
# ============================================================================

#' Histopathology Example Dataset
#'
#' A simulated clinicopathological dataset for demonstrating package functions.
#' Contains patient demographics, tumor characteristics, diagnostic test results,
#' and survival outcomes.
#'
#' @format A data frame with 250 rows and 38 columns.
#' @examples
#' data(histopathology)
#' str(histopathology)
"histopathology"

#' Treatment Response Data
#'
#' A dataset containing patient treatment response values for demonstrating
#' summary and visualization functions.
#'
#' @format A data frame with 250 rows and 2 columns:
#' \describe{
#'   \item{PatientID}{Patient identifier}
#'   \item{ResponseValue}{Numeric treatment response measurement}
#' }
#' @examples
#' data(treatmentResponse)
"treatmentResponse"

#' Sarcoma IHC Data
#'
#' Simulated sarcoma immunohistochemistry dataset with tumor characteristics
#' and IHC marker results.
#'
#' @format A data frame with 300 rows and 18 columns including patient
#'   demographics, tumor type, grade, IHC markers, and survival outcomes.
"sarcoma_data"

#' IHC Test Data
#'
#' Immunohistochemistry test result dataset for demonstrating cross-table
#' and summary functions.
#'
#' @format A data frame with 100 rows and 9 columns.
"ihc_test_data"

# ============================================================================
# AGE PYRAMID DATASETS (.rda)
# ============================================================================

#' Age Pyramid Test Dataset
#'
#' Test data for the age pyramid module with age, sex, and group variables.
#'
#' @format A data frame with 500 rows and 3 columns.
"agepyramid_test"

#' Age Pyramid Cancer Dataset
#'
#' Simulated cancer registry data for age pyramid visualization.
#'
#' @format A data frame with 500 rows and 3 columns.
"agepyramid_cancer"

#' Age Pyramid Pediatric Dataset
#'
#' Simulated pediatric population data for age pyramid visualization.
#'
#' @format A data frame with 300 rows and 3 columns.
"agepyramid_pediatric"

#' Age Pyramid Geriatric Dataset
#'
#' Simulated geriatric population data for age pyramid visualization.
#'
#' @format A data frame with 200 rows and 3 columns.
"agepyramid_geriatric"

#' Age Pyramid Reproductive Dataset
#'
#' Simulated reproductive-age population data for age pyramid visualization.
#'
#' @format A data frame with 400 rows and 3 columns.
"agepyramid_reproductive"

#' Age Pyramid Unbalanced Dataset
#'
#' Simulated dataset with unbalanced sex distribution for testing
#' single-gender handling in age pyramid visualization.
#'
#' @format A data frame with 300 rows and 3 columns.
"agepyramid_unbalanced"

# ============================================================================
# CHI-SQUARE POST-TEST DATASETS
# ============================================================================

#' Chi-Square Post-Test Data
#'
#' Test data for the chi-square post-test module.
#'
#' @format A data frame with 300 rows and 14 columns including treatment,
#'   response, demographics, and tumor characteristics.
"chisqposttest_test_data"

#' @title Chi-Square All Features Data
#' @description Dataset with all feature combinations for chi-square testing.
#' @name chisqposttest_all_features
#' @docType data
#' @format A data frame loaded from CSV.
NULL

#' @title Chi-Square Comprehensive Test Data
#' @description Comprehensive dataset for chi-square post-test demonstrations.
#' @name chisqposttest_comprehensive
#' @docType data
#' @format A data frame loaded from CSV.
NULL

#' @title Chi-Square Null Association Data
#' @description Dataset with no significant associations for chi-square testing.
#' @name chisqposttest_null
#' @docType data
#' @format A data frame loaded from CSV.
NULL

#' @title Chi-Square Perfect Association Data
#' @description Dataset with perfect associations for chi-square testing.
#' @name chisqposttest_perfect
#' @docType data
#' @format A data frame loaded from CSV.
NULL

#' @title Chi-Square Small Sample Data
#' @description Small sample dataset for chi-square testing edge cases.
#' @name chisqposttest_small
#' @docType data
#' @format A data frame loaded from CSV.
NULL

#' @title Chi-Square Weighted Data
#' @description Weighted dataset for chi-square post-test module.
#' @name chisqposttest_weighted
#' @docType data
#' @format A data frame loaded from CSV.
NULL

# ============================================================================
# OUTLIER DETECTION DATASETS (.rda)
# ============================================================================

#' Outlier Detection Basic Dataset
#'
#' Basic test dataset for outlier detection module with numeric variables.
#'
#' @format A data frame with 200 rows and 9 columns.
"outlierdetection_basic"

#' Outlier Detection Clinical Dataset
#'
#' Clinical data with laboratory values for outlier detection.
#'
#' @format A data frame with 300 rows and 15 columns.
"outlierdetection_clinical"

#' Outlier Detection Edge Cases Dataset
#'
#' Dataset with edge cases for testing outlier detection robustness.
#'
#' @format A data frame with 100 rows and 11 columns.
"outlierdetection_edge_cases"

#' Outlier Detection International Dataset
#'
#' International measurement data for outlier detection testing.
#'
#' @format A data frame with 150 rows and 11 columns.
"outlierdetection_international"

#' Outlier Detection Large Dataset
#'
#' Large dataset for performance testing of outlier detection.
#'
#' @format A data frame with 2000 rows and 11 columns.
"outlierdetection_large"

#' Outlier Detection Multivariate Dataset
#'
#' Dataset for testing multivariate outlier detection methods.
#'
#' @format A data frame with 200 rows and 6 columns.
"outlierdetection_multivariate"

#' Outlier Detection Problematic Dataset
#'
#' Dataset with problematic data patterns for outlier detection testing.
#'
#' @format A data frame with 50 rows and 10 columns.
"outlierdetection_problematic"

#' Outlier Detection Psychological Dataset
#'
#' Psychological measurement data for outlier detection testing.
#'
#' @format A data frame with 200 rows and 11 columns.
"outlierdetection_psychological"

#' Outlier Detection Temporal Dataset
#'
#' Temporal data for testing outlier detection over time.
#'
#' @format A data frame with 200 rows and 6 columns.
"outlierdetection_temporal"

# ============================================================================
# OTHER DATASETS (.rda)
# ============================================================================

#' Table One Test Dataset
#'
#' Test data for the TableOne module with clinical variables.
#'
#' @format A data frame with 150 rows and 19 columns including patient
#'   demographics, tumor characteristics, lab values, and outcomes.
"tableone_test"

#' Complex Alluvial Data
#'
#' Dataset for demonstrating complex alluvial diagram features.
#'
#' @format A data frame with 500 rows and 8 columns.
"complex_alluvial_data"

#' Election Survey Data
#'
#' Simulated election survey dataset for alluvial diagram demonstration.
#'
#' @format A data frame with 300 rows and 11 columns.
"election_survey_data"

#' Flowchart Comprehensive Data
#'
#' Dataset for comprehensive flowchart generation.
#'
#' @format A data frame with 25 rows and 4 columns.
"ggflowchart_comprehensive_data"

#' Multi-Group Workflow Data
#'
#' Dataset for demonstrating multi-group analysis workflows.
#'
#' @format A data frame with 9 rows and 3 columns.
"multi_group_workflow"

#' Raw Data with Time Variable
#'
#' Dataset containing raw measurements with time information.
#'
#' @format A data frame with 20 rows and 3 columns.
"raw_with_time"

# ============================================================================
# CSV-ONLY DATASETS (auto-loaded by R from data/ directory)
# ============================================================================

#' @title Colorectal IHC Data
#' @description Colorectal cancer immunohistochemistry staining data.
#' @name colorectal_ihc_data
#' @docType data
#' @format A data frame loaded from CSV with IHC staining results.
NULL

#' @title Benford Test Dataset
#' @description Test data for Benford's law analysis module.
#' @name benford_test
#' @docType data
#' @format A data frame loaded from CSV with numeric columns.
NULL

#' @title Check Data Test Dataset
#' @description Test data for the data checking module.
#' @name checkdata_test
#' @docType data
#' @format A data frame loaded from CSV.
NULL

#' @title Data Quality Test Dataset
#' @description Test data for the data quality assessment module.
#' @name dataquality_test
#' @docType data
#' @format A data frame loaded from CSV.
NULL

#' @title Report Categorical Test Dataset
#' @description Test data for the categorical report module with clinical variables.
#' @name reportcat_test
#' @docType data
#' @format A data frame loaded from CSV with patient demographics and treatment data.
NULL

#' @title Summary Data Test Dataset
#' @description Test data for the summary data module.
#' @name summarydata_test
#' @docType data
#' @format A data frame loaded from CSV with continuous variables.
NULL

#' @title Percent Data without Time
#' @description Dataset with percentage data without time variable.
#' @name percent_no_time
#' @docType data
#' @format A data frame loaded from CSV.
NULL


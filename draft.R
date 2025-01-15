
      # getDataCondition ----
      .getDataCondition = function(timeVar, inputType) {
        if (!is.null(timeVar)) {
          if (inputType == "raw") {
            return("time_raw")
          } else {
            return("time_percentage")
          }
        } else {
          if (inputType == "raw") {
            return("notime_raw")
          } else {
            return("notime_percentage")
          }
        }
      },


      # # validate input data format ----
      # .validateData = function(df, patientID, inputType, responseVar, timeVar = NULL) {
      #   ## Check for required columns ----
      #   if (!responseVar %in% names(df)) {
      #     stop("Response variable not found in data")
      #   }
      #
      #   ## Convert response to numeric ----
      #   df[[responseVar]] <- jmvcore::toNumeric(df[[responseVar]])
      #
      #   ## Validate measurements based on input type ----
      #   if (inputType == "raw") {
      #     # Check for non-positive baselines
      #     baseline_vals <- df %>%
      #       dplyr::group_by(.data[[patientID]]) %>%
      #       dplyr::summarise(baseline = dplyr::first(measurement)) %>%
      #       dplyr::pull(baseline)
      #
      #     if (any(baseline_vals <= 0, na.rm=TRUE)) {
      #       stop("Cannot calculate percentage change from zero or negative baseline values")
      #     }
      #   } else {
      #     # For percentage data, check range
      #     if (any(abs(df[[responseVar]]) > 100, na.rm=TRUE)) {
      #       warning("Some percentage values exceed ±100%")
      #     }
      #   }
      #
      #   ## Validate time variable if present ----
      #   if (!is.null(timeVar)) {
      #     if (!timeVar %in% names(df)) {
      #       stop("Time variable not found in data")
      #     }
      #     df[[timeVar]] <- jmvcore::toNumeric(df[[timeVar]])
      #   }
      #
      #   return(df)
      # },


      # .validateData = function(df, patientID, inputType, responseVar, timeVar = NULL) {
      #   # Check if required variables exist in dataframe
      #   required_vars <- c(patientID, responseVar)
      #   missing_vars <- required_vars[!required_vars %in% names(df)]
      #   if (length(missing_vars) > 0) {
      #     stop(sprintf("Required variables not found in data: %s",
      #                  paste(missing_vars, collapse = ", ")))
      #   }
      #
      #   # Convert response variable to numeric
      #   df[[responseVar]] <- jmvcore::toNumeric(df[[responseVar]])
      #
      #   # Validate based on input type
      #   if (inputType == "raw") {
      #     # For raw measurements, check baseline values
      #     baseline_data <- df %>%
      #       dplyr::group_by(.data[[patientID]]) %>%
      #       dplyr::summarise(
      #         baseline = dplyr::first(.data[[responseVar]]),  # Use responseVar instead of measurement
      #         .groups = "drop"
      #       )
      #
      #     # Check for invalid baselines
      #     if (any(baseline_data$baseline <= 0, na.rm = TRUE)) {
      #       problem_patients <- baseline_data %>%
      #         dplyr::filter(baseline <= 0) %>%
      #         dplyr::pull(!!patientID)
      #
      #       stop(sprintf(
      #         "Cannot calculate percentage change for patients with zero or negative baseline values: %s",
      #         paste(problem_patients, collapse = ", ")
      #       ))
      #     }
      #   } else {
      #     # For percentage data, validate range
      #     invalid_values <- df %>%
      #       dplyr::filter(abs(.data[[responseVar]]) > 100) %>%
      #       dplyr::select(!!patientID, !!responseVar)
      #
      #     if (nrow(invalid_values) > 0) {
      #       warning(sprintf(
      #         "Some percentage values exceed ±100%%:\n%s",
      #         paste(capture.output(print(invalid_values)), collapse = "\n")
      #       ))
      #     }
      #   }
      #
      #   # Validate time variable if present
      #   if (!is.null(timeVar)) {
      #     if (!timeVar %in% names(df)) {
      #       stop(sprintf("Time variable '%s' not found in data", timeVar))
      #     }
      #
      #     # Convert time to numeric
      #     df[[timeVar]] <- jmvcore::toNumeric(df[[timeVar]])
      #
      #     # Check for negative time values
      #     if (any(df[[timeVar]] < 0, na.rm = TRUE)) {
      #       warning("Negative time values found - consider using non-negative values for time")
      #     }
      #
      #     # Check time variable is properly ordered
      #     time_check <- df %>%
      #       dplyr::group_by(.data[[patientID]]) %>%
      #       dplyr::arrange(.data[[timeVar]]) %>%
      #       dplyr::summarise(
      #         has_duplicates = any(duplicated(.data[[timeVar]])),
      #         is_ordered = all(diff(.data[[timeVar]]) >= 0),
      #         .groups = "drop"
      #       )
      #
      #     if (any(time_check$has_duplicates)) {
      #       warning("Duplicate time points found for some patients")
      #     }
      #
      #     if (!all(time_check$is_ordered)) {
      #       warning("Time points are not in ascending order for all patients")
      #     }
      #   }
      #
      #   return(df)
      # }
      #



#
#       .validateData = function(df, patientID, inputType, responseVar, timeVar = NULL) {
#         # Check if raw measurements require time variable
#         if (inputType == "raw" && is.null(timeVar)) {
#           stop(paste(
#             "Time variable is required for raw measurements.",
#             "This is necessary to:",
#             "1. Identify baseline measurements (time = 0)",
#             "2. Calculate correct percentage changes",
#             "3. Track response progression",
#             "\nPlease add a time variable to analyze raw measurements.",
#             sep = "\n"
#           ))
#         }
#
#         # Check if required variables exist in dataframe
#         required_vars <- c(patientID, responseVar)
#         if (inputType == "raw") {
#           required_vars <- c(required_vars, timeVar)  # Make timeVar mandatory for raw measurements
#         }
#
#         missing_vars <- required_vars[!required_vars %in% names(df)]
#         if (length(missing_vars) > 0) {
#           stop(sprintf("Required variables not found in data: %s",
#                        paste(missing_vars, collapse = ", ")))
#         }
#
#         # Convert response variable to numeric
#         df[[responseVar]] <- jmvcore::toNumeric(df[[responseVar]])
#
#         # For raw measurements, perform additional time-based validations
#         if (inputType == "raw") {
#           # Convert time to numeric
#           df[[timeVar]] <- jmvcore::toNumeric(df[[timeVar]])
#
#           # Check for baseline measurements (time = 0) for each patient
#           baseline_check <- df %>%
#             dplyr::group_by(.data[[patientID]]) %>%
#             dplyr::summarise(
#               has_baseline = any(.data[[timeVar]] == 0),
#               .groups = "drop"
#             )
#
#           patients_without_baseline <- baseline_check %>%
#             dplyr::filter(!has_baseline) %>%
#             dplyr::pull(!!patientID)
#
#           if (length(patients_without_baseline) > 0) {
#             stop(sprintf(
#               "Missing baseline measurements (time = 0) for patients: %s\nBaseline measurements are required for calculating percentage changes.",
#               paste(patients_without_baseline, collapse = ", ")
#             ))
#           }
#
#           # Validate measurement values at baseline
#           baseline_values <- df %>%
#             dplyr::filter(.data[[timeVar]] == 0) %>%
#             dplyr::select(!!patientID, !!responseVar)
#
#           invalid_baselines <- baseline_values %>%
#             dplyr::filter(.data[[responseVar]] <= 0)
#
#           if (nrow(invalid_baselines) > 0) {
#             stop(sprintf(
#               "Invalid baseline measurements (zero or negative) found for patients: %s\nBaseline measurements must be positive to calculate percentage changes.",
#               paste(invalid_baselines[[patientID]], collapse = ", ")
#             ))
#           }
#         } else {
#           # For percentage data, validate range
#           invalid_values <- df %>%
#             dplyr::filter(abs(.data[[responseVar]]) > 100) %>%
#             dplyr::select(!!patientID, !!responseVar)
#
#           if (nrow(invalid_values) > 0) {
#             warning(sprintf(
#               "Some percentage values exceed ±100%%:\n%s",
#               paste(capture.output(print(invalid_values)), collapse = "\n")
#             ))
#           }
#         }
#
#         return(df)
#       }
#
















      ,
      # process data into required format ----

      # .processData = function(df, patientID, inputType, responseVar, timeVar = NULL) {
      #   if (inputType == "raw") {
      #     ## Calculate percentage changes from raw measurements
      #     df <- df %>%
      #       dplyr::group_by(.data[[patientID]]) %>%
      #       dplyr::arrange(.data[[patientID]], .data[[timeVar]]) %>%
      #       dplyr::mutate(
      #         baseline = dplyr::first(measurement),
      #         response = ((measurement - baseline) / baseline) * 100
      #       ) %>%
      #       dplyr::ungroup()
      #   } else {
      #     ## Data already in percentage format
      #     df$response <- df[[responseVar]]
      #   }
      #
      #   ## Calculate RECIST categories
      #   df$category <- factor(
      #     cut(df$response,
      #         breaks = c(-Inf, -100, -30, 20, Inf),
      #         labels = c("CR", "PR", "SD", "PD"),
      #         right = TRUE),
      #     levels = c("CR", "PR", "SD", "PD", "NA")
      #   )
      #
      #   ## Create two datasets for two plots
      #   df_waterfall <- df %>%
      #     dplyr::group_by(.data[[patientID]]) %>%
      #     dplyr::filter(abs(response) == max(abs(response))) %>%
      #     dplyr::ungroup()
      #
      #   df_spider <- df
      #
      #   return(list(
      #     waterfall = df_waterfall,
      #     spider = df_spider
      #   ))
      # },



      # Main run function ----
      .run = function() {

        ## Messages ----

        inputType <- self$options$inputType
        timeVar <- NULL
        hasTime <- !is.null(self$options$timeVar)

        if (hasTime) {
         timeVar <- self$options$timeVar
          }

        condition <- private$.getDataCondition(timeVar, inputType)

        ### Generate appropriate guidance message ----
        guideMsg <- switch(condition,
                                     "time_raw" = "
        <br><b>Current Setup:</b>
        <br>- Time variable detected - Spider plot enabled
        <br>- Using raw measurements - Will calculate percentage changes
        <br>- Baseline measurements will be taken from Time = 0",

                                     "time_percentage" = "
        <br><b>Current Setup:</b>
        <br>- Time variable detected - Spider plot enabled
        <br>- Using pre-calculated percentages
        <br>- Values at Time = 0 should be 0 (baseline)",

                                     "notime_raw" = "
        <br><b>Current Setup:</b>
        <br>- No time variable - Only waterfall plot available
        <br>- Using raw measurements - Will calculate percentage changes
        <br>- First measurement for each patient will be used as baseline",

                                     "notime_percentage" = "
        <br><b>Current Setup:</b>
        <br>- No time variable - Only waterfall plot available
        <br>- Using pre-calculated percentages
        <br>- Values should already represent change from baseline"
                  )

                  if(hasTime) {
                    spiderMsg <-  "
        <br><b>Spider Plot:</b> Available - Select Show Spider Plot in options"
                  } else {
                    spiderMsg <- "<br><b>Spider Plot:</b> Not available - Add time variable to enable"
                  }


        ### Update todo text to include condition-specific guidance ----
                  todo <- paste0(
                    "<br>Welcome to ClinicoPath Treatment Response Analysis",
                    "<br><br>",
                    "<b>Current Input Type:</b> ",
                    if(inputType == "raw") {
                      "Raw Measurements - Values will be converted to percentage change from baseline"
                    } else {
                      "Percentage Changes - Values will be used as-is"
                    },
                    guideMsg,
                    spiderMsg)



        ### Generate initial guidance message based on setup ----

        if (self$options$inputType == "raw") {
          todo <- paste0(todo,
                         "<br><hr><br>",
                         "Using raw measurements - will calculate percentage changes")
        } else {
          todo <- paste0(todo,
                         "<br><hr><br>",
                         "Using pre-calculated percentage changes")
        }


        ### Add more context to guidance message ----
        if (!is.null(self$options$timeVar)) {
          todo <- paste0(todo, "\nTime variable detected - Spider plot enabled")
        }









        if (is.null(self$options$patientID) || is.null(self$options$responseVar)) {
          # Show initial guidance message
          todo <- paste(
            "Welcome to the Treatment Response Analysis Tool",
            "\n\nThis tool helps you visualize and analyze tumor response data.",
            "\n\nTo get started, please provide:",
            "\n• Patient ID variable",
            "\n• Response measurements",
            if (self$options$inputType == "raw") {
              "\n• Time variable (required for raw measurements)"
            } else {
              ""
            }
          )
          self$results$todo$setContent(todo)
          return()
        }

        if (nrow(self$data) == 0) {
          self$results$todo$setContent("No data available for analysis. Please provide data.")
          return()
        }








        ## Process data ----
        ### .validateData ----
        # df <- private$.validateData(
        #   self$data,
        #   self$options$patientID,
        #   self$options$inputType,
        #   self$options$responseVar,
        #   self$options$timeVar
        # )

        ### .processData ----
        # processed_data <- private$.processData(
        #   df,
        #   self$options$patientID,
        #   self$options$inputType,
        #   self$options$responseVar,
        #   self$options$timeVar
        # )




      #             # Process data ----
      #             # df <- self$data
      #             # responseVar <- self$options$responseVar
      #             # df$response <- jmvcore::toNumeric(df[[responseVar]])
      #
      #             # Calculate response categories including NA ----
      #             # df$category <- factor(
      #             #     cut(df$response,
      #             #         breaks = c(-Inf, -100, -30, 20, Inf),
      #             #         labels = c("CR", "PR", "SD", "PD"),
      #             #         right = TRUE),
      #             #     levels = c("CR", "PR", "SD", "PD", "NA")
      #             # )
      #
      #             # Create summary table with proper categories ----
      #             # cats <- c("CR", "PR", "SD", "PD")
      #             # summary_table <- data.frame(
      #             #     category = cats,
      #             #     n = sapply(cats, function(x) sum(df$category == x, na.rm = TRUE)),
      #             #     stringsAsFactors = FALSE
      #             # )
      #             # summary_table$percent <- round(summary_table$n / sum(!is.na(df$response)) * 100, 2)
      #
      #                 df <- self$data
      #                 responseVar <- self$options$responseVar
      #                 patientVar <- self$options$patientID
      #
      #                 timeVar <- NULL
      #                 if (!is.null(self$options$timeVar)) {
      #                   timeVar <- self$options$timeVar
      #                 }
      #
      #                 inputType <- self$options$inputType
      #
      #
      #                 # Convert measurements to numeric
      #                 df$measurement <- jmvcore::toNumeric(df[[responseVar]])
      #
      #
      #
      #
      #                 # Check data patterns
      #                 looks_like_percentage <- all(df$measurement[df[[timeVar]] == 0] == 0, na.rm=TRUE) &&
      #                   all(abs(df$measurement) <= 100, na.rm=TRUE)
      #
      #                 # If raw is selected but data looks like percentage
      #                 if (inputType == "raw" && looks_like_percentage) {
      #                   warning("Data appears to be in percentage format but 'Raw Measurements' is selected")
      #                   self$results$todo$setContent(paste0(
      #                     todo,
      #                     "<br><hr><br>",
      #                     "<b>⚠️ NOTE:</b> Your data appears to be already in percentage format. Consider changing 'Input Type' to 'Percentage Changes' in the options."
      #                   ))
      #                   return()
      # "
      # Your data appears to be already in percentage format (baselines are 0 and values are between -100 and 100).
      # Please either:
      # 1. Change 'Input Type' to 'Percentage Changes' in the options, or
      # 2. Provide raw measurements if available
      #
      # Expected format for raw measurements:
      # PatientID  Time  Measurement
      # PT1        0     50          (baseline measurement)
      # PT1        2     25          (actual measurements)
      # PT1        4     10
      #
      # Current format (appears to be percentages):
      # PatientID  Time  Response
      # PT1        0     0           (0% change at baseline)
      # PT1        2     -50         (-50% change)
      # PT1        4     -80         (-80% change)
      #         '"
      #                 }
      #
      #                 # If percentage is selected but data looks like raw
      #                 if (inputType == "percentage" && !looks_like_percentage) {
      #                   warning("Data appears to be raw measurements but 'Percentage Changes' is selected")
      #                   self$results$todo$setContent(paste0(
      #                     todo,
      #                     "<br><hr><br>",
      #                     "<b>⚠️ NOTE:</b> Your data appears to be raw measurements. Consider changing 'Input Type' to 'Raw Measurements' in the options."
      #                   ))
      #                   return()
      #
      # "Your data appears to be raw measurements (non-zero baselines or values outside -100 to 100 range).
      # Please either:
      # 1. Change 'Input Type' to 'Raw Measurements' in the options, or
      # 2. Pre-calculate percentage changes if preferred
      #
      # Expected format for percentages:
      # PatientID  Time  Response
      # PT1        0     0           (0% change at baseline)
      # PT1        2     -50         (-50% change)
      # PT1        4     -80         (-80% change)
      #
      # Current format (appears to be raw):
      # PatientID  Time  Measurement
      # PT1        0     50          (baseline measurement)
      # PT1        2     25          (actual measurements)
      # PT1        4     10
      # "
      #                 }
      #
      #                 # Process data based on validated input type
      #                 if (inputType == "raw") {
      #                   df <- df %>%
      #                     dplyr::group_by(.data[[patientVar]]) %>%
      #                     dplyr::arrange(.data[[patientVar]], .data[[timeVar]]) %>%
      #                     dplyr::mutate(
      #                       baseline = dplyr::first(measurement),
      #                       response = dplyr::if_else(
      #                         baseline == 0,
      #                         NA_real_,
      #                         ((measurement - baseline) / baseline) * 100
      #                       )
      #                     ) %>%
      #                     dplyr::ungroup()
      #                 } else {
      #                   df$response <- df$measurement
      #                 }
      #
      #
      #
      #
      #
      #                 # Auto-detect input type if not specified
      #                 # if (inputType == "auto") {
      #                 #   # Check characteristics of the data
      #                 #   has_zero_baseline <- df %>%
      #                 #     dplyr::group_by(.data[[patientVar]]) %>%
      #                 #     dplyr::summarise(
      #                 #       first_value = first(measurement),
      #                 #       .groups = "drop"
      #                 #     ) %>%
      #                 #     dplyr::pull(first_value) %>%
      #                 #     {all(. == 0)}
      #                 #
      #                 #   has_large_changes <- any(abs(df$measurement) > 100, na.rm = TRUE)
      #                 #
      #                 #   # If all baselines are 0 and no values >100, likely percentage
      #                 #   inputType <- if(has_zero_baseline && !has_large_changes) {
      #                 #     "percentage"
      #                 #   } else {
      #                 #     "raw"
      #                 #   }
      #                 # }
      #
      #                 # Calculate percentage change from baseline if raw measurements
      #                 # df <- df %>%
      #                 #   dplyr::group_by(.data[[patientVar]]) %>%
      #                 #   dplyr::arrange(.data[[patientVar]], .data[[timeVar]]) %>%
      #                 #   dplyr::mutate(
      #                 #     baseline = first(measurement),
      #                 #     response = ((measurement - baseline) / baseline) * 100
      #                 #   ) %>%
      #                 #   dplyr::ungroup()
      #
      #
      #
      #
      #                 # Calculate response based on input type
      #                 # if (inputType == "raw") {
      #                 #   df <- df %>%
      #                 #     dplyr::group_by(.data[[patientVar]]) %>%
      #                 #     dplyr::arrange(.data[[patientVar]], .data[[timeVar]]) %>%
      #                 #     dplyr::mutate(
      #                 #       baseline = first(measurement),
      #                 #       response = case_when(
      #                 #         baseline == 0 ~ NA_real_,  # Handle zero baseline
      #                 #         TRUE ~ ((measurement - baseline) / baseline) * 100
      #                 #       )
      #                 #     ) %>%
      #                 #     dplyr::ungroup()
      #                 # } else {
      #                 #   # Data is already in percentage change
      #                 #   df$response <- df$measurement
      #                 # }
      #
      #                 # Add warning for potential issues
      #                 if (any(is.na(df$response))) {
      #                   warning("Some responses could not be calculated (possibly due to zero baselines)")
      #                 }
      #
      #                 if (inputType == "raw" && any(df$baseline == 0, na.rm = TRUE)) {
      #                   warning("Zero baselines detected - percentage change cannot be calculated for these cases")
      #                 }
      #
      #
      #
      #
      #
      #
      #                 # Create two datasets:
      #                 # 1. For waterfall plot - get best response per patient
      #                 # df_waterfall <- df %>%
      #                 #   dplyr::group_by(.data[[patientVar]]) %>%
      #                 #   dplyr::filter(abs(.data[[responseVar]]) == max(abs(.data[[responseVar]]))) %>%
      #                 #   dplyr::ungroup()
      #
      #                 df_waterfall <- df %>%
      #                   dplyr::group_by(.data[[patientVar]]) %>%
      #                   dplyr::filter(abs(response) == max(abs(response))) %>%
      #                   dplyr::ungroup()
      #
      #
      #                 # 2. For spider plot - keep all timepoints
      #                 df_spider <- df
      #
      #                 # Continue with waterfall plot data processing
      #                 df_waterfall$response <- jmvcore::toNumeric(df_waterfall[[responseVar]])
      #
      #                 # Calculate response categories as before but using df_waterfall
      #                 df_waterfall$category <- factor(
      #                   cut(df_waterfall$response,
      #                       breaks = c(-Inf, -100, -30, 20, Inf),
      #                       labels = c("CR", "PR", "SD", "PD"),
      #                       right = TRUE),
      #                   levels = c("CR", "PR", "SD", "PD", "NA")
      #                 )
      #
      #                 # Create summary table using df_waterfall
      #                 cats <- c("CR", "PR", "SD", "PD")
      #                 summary_table <- data.frame(
      #                   category = cats,
      #                   n = sapply(cats, function(x)
      #                     sum(df_waterfall$category == x, na.rm = TRUE)),
      #                   stringsAsFactors = FALSE
      #                 )
      #                 summary_table$percent <- round(summary_table$n /
      #                                                  sum(!is.na(df_waterfall$response)) * 100, 2)
      #
      #
      #
      #
      #             # Add results to summary table ----
      #             for(i in seq_len(nrow(summary_table))) {
      #                 self$results$summary$addRow(rowKey=i, values=list(
      #                     category = summary_table$category[i],
      #                     n = summary_table$n[i],
      #                     percent = summary_table$percent[i]
      #                 ))
      #             }
      #
      #             # Calculate clinical metrics ----
      #             ORR <- round(
      #                 (summary_table$n[summary_table$category %in% c("CR", "PR")] |> sum()) /
      #                     (summary_table$n |> sum()) * 100,
      #                 1
      #             )
      #
      #             DCR <- round(
      #                 (summary_table$n[summary_table$category %in% c("CR", "PR", "SD")] |> sum()) /
      #                     (summary_table$n |> sum()) * 100,
      #                 1
      #             )
      #
      #             # Add results to clinical metrics table ----
      #             self$results$clinicalMetrics$addRow(rowKey=1, values=list(
      #                 metric = "Objective Response Rate (CR+PR)",
      #                 value = paste0(ORR, "%")
      #             ))
      #
      #             self$results$clinicalMetrics$addRow(rowKey=2, values=list(
      #                 metric = "Disease Control Rate (CR+PR+SD)",
      #                 value = paste0(DCR, "%")
      #             ))
      #
      #
      #
      #
      #
      #             # Calculate key statistics ----
      #             # stats <- list(
      #             #     mean = mean(df$response, na.rm=TRUE),
      #             #     sd = sd(df$response, na.rm=TRUE),
      #             #     median = median(df$response, na.rm=TRUE),
      #             #     q1 = quantile(df$response, 0.25, na.rm=TRUE),
      #             #     q3 = quantile(df$response, 0.75, na.rm=TRUE)
      #             # )
      #
      #             # Add stats table ----
      #             # self$results$stats$addRow(rowKey=1, values=list(
      #             #     statistic = "Mean (SD)",
      #             #     value = sprintf("%.1f (%.1f)", stats$mean, stats$sd)
      #             # ))
      #             # self$results$stats$addRow(rowKey=2, values=list(
      #             #     statistic = "Median [IQR]",
      #             #     value = sprintf("%.1f [%.1f, %.1f]", stats$median, stats$q1, stats$q3)
      #             # ))
      #
      #
      #
      #             # Add to summary statistics ----
      #             # best_response <- data.frame(
      #             #     metric = c(
      #             #         "Best Overall Response Rate",
      #             #         "Duration of Response (median)",
      #             #         "Time to Response (median)"
      #             #     ),
      #             #     value = c(
      #             #         sprintf("%.1f%%", ORR),
      #             #         sprintf("%.1f months", median_duration),
      #             #         sprintf("%.1f months", median_time_to_response)
      #             #     )
      #             # )
      #
      #             # Modify category calculation to include clinical significance ----
      #             # df$clinicalSignificance <- case_when(
      #             #     df$response <= -100 ~ "Complete Response",
      #             #     df$response <= -30 ~ "Partial Response",
      #             #     df$response >= 20 ~ "Progressive Disease",
      #             #     df$response >= 0 ~ "Stable Disease (Growth)",
      #             #     df$response < 0 ~ "Stable Disease (Shrinkage)",
      #             #     TRUE ~ "Not Evaluable"
      #             # )
      #
      #
      #
      #
      #
      #
      #             # Add response category to data ----
      #             # if (self$options$addResponseCategory) {
      #             #     self$results$responseCategory$setRowNums(rownames(df))
      #             #     self$results$responseCategory$setValues(as.character(df$category))
      #             # }
      #
      #
      #             # checkDataQuality ----
      #             # checkDataQuality <- function(df) {
      #             #     issues <- list()
      #             #
      #             #     # Check for outliers
      #             #     q1 <- quantile(df$response, 0.25, na.rm=TRUE)
      #             #     q3 <- quantile(df$response, 0.75, na.rm=TRUE)
      #             #     iqr <- q3 - q1
      #             #     outliers <- df$response < (q1 - 1.5*iqr) | df$response > (q3 + 1.5*iqr)
      #             #
      #             #     if (any(outliers, na.rm=TRUE)) {
      #             #         issues$outliers <- which(outliers)
      #             #     }
      #             #
      #             #     # Check for missing values
      #             #     if (any(is.na(df$response))) {
      #             #         issues$missing <- which(is.na(df$response))
      #             #     }
      #             #
      #             #     return(issues)
      #             # }
      #











      #         # waterfall plot
      #         .waterfallplot = function(imageWaterfallPlot, ggtheme, theme, ...) {
      #
      #           if (!self$options$showWaterfallPlot) return()
      #
      #
      #             # get data ----
      #             plotData <- image$state
      #
      #             # df <- plotData$data
      #
      #             df <- plotData$data_waterfall  # Use waterfall format data
      #
      #
      #
      #             # Sort data ----
      #             if (plotData$sortBy == "response") {
      #                 df <- df[order(df$response, na.last = TRUE),]
      #             } else {
      #                 df <- df[order(df[[plotData$patientID]], na.last = TRUE),]
      #             }
      #
      #
      #             # Get color scheme from state ----
      #             colorScheme <- plotData$colorScheme
      #
      #
      #             # Ensure category is a factor with correct levels
      #             df$category <- factor(df$category,
      #                                   levels = c("CR", "PR", "SD", "PD", "NA"))
      #
      #             # Define color schemes
      #             recistColors <- c(
      #                 "CR" = "#0000FF",  # Blue
      #                 "PR" = "#4169E1",  # Royal Blue
      #                 "SD" = "#FFA500",  # Orange
      #                 "PD" = "#FF0000",  # Red
      #                 "NA" = "#808080"   # Gray
      #
      #                 # "CR" = "#0066CC",  # Strong blue
      #                 # "PR" = "#3399FF",  # Lighter blue
      #                 # "SD" = "#FFA500",  # Orange
      #                 # "PD" = "#CC0000",  # Bright red
      #                 # "NA" = "#CCCCCC"   # Light gray
      #
      #             )
      #
      #             simpleColors <- c(
      #                 "CR" = "#00AA00",  # Green
      #                 "PR" = "#00AA00",  # Green
      #                 "SD" = "#808080",  # Gray
      #                 "PD" = "#FF0000",  # Red
      #                 "NA" = "#808080"   # Gray
      #
      #                 # "CR" = "#00CC00",  # Bright green
      #                 # "PR" = "#00CC00",  # Same green for PR
      #                 # "SD" = "#888888",  # Medium gray
      #                 # "PD" = "#CC0000",  # Bright red
      #                 # "NA" = "#CCCCCC"   # Light gray
      #
      #             )
      #
      #             # Select color scheme based on option ----
      #             colors <- if (plotData$colorScheme == "simple") simpleColors else recistColors
      #
      #             # Create base plot ----
      #             p <- ggplot2::ggplot(df,
      #                                  ggplot2::aes(x = factor(seq_len(nrow(df))),
      #                                               y = response)) +
      #                 ggplot2::geom_bar(
      #                     stat = "identity",
      #                     ggplot2::aes(fill = category),  # Now category is a proper factor
      #                     # width = 0.7,
      #                     na.rm = FALSE,
      #                     width = plotData$barWidth,
      #                     alpha = plotData$barAlpha
      #                 ) +
      #                 ggplot2::scale_fill_manual(
      #                     name = "RECIST Response",
      #                     values = colors,
      #                     na.value = "#808080",
      #                     drop = FALSE
      #                 ) +
      #                 ggplot2::labs(
      #                     x = "Patients",
      #                     y = "Change in Tumor Size (%)"
      #                 )
      #
      #
      #             # Add RECIST thresholds if requested ----
      #
      #             if (plotData$showThresholds) {
      #                 p <- p +
      #                     ggplot2::geom_hline(
      #                         yintercept = 20,
      #                         linetype = "dashed",
      #                         color = "#FF0000",
      #                         alpha = 0.5
      #                     ) +
      #                     ggplot2::geom_hline(
      #                         yintercept = -30,
      #                         linetype = "dashed",
      #                         color = "#4169E1",
      #                         alpha = 0.5
      #                     ) +
      #
      #                     ggplot2::scale_y_continuous(
      #                         # Show only key values: min/max rounded to nearest 50, plus threshold lines
      #                         breaks = function(x) {
      #                             c(
      #                                 floor(min(x[1], na.rm = TRUE) / 50) * 50,  # Min rounded to 50
      #                                 -30,  # PR threshold
      #                                 0,    # Zero line
      #                                 20,   # PD threshold
      #                                 ceiling(max(x[2], na.rm = TRUE) / 50) * 50  # Max rounded to 50
      #                             )
      #                         }
      #                     )
      #
      #
      #                     # ggplot2::scale_y_continuous(
      #                     #     breaks = function(x) c(seq(floor(x[1]/10)*10,
      #                     #                                ceiling(x[2]/10)*10,
      #                     #                                by=10), -30, 20)
      #                     # )
      #             }
      #
      #
      #
      #
      #
      #
      #
      #             # Add labels for large changes if requested ----
      #
      #             if (plotData$labelOutliers) {
      #                 # Create labels vector safely
      #                 labels <- ifelse(!is.na(df$response) & abs(df$response) > 50,
      #                                  sprintf("%.1f%%", df$response),
      #                                  "")
      #
      #                 # Only add text if we have labels
      #                 if (any(labels != "")) {
      #                     p <- p +
      #                         ggplot2::geom_text(
      #                             data = df[labels != "",],  # Only plot points with labels
      #                             mapping = ggplot2::aes(
      #                                 x = factor(which(labels != "")),
      #                                 y = response
      #                             ),
      #                             label = labels[labels != ""],
      #                             vjust = ifelse(df$response[labels != ""] >= 0, -0.5, 1.5),
      #                             size = 3
      #                         )
      #                 }
      #             }
      #
      #
      #
      #             # Add watermark for median response if requested ----
      #
      #             if (plotData$showMedian) {
      #
      #
      #             p <- p +
      #                 ggplot2::geom_hline(
      #                     yintercept = median(df$response, na.rm=TRUE),
      #                     linetype = "dotted",
      #                     color = "darkgray"
      #                 ) +
      #                 ggplot2::annotate(
      #                     "text",
      #                     x = nrow(df),
      #                     y = median(df$response, na.rm=TRUE),
      #                     label = sprintf("Median: %.1f%%", median(df$response, na.rm=TRUE)),
      #                     hjust = 1,
      #                     vjust = -0.5,
      #                     size = 3
      #                 )
      #
      #
      #             }
      #
      #
      #
      #
      #             # Add confidence intervals if requested ----
      #             if (plotData$showCI) {
      #
      #             # Add confidence intervals if sample size sufficient
      #             if (nrow(df) >= 10) {
      #                 ci <- t.test(df$response)$conf.int
      #                 p <- p +
      #                     ggplot2::annotate(
      #                         "text",
      #                         x = 1,
      #                         y = max(df$response, na.rm=TRUE),
      #                         label = sprintf("95%% CI: [%.1f%%, %.1f%%]", ci[1], ci[2]),
      #                         hjust = 0,
      #                         vjust = -0.5,
      #                         size = 3
      #                     )
      #             }
      #
      #             }
      #
      #
      #
      #             # Add minResponseForLabel if requested ----
      #             # if (plotData$minResponseForLabel) {
      #             #
      #             # p <- p +
      #             #     ggplot2::geom_text(
      #             #         data = df,
      #             #         ggplot2::aes(
      #             #             text = sprintf(
      #             #                 "ID: %s\nResponse: %.1f%%\nCategory: %s",
      #             #                 df[[plotData$patientID]],
      #             #                 response,
      #             #                 category
      #             #             )
      #             #         ),
      #             #         na.rm = TRUE,
      #             #         size = 0
      #             #     )
      #             #
      #             #
      #             # }
      #
      #
      #
      #             # Add reference lines if requested ----
      #             # if (self$options$showReferenceLines) {
      #             #     p <- p +
      #             #         # Add reference line for mean
      #             #         ggplot2::geom_hline(
      #             #             yintercept = mean(df$response, na.rm=TRUE),
      #             #             linetype = "dotted",
      #             #             color = "darkgray",
      #             #             alpha = 0.5
      #             #         ) +
      #             #         # Add confidence interval band
      #             #         ggplot2::geom_ribbon(
      #             #             aes(ymin = mean - sd,
      #             #                 ymax = mean + sd),
      #             #             alpha = 0.1,
      #             #             fill = "gray"
      #             #         )
      #             # }
      #
      #
      #
      #
      #
      #             # Add jamovi theme if selected ----
      #
      #             if (colorScheme == "jamovi") {
      #                 p <- p +
      #                     ggtheme
      #             }
      #
      #
      #             # Add theme and formatting ----
      #
      #             p <- p +
      #                 # ggtheme +
      #                 ggplot2::theme(
      #                     axis.text.x = ggplot2::element_blank(),
      #                     axis.ticks.x = ggplot2::element_blank(),
      #                     panel.grid.major.x = ggplot2::element_blank(),
      #                     panel.grid.minor.x = ggplot2::element_blank(),
      #                     legend.position = "right"
      #                 )
      #
      #
      #
      #
      #             # Add plotly support for interactive features ----
      #             # if (self$options$interactive) {
      #             #     p <- plotly::ggplotly(p, tooltip = c("y", "fill")) %>%
      #             #         plotly::layout(
      #             #             hoverlabel = list(
      #             #                 bgcolor = "white",
      #             #                 font = list(family = "Arial", size = 12)
      #             #             )
      #             #         )
      #             # }
      #
      #
      #             # Return plot ----
      #
      #             print(p)
      #             TRUE
      #         }
      #

      # ,
      #
      #
      #
      #





      #         # spider plot
      #         # .spiderplot = function(imagespiderplot, ggtheme, theme, ...) {
      #
      #           if (is.null(self$options$timeVar) || !self$options$showSpiderPlot)
      #             return()
      #
      #           plotData <- image$state
      #           df <- plotData$data_spider  # Use spider format data
      #
      #
      #           # Prepare data
      #           df <- self$data
      #           responseVar <- self$options$responseVar
      #           timeVar <- self$options$timeVar
      #           patientVar <- self$options$patientID
      #
      #           # Convert to numeric
      #           df$response <- jmvcore::toNumeric(df[[responseVar]])
      #           df$time <- jmvcore::toNumeric(df[[timeVar]])
      #
      #           # Create spider plot
      #           p <- ggplot2::ggplot(df, ggplot2::aes(
      #             x = time,
      #             y = response,
      #             group = .data[[patientVar]],
      #             color = response <= -30
      #           )) +
      #             ggplot2::geom_line(size = 1) +
      #             ggplot2::geom_point(size = 2) +
      #             ggplot2::scale_color_manual(
      #               name = "Response",
      #               values = c("FALSE" = "#CC0000", "TRUE" = "#0066CC"),
      #               labels = c("Non-responder", "Responder")
      #             ) +
      #             ggplot2::geom_hline(
      #               yintercept = c(-30, 20),
      #               linetype = "dashed",
      #               color = "gray50",
      #               alpha = 0.5
      #             ) +
      #             ggplot2::labs(
      #               x = "Time",
      #               y = "Change in Tumor Size (%)",
      #               title = "Spider Plot of Tumor Response"
      #             ) +
      #             ggtheme +
      #             ggplot2::theme(
      #               legend.position = "right"
      #             )
      #
      #           print(p)
      #           TRUE
      #         # }



      # Spider plot function
      # .spiderplot = function(imagespider, ggtheme, theme, ...) {
      #   if (is.null(self$options$timeVar) || !self$options$showSpiderPlot)
      #     return()
      #
      #   plotData <- imagespider$state
      #   df <- plotData$data$spider
      #
      #   p <- ggplot2::ggplot(df, ggplot2::aes(
      #     x = .data[[plotData$options$timeVar]],
      #     y = response,
      #     group = .data[[plotData$options$patientID]],
      #     color = response <= -30
      #   )) +
      #     ggplot2::geom_line(size = 1) +
      #     ggplot2::geom_point(size = 2) +
      #     ggplot2::scale_color_manual(
      #       name = "Response",
      #       values = c("FALSE" = "#CC0000", "TRUE" = "#0066CC"),
      #       labels = c("Non-responder", "Responder")
      #     ) +
      #     ggplot2::geom_hline(
      #       yintercept = c(-30, 20),
      #       linetype = "dashed",
      #       color = "gray50",
      #       alpha = 0.5
      #     ) +
      #     ggplot2::labs(
      #       x = "Time",
      #       y = "Change in Tumor Size (%)",
      #       title = "Spider Plot of Tumor Response"
      #     ) +
      #     ggtheme +
      #     ggplot2::theme(
      #       legend.position = "right"
      #     )
      #
      #   print(p)
      #   TRUE
      # }



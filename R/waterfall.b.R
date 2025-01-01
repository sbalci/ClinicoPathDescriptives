#' @title Treatment Response Waterfall Plot
#' @importFrom R6 R6Class
#' @import jmvcore
#' @description Creates a waterfall plot to visualize tumor response data following RECIST criteria
#' @param data Data frame containing response data
#' @param patientID Column name for patient identifiers
#' @param response Column name for response values (percent change)
# @param timeVar Optional column name for time points
#' @return A list containing plot object and summary statistics

# @examples
# data <- data.frame(
#   PatientID = paste0("PT", 1:10),
#   Response = c(-100, -45, -30, -20, -10, 0, 10, 20, 30, 40),
#   Time = c(1,2,3,4,5,6,7,8,9,10)
# )
# waterfall(data, "PatientID", "Response", "Time")


waterfallClass <- if (requireNamespace('jmvcore')) R6::R6Class(
    "waterfallClass",
    inherit = waterfallBase,
    private = list(
        .run = function() {

            # TODO ----

            # if (is.null(self$options$patientID) || is.null(self$options$response)) {
                todo <- "
                <br>Welcome to ClinicoPath Treatment Response Analysis
                <br><br>
                This tool creates a waterfall plot to visualize tumor response data.
                <br>
                <b>- Patient ID:</b> Unique identifier for each patient <br>
                <b>- Response Value:</b> Percentage change in tumor size (negative values indicate shrinkage)
                <br><br>
                The plot follows RECIST criteria: <br>
                - Progressive Disease (PD): ≥20% increase <br>
                - Stable Disease (SD): -30% to +20% change <br>
                - Partial Response (PR): ≥30% decrease <br>
                - Complete Response (CR): -100% (complete disappearance) <br>
                <hr><br>

                <br>
                <b>TODO</b>
                <br>
                - More comprehensive statistical analysis<br>
                - Better data quality checks<br>
                - Interactive features<br>
                - Enhanced visualization options<br>
                - Better clinical relevance<br>
                - Improved documentation<br>
                - Export capabilities<br>
                - Longitudinal analysis support<br>

                - RECISTEvaluation:<br>
  - Target lesion measurements<br>
  - Response categorization<br>
  - Waterfall plots<br>
  - Spider plots for tumor size changes<br>
<br>
- TumorGrowthKinetics:<br>
  - Growth rate calculations<br>
  - Doubling time estimation<br>
  - Growth curves<br>
<br>
<br>
<br>
<br>
- PrognosticModeling:<br>
  - Risk score calculation<br>
  - Nomogram generation<br>
  - Calibration plots<br>
  - Decision curve analysis<br>
<br>
- StageReclassification:<br>
  - TNM staging calculator<br>
  - Stage migration analysis<br>
  - Stage-specific survival<br>
<br>
<br>


                <hr><br>
                "
                html <- self$results$todo
                html$setContent(todo)
            #     return()
            # } else {
            #     todo <- ""
            #     html <- self$results$todo
            #     html$setContent(todo)
            # }

                # Check Data ----
            if (nrow(self$data) == 0)
                stop('Data contains no (complete) rows')


            # Process data ----
            df <- self$data
            responseVar <- self$options$response
            df$response <- jmvcore::toNumeric(df[[responseVar]])

            # Calculate response categories including NA ----
            df$category <- factor(
                cut(df$response,
                    breaks = c(-Inf, -100, -30, 20, Inf),
                    labels = c("CR", "PR", "SD", "PD"),
                    right = TRUE),
                levels = c("CR", "PR", "SD", "PD", "NA")
            )

            # Create summary table with proper categories ----
            cats <- c("CR", "PR", "SD", "PD")
            summary_table <- data.frame(
                category = cats,
                n = sapply(cats, function(x) sum(df$category == x, na.rm = TRUE)),
                stringsAsFactors = FALSE
            )
            summary_table$percent <- round(summary_table$n / sum(!is.na(df$response)) * 100, 2)

            # Add results to summary table ----
            for(i in seq_len(nrow(summary_table))) {
                self$results$summary$addRow(rowKey=i, values=list(
                    category = summary_table$category[i],
                    n = summary_table$n[i],
                    percent = summary_table$percent[i]
                ))
            }

            # Calculate clinical metrics ----
            ORR <- round(
                (summary_table$n[summary_table$category %in% c("CR", "PR")] |> sum()) /
                    (summary_table$n |> sum()) * 100,
                1
            )

            DCR <- round(
                (summary_table$n[summary_table$category %in% c("CR", "PR", "SD")] |> sum()) /
                    (summary_table$n |> sum()) * 100,
                1
            )

            # Add results to clinical metrics table ----
            self$results$clinicalMetrics$addRow(rowKey=1, values=list(
                metric = "Objective Response Rate (CR+PR)",
                value = paste0(ORR, "%")
            ))

            self$results$clinicalMetrics$addRow(rowKey=2, values=list(
                metric = "Disease Control Rate (CR+PR+SD)",
                value = paste0(DCR, "%")
            ))





            # Calculate key statistics ----
            # stats <- list(
            #     mean = mean(df$response, na.rm=TRUE),
            #     sd = sd(df$response, na.rm=TRUE),
            #     median = median(df$response, na.rm=TRUE),
            #     q1 = quantile(df$response, 0.25, na.rm=TRUE),
            #     q3 = quantile(df$response, 0.75, na.rm=TRUE)
            # )

            # Add stats table ----
            # self$results$stats$addRow(rowKey=1, values=list(
            #     statistic = "Mean (SD)",
            #     value = sprintf("%.1f (%.1f)", stats$mean, stats$sd)
            # ))
            # self$results$stats$addRow(rowKey=2, values=list(
            #     statistic = "Median [IQR]",
            #     value = sprintf("%.1f [%.1f, %.1f]", stats$median, stats$q1, stats$q3)
            # ))



            # Add to summary statistics ----
            # best_response <- data.frame(
            #     metric = c(
            #         "Best Overall Response Rate",
            #         "Duration of Response (median)",
            #         "Time to Response (median)"
            #     ),
            #     value = c(
            #         sprintf("%.1f%%", ORR),
            #         sprintf("%.1f months", median_duration),
            #         sprintf("%.1f months", median_time_to_response)
            #     )
            # )

            # Modify category calculation to include clinical significance ----
            # df$clinicalSignificance <- case_when(
            #     df$response <= -100 ~ "Complete Response",
            #     df$response <= -30 ~ "Partial Response",
            #     df$response >= 20 ~ "Progressive Disease",
            #     df$response >= 0 ~ "Stable Disease (Growth)",
            #     df$response < 0 ~ "Stable Disease (Shrinkage)",
            #     TRUE ~ "Not Evaluable"
            # )






            # Add response category to data ----
            # if (self$options$addResponseCategory) {
            #     self$results$responseCategory$setRowNums(rownames(df))
            #     self$results$responseCategory$setValues(as.character(df$category))
            # }


            # checkDataQuality ----
            # checkDataQuality <- function(df) {
            #     issues <- list()
            #
            #     # Check for outliers
            #     q1 <- quantile(df$response, 0.25, na.rm=TRUE)
            #     q3 <- quantile(df$response, 0.75, na.rm=TRUE)
            #     iqr <- q3 - q1
            #     outliers <- df$response < (q1 - 1.5*iqr) | df$response > (q3 + 1.5*iqr)
            #
            #     if (any(outliers, na.rm=TRUE)) {
            #         issues$outliers <- which(outliers)
            #     }
            #
            #     # Check for missing values
            #     if (any(is.na(df$response))) {
            #         issues$missing <- which(is.na(df$response))
            #     }
            #
            #     return(issues)
            # }

            # mydataview ----

            self$results$mydataview$setContent(
                list(
                    "data" = head(df),
                    "patientID" = self$options$patientID,
                    "response" = self$options$response,
                    "sortBy" = self$options$sortBy,
                    "showThresholds" = self$options$showThresholds,
                    "labelOutliers" = self$options$labelOutliers,
                    "colorScheme" = self$options$colorScheme,
                    "summary" = summary_table,
                    "ORR" = ORR,
                    "DCR" = DCR,
                    "barWidth" = self$options$barWidth,
                    "barAlpha" = self$options$barAlpha,
                    "showMedian" = self$options$showMedian,
                    "showCI" = self$options$showCI,
                    "minResponseForLabel" = self$options$minResponseForLabel
                )
            )



            # Save data for plot ----
            plotData <- list(
                "data" = df,
                "patientID" = self$options$patientID,
                "response" = self$options$response,
                "sortBy" = self$options$sortBy,
                "showThresholds" = self$options$showThresholds,
                "labelOutliers" = self$options$labelOutliers,
                "colorScheme" = self$options$colorScheme,
                "barWidth" = self$options$barWidth,
                "barAlpha" = self$options$barAlpha,
                "showMedian" = self$options$showMedian,
                "showCI" = self$options$showCI,
                "minResponseForLabel" = self$options$minResponseForLabel
            )

            image <- self$results$plot
            image$setState(plotData)
        },

        # plot ----
        .plot = function(image, ggtheme, theme, ...) {

            # get data ----
            plotData <- image$state
            df <- plotData$data

            # Sort data ----
            if (plotData$sortBy == "response") {
                df <- df[order(df$response, na.last = TRUE),]
            } else {
                df <- df[order(df[[plotData$patientID]], na.last = TRUE),]
            }


            # Get color scheme from state ----
            colorScheme <- plotData$colorScheme


            # Ensure category is a factor with correct levels
            df$category <- factor(df$category,
                                  levels = c("CR", "PR", "SD", "PD", "NA"))

            # Define color schemes
            recistColors <- c(
                "CR" = "#0000FF",  # Blue
                "PR" = "#4169E1",  # Royal Blue
                "SD" = "#FFA500",  # Orange
                "PD" = "#FF0000",  # Red
                "NA" = "#808080"   # Gray

                # "CR" = "#0066CC",  # Strong blue
                # "PR" = "#3399FF",  # Lighter blue
                # "SD" = "#FFA500",  # Orange
                # "PD" = "#CC0000",  # Bright red
                # "NA" = "#CCCCCC"   # Light gray

            )

            simpleColors <- c(
                "CR" = "#00AA00",  # Green
                "PR" = "#00AA00",  # Green
                "SD" = "#808080",  # Gray
                "PD" = "#FF0000",  # Red
                "NA" = "#808080"   # Gray

                # "CR" = "#00CC00",  # Bright green
                # "PR" = "#00CC00",  # Same green for PR
                # "SD" = "#888888",  # Medium gray
                # "PD" = "#CC0000",  # Bright red
                # "NA" = "#CCCCCC"   # Light gray

            )

            # Select color scheme based on option ----
            colors <- if (plotData$colorScheme == "simple") simpleColors else recistColors

            # Create base plot ----
            p <- ggplot2::ggplot(df,
                                 ggplot2::aes(x = factor(seq_len(nrow(df))),
                                              y = response)) +
                ggplot2::geom_bar(
                    stat = "identity",
                    ggplot2::aes(fill = category),  # Now category is a proper factor
                    # width = 0.7,
                    na.rm = FALSE,
                    width = plotData$barWidth,
                    alpha = plotData$barAlpha
                ) +
                ggplot2::scale_fill_manual(
                    name = "RECIST Response",
                    values = colors,
                    na.value = "#808080",
                    drop = FALSE
                ) +
                ggplot2::labs(
                    x = "Patients",
                    y = "Change in Tumor Size (%)"
                )


            # Add RECIST thresholds if requested ----

            if (plotData$showThresholds) {
                p <- p +
                    ggplot2::geom_hline(
                        yintercept = 20,
                        linetype = "dashed",
                        color = "#FF0000",
                        alpha = 0.5
                    ) +
                    ggplot2::geom_hline(
                        yintercept = -30,
                        linetype = "dashed",
                        color = "#4169E1",
                        alpha = 0.5
                    ) +

                    ggplot2::scale_y_continuous(
                        # Show only key values: min/max rounded to nearest 50, plus threshold lines
                        breaks = function(x) {
                            c(
                                floor(min(x[1], na.rm = TRUE) / 50) * 50,  # Min rounded to 50
                                -30,  # PR threshold
                                0,    # Zero line
                                20,   # PD threshold
                                ceiling(max(x[2], na.rm = TRUE) / 50) * 50  # Max rounded to 50
                            )
                        }
                    )


                    # ggplot2::scale_y_continuous(
                    #     breaks = function(x) c(seq(floor(x[1]/10)*10,
                    #                                ceiling(x[2]/10)*10,
                    #                                by=10), -30, 20)
                    # )
            }







            # Add labels for large changes if requested ----

            if (plotData$labelOutliers) {
                # Create labels vector safely
                labels <- ifelse(!is.na(df$response) & abs(df$response) > 50,
                                 sprintf("%.1f%%", df$response),
                                 "")

                # Only add text if we have labels
                if (any(labels != "")) {
                    p <- p +
                        ggplot2::geom_text(
                            data = df[labels != "",],  # Only plot points with labels
                            mapping = ggplot2::aes(
                                x = factor(which(labels != "")),
                                y = response
                            ),
                            label = labels[labels != ""],
                            vjust = ifelse(df$response[labels != ""] >= 0, -0.5, 1.5),
                            size = 3
                        )
                }
            }



            # Add watermark for median response if requested ----

            if (plotData$showMedian) {


            p <- p +
                ggplot2::geom_hline(
                    yintercept = median(df$response, na.rm=TRUE),
                    linetype = "dotted",
                    color = "darkgray"
                ) +
                ggplot2::annotate(
                    "text",
                    x = nrow(df),
                    y = median(df$response, na.rm=TRUE),
                    label = sprintf("Median: %.1f%%", median(df$response, na.rm=TRUE)),
                    hjust = 1,
                    vjust = -0.5,
                    size = 3
                )


            }




            # Add confidence intervals if requested ----
            if (plotData$showCI) {

            # Add confidence intervals if sample size sufficient
            if (nrow(df) >= 10) {
                ci <- t.test(df$response)$conf.int
                p <- p +
                    ggplot2::annotate(
                        "text",
                        x = 1,
                        y = max(df$response, na.rm=TRUE),
                        label = sprintf("95%% CI: [%.1f%%, %.1f%%]", ci[1], ci[2]),
                        hjust = 0,
                        vjust = -0.5,
                        size = 3
                    )
            }

            }



            # Add minResponseForLabel if requested ----
            # if (plotData$minResponseForLabel) {
            #
            # p <- p +
            #     ggplot2::geom_text(
            #         data = df,
            #         ggplot2::aes(
            #             text = sprintf(
            #                 "ID: %s\nResponse: %.1f%%\nCategory: %s",
            #                 df[[plotData$patientID]],
            #                 response,
            #                 category
            #             )
            #         ),
            #         na.rm = TRUE,
            #         size = 0
            #     )
            #
            #
            # }



            # Add reference lines if requested ----
            # if (self$options$showReferenceLines) {
            #     p <- p +
            #         # Add reference line for mean
            #         ggplot2::geom_hline(
            #             yintercept = mean(df$response, na.rm=TRUE),
            #             linetype = "dotted",
            #             color = "darkgray",
            #             alpha = 0.5
            #         ) +
            #         # Add confidence interval band
            #         ggplot2::geom_ribbon(
            #             aes(ymin = mean - sd,
            #                 ymax = mean + sd),
            #             alpha = 0.1,
            #             fill = "gray"
            #         )
            # }





            # Add jamovi theme if selected ----

            if (colorScheme == "jamovi") {
                p <- p +
                    ggtheme
            }


            # Add theme and formatting ----

            p <- p +
                # ggtheme +
                ggplot2::theme(
                    axis.text.x = ggplot2::element_blank(),
                    axis.ticks.x = ggplot2::element_blank(),
                    panel.grid.major.x = ggplot2::element_blank(),
                    panel.grid.minor.x = ggplot2::element_blank(),
                    legend.position = "right"
                )




            # Add plotly support for interactive features ----
            # if (self$options$interactive) {
            #     p <- plotly::ggplotly(p, tooltip = c("y", "fill")) %>%
            #         plotly::layout(
            #             hoverlabel = list(
            #                 bgcolor = "white",
            #                 font = list(family = "Arial", size = 12)
            #             )
            #         )
            # }


            # Return plot ----

            print(p)
            TRUE
        }
    )
)

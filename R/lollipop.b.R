
# This file is a generated template, your changes will not be overwritten

lollipopClass <- if (requireNamespace('jmvcore')) R6::R6Class(
    "lollipopClass",
    inherit = lollipopBase,
    private = list(
        .run = function() {

            # `self$data` contains the data
            # `self$options` contains the options
            # `self$results` contains the results object (to populate)





            # plotData <- self$data

            # image <- self$results$plot
            # image$setState(plotData)




        }


        ,
        .plot = function(image, ggtheme, theme, ...) {


            # Error Message ----
            if ( (is.null(self$options$dep) || is.null(self$options$group)) )
                return()

            if (nrow(self$data) == 0) stop("Data contains no (complete) rows")


            # read data ----

            # plotData <- image$state


            plotData <- self$data

            group <- self$options$group
            dep <- self$options$dep

            plot <-
            plotData %>%
            ggcharts::lollipop_chart(x = group
                                     , y = dep
                                     # , threshold = 30
                                     )


            # plot <- plot + ggtheme

            print(plot)
            TRUE

        }

        )
)

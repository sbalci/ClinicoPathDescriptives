benfordClass <- if (requireNamespace('jmvcore')) R6::R6Class(
    "benfordClass",
    inherit = benfordBase,
    private = list(
        .run = function() {

            todo <- glue::glue("
                               <br>
                               See
                               <a href = 'https://github.com/carloscinelli/benford.analysis'>Package documentation</a> for interpratation.
                               ")

            self$results$todo$setContent(todo)

            # Error Message ----

            if ( is.null(self$options$var) )
                return()

            if (nrow(self$data) == 0) stop("Data contains no (complete) rows")

            # Read data ----

            mydata <- self$data

            # var <- self$options$var

            # var <- jmvcore::composeTerm(components = var)

            var <- jmvcore::constructFormula(terms = self$options$var)

            var <- jmvcore::toNumeric(mydata[[self$options$var]])

            bfd.cp <- benford.analysis::benford(data = var)

            self$results$text$setContent(bfd.cp)

            # Suspects ----

            suspects <- benford.analysis::getSuspects(bfd = bfd.cp, data = mydata)

            self$results$text2$setContent(suspects)

            # Prepare Data for Plot ----

            plotData <- bfd.cp

            # Data for plot ----

            image <- self$results$plot
            image$setState(plotData)

        },

        .plot = function(image, ggtheme, theme, ...) {

            # Error Message ----
            if ( is.null(self$options$var) )
                return()

            if (nrow(self$data) == 0) stop("Data contains no (complete) rows")

            # read data ----

            plotData <- image$state

            plot <- plot(plotData)

            print(plot)
            TRUE

        }

    )
)

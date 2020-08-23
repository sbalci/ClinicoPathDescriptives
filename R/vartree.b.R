#' @title Variable Tree
#'
#' @importFrom R6 R6Class
#' @import jmvcore

vartreeClass <- if (requireNamespace('jmvcore')) R6::R6Class(
    "vartreeClass",
    inherit = vartreeBase,
    private = list(
        .run = function() {


            if ( is.null(self$options$vars) ) {
                # ToDo Message ----
                todo <- "
                <br>Welcome to ClinicoPath Descriptives Module
                          <br><br>
                          This tool will help you form a Variable Tree.
                          "
                html <- self$results$todo
                html$setContent(todo)
                return()

            } else {
                todo <- ""
                html <- self$results$todo
                html$setContent(todo)

            }

            # Error Message ----

            if (nrow(self$data) == 0) stop("Data contains no (complete) rows")

            # Read Data ----

            mydata <- self$data


            # Read Arguments ----


            horizontal <- self$options$horizontal



            # Prepare Data ----

            mydata <- jmvcore::naOmit(mydata)


            # Prepare Formula ----

            formula <- jmvcore::constructFormula(terms = self$options$vars)

            myvars <- jmvcore::decomposeFormula(formula = formula)

            myvars <- unlist(myvars)

            mydata <- mydata %>%
                dplyr::select(myvars)

            myvars <- paste0(myvars, collapse = " ")


            # run vtree ----

            results <- vtree::vtree(z = mydata,
                                    vars = myvars,

                                    horiz = horizontal)

            # export as svg ----

            results <- DiagrammeRsvg::export_svg(gv = results)

            self$results$text1$setContent(print(results))

        }

        )
)

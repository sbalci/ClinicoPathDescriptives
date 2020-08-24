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
            sline <- self$options$sline
            mytitle <- self$options$mytitle


            # Prepare Data ----

            # Exclude NA ----

            excl <- self$options$excl

            if (excl) {mydata <- jmvcore::naOmit(mydata)}


            # Prepare Formula ----

            formula <- jmvcore::constructFormula(terms = self$options$vars)

            myvars <- jmvcore::decomposeFormula(formula = formula)

            myvars <- unlist(myvars)



            mydata1 <- mydata %>%
                dplyr::select(myvars)

            myvars <- paste0(myvars, collapse = " ")

            # run vtree ----
            results <- vtree::vtree(z = mydata1,
                                    vars = myvars,
                                    sameline = sline,
                                    title = mytitle,
                                    horiz = horizontal,
                                    # fillcolor = "white",
                                    # showvarinnode = ,
                                    # shownodelabels = ,
                                    showvarnames = self$options$varnames,
                                    showlegend = self$options$legend,
                                    showpct = self$options$pct,
                                    pxheight = self$options$hght,
                                    pxwidth = self$options$wdth
                                    )



            if ( !is.null(self$options$percvar) ) {

                percvar <- self$options$percvar

                # Prepare Formula ----

                formula2 <- jmvcore::constructFormula(terms = self$options$vars)

                myvars2 <- jmvcore::decomposeFormula(formula = formula2)

                myvars2 <- unlist(myvars2)

                myvars2 <- paste0(myvars2, collapse = " ")

                mydata2 <- mydata %>%
                    dplyr::select(myvars2, percvar)

                xsummary <- paste0(percvar,"=Yes \n%pct%")

                results <- vtree::vtree(z = mydata2,
                                        vars = myvars2,
                                        summary = xsummary,

                                        showlegend = TRUE)


            }




            # export as svg ----

            results <- DiagrammeRsvg::export_svg(gv = results)

            self$results$text1$setContent(print(results))

        }

        )
)

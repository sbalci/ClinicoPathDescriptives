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


            # Default Arguments ----
            xsummary <- ""



            # Exclude NA ----

            excl <- self$options$excl

            if (excl) {mydata <- jmvcore::naOmit(mydata)}

            # Prepare Data ----

            mydata <- jmvcore::select(df = mydata, columnNames = c(myvars, percvar))

            # Prepare Formula ----

            formula <- jmvcore::constructFormula(terms = self$options$vars)

            myvars <- jmvcore::decomposeFormula(formula = formula)

            myvars <- unlist(myvars)

            myvars <- paste0(myvars, collapse = " ")


                # myvars2 <- self$options$vars
                # myvars2 <- unlist(myvars2)
                #
                # myvars2 <- paste0(myvars2, collapse = " ")

            # Percentage Variable ----
            if ( !is.null(self$options$percvar) ) {
                percvar <- self$options$percvar
                xsummary <- paste0(percvar,"=", self$options$percvarLevel ,"\n%pct%")
            }



            # run vtree function ----

            results <- vtree(
                z = mydata,
                vars =myvars,
                sameline = sline,
                title = mytitle,
                horiz = horizontal,
                showvarnames = self$options$varnames,
                showlegend = self$options$legend,
                showpct = self$options$pct,
                # pxheight = self$options$hght,
                # pxwidth = self$options$wdth,
                # splitspaces = TRUE,
                # prune = list(),
                # prunebelow = list(),
                # keep = list(),
                # follow = list(),
                # prunelone = NULL,
                # pruneNA = FALSE,
                # prunesmaller = NULL,
                # labelnode = list(),
                # tlabelnode = NULL,
                # labelvar = NULL,
                # varminwidth = NULL,
                # varminheight = NULL,
                # varlabelloc = NULL,
                # fillcolor = "white",
                # fillcolor = NULL,
                # fillnodes = TRUE,
                # NAfillcolor = "white",
                # rootfillcolor = "#EFF3FF",
                # palette = NULL,
                # gradient = TRUE,
                # revgradient = FALSE,
                # singlecolor = 2,
                # colorvarlabels = TRUE,
                # title = "",
                # sameline = FALSE,
                # Venn = FALSE,
                # check.is.na = FALSE,
                # seq = FALSE,
                # pattern = FALSE,
                # ptable = FALSE,
                # showroot = TRUE,
                # text = list(),
                # ttext = list(),
                # plain = FALSE,
                # squeeze = 1,
                # showvarinnode = FALSE,
                # shownodelabels = TRUE,
                # showvarnames = TRUE,
                # showlevels = TRUE,
                # showpct = TRUE,
                # showlpct = TRUE,
                # showcount = TRUE,
                # showlegend = FALSE,
                # varnamepointsize = 18,
                # HTMLtext = FALSE,
                # digits = 0,
                # cdigits = 1,
                # splitwidth = 20,
                # lsplitwidth = 15,
                # getscript = FALSE,
                # nodesep = 0.5,
                # ranksep = 0.5,
                # margin = 0.2,
                # vp = TRUE,
                # horiz = TRUE,
                summary = xsummary,
                # runsummary = NULL,
                # retain = NULL,
                # width = NULL,
                # height = NULL,
                # graphattr = "",
                # nodeattr = "",
                # edgeattr = "",
                # color = c("blue", "forestgreen", "red", "orange", "pink"),
                # colornodes = FALSE,
                # mincount = 1,
                # maxcount,
                # showempty = FALSE,
                # rounded = TRUE,
                # nodefunc = NULL,
                # nodeargs = NULL,
                # choicechecklist = TRUE,
                # arrowhead = "normal",
                # pxwidth,
                # pxheight,
                # imagewidth,
                # imageheight,
                # folder,
                # pngknit = TRUE,
                # as.if.knit = FALSE,
                # maxNodes = 1000,
                # parent = 1,
                # last = 1,
                root = TRUE
            )



            # export as svg ----

            results <- DiagrammeRsvg::export_svg(gv = results)

            self$results$text1$setContent(print(results))

        }

        )
)

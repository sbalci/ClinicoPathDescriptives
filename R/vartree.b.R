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
            myvars <-  self$options$vars
            percvar <- self$options$percvar


            # Default Arguments ----
            xsplitspaces  <-  TRUE
            xprune <- list()
            xprunebelow <- list()
            xkeep <- list()
            xfollow <- list()
            xprunesmaller <- NULL
            xlabelnode <- list()
            xtlabelnode <- NULL
            xlabelvar <- NULL
            xvarminwidth <- NULL
            xvarminheight <- NULL
            xvarlabelloc <- NULL
            xfillcolor <- "white"
            xfillcolor <- NULL
            xfillnodes <- TRUE
            xNAfillcolor <- "white"
            xrootfillcolor <- "#EFF3FF"
            xpalette <- NULL
            xgradient <- TRUE
            xrevgradient <- FALSE
            xsinglecolor <- 2
            xcolorvarlabels <- TRUE
            xtitle <- ""
            xsameline <- FALSE
            xVenn <- FALSE
            xcheck.is.na <- FALSE
            xseq <- FALSE
            xpattern <- FALSE
            xptable <- FALSE
            xshowroot <- TRUE
            xtext <- list()
            xttext <- list()
            xplain <- FALSE
            xsqueeze <- 1
            xshowvarinnode <- FALSE
            xshownodelabels <- TRUE
            xshowvarnames <- TRUE
            xshowpct <- TRUE
            xshowlpct <- TRUE
            xshowcount <- TRUE
            xshowlegend <- FALSE
            xvarnamepointsize <- 18
            xHTMLtext <- FALSE
            xdigits <- 0
            xcdigits <- 1
            xsplitwidth <- 20
            xlsplitwidth <- 15
            xgetscript <- FALSE
            xnodesep <- 0.5
            xranksep <- 0.5
            xmargin <- 0.2
            xhoriz <- TRUE
            xsummary <- ""
            xrunsummary <- NULL
            xretain <- NULL
            xgraphattr <- ""
            xnodeattr <- ""
            xedgeattr <- ""
            xcolor <- c("blue", "forestgreen", "red", "orange", "pink")
            xcolornodes <- FALSE
            xmincount <- 1
            xmaxcount <- NULL
            xshowempty <- FALSE
            xrounded <- TRUE
            xnodefunc <- NULL
            xnodeargs <- NULL
            xchoicechecklist <- TRUE
            xarrowhead <- "normal"
            xfolder <- NULL
            xpngknit <- TRUE
            xas.if.knit <- FALSE
            xmaxNodes <- 1000
            xparent <- 1
            xlast <- 1
            xroot <- TRUE


            # Exclude NA ----

            excl <- self$options$excl

            if (excl) {mydata <- jmvcore::naOmit(mydata)}

            # Prepare Data ----

            mydata <- jmvcore::select(df = mydata, columnNames = c(myvars, percvar))

            # Prepare Formula ----

            formula <- jmvcore::constructFormula(terms = self$options$vars)

            myvars1 <- jmvcore::decomposeFormula(formula = formula)

            myvars1 <- unlist(myvars1)

            myvars1 <- paste0(myvars1, collapse = " ")


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

            results <- vtree::vtree(
                z = mydata,
                vars = myvars1,
                sameline = sline,
                title = mytitle,
                horiz = horizontal,
                showvarnames = self$options$varnames,
                showlegend = self$options$legend,
                showpct = self$options$pct,
                splitspaces = xsplitspaces,
                # prune = list(),
                # prunebelow = list(),
                # keep = list(),
                # follow = list(),
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
                vp = self$options$vp,
                # horiz = TRUE,
                summary = xsummary,
                # runsummary = NULL,
                # retain = NULL,
                width = self$options$width,
                height = self$options$height,
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
                # folder,
                # pngknit = TRUE,
                # as.if.knit = FALSE,
                # maxNodes = 1000,
                # parent = 1,
                # last = 1,
                root = xroot
            )



            # export as svg ----

            results <- DiagrammeRsvg::export_svg(gv = results)

            self$results$text1$setContent(print(results))

        }

        )
)

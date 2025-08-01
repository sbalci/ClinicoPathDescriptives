
# This file is automatically generated, you probably don't want to edit this

crosstableOptions <- if (requireNamespace("jmvcore", quietly=TRUE)) R6::R6Class(
    "crosstableOptions",
    inherit = jmvcore::Options,
    public = list(
        initialize = function(
            vars = NULL,
            group = NULL,
            sty = "nejm",
            excl = FALSE,
            cont = "mean",
            pcat = "chisq", ...) {

            super$initialize(
                package="ClinicoPathDescriptives",
                name="crosstable",
                requiresData=TRUE,
                ...)

            private$..vars <- jmvcore::OptionVariables$new(
                "vars",
                vars)
            private$..group <- jmvcore::OptionVariable$new(
                "group",
                group,
                suggested=list(
                    "ordinal",
                    "nominal"),
                permitted=list(
                    "factor"))
            private$..sty <- jmvcore::OptionList$new(
                "sty",
                sty,
                options=list(
                    "arsenal",
                    "finalfit",
                    "gtsummary",
                    "nejm",
                    "lancet",
                    "hmisc"),
                default="nejm")
            private$..excl <- jmvcore::OptionBool$new(
                "excl",
                excl,
                default=FALSE)
            private$..cont <- jmvcore::OptionList$new(
                "cont",
                cont,
                options=list(
                    "mean",
                    "median"),
                default="mean")
            private$..pcat <- jmvcore::OptionList$new(
                "pcat",
                pcat,
                options=list(
                    "chisq",
                    "fisher"),
                default="chisq")

            self$.addOption(private$..vars)
            self$.addOption(private$..group)
            self$.addOption(private$..sty)
            self$.addOption(private$..excl)
            self$.addOption(private$..cont)
            self$.addOption(private$..pcat)
        }),
    active = list(
        vars = function() private$..vars$value,
        group = function() private$..group$value,
        sty = function() private$..sty$value,
        excl = function() private$..excl$value,
        cont = function() private$..cont$value,
        pcat = function() private$..pcat$value),
    private = list(
        ..vars = NA,
        ..group = NA,
        ..sty = NA,
        ..excl = NA,
        ..cont = NA,
        ..pcat = NA)
)

crosstableResults <- if (requireNamespace("jmvcore", quietly=TRUE)) R6::R6Class(
    "crosstableResults",
    inherit = jmvcore::Group,
    active = list(
        subtitle = function() private$.items[["subtitle"]],
        todo = function() private$.items[["todo"]],
        todo2 = function() private$.items[["todo2"]],
        tablestyle1 = function() private$.items[["tablestyle1"]],
        tablestyle2 = function() private$.items[["tablestyle2"]],
        tablestyle3 = function() private$.items[["tablestyle3"]],
        tablestyle4 = function() private$.items[["tablestyle4"]],
        qvalueExplanation = function() private$.items[["qvalueExplanation"]],
        testInformation = function() private$.items[["testInformation"]]),
    private = list(),
    public=list(
        initialize=function(options) {
            super$initialize(
                options=options,
                name="",
                title="Cross Table",
                refs=list(
                    "ClinicoPathJamoviModule"))
            self$add(jmvcore::Preformatted$new(
                options=options,
                name="subtitle",
                title="`Cross Table - ${group}`"))
            self$add(jmvcore::Html$new(
                options=options,
                name="todo",
                title="To Do",
                clearWith=list(
                    "vars",
                    "group",
                    "sty")))
            self$add(jmvcore::Html$new(
                options=options,
                name="todo2",
                title="To Do",
                clearWith=list(
                    "vars",
                    "group",
                    "sty")))
            self$add(jmvcore::Html$new(
                options=options,
                name="tablestyle1",
                title="`Cross Table - ${group}`",
                clearWith=list(
                    "vars",
                    "group",
                    "sty"),
                visible="(sty:arsenal)",
                refs="arsenal"))
            self$add(jmvcore::Html$new(
                options=options,
                name="tablestyle2",
                title="`Cross Table - ${group}`",
                clearWith=list(
                    "vars",
                    "group",
                    "cont",
                    "pcat",
                    "sty"),
                visible="(sty:finalfit)",
                refs="finalfit"))
            self$add(jmvcore::Html$new(
                options=options,
                name="tablestyle3",
                title="`Cross Table - ${group}`",
                clearWith=list(
                    "vars",
                    "group",
                    "sty"),
                visible="(sty:gtsummary)",
                refs="gtsummary"))
            self$add(jmvcore::Html$new(
                options=options,
                name="tablestyle4",
                title="`Cross Table - ${group}`",
                clearWith=list(
                    "vars",
                    "group",
                    "sty"),
                visible="(sty:nejm || sty:lancet || sty:hmisc)",
                refs="tangram"))
            self$add(jmvcore::Html$new(
                options=options,
                name="qvalueExplanation",
                title="Q-value Explanation",
                clearWith=list(
                    "vars",
                    "group",
                    "sty"),
                visible="(sty:gtsummary)"))
            self$add(jmvcore::Html$new(
                options=options,
                name="testInformation",
                title="Q-value Information",
                clearWith=list(
                    "vars",
                    "group",
                    "sty"),
                visible="(sty:gtsummary)"))}))

crosstableBase <- if (requireNamespace("jmvcore", quietly=TRUE)) R6::R6Class(
    "crosstableBase",
    inherit = jmvcore::Analysis,
    public = list(
        initialize = function(options, data=NULL, datasetId="", analysisId="", revision=0) {
            super$initialize(
                package = "ClinicoPathDescriptives",
                name = "crosstable",
                version = c(0,0,3),
                options = options,
                results = crosstableResults$new(options=options),
                data = data,
                datasetId = datasetId,
                analysisId = analysisId,
                revision = revision,
                pause = NULL,
                completeWhenFilled = FALSE,
                requiresMissings = FALSE,
                weightsSupport = 'auto')
        }))

#' Cross Tables
#'
#' Function for making Cross Tables.
#'
#' @examples
#' \donttest{
#' # Example usage:
#' # dat <- as.data.frame(your_data)
#' # ClinicoPathDescriptives::crosstable(
#' #   data = dat,
#' #   vars = vars(YourRowVariable),
#' #   group = "YourGroupingVariable",
#' #   sty = "finalfit",
#' #   excl = TRUE,
#' #   cont = "mean",
#' #   pcat = "chisq",
#' #   exportCSV = TRUE
#' # )
#'}
#' @param data The data as a data frame.
#' @param vars The variable(s) that will appear as rows in the cross table.
#' @param group The variable that will appear as columns (groups) in the
#'   table.
#' @param sty .
#' @param excl Exclude rows with missing values.
#' @param cont .
#' @param pcat .
#' @return A results object containing:
#' \tabular{llllll}{
#'   \code{results$subtitle} \tab \tab \tab \tab \tab a preformatted \cr
#'   \code{results$todo} \tab \tab \tab \tab \tab a html \cr
#'   \code{results$todo2} \tab \tab \tab \tab \tab a html \cr
#'   \code{results$tablestyle1} \tab \tab \tab \tab \tab a html \cr
#'   \code{results$tablestyle2} \tab \tab \tab \tab \tab a html \cr
#'   \code{results$tablestyle3} \tab \tab \tab \tab \tab a html \cr
#'   \code{results$tablestyle4} \tab \tab \tab \tab \tab a html \cr
#'   \code{results$qvalueExplanation} \tab \tab \tab \tab \tab a html \cr
#'   \code{results$testInformation} \tab \tab \tab \tab \tab a html \cr
#' }
#'
#' @export
crosstable <- function(
    data,
    vars,
    group,
    sty = "nejm",
    excl = FALSE,
    cont = "mean",
    pcat = "chisq") {

    if ( ! requireNamespace("jmvcore", quietly=TRUE))
        stop("crosstable requires jmvcore to be installed (restart may be required)")

    if ( ! missing(vars)) vars <- jmvcore::resolveQuo(jmvcore::enquo(vars))
    if ( ! missing(group)) group <- jmvcore::resolveQuo(jmvcore::enquo(group))
    if (missing(data))
        data <- jmvcore::marshalData(
            parent.frame(),
            `if`( ! missing(vars), vars, NULL),
            `if`( ! missing(group), group, NULL))

    for (v in group) if (v %in% names(data)) data[[v]] <- as.factor(data[[v]])

    options <- crosstableOptions$new(
        vars = vars,
        group = group,
        sty = sty,
        excl = excl,
        cont = cont,
        pcat = pcat)

    analysis <- crosstableClass$new(
        options = options,
        data = data)

    analysis$run()

    analysis$results
}


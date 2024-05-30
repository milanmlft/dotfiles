# set default CRAN mirror
options(repos = c(CRAN = "https://cloud.r-project.org"))

# enable autocompletions for package names in
# `require()`, `library()`
utils::rc.settings(ipck = TRUE)

# disable fancy quotes
options(useFancyQuotes = FALSE)

# set width
options(width = 120)

# set Ncpus for install.packages()
options(Ncpus = 4L)

# set custom options for package dev
options(
  usethis.full_name = "Milan Malfait",
  usethis.description = list(
    `Authors@R` = 'person("Milan", "Malfait",
    email = "milan.malfait94@gmail.com", role = c("aut", "cre"),
    comment = c(ORCID = "0000-0001-9144-3701"))',
    Version = "0.0.1"
  ),
  usethis.protocol = "ssh"
)

# Options for reprex
options(
  reprex.advertise = FALSE,
  reprex.session_info = TRUE,
  reprex.style = TRUE
)

# Read global .Renviron file, if it exists
if (file.exists("~/.Renviron")) {
  readRenviron("~/.Renviron")
}

# Return error for if statements with length(condition) > 1
# See https://adv-r.hadley.nz/control-flow.html 5.2.1
Sys.setenv("_R_CHECK_LENGTH_1_CONDITION_" = "true")

# Settings for interactive sessions only
if (interactive()) {
  # load devtools in interactive session
  suppressMessages(require(devtools))
  suppressMessages(require(usethis))
  suppressMessages(require(pak))

  # print max. 100 lines
  options(max.print = 100)
  # warn about partial matching with `$`
  # (see https://adv-r.hadley.nz/subsetting.html#section-1)
  # also https://kevinushey.github.io/blog/2015/02/02/rprofile-essentials/
  options(
    warnPartialMatchDollar = TRUE,
    warnPartialMatchAttr = TRUE,
    warnPartialMatchArgs = TRUE
  )
  options(styler.cache_root = "styler_perm")

  if (length(.libPaths()) > 1) {
    msg <- "Using libraries at paths:\n"
  } else {
    msg <- "Using library at path:\n"
  }
  libs <- paste("-", .libPaths(), collapse = "\n")
  message(msg, libs, sep = "")

  # Check and print BioC version
  if (requireNamespace("BiocManager", quietly = TRUE)) {
    bioc_devel <- BiocManager:::isDevel()
    msg <- paste("Using Bioconductor", BiocManager::version())
    if (bioc_devel) msg <- paste(msg, "(devel)")
    message(msg)
  }
  ## Clean up
  rm(list = ls())
}


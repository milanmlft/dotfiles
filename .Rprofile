# set default CRAN mirror
options(repos = c(CRAN = "https://cran.rstudio.org"))

# warn about partial matching with `$`
# (see https://adv-r.hadley.nz/subsetting.html#section-1)
# also https://kevinushey.github.io/blog/2015/02/02/rprofile-essentials/
options(
	warnPartialMatchDollar = TRUE,
	warnPartialMatchAttr = TRUE,
  warnPartialMatchArgs = TRUE
)

# enable autocompletions for package names in
# `require()`, `library()`
utils::rc.settings(ipck = TRUE)

# disable fancy quotes
options(useFancyQuotes = FALSE)

# load devtools in interactive session
if (interactive()) {
  suppressMessages(require(devtools))
  # print max. 100 lines
  options(max.print = 100)
  # set width
  options(width = 120)
  # # enable colored output
  # this is messing up chunk outputs in RMarkdown files
  # would be better to only enable this in terminal environments
  # suppressMessages(require(colorout))
}

# set custom options for package dev
options(
  usethis.full_name = "Milan Malfait",
  usethis.description = list(
    `Authors@R` = 'person("Milan", "Malfait",
    email = "milan.malfait94@gmail.com", role = c("aut", "cre"),
    comment = c(ORCID = "0000-0001-9144-3701"))',
    Version = "0.0.0.9000"
  ),
  usethis.protocol  = "ssh"
)

# Read global .Renviron file, if it exists
if (file.exists("~/.Renviron")) {
  readRenviron("~/.Renviron")
}

# print .libPaths()
if (length(.libPaths()) > 1) {
  msg <- "Using libraries at paths:\n"
} else {
  msg <- "Using library at path:\n"
}
libs <- paste("-", .libPaths(), collapse = "\n")
message(msg, libs, sep = "")

# Return error for if statements with length(condition) > 1
# See https://adv-r.hadley.nz/control-flow.html 5.2.1
Sys.setenv("_R_CHECK_LENGTH_1_CONDITION_" = "true")


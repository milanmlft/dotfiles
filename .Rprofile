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
  usethis.protocol  = "ssh"
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

# Options for pak: set correct Bioc version
# Sys.setenv("R_BIOC_VERSION" = "3.16")

## Set GITHUB_PAT
credentials::set_github_pat()

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
  # options(styler.addins_style_transformer = "biocthis::bioc_style()")
  options(styler.cache_root = "styler_perm")

  # print .libPaths()
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
      # if (!bioc_devel) {
      #    message(
      #        "Activate Bioc-devel with\n",
      #        "  .libPaths('~/Library/R/x86_64/4.1-Bioc-devel/library/')"
      #    )
      # }
  }
  ## Clean up
  rm(list = ls())
}

# LanguageServer Setup Start (do not change this chunk)
# to remove this, run languageserversetup::remove_from_rprofile
if (requireNamespace("languageserversetup", quietly = TRUE)) {
  options(langserver_library = "/Users/milan/Library/R/languageserver-library")
  languageserversetup::languageserver_startup(strictLibrary = FALSE)
  unloadNamespace("languageserversetup")
}
# LanguageServer Setup End

# From https://github.com/REditorSupport/vscode-R/wiki/Interacting-with-R-terminals
if (interactive() && Sys.getenv("TERM_PROGRAM") == "vscode") {

  # https://github.com/REditorSupport/vscode-R/wiki/Plot-viewer#svg-in-httpgd-webpage
  if ("httpgd" %in% .packages(all.available = TRUE)) {
    options(vsc.plot = FALSE)
    options(device = function(...) {
      httpgd::hgd(silent = TRUE)
      .vsc.browser(httpgd::hgd_url(history = FALSE), viewer = "Beside")
    })
    options(vsc.use_httpgd = TRUE)
  }

	vscodeR_init <- file.path(Sys.getenv(if (.Platform$OS.type == "windows") "USERPROFILE" else "HOME"), ".vscode-R", "init.R")
	if (file.exists(vscodeR_init)) { # nolint
			source(vscodeR_init)
	}
	## Clean up
	rm(vscodeR_init)
}


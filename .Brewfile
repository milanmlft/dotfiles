# ~/.Brewfile — hand-curated, the source of truth for this Mac.
#
#   brew bundle upgrade --file ~/.Brewfile          # install and upgrade what's listed
#   brew bundle check --verbose --file ~/.Brewfile  # anything missing?
#   brew bundle cleanup --file ~/.Brewfile          # preview what isn't listed
#   brew bundle cleanup --file ~/.Brewfile --force  # ...and remove it
#
# Rules: list only what you'd reinstall on a fresh machine; no dependencies

# ---- Taps --------------------------------------------------------------
tap "anomalyco/tap"                           # opencode
tap "hashicorp/tap", trusted: true
tap "nikitabobko/tap", trusted: true          # aerospace
tap "terraform-linters/tap"

# ---- Shell & terminal --------------------------------------------------
brew "zsh"
brew "starship"
brew "zellij"
brew "fzf"
brew "zoxide"
brew "direnv"
brew "eza"
brew "bat"
brew "fd"
brew "ripgrep"
brew "dust"
brew "btop"
brew "fastfetch"
brew "glow"
brew "tldr"
brew "hwatch"
brew "watch"
brew "tree"
brew "jq"
brew "yq"
brew "httpie"
brew "wget"
brew "coreutils"                              # GNU tools on PATH (paths.zsh)
brew "gnu-sed"
brew "yadm"
brew "topgrade"
cask "ghostty"
cask "aerospace"
cask "raycast"
cask "hiddenbar"
cask "flycut"

# ---- Editors & git -----------------------------------------------------
brew "neovim"
brew "git"
brew "git-lfs"
brew "git-delta"
brew "lazygit"
brew "gh"
brew "act"                                    # run GitHub Actions locally
brew "prek"                                   # pre-commit hooks
brew "gitmoji"
brew "typos-cli"
brew "ast-grep"
brew "detect-secrets"
brew "marksman"                               # markdown LSP
brew "prettier"
brew "stylua"
cask "zed"
cask "claude"
cask "claude-code@latest"
brew "anomalyco/tap/opencode", trusted: true

# ---- Secrets & crypto --------------------------------------------------
brew "age"
brew "sops"
brew "gnupg"                                  # drop with pinentry* if you move to SSH signing
brew "pinentry-mac"
brew "pass"
brew "bitwarden-cli"

# ---- Cloud & infrastructure --------------------------------------------
brew "awscli"
brew "hashicorp/tap/terraform", trusted: true
brew "hashicorp/tap/packer", trusted: true
brew "opentofu"
brew "terragrunt"
brew "terraform-docs"
brew "tfupdate"
cask "terraform-linters/tap/tflint", trusted: true
brew "ansible"
brew "ansible-lint"
brew "rclone"
brew "watchman"

# ---- Kubernetes --------------------------------------------------------
brew "kubectl"
brew "helm"
brew "k9s"
brew "k3d"
brew "cilium-cli"

# ---- Containers --------------------------------------------------------
cask "docker-desktop"                         # bundles docker, compose, buildx
brew "hadolint"
# brew "podman"
# brew "podman-compose"

# ---- Python ------------------------------------------------------------
brew "uv"
brew "ruff"
brew "ty"
uv "ipython"
uv "pytest"
uv "cookiecutter"
uv "cmakelint"
uv "playwright"

# ---- Go ----------------------------------------------------------------
# Toolchain versions: set `toolchain` in go.mod instead of golang.org/dl/*.
# gopls, dlv, gofumpt, gomodifytags, impl are also installed by LazyVim's Mason;
# keep them here only if you use them outside nvim.
brew "go"
brew "golangci-lint"
brew "govulncheck"
go "golang.org/x/tools/gopls"
go "github.com/go-delve/delve/cmd/dlv"
go "mvdan.cc/gofumpt"
go "github.com/incu6us/goimports-reviser/v3"
go "github.com/segmentio/golines"
go "github.com/fatih/gomodifytags"
go "github.com/josharian/impl"
go "github.com/koron/iferr"
go "github.com/cweill/gotests/gotests"
go "github.com/securego/gosec/v2/cmd/gosec"
go "honnef.co/go/tools/cmd/staticcheck"
go "github.com/air-verse/air"
go "github.com/spf13/cobra-cli"
go "github.com/oapi-codegen/oapi-codegen/v2/cmd/oapi-codegen"
go "github.com/dependabot/cli/cmd/dependabot"
go "github.com/nao1215/gup"                   # updates the go-installed tools

# ---- Rust --------------------------------------------------------------
cargo "cargo-update"
cargo "cargo-cache"
cargo "neocmakelsp"

# ---- C / C++ -----------------------------------------------------------
brew "llvm", link: true                       # clang/clangd, used by paths.zsh
brew "gcc"
brew "cmake"
brew "ccache"
brew "catch2"
brew "cppcheck"

# ---- R -----------------------------------------------------------------
brew "R"
# Needed to compile common R packages from source:
brew "gsl"
brew "jags"
brew "libxml2"
brew "openblas"
cask "rstudio"

# ---- Docs & publishing -------------------------------------------------
brew "pandoc"
brew "graphviz"
brew "imagemagick"

# ---- Node --------------------------------------------------------------
brew "bun"
brew "node"
npm "@ansible/ansible-language-server"
npm "@earendil-works/pi-coding-agent"
npm "@getgrit/cli"

# ---- Misc CLI ----------------------------------------------------------
brew "hyperfine"
brew "tokei"
brew "hunk"
brew "viu"

# ---- Apps --------------------------------------------------------------
cask "firefox"
cask "zen"
cask "obsidian"
cask "slack"
cask "spotify"
cask "postman"
cask "libreoffice"
cask "gimp"
cask "inkscape"
cask "keycastr"
cask "nordvpn"

# ---- Fonts -------------------------------------------------------------
cask "font-hack-nerd-font"                    # Ghostty
cask "font-jetbrains-mono-nerd-font"

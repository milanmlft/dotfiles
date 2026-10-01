# My dotfiles

My dotfiles, managed by [yadm](https://github.com/TheLocehiliosan/yadm).

## Set up instructions

1. [Install yadm](https://yadm.io/docs/install)
2. Run

   ```sh
   yadm clone git@github.com:milanmlft/dotfiles.git
   ```

3. Source shell with

   ```sh
   exec zsh
   ```

4. Start a session: `zj` (fuzzy project picker) or plain `zellij`. Prefix is `Alt a`; see the cheat
   sheet at the top of [`config.kdl`](.config/zellij/config.kdl).
5. Enjoy!

## Keeping the `Brewfile` up-to-date

The [`Brewfile`](./.Brewfile) is a manually curated list of [Homebrew](https://brew.sh/) formulae
and casks for tools that I want installed on a fresh machine install.

The following commands are useful to manage this file:

```zsh
brew bundle upgrade --file ~/.Brewfile          # install and upgrade what's listed
brew bundle check --verbose --file ~/.Brewfile  # anything missing?
brew bundle cleanup --file ~/.Brewfile          # preview what isn't listed
brew bundle cleanup --file ~/.Brewfile --force  # ...and remove it
```

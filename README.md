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

4. Start a session: `zj` (fuzzy project picker) or plain `zellij`. Prefix is `Alt a`; see the cheat sheet at the top of [`config.kdl`](.config/zellij/config.kdl).
5. Enjoy!

## Updating the `Brewfile`

To keep the [`Brewfile`](./.Brewfile) up to date with the currently installed brews, regularly run the [update script](./bin/brupdate.sh) (topgrade also runs it after every upgrade):

```sh
brupdate.sh
```

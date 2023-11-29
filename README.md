# My dotfiles

My dotfiles, managed by [yadm](https://github.com/TheLocehiliosan/yadm).

## Set up instructions

1. [Install yadm](https://yadm.io/docs/install)
2. Run

    ```sh
    yadm clone git@github.com:milanmlft/dotfiles.git`
    ```

3. Source shell with 

    ```sh
    exec zsh`
    ```

3. Enjoy!

## Updating the `Brewfile`

To keep the [`Brewfile`](./.Brewfile) up to date with the currently installed brews, regularly run the [update script](./.config/homebrew/update.sh):

```sh
.config/homebrew/update.sh
```

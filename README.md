# Sway Dotfiles

![Mar19_170212](https://github.com/aruyu/sway-dotfiles/assets/75081360/56448347-403a-403f-b0b3-7351b7e2fda2)

![Mar19_150743](https://github.com/aruyu/sway-dotfiles/assets/75081360/e91ce484-5779-4bc0-b5d6-41596f500836)

Custom dotfiles for SwayFx Compositor for wayland with ZSH.

## Installation

> I highly recommend to use ***'rsync'*** for installation.

<details>
<summary><b>Install with rsync</b></summary>

#### Clone the repository to *'~/Documents'* and install with rsync.

```bash
git clone https://github.com/aruyu/sway-dotfiles.git ~/Documents/sway-dotfiles/
```

> Use rsync to sync the dotfiles.

```bash
rsync -avxHAXP --exclude={'.git*','tools','LICENSE','*.md'} ~/Documents/sway-dotfiles/. ~/
```

> Run *'install.sh'* to install essentials.

``` bash
bash ~/Documents/sway-dotfiles/tools/install_themes.sh
bash ~/Documents/sway-dotfiles/tools/install_zsh.sh
```

</details>

<details>
<summary><b>Direct installation</b></summary>

#### Clone the repository to *'~/.config'* directly.

```bash
git clone https://github.com/aruyu/sway-dotfiles.git ~/Downloads/sway-dotfiles/
cp -rf ~/Downloads/sway-dotfiles/.* ~/
```

> Run *'install.sh'* to install essentials.

```bash
bash ~/Downloads/sway-dotfiles/tools/install_themes.sh
bash ~/Downloads/sway-dotfiles/tools/install_zsh.sh
```

</details>

## *'install.sh'* script

Type one of belows.

- Arch
- Ubuntu
- Mac
- Font (*'JetBrainsMono NerdFont'* fonts installation)

## Issues

**NOTE:** If you have some problems with *'nwgbar'*, you have to change directory in *'exec'* key.

> **~/.config/nwg-launchers/nwgbar/bar.json**.

```json
  {
    "name": "...",
    "exec": "$HOME/.config/...",
    "icon": "..."
  }
```

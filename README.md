#  Dotfiles And Setup

# Installation

```bash
    git clone git@github.com:ru4en/.dotfiles.git
    cd .dotfiles
    ./setup.sh
```

## Dependencies

### Ubuntu Dependencies
```
    sudo apt-get install git zsh vim tmux curl cmake build-essential python3-dev
```

### Fedora Dependencies
```bash
    sudo dnf install git zsh vim tmux curl cmake gcc-c++ make python3-devel
```

## Scripts
- [auto-logout-key](https://github.com/ru4en/.dotfiles/tree/main/scripts/auto-logout-key)

## Setup

## Git

```bash
    git config --global user.name "Ruben Lopes"
    git config --global user.email "ru4en@pm.me"
    git config --global core.editor "vim"
    git config --global pull.rebase "true"
```

### Generate SSH Key for Github

```bash
    ssh-keygen -t rsa -b 4096 -C "ru4en@pm.me"
```

### Add to github

```bash
    cat ~/.ssh/id_rsa.pub
```
go to [github](https://github.com/settings/keys) and add the key.

## Nvidia Graphics Settings

Use [EnvyControl](https://github.com/bayasdev/envycontrol) for fixing graphics ishues such as screen tairing.


- Enable the repository with `sudo dnf copr enable sunwire/envycontrol`
- `sudo dnf install python3-envycontrol`

Set graphics mode to nvidia, enable ForceCompositionPipeline and Coolbits with a value of 24:
```
sudo envycontrol -s nvidia --force-comp --coolbits 24
```


## Gnome Extensions

- [Resource Monitor](https://extensions.gnome.org/extension/1634/resource-monitor/)
- [System Stats Plus](https://extensions.gnome.org/extension/6502/systemstatsplus/)
- [move-clock](https://extensions.gnome.org/extension/2/move-clock/)

## Firefox Extensions
- [Vimium](https://addons.mozilla.org/en-US/firefox/addon/vimium-ff/)
- [uBlock Origin](https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/)
- [Bitwarden](https://addons.mozilla.org/en-US/firefox/addon/bitwarden-password-manager/)
- [Gnome Shell Integration](https://addons.mozilla.org/en-US/firefox/addon/gnome-shell-integration/)





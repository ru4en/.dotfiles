#!/usr/bin/env bash
set -euo pipefail

if (( EUID == 0 )); then
  SUDO=()
else
  if ! command -v sudo >/dev/null 2>&1; then
    echo "Error: sudo is required when not running as root." >&2
    exit 1
  fi
  SUDO=(sudo)
fi

if command -v dnf >/dev/null 2>&1; then
  package_manager=dnf
elif command -v yum >/dev/null 2>&1; then
  package_manager=yum
elif command -v apt-get >/dev/null 2>&1; then
  package_manager=apt-get
elif command -v pacman >/dev/null 2>&1; then
  package_manager=pacman
elif command -v zypper >/dev/null 2>&1; then
  package_manager=zypper
elif command -v apk >/dev/null 2>&1; then
  package_manager=apk
else
  echo "Error: no supported package manager found." >&2
  exit 1
fi

case "$package_manager" in
  dnf|yum)
    packages=(
      git zsh vim tmux curl cmake
      gcc-c++ make python3-devel stow
    )
    ;;
  apt-get)
    packages=(
      git zsh vim tmux curl cmake
      g++ make python3-dev stow
    )
    ;;
  pacman)
    packages=(
      git zsh vim tmux curl cmake
      make gcc python3 stow
    )
    ;;
  zypper)
    packages=(
      git zsh vim tmux curl cmake
      gcc-c++ make python3-devel stow
    )
    ;;
  apk)
    packages=(
      git zsh vim tmux curl cmake
      gcc g++ python3-dev stow
    )
    ;;
esac

echo "Detected package manager: $package_manager"
echo "Installing: ${packages[*]}"

case "$package_manager" in
  dnf|yum)
    "${SUDO[@]}" "$package_manager" install -y "${packages[@]}"
    ;;
  apt-get)
    "${SUDO[@]}" apt-get update
    "${SUDO[@]}" apt-get install -y "${packages[@]}"
    ;;
  pacman)
    "${SUDO[@]}" pacman -Sy --noconfirm "${packages[@]}"
    ;;
  zypper)
    "${SUDO[@]}" zypper --non-interactive install "${packages[@]}"
    ;;
  apk)
    "${SUDO[@]}" apk add --no-cache "${packages[@]}"
    ;;
esac

cd "$HOME" || exit 1

repo_url="https://github.com/ru4en/.dotfiles.git"
repo_dir="$HOME/dotfiles"

if [[ -d "$repo_dir/.git" ]]; then
  git -C "$repo_dir" pull --ff-only
elif [[ -e "$repo_dir" ]]; then
  echo "Error: $repo_dir exists but is not a Git repository." >&2
  exit 1
else
  git clone "$repo_url" "$repo_dir"
fi

sudo bash "$repo_dir/setup.sh" repo
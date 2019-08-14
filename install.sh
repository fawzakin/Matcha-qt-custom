#!/bin/sh

set -e

gh_repo="matchama-kde"
gh_desc="Matchama KDE"

cat <<- EOF


M    M          t         h                  K  K   DDDD   EEEE  
MM  MM   aaa    t    cc   h       aaa        K K    D   D  E     
M MM M      a  ttt  c  c  hhhh       a       KK     D   D  EEE   
M    M   aaaa   t   c     h   h   aaaa       K K    D   D  E     
M    M  a   a   t   c  c  h   h  a   a       K  K   D   D  E     
M    M   aaaa   tt   cc   h   h   aaaa       K   K  DDDD   EEEE                                


  $gh_desc
  https://gitlab.com/cscs/$gh_repo


EOF

: "${PREFIX:=/usr}"
: "${TAG:=master}"
: "${uninstall:=false}"

_msg() {
    echo "=>" "$@" >&2
}

_rm() {
    # removes parent directories if empty
    sudo rm -rf "$1"
    sudo rmdir -p "$(dirname "$1")" 2>/dev/null || true
}

_download() {
    _msg "Getting the latest version from GitHub ..."
    wget -O "$temp_file" \
        "https://gitlab.com/cscs/$gh_repo/-/archive/master/matchama-kde-master.tar.gz"
    _msg "Unpacking matchama archive ..."
    tar -xzf "$temp_file" -C "$temp_dir"
}

_uninstall() {
    _msg "Deleting $gh_desc ..."
    sudo rm -rf "$PREFIX/share/aurorae/themes/Matchama"
    sudo rm -rf "$PREFIX/share/aurorae/themes/Matchama-Dark"
    sudo rm -rf "$PREFIX/share/color-schemes/Matchama.colors"
    sudo rm -rf "$PREFIX/share/color-schemes/Matchama-Aliz.colors"
    sudo rm -rf "$PREFIX/share/color-schemes/Matchama-Azul.colors"
    sudo rm -rf "$PREFIX/share/color-schemes/Matchama-Dark.colors"
    sudo rm -rf "$PREFIX/share/color-schemes/Matchama-Dark-Aliz.colors"
    sudo rm -rf "$PREFIX/share/color-schemes/Matchama-Dark-Azul.colors"
    sudo rm -rf "$PREFIX/share/color-schemes/Matchama-Light.colors"
    sudo rm -rf "$PREFIX/share/color-schemes/Matchama-Light-Aliz.colors"
    sudo rm -rf "$PREFIX/share/color-schemes/Matchama-Light-Azul.colors"
    sudo rm -rf "$PREFIX/share/konsole/Matchama.colorscheme"
    sudo rm -rf "$PREFIX/share/konsole/Matchama-Dark.colorscheme"
    sudo rm -rf "$PREFIX/share/konversation/themes/papirus"
    sudo rm -rf "$PREFIX/share/konversation/themes/papirus-dark"
    sudo rm -rf "$PREFIX/share/Kvantum/Matchama"
    sudo rm -rf "$PREFIX/share/Kvantum/Matchama-Aliz"
    sudo rm -rf "$PREFIX/share/Kvantum/Matchama-Azul"
    sudo rm -rf "$PREFIX/share/Kvantum/Matchama-Dark"
    sudo rm -rf "$PREFIX/share/Kvantum/Matchama-Dark-Aliz"
    sudo rm -rf "$PREFIX/share/Kvantum/Matchama-Dark-Azul"
    sudo rm -rf "$PREFIX/share/Kvantum/Matchama-Light"
    sudo rm -rf "$PREFIX/share/Kvantum/Matchama-Light-Aliz"
    sudo rm -rf "$PREFIX/share/Kvantum/Matchama-Light-Azul"
    sudo rm -rf "$PREFIX/share/plasma/desktoptheme/Matchama-Dark"
    sudo rm -rf "$PREFIX/share/plasma/desktoptheme/Matchama-Color"
    sudo rm -rf "$PREFIX/share/plasma/look-and-feel/com.gitlab.cscs.matchama"
    sudo rm -rf "$PREFIX/share/plasma/look-and-feel/com.gitlab.cscs.matchama-dark"
    sudo rm -rf "$PREFIX/share/wallpapers/Matchama"
    sudo rm -rf "$PREFIX/share/wallpapers/Matchama-Dark"
    sudo rm -rf "$PREFIX/share/yakuake/skins/matchama"
    sudo rm -rf "$PREFIX/share/yakuake/skins/matchama-aliz"
    sudo rm -rf "$PREFIX/share/yakuake/skins/matchama-azul"
    sudo rm -rf "$PREFIX/share/yakuake/skins/matchama-dark"
    sudo rm -rf "$PREFIX/share/yakuake/skins/matchama-dark-aliz"
    sudo rm -rf "$PREFIX/share/yakuake/skins/matchama-dark-azul"
}

_install() {
    _msg "Installing ..."
    sudo cp -R \
        "$temp_dir/$gh_repo-$TAG/aurorae" \
        "$temp_dir/$gh_repo-$TAG/color-schemes" \
        "$temp_dir/$gh_repo-$TAG/konsole" \
        "$temp_dir/$gh_repo-$TAG/konversation" \
        "$temp_dir/$gh_repo-$TAG/Kvantum" \
        "$temp_dir/$gh_repo-$TAG/plasma" \
        "$temp_dir/$gh_repo-$TAG/wallpapers" \
        "$temp_dir/$gh_repo-$TAG/yakuake" \
        "$PREFIX/share"
}

_cleanup() {
    _msg "Clearing cache ..."
    rm -rf "$temp_file" "$temp_dir" \
        ~/.cache/plasma-svgelements-Matchama* \
        ~/.cache/plasma_theme_Matchama*.kcache
    _msg "Done!"
}

trap _cleanup EXIT HUP INT TERM

temp_file="$(mktemp -u)"
temp_dir="$(mktemp -d)"

if [ "$uninstall" = "false" ]; then
    _download
    _uninstall
    _install
else
    _uninstall
fi

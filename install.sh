#!/bin/sh

set -e

gh_repo="matcha-kde"
gh_desc="Matcha KDE"

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
        "https://gitlab.com/cscs/$gh_repo/-/archive/master/matcha-kde-master.tar.gz"
    _msg "Unpacking matcha archive ..."
    tar -xzf "$temp_file" -C "$temp_dir"
}

_uninstall() {
    _msg "Deleting $gh_desc ..."
    _rm "$PREFIX/share/aurorae/themes/Matcha"
    _rm "$PREFIX/share/aurorae/themes/Matcha-Dark"
    _rm "$PREFIX/share/color-schemes/Matcha.colors"
    _rm "$PREFIX/share/color-schemes/MatchaDark.colors"
    _rm "$PREFIX/share/konsole/Matcha.colorscheme"
    _rm "$PREFIX/share/konsole/MatchaDark.colorscheme"
    _rm "$PREFIX/share/konversation/themes/papirus"
    _rm "$PREFIX/share/konversation/themes/papirus-dark"
    _rm "$PREFIX/share/Kvantum/Matcha"
    _rm "$PREFIX/share/Kvantum/MatchaDark"
    _rm "$PREFIX/share/Kvantum/MatchaDarker"
    _rm "$PREFIX/share/plasma/desktoptheme/Matcha-Dark"
    _rm "$PREFIX/share/plasma/desktoptheme/Matcha-Color"
    _rm "$PREFIX/share/plasma/look-and-feel/com.gitlab.cscs.matcha"
    _rm "$PREFIX/share/plasma/look-and-feel/com.gitlab.cscs.matcha-dark"
    _rm "$PREFIX/share/wallpapers/Matcha"
    _rm "$PREFIX/share/wallpapers/Matcha-Dark"
    _rm "$PREFIX/share/yakuake/skins/matcha"
    _rm "$PREFIX/share/yakuake/skins/matcha-dark"
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
        ~/.cache/plasma-svgelements-Matcha* \
        ~/.cache/plasma_theme_Matcha*.kcache
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

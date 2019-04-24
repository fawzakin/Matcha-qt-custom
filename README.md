<p align="center">
  <img src="https://raw.githubusercontent.com/PapirusDevelopmentTeam/matcha-kde/master/preview.png" alt="Preview Matcha-Dark KDE"/>
  <sup><sub>Screenshot Details: Engine: <a href="https://github.com/tsujan/Kvantum/tree/master/Kvantum">Kavntum</a> | Kvantum Theme: Matcha Darker | Aurorae decoration: Matcha Dark | Plasma Theme: Matcha Dark | Icons: <a href="https://github.com/PapirusDevelopmentTeam/papirus-icon-theme">Papirus</a> | Dock: <a href="https://github.com/psifidotos/Latte-Dock">Latte Dock</a></sub></sup>
</p>

Matcha KDE - This is a port of the popular [GTK theme Matcha](https://github.com/NicoHood/Matcha-theme) for Plasma 5 desktop with a few additions and extras.

In this repository you'll find:

- Aurorae Themes
- Konsole Color Schemes
- Konversation Themes
- Kvantum Themes
- Plasma Color Schemes
- Plasma Desktop Themes
- Plasma Look-and-Feel Settings
- Wallpapers
- Yakuake Skins

**NOTE:** Plasma theme Matcha Color now supports KDE Color Schemes with [Papirus icon theme](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme).

## Installation

### Ubuntu and derivatives

You can install matcha-kde from our official [PPA](https://launchpad.net/~papirus/+matchahive/ubuntu/papirus):

```
sudo add-apt-repository ppa:papirus/papirus
sudo apt-get update
sudo apt-get install --install-recommends matcha-kde
```

or download .deb packages from [here](https://launchpad.net/~papirus/+matchahive/ubuntu/papirus/+packages?field.name_filter=matcha-kde).

### Matcha KDE Installer

Use the scripts to install the latest version directly from this repo (independently on your distro):

**NOTE:** Use the same script to update Matcha-KDE.

#### Install

```
wget -qO- https://raw.githubusercontent.com/PapirusDevelopmentTeam/matcha-kde/master/install.sh | sh
```

#### Uninstall

```
wget -qO- https://raw.githubusercontent.com/PapirusDevelopmentTeam/matcha-kde/master/install.sh | env uninstall=true sh
```

### Third-party packages

Packages in this section are not part of the official repositories. If you have a trouble or a question please contact with package maintainer.

| **Distro** | **Maintainer**    | **Package** |
|:-----------|:------------------|:------------|
| Matchah Linux | Bruno Pagani | `sudo pacman -S matcha-kde kvantum-theme-matcha` <sup>[[link](https://www.matchahlinux.org/packages/community/any/matcha-kde/)]</sup> **<sup>[1]</sup>** |
| Matchah Linux | Mmatchaus Behrendt | [matcha-kde-git](https://aur.matchahlinux.org/packages/matcha-kde-git) <sup>AUR</sup> |
| Manjaro | Nikola Yanev | [matcha-kde](http://download.tuxfamily.org/gericom/README.html) |
| openSUSE | Konstantin Voinov | [matcha-kde](https://software.opensuse.org/download.html?project=home:kill_it&package=matcha-kde) <sup>OBS [[link](https://build.opensuse.org/package/show/home:kill_it/matcha-kde)]</sub> |
| Fedora | Robert-André Mauchin | `sudo dnf install matcha-kde` <sup>[[link](https://src.fedoraproject.org/rpms/matcha-kde)]</sup> |

**<sup>[1]</sup>** This package does not contain Konversation themes.

**NOTE:** If you maintainer and want be in the list please create an issue or send a pull request.

## Recommendations

- For better looking please use this pack with [Kvantum engine](https://github.com/tsujan/Kvantum/tree/master/Kvantum).

  Run `kvantummanager` to choose and apply **Matcha Darker** (or any other Matcha) theme.

- Install [Papirus icon theme](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme) for a more consistent and beautiful experience.

## Extras

- [VLC Skin](https://github.com/varlesh/VLC-Matcha-Dark) — Matcha Dark skin for [VLC](http://www.videolan.org/vlc/)
- [KDE-gaps](http://www.simonizor.gq/kde-gaps) — a modification of Matcha-Dark that removes the title, window buttons, and makes the window decorations completely transparent

## Donate

If you like my project, you can donate at:

<span class="paypal"><a href="https://www.paypal.me/varlesh" title="Donate to this project using Paypal"><img src="https://www.paypalobjects.com/webstatic/mktg/Logo/pp-logo-100px.png" alt="PayPal donate button" /></a></span>

## License

GNU GPL v3

# GNU make is required to run this file. To install on *BSD, run:
#   gmake PREFIX=/usr/local install

PREFIX ?= /usr
IGNORE ?=
THEMES ?= aurorae color-schemes konsole konversation Kvantum plasma wallpapers yakuake

# excludes IGNORE from THEMES list
THEMES := $(filter-out $(IGNORE), $(THEMES))

all:

install:
	sudo mkdir -p $(DESTDIR)$(PREFIX)/share
	sudo cp -R $(THEMES) $(DESTDIR)$(PREFIX)/share

uninstall:
	-sudo rm -rf $(DESTDIR)$(PREFIX)/share/aurorae/themes/Matchama
	-sudo rm -rf $(DESTDIR)$(PREFIX)/share/aurorae/themes/Matchama-Dark
	-sudo rm -r  $(DESTDIR)$(PREFIX)/share/color-schemes/Matchama.colors
	-sudo rm -r  $(DESTDIR)$(PREFIX)/share/color-schemes/MatchamaAliz.colors
	-sudo rm -r  $(DESTDIR)$(PREFIX)/share/color-schemes/MatchamaAzul.colors
	-sudo rm -r  $(DESTDIR)$(PREFIX)/share/color-schemes/MatchamaDark.colors
	-sudo rm -r  $(DESTDIR)$(PREFIX)/share/color-schemes/MatchamaDarkAliz.colors
	-sudo rm -r  $(DESTDIR)$(PREFIX)/share/color-schemes/MatchamaDarkAzul.colors
	-sudo rm -r  $(DESTDIR)$(PREFIX)/share/color-schemes/MatchamaLight.colors
	-sudo rm -r  $(DESTDIR)$(PREFIX)/share/color-schemes/MatchamaLightAliz.colors
	-sudo rm -r  $(DESTDIR)$(PREFIX)/share/color-schemes/MatchamaLightAzul.colors
	-sudo rm -r  $(DESTDIR)$(PREFIX)/share/konsole/Matchama.colorscheme
	-sudo rm -r  $(DESTDIR)$(PREFIX)/share/konsole/Matchama-Dark.colorscheme
	-sudo rm -rf $(DESTDIR)$(PREFIX)/share/konversation/themes/matchama
	-sudo rm -rf $(DESTDIR)$(PREFIX)/share/konversation/themes/matchama-dark
	-sudo rm -rf $(DESTDIR)$(PREFIX)/share/Kvantum/Matchama
	-sudo rm -rf $(DESTDIR)$(PREFIX)/share/Kvantum/Matchama-Aliz
	-sudo rm -rf $(DESTDIR)$(PREFIX)/share/Kvantum/Matchama-Azul
	-sudo rm -rf $(DESTDIR)$(PREFIX)/share/Kvantum/Matchama-Dark
	-sudo rm -rf $(DESTDIR)$(PREFIX)/share/Kvantum/Matchama-Dark-Aliz
	-sudo rm -rf $(DESTDIR)$(PREFIX)/share/Kvantum/Matchama-Dark-Azul
	-sudo rm -rf $(DESTDIR)$(PREFIX)/share/Kvantum/Matchama-Light
	-sudo rm -rf $(DESTDIR)$(PREFIX)/share/Kvantum/Matchama-Light-Aliz
	-sudo rm -rf $(DESTDIR)$(PREFIX)/share/Kvantum/Matchama-Light-Azul
	-sudo rm -rf $(DESTDIR)$(PREFIX)/share/plasma/desktoptheme/Matchama-Adaptive-Colors
	-sudo rm -rf $(DESTDIR)$(PREFIX)/share/plasma/desktoptheme/Matchama-Adaptive-Mono
	-sudo rm -rf $(DESTDIR)$(PREFIX)/share/plasma/desktoptheme/Matchama-Color
	-sudo rm -rf $(DESTDIR)$(PREFIX)/share/plasma/desktoptheme/Matchama-Dark
	-sudo rm -rf $(DESTDIR)$(PREFIX)/share/plasma/look-and-feel/com.gitlab.cscs.matchama
	-sudo rm -rf $(DESTDIR)$(PREFIX)/share/plasma/look-and-feel/com.gitlab.cscs.matchama-dark
	-sudo rm -rf $(DESTDIR)$(PREFIX)/share/wallpapers/Matchama
	-sudo rm -rf $(DESTDIR)$(PREFIX)/share/wallpapers/Matchama-Dark
	-sudo rm -rf $(DESTDIR)$(PREFIX)/share/yakuake/skins/matchama
	-sudo rm -rf $(DESTDIR)$(PREFIX)/share/yakuake/skins/matchama-aliz
	-sudo rm -rf $(DESTDIR)$(PREFIX)/share/yakuake/skins/matchama-azul
	-sudo rm -rf $(DESTDIR)$(PREFIX)/share/yakuake/skins/matchama-dark
	-sudo rm -rf $(DESTDIR)$(PREFIX)/share/yakuake/skins/matchama-dark-aliz
	-sudo rm -rf $(DESTDIR)$(PREFIX)/share/yakuake/skins/matchama-dark-azul

_get_version:
	$(eval VERSION := $(shell git show -s --format=%cd --date=format:%Y%m%d HEAD))
	@echo $(VERSION)

dist: _get_version
	git matchamarchive --format=tar.gz -o $(notdir $(CURDIR))-$(VERSION).tar.gz master -- $(THEMES)

release: _get_version
	git tag -f $(VERSION)
	git push origin
	git push origin --tags

undo_release: _get_version
	-git tag -d $(VERSION)
	-git push --delete origin $(VERSION)


.PHONY: all install uninstall _get_version dist release undo_release

# .BEGIN is ignored by GNU make so we can use it as a guard
.BEGIN:
	@head -3 Makefile
	@false

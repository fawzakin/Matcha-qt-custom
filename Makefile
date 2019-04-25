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
	-sudo rm -rf $(DESTDIR)$(PREFIX)/share/aurorae/themes/Matcha
	-sudo rm -rf $(DESTDIR)$(PREFIX)/share/aurorae/themes/Matcha-Dark
	-sudo rm -r  $(DESTDIR)$(PREFIX)/share/color-schemes/Matcha.colors
	-sudo rm -r  $(DESTDIR)$(PREFIX)/share/color-schemes/Matcha-Dark.colors
	-sudo rm -r  $(DESTDIR)$(PREFIX)/share/konsole/Matcha.colorscheme
	-sudo rm -r  $(DESTDIR)$(PREFIX)/share/konsole/Matcha-Dark.colorscheme
	-sudo rm -rf $(DESTDIR)$(PREFIX)/share/konversation/themes/papirus
	-sudo rm -rf $(DESTDIR)$(PREFIX)/share/konversation/themes/papirus-dark
	-sudo rm -rf $(DESTDIR)$(PREFIX)/share/Kvantum/Matcha
	-sudo rm -rf $(DESTDIR)$(PREFIX)/share/Kvantum/Matcha-Dark
	-sudo rm -rf $(DESTDIR)$(PREFIX)/share/Kvantum/Matcha-Darker
	-sudo rm -rf $(DESTDIR)$(PREFIX)/share/plasma/desktoptheme/Matcha-Color
	-sudo rm -rf $(DESTDIR)$(PREFIX)/share/plasma/desktoptheme/Matcha-Dark
	-sudo rm -rf $(DESTDIR)$(PREFIX)/share/plasma/look-and-feel/com.gitlab.cscs.matcha-dark
	-sudo rm -rf $(DESTDIR)$(PREFIX)/share/wallpapers/Matcha
	-sudo rm -rf $(DESTDIR)$(PREFIX)/share/wallpapers/Matcha-Dark
	-sudo rm -rf $(DESTDIR)$(PREFIX)/share/yakuake/skins/matcha
	-sudo rm -rf $(DESTDIR)$(PREFIX)/share/yakuake/skins/matcha-dark

_get_version:
	$(eval VERSION := $(shell git show -s --format=%cd --date=format:%Y%m%d HEAD))
	@echo $(VERSION)

dist: _get_version
	git matcharchive --format=tar.gz -o $(notdir $(CURDIR))-$(VERSION).tar.gz master -- $(THEMES)

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

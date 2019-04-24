# GNU make is required to run this file. To install on *BSD, run:
#   gmake PREFIX=/usr/local install

PREFIX ?= /usr
IGNORE ?=
THEMES ?= aurorae color-schemes konsole konversation Kvantum plasma wallpapers yakuake

# excludes IGNORE from THEMES list
THEMES := $(filter-out $(IGNORE), $(THEMES))

all:

install:
	mkdir -p $(DESTDIR)$(PREFIX)/share
	cp -R $(THEMES) $(DESTDIR)$(PREFIX)/share

uninstall:
	-rm -rf $(DESTDIR)$(PREFIX)/share/aurorae/themes/Matcha
	-rm -rf $(DESTDIR)$(PREFIX)/share/aurorae/themes/Matcha-Dark
	-rm -r  $(DESTDIR)$(PREFIX)/share/color-schemes/Matcha.colors
	-rm -r  $(DESTDIR)$(PREFIX)/share/color-schemes/MatchaDark.colors
	-rm -r  $(DESTDIR)$(PREFIX)/share/konsole/Matcha.colorscheme
	-rm -r  $(DESTDIR)$(PREFIX)/share/konsole/MatchaDark.colorscheme
	-rm -rf $(DESTDIR)$(PREFIX)/share/konversation/themes/papirus
	-rm -rf $(DESTDIR)$(PREFIX)/share/konversation/themes/papirus-dark
	-rm -rf $(DESTDIR)$(PREFIX)/share/Kvantum/Matcha
	-rm -rf $(DESTDIR)$(PREFIX)/share/Kvantum/MatchaDark
	-rm -rf $(DESTDIR)$(PREFIX)/share/Kvantum/MatchaDarker
	-rm -rf $(DESTDIR)$(PREFIX)/share/plasma/desktoptheme/Matcha-Color
	-rm -rf $(DESTDIR)$(PREFIX)/share/plasma/desktoptheme/Matcha-Dark
	-rm -rf $(DESTDIR)$(PREFIX)/share/plasma/look-and-feel/com.github.varlesh.matcha-dark
	-rm -rf $(DESTDIR)$(PREFIX)/share/wallpapers/Matcha
	-rm -rf $(DESTDIR)$(PREFIX)/share/wallpapers/Matcha-Dark
	-rm -rf $(DESTDIR)$(PREFIX)/share/yakuake/skins/matcha
	-rm -rf $(DESTDIR)$(PREFIX)/share/yakuake/skins/matcha-dark

_get_version:
	$(eval VERSION := $(shell git show -s --format=%cd --date=format:%Y%m%d HEAD))
	@echo $(VERSION)

dist: _get_version
	git matchahive --format=tar.gz -o $(notdir $(CURDIR))-$(VERSION).tar.gz master -- $(THEMES)

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

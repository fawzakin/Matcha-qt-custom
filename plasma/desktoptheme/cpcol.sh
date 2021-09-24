#!/bin/bash
#for x in "-alice" "-azure" "-amethyst"; do
    #cp -r matcha-tea matcha${x}
    #cp -r matcha-dark-tea matcha-dark${x}
    #[ "${x}" = "-alice" ] && sed -i 's/2eb398/ef2929/g' matcha{,-dark}${x}/src/{irc_admin.svg,irc_owner.svg}
    #[ "${x}" = "-azure" ] && sed -i 's/2eb398/3465a4/g' matcha{,-dark}${x}/src/{irc_admin.svg,irc_owner.svg}
    #[ "${x}" = "-amethyst" ] && sed -i 's/2eb398/75507b/g' matcha{,-dark}${x}/src/{irc_admin.svg,irc_owner.svg}
    #inkscape --export-filename=matcha${x}/irc_admin.png matcha${x}/src/irc_admin.svg
    #inkscape --export-filename=matcha${x}/irc_owner.png matcha${x}/src/irc_owner.svg
    #inkscape --export-filename=matcha-dark${x}/irc_admin.png matcha-dark${x}/src/irc_admin.svg
    #inkscape --export-filename=matcha-dark${x}/irc_owner.png matcha-dark${x}/src/irc_owner.svg
#done
x="-tea"
sed -i 's/2eb398/73d216/g' matcha{,-dark}${x}/src/{irc_admin.svg,irc_owner.svg}
inkscape --export-filename=matcha${x}/irc_admin.png matcha${x}/src/irc_admin.svg
inkscape --export-filename=matcha${x}/irc_owner.png matcha${x}/src/irc_owner.svg
inkscape --export-filename=matcha-dark${x}/irc_admin.png matcha-dark${x}/src/irc_admin.svg
inkscape --export-filename=matcha-dark${x}/irc_owner.png matcha-dark${x}/src/irc_owner.svg

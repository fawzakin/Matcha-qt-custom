#!/bin/bash
for x in */; do
    cd $x
    sed -i "/Name/s/=.*$/=${x}" metadata.desktop
    rm AUTHORS LICENSE
    cd icons
    sed -i "s/ee554d/ef2929/g;s/ff2a2a/cd241d/g;s/2eb398/73d216/g;s/4e9a06/8ae234/g;s/3497da/3465a4/g" *.svg
    cd ../widgets
    sed -i "s/ee554d/ef2929/g;s/ff2a2a/cd241d/g;s/2eb398/73d216/g;s/4e9a06/8ae234/g;s/3497da/3465a4/g" *.svg
    cd ../..
done

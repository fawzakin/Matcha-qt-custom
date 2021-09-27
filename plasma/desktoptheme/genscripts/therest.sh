#!/bin/bash
for x in Matcha-Alice-* Matcha-Azure-*; do
    cd $x
    sed -i "/Name/s/=.*$/=${x}/" metadata.desktop
    cd ..
done

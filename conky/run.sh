#!/bin/sh

conky -q -c ~/dev/conky/perso/conkyrc_zen
sleep 3
conky -q -c ~/dev/conky/perso/conkyrc_sys
sleep 1
conky -q -c ~/dev/conky/perso/conkyrc_power

tilda


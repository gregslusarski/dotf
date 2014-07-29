#!/bin/sh

vol=$(amixer get Master | awk -F'[]%[]' '/%/ {if ($5 == "off") { print "Muted" } else { print $2 }}' | head -n 1)

echo Vol: $vol%

exit 0

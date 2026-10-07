#!/usr/bin/env bash
# Cycles kitty's cursor, active border and active tab through the neon green range.
# Run from inside kitty (uses $KITTY_LISTEN_ON):  ~/.config/kitty/rgb-cycle.sh &
colors=(0ABF53 1FE05C 39FF14 76FF3C A8FF00 D7FF1A 00FF85 00FFC8)
delay=${1:-0.4}
i=0
while :; do
  c=${colors[i % ${#colors[@]}]}
  kitten @ set-colors -a \
    cursor="#$c" active_border_color="#$c" active_tab_background="#$c" 2>/dev/null || exit 0
  i=$((i + 1))
  sleep "$delay"
done

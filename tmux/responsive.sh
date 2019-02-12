#!/bin/sh

CALENDAR=

WIDTH=${1}

SMALL=80
MEDIUM=107
LARGE=125
X_LARGE=150

SPOTIFY="#[fg=colour81] #(~/.tmux/bin/spotify_info)"

DATE_SHORT="#[fg=colour255] $CALENDAR$(date)"
DATE_LONG="#[fg=colour255] $CALENDAR  $(date)"
OUTPUT=""
if [ "$WIDTH" -gt "$X_LARGE" ]; then
	OUTPUT="$CPU $SPOTIFY $BATTERY $DATE_LONG $CPU"
elif [ "$WIDTH" -ge "$LARGE" ]; then
	OUTPUT="$BATTERY $DATE_SHORT $CPU"
elif [ "$WIDTH" -ge "$MEDIUM" ]; then
	OUTPUT=""
fi

echo "$OUTPUT" | sed 's/ *$/ /g'

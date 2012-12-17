#!/bin/sh

SITE="${1:-http://effectif.com}"

## Functions

site_is_up()
{
    curl -k -I -f $SITE 2>/dev/null | head -n 1 | grep -qs 200
}

## Main program

[ -n "$DEBUG" ] && set -x

for i in $(seq 5); do
    if site_is_up; then
        exit 0
    fi
done

if [ $? -ne 0 ]; then
    curl -I $SITE
fi

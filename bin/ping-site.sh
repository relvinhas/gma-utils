#!/bin/sh

SITE="${1:-http://effectif.com}"

## Functions

site_is_up()
{
    curl -I -f $SITE 2>/dev/null | head -n 1 | grep -qs 200
}

## Main program

[ -n "$DEBUG" ] && set -x

site_is_up

if [ $? -ne 0 ]; then
    curl -I $SITE
fi

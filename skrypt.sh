#!/bin/bash

if [ "$1" = "--date" ]; then
    date
else
    echo "Użycie: $0 --date"
fi

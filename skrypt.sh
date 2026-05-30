#!/bin/bash

if [ "$1" = "--logs" ] && [ -n "$2" ]; then
    count=$2

    for i in $(seq 1 "$count")
    do
        filename="log${i}.txt"
        echo "Nazwa pliku: $filename" > "$filename"
        echo "Skrypt: $0" >> "$filename"
        echo "Data: $(date)" >> "$filename"
    done

    echo "Utworzono $count plików"
else
    echo "Użycie: $0 --logs liczba"
fi

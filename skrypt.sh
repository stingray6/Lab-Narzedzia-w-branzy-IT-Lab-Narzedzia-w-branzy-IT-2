#!/bin/bash

if [ "$1" = "--logs" ]; then
    for i in $(seq 1 100)
    do
        filename="log${i}.txt"
        echo "Nazwa pliku: $filename" > "$filename"
        echo "Skrypt: $0" >> "$filename"
        echo "Data: $(date)" >> "$filename"
    done
    echo "Utworzono 100 plików log1.txt - log100.txt"
else
    echo "Użycie: $0 --logs"
fi

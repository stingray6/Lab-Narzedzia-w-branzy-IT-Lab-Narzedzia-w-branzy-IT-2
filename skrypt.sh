#!/bin/bash

if [ "$1" = "--date" ]; then
    date

elif [ "$1" = "--logs" ]; then
    if  [ -n "$2" ]; then
        count=$2
    else
        count=100
    fi

    for i in $(seq 1 "$count")
    do
        filename="log${i}.txt"
        echo "Nazwa pliku: $filename" > "$filename"
        echo "Skrypt: $0" >> "$filename"
        echo "Data: $(date)" >> "$filename"
    done

    echo "Utworzono $count plików"

elif [ "$1" = "--help" ]; then
    echo "Dostępne opcje:"
    echo "  [-d | --date]           wyświetla aktualną datę"
    echo "  [-l | --logs] LICZBA    tworzy LICZBA plików logX.txt (LICZBA=100 jeśli nie podano)"
    echo "  [-h | --help]           wyświetla pomoc"

else
    echo "Aby wyświetlić pomoc: $0 --help "
fi

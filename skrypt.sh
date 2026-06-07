#!/bin/bash

if [ "$1" = "--date" ] || [ "$1" = "-d" ]; then
    date

elif [ "$1" = "--logs" ] || [ "$1" = "-l" ]; then
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

elif [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
    echo "Dostępne opcje:"
    echo "  --date           wyświetla aktualną datę"
    echo "  --logs LICZBA    tworzy LICZBA plików logX.txt (LICZBA=100 jeśli nie podano)"
    echo "  --help           wyświetla pomoc"

else
    echo "Aby wyświetlić pomoc: $0 --help "
fi

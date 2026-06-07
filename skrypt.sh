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

elif [ "$1" = "--init" ]; then
    REPO_URL=$(git config --get remote.origin.url)

    if [ -z "$REPO_URL" ]; then
        echo "Brak repozytorium zdalnego!"
        exit 1
    fi

    git clone "$REPO_URL"
    DIR_NAME=$(basename "$REPO_URL" .git)

    export PATH="$PATH:$(pwd)/$DIR_NAME"

    echo "Repozytorium: $REPO_URL"
    echo "Sklonowano do katalogu docelowago i zaktualizowano PATH: $(pwd)/$DIR_NAME"

elif [ "$1" = "--error" ] || [ "$1" = "-e" ]; then
    if  [ -n "$2" ]; then
        count=$2
    else
        count=100
    fi

    for i in $(seq 1 "$count")
    do
        dirname="error$i"
        filename="error${i}.txt"
        filepath="$dirname/$filename"

        mkdir -p "$dirname"

        echo "Nazwa pliku: $filename" > "$filepath"

    done

    echo "Utworzono $count plików"

elif [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
    echo "Dostępne opcje:"
    echo "  [-d | --date]           wyświetla aktualną datę"
    echo "  [-l | --logs] LICZBA    tworzy LICZBA plików logX.txt (LICZBA=100 jeśli nie podano)"
    echo "  [-h | --help]           wyświetla pomoc"

else
    echo "Aby wyświetlić pomoc: $0 --help "
fi

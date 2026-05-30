#!/bin/bash

if [ "$1" = "--help" ]; then
    echo "Dostępne opcje:"
    echo "  --date           wyświetla aktualną datę"
    echo "  --logs LICZBA    tworzy LICZBA plików logX.txt (LICZBA=100 jeśli nie podano)"
    echo "  --help           wyświetla pomoc"
else
    echo "Aby wyświetlić pomoc: $0 --help "
fi

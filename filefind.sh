#!/bin/bash

# Verifica se os argumentos foram passados
if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Uso: $0 <dominio> <extensao>"
  echo "Exemplo: $0 businesscorp.com.br pdf"
  exit 1
fi

DOMINIO="$1"
EXTENSAO="$2"

echo "Buscando por arquivos .${EXTENSAO} em ${DOMINIO}..."

lynx -dump "http://google.com/search?num=100&q=site:${DOMINIO}+ext:${EXTENSAO}" \
  | grep "/url?q=" \
  | sed 's/.*\/url?q=\([^&]*\).*/\1/' \
  | grep -v "webcache.googleusercontent.com"

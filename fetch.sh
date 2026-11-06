#!/bin/sh
# Baixa os instaladores do release do GitHub para /data e confere o sha256.
# Um arquivo que ja esta la com o hash certo nao e baixado de novo.
set -e
REL="https://github.com/Marcolinofael/rustdesk/releases/download/rafadesk-1.5.1"

grep -v '^[[:space:]]*#' /app/downloads.txt | while read -r name sha required; do
  [ -n "$name" ] || continue
  echo "$sha  /data/$name" > /tmp/sum
  if sha256sum -c /tmp/sum >/dev/null 2>&1; then
    echo "ok (cache): $name"
    continue
  fi
  if curl -fsL -o "/data/$name.part" "$REL/$name" && mv -f "/data/$name.part" "/data/$name" && sha256sum -c /tmp/sum; then
    echo "ok: $name"
  else
    rm -f "/data/$name.part"
    if [ "$required" = "sim" ]; then
      echo "ERRO: $name nao baixou ou o hash nao confere" >&2
      exit 1
    fi
    echo "aviso: $name indisponivel por enquanto"
  fi
done

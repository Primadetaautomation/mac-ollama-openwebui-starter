#!/usr/bin/env bash
set -euo pipefail

here="$(cd "$(dirname "$0")" && pwd)"
repo_root="$(cd "$here/.." && pwd)"

echo "[warn] Dit verwijdert de Open WebUI container en (optioneel) data volumes."

confirm() {
  read -r -p "$1 [y/N] " resp || true
  [[ "$resp" == "y" || "$resp" == "Y" ]]
}

if confirm "Containers stoppen en verwijderen (mac setup)?"; then
  docker compose -f "$repo_root/compose.webui-mac.yml" down || true
fi

if confirm "Data volume 'openwebui-data' verwijderen (permanent verlies van UI data)?"; then
  docker volume rm openwebui-data || true
fi

if confirm "Ollama brew service stoppen (indien actief)?"; then
  if command -v brew >/dev/null 2>&1; then
    brew services stop ollama || true
  else
    echo "[info] brew niet gevonden; sla over."
  fi
fi

echo "[ok] Verwijderen gereed."


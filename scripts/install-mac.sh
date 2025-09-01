#!/usr/bin/env bash
set -euo pipefail

here="$(cd "$(dirname "$0")" && pwd)"
repo_root="$(cd "$here/.." && pwd)"

echo "[info] Installatie (macOS): Ollama (native) + Open WebUI (Docker)"

if [[ "$(uname -s)" != "Darwin" ]]; then
  echo "[error] Dit script is bedoeld voor macOS (Darwin)." >&2
  exit 1
fi

command -v docker >/dev/null 2>&1 || {
  echo "[error] Docker Desktop niet gevonden. Installeer eerst: https://www.docker.com/products/docker-desktop/" >&2
  exit 1
}

if ! command -v ollama >/dev/null 2>&1; then
  if command -v brew >/dev/null 2>&1; then
    echo "[info] Installeer Ollama via Homebrew"
    brew install ollama || true
  else
    echo "[warn] Homebrew niet gevonden. Installeer Ollama.app handmatig: https://ollama.com/download" >&2
  fi
fi

if command -v brew >/dev/null 2>&1; then
  echo "[info] Start Ollama als service (brew services)"
  brew services start ollama || true
else
  echo "[info] Zorg dat Ollama.app draait of start handmatig 'ollama serve'"
fi

export WEBUI_PORT="${WEBUI_PORT:-3000}"
export OLLAMA_PORT="${OLLAMA_PORT:-11434}"
export OLLAMA_BASE_URL="${OLLAMA_BASE_URL:-http://host.docker.internal:${OLLAMA_PORT}}"

echo "[info] Pull Open WebUI image"
docker pull ghcr.io/open-webui/open-webui:main

echo "[info] Start Open WebUI container op poort ${WEBUI_PORT}"
docker compose -f "$repo_root/compose.webui-mac.yml" up -d

echo "[ok] Open WebUI draait: http://localhost:${WEBUI_PORT}"
echo "[hint] Eerste keer? Maak een account aan in de UI."


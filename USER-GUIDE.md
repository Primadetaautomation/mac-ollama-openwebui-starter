# Gebruikershandleiding (Open WebUI)

## Vereisten (Windows)
- Docker Desktop geïnstalleerd en draaiend
- PowerShell met internettoegang (one‑liner gebruikt `ExecutionPolicy Bypass` voor deze sessie)
- Ollama geïnstalleerd: `winget install -e --id Ollama.Ollama` of via installer (https://ollama.com/download/windows)
- Verbinding container → host via `host.docker.internal` (standaard in Docker Desktop)

## Starten
- macOS + native Ollama: `make start` of `./scripts/install-mac.sh` → open `http://localhost:3000`
- Windows + native Ollama: `./scripts/install-windows.ps1` (PowerShell) → open `http://localhost:3000`
- All‑in‑one (containers): `docker compose -f compose.all-in-one.yml up -d`

Eerste bezoeker maakt een account (admin).

## Modellen
- Pull modellen (native): `ollama pull llama3.1:8b` (of via WebUI Settings → Models → Refresh)
- Stel een standaardmodel in via Settings → Models.

## Best practices voor prompts
- Geef context en doel (rol, publiek, formaat van antwoord).
- Voeg voorbeeldinput/uitvoer toe voor consistentie.
- Beperk gevoelige data; anonimiseer waar mogelijk (zie PRIVACY.md).

## Documenten
- Upload alleen documenten binnen afgesproken scope.
- Verwijder oude uploads als ze niet meer nodig zijn.

## Troubleshooting
- Geen modellen zichtbaar: Settings → Models → Refresh; of `curl http://localhost:11434/api/tags`
- Poort al in gebruik: wijzig `WEBUI_PORT` in `.env` of compose en start opnieuw.
- Container logs: `docker logs -f open-webui`

## One‑liners
- macOS:
  - `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Primadetaautomation/mac-ollama-openwebui-starter/main/scripts/install-mac.sh)"`
- Windows (PowerShell):
  - `powershell -NoProfile -ExecutionPolicy Bypass -Command "iwr -useb https://raw.githubusercontent.com/Primadetaautomation/mac-ollama-openwebui-starter/main/scripts/install-windows.ps1 | iex"`

## Uninstall
- macOS: `./scripts/uninstall-mac.sh`
- Windows (PowerShell): `./scripts/uninstall-windows.ps1`

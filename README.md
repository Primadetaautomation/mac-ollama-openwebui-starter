# Mac Ollama + Open WebUI Starter

Eenvoudig, lokaal en reviewbaar pakket om Ollama en Open WebUI op macOS te draaien. Ontworpen om snel te installeren en eenvoudig te toetsen aan (bijv.) beleidsregels van de Nederlandse Pensioenfederatie.

## Snelstart (macOS, Ollama native + WebUI in Docker)

Vereisten:
- Docker Desktop geïnstalleerd en draaiend (https://www.docker.com/products/docker-desktop/)
- Homebrew (https://brew.sh) of Ollama.app

Stappen:
1. Installeer Ollama (kies één):
   - Via Homebrew: `brew install ollama && brew services start ollama`
   - Of download Ollama.app: https://ollama.com/download en start de app
2. Start Open WebUI gekoppeld aan je lokale Ollama:
   - `make start`  (of run het script: `./scripts/install-mac.sh`)
3. Open WebUI: http://localhost:3000

Verifiëren:
- Ollama API: `curl -sS http://localhost:11434/api/tags`
- WebUI loaderpagina: `curl -sS http://localhost:3000/api/health` (verwacht HTML)

## Alternatief: Alles-in-1 met Docker Compose

Dit draait zowel Ollama als Open WebUI in containers (handig voor servers of wanneer je geen native Ollama wilt gebruiken):

```bash
docker compose -f compose.all-in-one.yml up -d
```

Open vervolgens: http://localhost:3000

## Projectstructuur

- `compose.webui-mac.yml` – Open WebUI container koppelt naar native Ollama via `host.docker.internal`.
- `compose.all-in-one.yml` – Zowel Ollama als Open WebUI als containers, met persistente volumes.
- `scripts/install-mac.sh` – Controleert vereisten, start Ollama (via brew) en Open WebUI container.
 - `scripts/uninstall-mac.sh` – Verwijdert containers en (optioneel) data volume.
- `Makefile` – Handige wrappers voor starten/stoppen/status/logs.
- `policy/` – Sjablonen voor governance en compliance (aanpasbaar aan interne richtlijnen/regels).
 - `.github/` – Workflows en templates (PR/Issues) incl. compliance-checklists.
 - `PRIVACY.md` – Eindgebruikersrichtlijnen over invoer, verwerking en retentie.
 - `USER-GUIDE.md` – Korte handleiding voor gebruik, modellen en troubleshooting.

## Configuratie

- Poorten: standaard WebUI op `3000`, Ollama op `11434`.
- Pas zo nodig `.env` aan en gebruik variabelen in Compose (`${WEBUI_PORT:-3000}` etc.).
- Open WebUI wordt standaard met lokale authenticatie gestart; eerste bezoeker maakt een account.

## Veelgebruikte commando's

```bash
# Start (mac + native Ollama)
make start

# Stoppen
make stop

# Logs WebUI
make logs

# Alles-in-1 (beide containers)
docker compose -f compose.all-in-one.yml up -d

# Upgraden naar nieuwste images
docker compose -f compose.webui-mac.yml pull && docker compose -f compose.webui-mac.yml up -d

# Verwijderen (mac setup)
./scripts/uninstall-mac.sh
```

## Compliance en governance

Zie de `policy/`-map voor sjablonen en checklists (Data handling, Toelichting modelkeuze, Logging/Audit, Toegang & Autorisatie, Menselijke tussenkomst, Risicobeoordeling). Deze zijn bedoeld om door jullie te worden ingevuld en afgestemd op de beleidsregels (bijv. Pensioenfederatie).

Aanbevolen uitgangspunten:
- Draai lokaal/offline waar mogelijk; verstuur geen klant- of vertrouwelijke data naar externe API's.
- Beperk toegang (accounts, sterke wachtwoorden, device-beveiliging).
- Leg vast welke modellen zijn toegestaan en waarvoor (use-case scope).
- Zorg voor logging/auditability en bewaartermijnen conform beleid.
- Documenteer updates van modellen en prompts (versiebeheer).

## Bekende varianten

- Apple Silicon en Intel Mac worden ondersteund. Native Ollama gebruikt Metal/Accelerate automatisch.
- Gebruik `host.docker.internal` (Docker Desktop) om de container met native Ollama te verbinden.

## Problemen oplossen

- Geen modellen zichtbaar in WebUI: Open WebUI → Settings → Models → Refresh; of `ollama pull <model>`.
- Poort bezet: pas `WEBUI_PORT` (of `ports`) aan in Compose en open de nieuwe URL.
- Docker compose niet gevonden: installeer Docker Desktop of gebruik `docker compose v2`.

---

Na review kun je dit project naar GitHub pushen en via PR's laten toetsen aan jullie beleidsregels.

## Publiceren op GitHub

1. Initialiseer git en maak een eerste commit:
   ```bash
   cd mac-ollama-openwebui-starter
   git init
   git add .
   git commit -m "Init: mac Ollama + Open WebUI starter"
   ```
2. Maak een lege GitHub-repo (via web) en koppel remote, bijvoorbeeld:
   ```bash
   git remote add origin git@github.com:<org>/<repo>.git
   git branch -M main
   git push -u origin main
   ```

Na het pushen draaien de GitHub Actions die de Compose-bestanden valideren. PR's gebruiken de meegeleverde compliance‑checklist.

### One-liner installatie (na publicatie)

Vervang `<org>/<repo>` door jullie pad:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/<org>/<repo>/main/scripts/install-mac.sh)"
```

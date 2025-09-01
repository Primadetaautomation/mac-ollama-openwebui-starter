# Gebruikershandleiding (Open WebUI)

## Starten
- Mac + native Ollama: `make start` en open `http://localhost:3000`
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


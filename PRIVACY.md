# Privacy Richtlijnen (Eindgebruikers)

Deze starter draait lokaal: prompts en antwoorden blijven op je eigen Mac. Volg onderstaande richtlijnen om privacy te waarborgen.

## Wat wel/niet invoeren
- Vermijd het invoeren van persoonsgegevens, BSN, medische of financiële details tenzij expliciet toegestaan.
- Anonimiseer data waar mogelijk (vervang namen met initialen of placeholders).
- Upload alleen documenten die binnen de afgesproken scope vallen.

## Verwerking
- Inference gebeurt lokaal via Ollama (geen externe AI‑API's door dit project).
- Het model kan gedrag vertonen zoals “hallucinaties”; controleer kritieke output altijd.

## Bewaren en verwijderen
- Open WebUI slaat chatgeschiedenis lokaal op in het data‑volume.
- Verwijder chats in de UI of verwijder het docker‑volume `openwebui-data` om alles te wissen.
- Zie `policy/Data-Handling.md` voor beleid rond retentie en verwijdering.

## Toegang
- Gebruik een sterk wachtwoord voor het eerste (admin) account.
- Deel geen accounts; maak aparte gebruikers aan indien nodig.

## Transparantie
- Markeer AI‑uitvoer in documenten waar dat relevant is.
- Vermeld het gebruikte model en versie bij rapportages.


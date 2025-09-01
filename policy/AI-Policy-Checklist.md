# AI Policy Checklist (Sjabloon)

Doel: houvast voor interne toetsing (bijv. conform beleidsregels Pensioenfederatie). Pas aan op jullie organisatie.

## 1. Doel & scope
- Use-cases beschreven en afgebakend
- Niet-toegestane use-cases expliciet uitgesloten

## 2. Modellen & versies
- Toegestane modellen (naam, versie, bron) vastgelegd
- Wijzigingen/versionering gedocumenteerd (changelog)
- Evaluatiecriteria per model (kwaliteit, bias, risico)

## 3. Data handling
- Inputclassificatie (PII/gevoelig) en maskering/anonymisatie-beleid
- Geen verzending naar externe API’s zonder expliciete toestemming
- Retentie- en verwijderbeleid (incl. backups)

## 4. Toegang & autorisatie
- Accounts verplicht; sterke wachtwoorden/SSO waar mogelijk
- Rolgebaseerde toegang (admin/user)
- Logging van administratieve acties

## 5. Logging & audit
- Wat wordt gelogd (events, fouten, modelversies)
- Bewaartermijnen en toegang tot logs
- Auditprocedure (wie/wanneer, reviewfrequentie)

## 6. Menselijke tussenkomst
- Beslisboom: wanneer is human-in-the-loop verplicht?
- Escalatie bij onzekerheid of lage confidence

## 7. Risico’s & mitigatie
- Juridische/compliance risico’s (AVG, IP, non-discrimination)
- Operationele risico’s (beschikbaarheid, dataverlies)
- Technische risico’s (prompt injection, data exfiltratie)

## 8. Transparantie & communicatie
- Gebruikersinformatie over beperkingen van AI-output
- Duidelijke markering van AI-gegenereerde content

## 9. Beveiliging
- Patch/upgrade-proces voor images en dependencies
- Geheimenbeheer (environment secrets, geen secrets in repo)
- Netwerkbeperkingen (alleen lokaal, geen open internet indien vereist)

## 10. Go-live & herbeoordeling
- UAT/acceptatiecriteria gehaald
- Periodieke herbeoordeling van modellen en policies


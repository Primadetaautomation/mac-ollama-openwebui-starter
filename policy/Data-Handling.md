# Data Handling (Sjabloon)

## Datastromen
- Invoer: gebruikersprompts, geüploade bestanden (maximale bestandstypen/scope)
- Verwerking: lokaal via Ollama; geen externe API-calls voor inferentie
- Uitvoer: antwoorden, bijlagen; opslagscope (chatgeschiedenis) beschrijven

## Classificatie & minimalisatie
- Classificeer data (openbaar/intern/vertrouwelijk/zeer vertrouwelijk)
- Verzamel minimale benodigde data voor de taak

## PII/AVG
- Richtlijnen voor persoonlijke data (maskeren/anonymiseren waar mogelijk)
- Verwerkersovereenkomst niet van toepassing bij volledig lokaal gebruik; documenteer dit

## Retentie
- Standaard bewaartermijn chatdata: XX dagen (invullen)
- Bewaartermijn logs: XX dagen (invullen)
- Procedure voor verwijderverzoeken (recht op vergetelheid)

## Toegang
- Toegang tot data beperkt op need-to-know basis
- Admin toegang gelogd en periodiek gereviewd

## Beveiliging
- Encryptie at-rest waar mogelijk (host/device)
- Backups versleuteld en bewaartermijnen vastgelegd


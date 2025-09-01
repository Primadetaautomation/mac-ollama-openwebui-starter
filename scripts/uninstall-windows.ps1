#!/usr/bin/env pwsh
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

Write-Host "[warn] Dit verwijdert de Open WebUI container en (optioneel) data volumes."

$ScriptDir = Split-Path -LiteralPath $PSCommandPath -Parent
$RepoRoot  = Split-Path -LiteralPath $ScriptDir -Parent
$composeFile = Join-Path $RepoRoot "compose.webui-mac.yml"

function Confirm($Prompt) {
  $resp = Read-Host "$Prompt [y/N]"
  return ($resp -eq 'y' -or $resp -eq 'Y')
}

if (Confirm "Containers stoppen en verwijderen (Windows setup)?") {
  if (Test-Path $composeFile) {
    docker compose -f "$composeFile" down | Out-Host
  } else {
    Write-Warning "Compose file niet gevonden: $composeFile"
  }
}

if (Confirm "Data volume 'openwebui-data' verwijderen (permanent verlies van UI data)?") {
  docker volume rm openwebui-data | Out-Host
}

if (Confirm "Ollama service stoppen (indien actief)?") {
  try {
    Stop-Service -Name "Ollama" -ErrorAction Stop
  } catch {
    Write-Host "[info] Service niet gevonden of geen rechten; sla over."
  }
}

Write-Host "[ok] Verwijderen gereed."


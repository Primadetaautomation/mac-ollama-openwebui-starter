#!/usr/bin/env pwsh
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

Write-Host "[info] Installatie (Windows): Ollama (native) + Open WebUI (Docker)"

# Resolve paths
$ScriptDir = Split-Path -LiteralPath $PSCommandPath -Parent
$RepoRoot  = Split-Path -LiteralPath $ScriptDir -Parent

# Check Docker Desktop
if (-not (Get-Command docker -ErrorAction SilentlyContinue)) {
  Write-Error "Docker Desktop niet gevonden. Installeer eerst: https://www.docker.com/products/docker-desktop/"
}

# Ensure Ollama installed (try winget if available)
if (-not (Get-Command ollama -ErrorAction SilentlyContinue)) {
  if (Get-Command winget -ErrorAction SilentlyContinue) {
    Write-Host "[info] Installeer Ollama via winget"
    try {
      winget install -e --id Ollama.Ollama --accept-source-agreements --accept-package-agreements | Out-Host
    } catch {
      Write-Warning "Kon Ollama niet installeren via winget. Download handmatig: https://ollama.com/download/windows"
    }
  } else {
    Write-Warning "winget niet gevonden. Installeer Ollama handmatig: https://ollama.com/download/windows"
  }
}

# Try to start Ollama Windows service if present
try {
  $svc = Get-Service -Name "Ollama" -ErrorAction Stop
  if ($svc.Status -ne 'Running') {
    Write-Host "[info] Start Ollama service"
    Start-Service -Name "Ollama"
  }
} catch {
  Write-Warning "Ollama service niet gevonden. Zorg dat Ollama draait (bijv. start Ollama app of 'ollama serve')."
}

# Defaults
if (-not $env:WEBUI_PORT) { $env:WEBUI_PORT = "3000" }
if (-not $env:OLLAMA_PORT) { $env:OLLAMA_PORT = "11434" }
if (-not $env:OLLAMA_BASE_URL) { $env:OLLAMA_BASE_URL = "http://host.docker.internal:$($env:OLLAMA_PORT)" }

Write-Host "[info] Pull Open WebUI image"
docker pull ghcr.io/open-webui/open-webui:main | Out-Host

$composeFile = Join-Path $RepoRoot "compose.webui-mac.yml"
if (-not (Test-Path $composeFile)) { throw "Compose file niet gevonden: $composeFile" }

Write-Host "[info] Start Open WebUI container op poort $($env:WEBUI_PORT)"
docker compose -f "$composeFile" up -d | Out-Host

Write-Host "[ok] Open WebUI draait: http://localhost:$($env:WEBUI_PORT)"
Write-Host "[hint] Eerste keer? Maak een account aan in de UI."


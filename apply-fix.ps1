# Apply Claude Code & VS Code Extension Proxy Fix
# This script sets the correct environment variables (ANTHROPIC_API_KEY and ANTHROPIC_BASE_URL) at the User level.
# This ensures that both Claude Code CLI and the VS Code Extension can read them properly.

$ErrorActionPreference = "Stop"

# Define default values
$ApiKey = "PROXY_MANAGED"
$BaseUrl = "http://127.0.0.1:15721"

Write-Host "=========================================" -ForegroundColor Cyan
Write-Host "  Claude Code VS Code Extension Fixer" -ForegroundColor Cyan
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host ""

# Set Environment Variables at User level (persists across restarts and is read by VS Code)
Write-Host "Setting User Environment Variables..." -ForegroundColor Yellow

[System.Environment]::SetEnvironmentVariable("ANTHROPIC_API_KEY", $ApiKey, [System.EnvironmentVariableTarget]::User)
[System.Environment]::SetEnvironmentVariable("ANTHROPIC_BASE_URL", $BaseUrl, [System.EnvironmentVariableTarget]::User)

# Also set them in the current session so they are active immediately in this terminal
$env:ANTHROPIC_API_KEY = $ApiKey
$env:ANTHROPIC_BASE_URL = $BaseUrl

Write-Host "Successfully configured variables:" -ForegroundColor Green
Write-Host "  [User] ANTHROPIC_API_KEY  = $ApiKey" -ForegroundColor Green
Write-Host "  [User] ANTHROPIC_BASE_URL = $BaseUrl" -ForegroundColor Green
Write-Host ""
Write-Host "-----------------------------------------"
Write-Host "IMPORTANT: For VS Code to pick up these changes:" -ForegroundColor Yellow
Write-Host "1. Completely close all running instances of VS Code." -ForegroundColor Yellow
Write-Host "2. Reopen VS Code." -ForegroundColor Yellow
Write-Host "3. Alternatively, launch VS Code from this terminal by running: code ." -ForegroundColor Yellow
Write-Host "=========================================" -ForegroundColor Cyan

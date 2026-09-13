<#
Install Lua, LuaRocks, and luacheck on Windows using Chocolatey or Scoop.
Run from an elevated PowerShell (Admin) for Chocolatey installs.
#>

$ErrorActionPreference = 'Stop'

function Write-Info($s){ Write-Host $s -ForegroundColor Cyan }

Write-Info "Checking for lua..."
if (Get-Command lua -ErrorAction SilentlyContinue) {
  Write-Info "lua already installed"
} else {
  if (Get-Command choco -ErrorAction SilentlyContinue) {
    Write-Info "Installing lua and luarocks via Chocolatey (requires Admin)..."
    choco install -y lua luarocks
  } elseif (Get-Command scoop -ErrorAction SilentlyContinue) {
    Write-Info "Installing lua and luarocks via Scoop..."
    scoop install lua luarocks
  } else {
    Write-Error "Neither Chocolatey nor Scoop found. Install one (https://chocolatey.org/install or https://scoop.sh/) or install Lua + LuaRocks manually."
    exit 1
  }
}

Write-Info "Checking for luacheck..."
if (Get-Command luacheck -ErrorAction SilentlyContinue) {
  Write-Info "luacheck already installed"
} else {
  if (Get-Command luarocks -ErrorAction SilentlyContinue) {
    Write-Info "Installing luacheck via luarocks..."
    luarocks install luacheck
  } else {
    Write-Error "luarocks not found after installing. Please ensure luarocks is on PATH or install luacheck manually with luarocks."
    exit 1
  }
}

Write-Info "Installation finished. Run tests\run-lua-tests.ps1 to verify the filters load."

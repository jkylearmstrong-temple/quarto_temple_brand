Windows: install Lua, LuaRocks, and luacheck (quick guide)

This repository includes PowerShell helpers to install and test Lua tooling on Windows.

Recommended methods (pick one):

1) Chocolatey (Admin recommended)

- Open PowerShell as Administrator
- Install Chocolatey (if you don't have it):
  Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
- Install Lua and LuaRocks:
  choco install -y lua luarocks
- Install luacheck via LuaRocks:
  luarocks install luacheck

2) Scoop (no admin required for user installs)

- Install Scoop (PowerShell):
  Set-ExecutionPolicy RemoteSigned -Scope CurrentUser; iwr -useb get.scoop.sh | iex
- Install Lua and LuaRocks:
  scoop install lua luarocks
- Install luacheck via LuaRocks:
  luarocks install luacheck

Repository helpers

- tests\install-lua-windows.ps1
  Attempts to install Lua + LuaRocks via Chocolatey or Scoop and then installs luacheck via luarocks.

- tests\run-lua-tests.ps1
  Smoke-loads the two Lua filters to validate they load without runtime errors.

Running tests locally

- From an elevated PowerShell (if required), run:
  .\tests\install-lua-windows.ps1
  .\tests\run-lua-tests.ps1

CI

The GitHub Actions workflow .github/workflows/lua-lint.yml runs luacheck and the smoke-load tests on Ubuntu. If CI failed earlier, re-run the failing job from the PR checks page.

Troubleshooting

- If luarocks is not on PATH after installation, restart PowerShell or add its bin directory to PATH.
- If installation via package manager is not possible, install Lua and LuaRocks manually following their upstream docs, then run:
  luarocks install luacheck

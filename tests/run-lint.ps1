# Run luacheck on titlepage Lua filters (Windows helper)
if (Get-Command luacheck -ErrorAction SilentlyContinue) {
  luacheck --no-color _extensions\titlepage\*.lua
  exit $LASTEXITCODE
} else {
  Write-Error "luacheck not found. Install luacheck (apt/brew/luarocks) or run the GitHub Actions workflow to lint."
  exit 1
}

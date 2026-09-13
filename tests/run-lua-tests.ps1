# Windows helper: smoke-load both Lua filters and exit non-zero on error
$ErrorActionPreference = 'Stop'

if (Get-Command lua -ErrorAction SilentlyContinue) {
  lua -e "pandoc = { utils = { stringify = function(x) return tostring(x) end }, MetaInlines = function(x) return x end, RawInline = function(...) return '' end, List = function(t) return t end } debug = { getinfo = function() return { source = '@_extensions/titlepage/' } end } dofile('_extensions/titlepage/coverpage-theme.lua')"
  lua -e "pandoc = { utils = { stringify = function(x) return tostring(x) end }, MetaInlines = function(x) return x end, RawInline = function(...) return '' end, List = function(t) return t end } debug = { getinfo = function() return { source = '@_extensions/titlepage/' } end } dofile('_extensions/titlepage/titlepage-theme.lua')"
  Write-Host "Lua filters loaded successfully"
} else {
  Write-Error "lua not found. Run tests\install-lua-windows.ps1 to install prerequisites, or run CI (GitHub Actions)."
  exit 1
}

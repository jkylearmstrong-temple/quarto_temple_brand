#!/usr/bin/env bash
set -euo pipefail

# stubbed pandoc + debug and load each filter in its own lua process
# Set LUA to pick a specific interpreter (e.g. LUA=lua5.4); defaults to "lua".
"${LUA:-lua}" -e "pandoc = { utils = { stringify = function(x) return tostring(x) end }, MetaInlines = function(x) return x end, RawInline = function(...) return '' end, List = function(t) return t end } debug = { getinfo = function() return { source = '@_extensions/titlepage/' } end } dofile('_extensions/titlepage/coverpage-theme.lua')"
"${LUA:-lua}" -e "pandoc = { utils = { stringify = function(x) return tostring(x) end }, MetaInlines = function(x) return x end, RawInline = function(...) return '' end, List = function(t) return t end } debug = { getinfo = function() return { source = '@_extensions/titlepage/' } end } dofile('_extensions/titlepage/titlepage-theme.lua')"

echo "Lua filters loaded successfully"

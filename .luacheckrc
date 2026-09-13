std = "lua54"

-- Pandoc Lua filters expose their filter functions (Meta, Pandoc, ...) as globals.
globals = { "Meta" }

-- Provided by pandoc at runtime; the filters only read it.
read_globals = { "pandoc" }

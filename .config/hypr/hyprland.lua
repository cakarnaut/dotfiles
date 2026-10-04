-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                         Source Files                        ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

-- https://wiki.hypr.land/configuring/
-- require() resolves "configs.x" to ./configs/x.lua; each file loads in its own
-- scope, so an error in one of them does not stop the others.

require("configs.animations")
require("configs.execs")
require("configs.decorations")
require("configs.env-variables")
require("configs.input")
require("configs.keybindings")
require("configs.monitors")
require("configs.variables")
require("configs.window-rules")
require("configs.workspace-rules")

-- Must stay last so the generated colours win. noctalia.lua is (re)written by
-- Noctalia's template engine; do not edit it by hand.

-- For Noctalia Color templates
require("noctalia").apply_theme()

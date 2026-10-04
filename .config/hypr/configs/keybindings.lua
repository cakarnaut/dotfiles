-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                         Keybinds                            ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

-- https://wiki.hypr.land/configuring/core/binds/
-- https://wiki.hypr.land/configuring/core/dispatchers/

local defaults = require("configs.defaults")
local mainMod  = defaults.mainMod

-- A layout message only exists on its own layout; sent anywhere else, Lua mode
-- pops a "Runtime error in lua" notification. So pick it by the active layout.
local function perLayout(actions)
    return function()
        local ws     = hl.get_active_special_workspace() or hl.get_active_workspace()
        local action = ws and actions[ws.tiled_layout]
        if action then
            hl.dispatch(action)
        end
    end
end

local function splitRatio(delta)
    return perLayout({
        master    = hl.dsp.layout("mfact " .. delta),
        dwindle   = hl.dsp.layout("splitratio " .. delta),
        scrolling = hl.dsp.layout("colresize " .. delta),
    })
end

local function toggleLayout()
    local layout = hl.get_config("general.layout") == "master" and "dwindle" or "master"
    hl.config({ general = { layout = layout } })
    hl.notification.create({ text = "Layout: " .. layout, timeout = 2000, icon = 1 })
end

-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                           General                           ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

hl.bind(mainMod .. " + SHIFT + R",      hl.dsp.exec_cmd("hyprctl reload"))
hl.bind(mainMod .. " + D",              hl.dsp.exec_cmd(defaults.menu))
hl.bind(mainMod .. " + SHIFT + Q",      hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + Return", hl.dsp.exec_cmd(defaults.fileManager))
hl.bind(mainMod .. " + SHIFT + Space",  hl.dsp.window.float())
hl.bind(mainMod .. " + F",              hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + Q",              hl.dsp.window.close())
hl.bind(mainMod .. " + Return",         hl.dsp.exec_cmd(defaults.term))
hl.bind(mainMod .. " + T",              hl.dsp.exec_cmd("footclient"))

hl.bind("CTRL + ALT + T",      hl.dsp.exec_cmd("footclient"))
hl.bind("CTRL + ALT + Return", hl.dsp.exec_cmd(defaults.term))

hl.bind(mainMod .. " + M",         splitRatio("+0.1"))
hl.bind(mainMod .. " + SHIFT + M", splitRatio("-0.1"))

hl.bind(mainMod .. " + SHIFT + Y", hl.dsp.exec_cmd(
    defaults.term .. [[ --class clock -T clock -e tty-clock -c -C 7 -r -s -f "%A, %B, %d"]]
))
hl.bind(mainMod .. " + Escape", hl.dsp.exec_cmd("hyprctl kill"))

-- Master layout
hl.bind(mainMod .. " + I",             perLayout({ master = hl.dsp.layout("addmaster") }))
hl.bind(mainMod .. " + J",             perLayout({ master = hl.dsp.layout("cyclenext") }))
hl.bind(mainMod .. " + K",             perLayout({ master = hl.dsp.layout("cycleprev") }))
hl.bind(mainMod .. " + CTRL + Return", perLayout({ master = hl.dsp.layout("swapwithmaster") }))

hl.bind(mainMod .. " + P",     hl.dsp.window.pseudo())
hl.bind(mainMod .. " + Space", toggleLayout)
hl.bind(mainMod .. " + F8",    require("configs.gamemode").toggle)

-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                        Special Keys                         ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd(defaults.volume.up),       { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd(defaults.volume.down),     { locked = true, repeating = true })
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd(defaults.volume.mute),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd(defaults.volume.micMute),  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd(defaults.brightness.up),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(defaults.brightness.down), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-- Backlight control
hl.bind(mainMod .. " + SHIFT + equal", hl.dsp.submap("backlight"))
hl.define_submap("backlight", function()
    hl.bind("equal",  hl.dsp.exec_cmd(defaults.brightness.up))
    hl.bind("minus",  hl.dsp.exec_cmd(defaults.brightness.down))
    hl.bind("escape", hl.dsp.submap("reset"))
end)

-- Volume control
hl.bind(mainMod .. " + equal", hl.dsp.submap("volume"))
hl.define_submap("volume", function()
    hl.bind("equal",  hl.dsp.exec_cmd(defaults.volume.up))
    hl.bind("minus",  hl.dsp.exec_cmd(defaults.volume.down))
    hl.bind("0",      hl.dsp.exec_cmd(defaults.volume.mute))
    hl.bind("9",      hl.dsp.exec_cmd(defaults.volume.micMute))
    hl.bind("escape", hl.dsp.submap("reset"))
end)

-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                     Windows and Focus                       ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

-- Resize
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.resize({ x = -50, y = 0,   relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.resize({ x = 50,  y = 0,   relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.resize({ x = 0,   y = -50, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.resize({ x = 0,   y = 50,  relative = true }), { repeating = true })

-- Move
hl.bind(mainMod .. " + CTRL + H", hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + CTRL + L", hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + CTRL + K", hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + CTRL + J", hl.dsp.window.move({ direction = "d" }))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "d" }))

-- Toggle "fake fullscreen": the app thinks it is fullscreen, the window stays tiled
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen_state({ internal = 0, client = 2, action = "toggle" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Groups
hl.bind(mainMod .. " + G", hl.dsp.group.toggle())
hl.bind("ALT + G",         hl.dsp.group.next())

-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                         Workspaces                          ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

-- Special workspace (no name = the default special workspace)
hl.bind(mainMod .. " + SHIFT + U", hl.dsp.window.move({ workspace = "special" }))
hl.bind(mainMod .. " + U",         hl.dsp.workspace.toggle_special())

-- Cycle workspaces on the current monitor
hl.bind(mainMod .. " + tab",         hl.dsp.focus({ workspace = "m+1" }))
hl.bind(mainMod .. " + SHIFT + tab", hl.dsp.focus({ workspace = "m-1" }))
hl.bind("ALT + tab",                 hl.dsp.focus({ workspace = "m+1" }))
hl.bind("ALT + SHIFT + tab",         hl.dsp.focus({ workspace = "m-1" }))

-- mainMod + [0-9]: switch, + CTRL: move window and follow, + SHIFT: move silently
for i = 1, 10 do
    local key = tostring(i % 10) -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,         hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + CTRL + " .. key,  hl.dsp.window.move({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, follow = false }))
end

hl.bind(mainMod .. " + CTRL + bracketleft",   hl.dsp.window.move({ workspace = "-1" }))
hl.bind(mainMod .. " + CTRL + bracketright",  hl.dsp.window.move({ workspace = "+1" }))
hl.bind(mainMod .. " + SHIFT + bracketleft",  hl.dsp.window.move({ workspace = "-1", follow = false }))
hl.bind(mainMod .. " + SHIFT + bracketright", hl.dsp.window.move({ workspace = "+1", follow = false }))

-- Scrolling layout: mouse wheel pans and moves focus between columns
hl.bind(mainMod .. " + mouse_down", perLayout({ scrolling = hl.dsp.layout("move +200") }))
hl.bind(mainMod .. " + mouse_up",   perLayout({ scrolling = hl.dsp.layout("move -200") }))
hl.bind(mainMod .. " + mouse_down", perLayout({ scrolling = hl.dsp.layout("focus r") }))
hl.bind(mainMod .. " + mouse_up",   perLayout({ scrolling = hl.dsp.layout("focus l") }))

-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                  Colour Picker / Screenshots                ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

hl.bind(mainMod .. " + O",         hl.dsp.exec_cmd(defaults.colorPicker))
hl.bind(mainMod .. " + SHIFT + O", hl.dsp.exec_cmd(defaults.term .. " --class hyprpicker --hold -e hyprpicker"))

hl.bind("Print",                      hl.dsp.exec_cmd(defaults.screenshot.now))
hl.bind(mainMod .. " + Print",        hl.dsp.exec_cmd(defaults.screenshot.in5))
hl.bind("SHIFT + Print",              hl.dsp.exec_cmd(defaults.screenshot.in10))
hl.bind("CTRL + Print",               hl.dsp.exec_cmd(defaults.screenshot.window))
hl.bind(mainMod .. " + CTRL + Print", hl.dsp.exec_cmd(defaults.screenshot.annotate))
hl.bind(mainMod .. " + S",            hl.dsp.exec_cmd([[grim -g "$(slurp)"]]))

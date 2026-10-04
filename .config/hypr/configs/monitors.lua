-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                    Monitor Configuration                    ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

-- Use `hyprctl monitors all` to get the info.
-- https://wiki.hypr.land/configuring/core/monitors/

hl.monitor({ output = "eDP-1",    mode = "preferred", position = "auto", scale = 1 })
hl.monitor({ output = "HDMI-A-2", mode = "preferred", position = "auto", scale = 0.83 })

hl.config({
    xwayland = {
        force_zero_scaling = true, -- Unscale XWayland
    },
})

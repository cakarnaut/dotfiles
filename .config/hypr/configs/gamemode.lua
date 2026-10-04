-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                           Game Mode                         ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

local M = {}

local active = false

function M.toggle()
    if active then
        hl.notification.create({ text = "Gamemode [OFF]", timeout = 5000, icon = 1, color = "rgb(d20f39)" })
        -- A reload restores every option and re-runs this file, resetting `active`.
        hl.exec_cmd("hyprctl reload")
        return
    end

    active = true

    hl.config({
        animations = { enabled = false },
        decoration = {
            rounding           = 0,
            fullscreen_opacity = 1.0,
            shadow             = { enabled = false },
            blur               = { enabled = false },
        },
        general = {
            gaps_in     = 0,
            gaps_out    = 0,
            border_size = 1,
        },
    })
    hl.animation({ leaf = "borderangle", enabled = false })

    hl.notification.create({ text = "Gamemode [ON]", timeout = 5000, icon = 1, color = "rgb(40a02b)" })
end

return M

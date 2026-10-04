-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                    Variables Configuration                  ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

-- https://wiki.hypr.land/configuring/core/config-options/

hl.config({
    general = {
        gaps_in  = 5,
        gaps_out = 10,

        border_size = 0,

        -- Overridden by the Noctalia theme (see hyprland.lua).
        col = {
            active_border   = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },

        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false,

        -- Please see https://wiki.hypr.land/configuring/extra/tearing/ before you turn this on
        allow_tearing = false,

        layout = "master",

        snap = {
            enabled = false,
        },
    },

    -- https://wiki.hypr.land/configuring/layouts/master-layout/
    master = {
        new_status = "master",
        mfact      = 0.5,
    },

    -- https://wiki.hypr.land/configuring/layouts/scrolling-layout/
    scrolling = {
        direction                = "right",
        fullscreen_on_one_column = true,
        follow_focus             = true,
        focus_fit_method         = 1,
        column_width             = 0.75,
    },

    misc = {
        force_default_wallpaper  = -1, -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo    = true,
        disable_splash_rendering = true,
        mouse_move_enables_dpms  = true,
        vrr                      = 3,
    },

    binds = {
        workspace_back_and_forth = true,
    },

    opengl = {
        nvidia_anti_flicker = true,
    },
})

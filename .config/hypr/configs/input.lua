-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                      Input Configuration                    ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

-- https://wiki.hypr.land/configuring/core/config-options/#input

hl.config({
    input = {
        kb_layout  = "tr",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        accel_profile  = "flat",
        force_no_accel = true,
        sensitivity    = 0.0, -- -1.0 - 1.0, 0 means no modification.
        left_handed    = false,

        numlock_by_default = true,

        touchpad = {
            natural_scroll       = true,
            tap_to_click         = true,
            drag_lock            = true,
            disable_while_typing = true,
        },
    },
})

-- The touchpad workspace swipe stays off simply because no hl.gesture() is defined.

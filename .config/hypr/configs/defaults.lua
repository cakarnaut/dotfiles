-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                     Defaults Configuration                  ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

local home = os.getenv("HOME")

return {
    mainMod     = "SUPER",
    scriptsDir  = home .. "/.config/hypr/scripts",

    term        = "ghostty +new-window",
    fileManager = "dolphin",
    menu        = "noctalia msg panel-toggle launcher",
    colorPicker = "hyprpicker -a",

    volume = {
        up      = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+",
        down    = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-",
        mute    = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle",
        micMute = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle",
    },

    -- Noctalia drives the backlight itself, no brightnessctl needed.
    brightness = {
        up   = "noctalia msg brightness-up",
        down = "noctalia msg brightness-down",
    },

    screenshot = {
        now      = "noctalia msg screenshot-fullscreen",
        in5      = "sleep 5 && noctalia msg screenshot-fullscreen",
        in10     = "sleep 10 && noctalia msg screenshot-fullscreen",
        window   = [=[grim -g "$(hyprctl -j activewindow | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"')" - | wl-copy]=],
        annotate = "noctalia msg screenshot-annotate",
    },
}

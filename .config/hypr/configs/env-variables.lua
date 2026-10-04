-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                   Environment Configuration                 ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

-- https://wiki.hypr.land/configuring/core/environment-variables/

-- Theming
hl.env("GDK_SCALE", "1")
hl.env("HYPRCURSOR_SIZE", "20")
hl.env("HYPRCURSOR_THEME", "Oreo Spark Lime Cursors")
hl.env("WLR_RENDERER_ALLOW_SOFTWARE", "1")

-- Toolkit backends
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")

-- Qt
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")

-- XDG
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("XDG_MENU_PREFIX", "plasma-")

-- NVIDIA PRIME offload (what prime-run sets)
hl.env("__NV_PRIME_RENDER_OFFLOAD", "1")
hl.env("__VK_LAYER_NV_optimus", "NVIDIA_only")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")

-- Aquamarine
hl.env("AQ_DRM_DEVICES", "/dev/dri/card2:/dev/dri/card1")

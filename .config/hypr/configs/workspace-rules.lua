-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                 Workspace Rules Configuration               ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

-- https://wiki.hypr.land/configuring/core/rules/workspace-rules/

hl.workspace_rule({ workspace = "1",  default_name = "duty", 	monitor="e-DP1" })
hl.workspace_rule({ workspace = "2",  default_name = "web",   	monitor="e-DP1"})
hl.workspace_rule({ workspace = "3",  default_name = "misc", 	monitor="e-DP1"})
hl.workspace_rule({ workspace = "4",  default_name = "res", 	monitor="e-DP1"})
hl.workspace_rule({ workspace = "5",  default_name = "code",   	layout = "scrolling" , monitor="e-DP1"})
hl.workspace_rule({ workspace = "6",  default_name = "helper", 	layout = "scrolling" , monitor="HDMI-A-2"})
hl.workspace_rule({ workspace = "7",  default_name = "linux", 	monitor="HDMI-A-2" })
hl.workspace_rule({ workspace = "8",  default_name = "game", 	monitor="HDMI-A-2"})
hl.workspace_rule({ workspace = "9",  default_name = "media", 	monitor="HDMI-A-2"})
hl.workspace_rule({ workspace = "10", default_name = "social" , monitor="HDMI-A-2"})

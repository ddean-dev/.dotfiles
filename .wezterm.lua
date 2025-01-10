-- Pull in the wezterm API
local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme = "Kanagawa (Gogh)"
config.font = wezterm.font("Hack")
config.font_size = 14
config.enable_tab_bar = false

return config

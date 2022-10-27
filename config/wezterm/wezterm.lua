local wezterm = require 'wezterm';

return {
    font = wezterm.font("Comic Code"),
    default_prog = {"/usr/bin/fish", "-l"},
    hide_tab_bar_if_only_one_tab = true,
}

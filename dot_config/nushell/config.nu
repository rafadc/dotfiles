# config.nu
#
# Installed by:
# version = "0.107.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# Nushell sets "sensible defaults" for most configuration settings,
# so your `config.nu` only needs to override these defaults if desired.
#
# You can open this file in your default editor using:
#     config nu
#
# You can also pretty-print and page through the documentation for configuration
# options using:
#     config nu --doc | nu-highlight | less -R

$env.config.show_banner = false

$env.config.buffer_editor = "nvim"
$env.EDITOR = "nvim"
$env.VISUAL = "nvim"


$env.SSH_AUTH_SOCK = $"/Users/($env.USER)/Library/Containers/com.bitwarden.desktop/Data/.bitwarden-ssh-agent.sock"

# Direnv
$env.config = {
  hooks: {
    pre_prompt: [{ ||
      if (which direnv | is-empty) {
        return
      }

      direnv export json | from json | default {} | load-env
      if 'ENV_CONVERSIONS' in $env and 'PATH' in $env.ENV_CONVERSIONS {
        $env.PATH = do $env.ENV_CONVERSIONS.PATH.from_string $env.PATH
      }
    }]
  }
}

# Aliases
alias l = ls
alias v = nvim
alias g = nvim -c "lua require('neogit').open()" -c "autocmd TabClosed * if tabpagenr('$') == 1 | quit | endif"
alias zj = zellij
alias cm = chezmoi

def --env mkcd [dir: string] {
    mkdir $dir
    cd $dir
}

# startup
mkdir ($nu.data-dir | path join "vendor/autoload")

zoxide init nushell | save -f ($nu.data-dir | path join "vendor/autoload/zoxide.nu")
mise activate nu | save -f ($nu.data-dir | path join "vendor/autoload/mise.nu")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

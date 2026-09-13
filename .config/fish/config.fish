# ==============================================================================
# CLI tools
# ==============================================================================
# source /usr/share/cachyos-fish-config/cachyos-config.fish
starship init fish | source

alias hx="helix"
alias cak="kak"
set -gx EDITOR kak
set -gx PAGER "less -R"

# alias dotz='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dot="dotz status"

if command -q eza
    alias ls="eza --icons"
    alias ll="eza -l --icons --git"
    alias la="eza -a --icons"
    alias tree="eza --tree --icons"
end

if command -q bat
    alias cat="bat"
    set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"
end

if command -q zoxide
    zoxide init fish | source
    alias cd="z"
end

if command -q rg
    alias grep="rg"
end
if command -q fd
    alias find="fd"
end

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."




# ==============================================================================
# Environments and Paths
# ==============================================================================


set -gx XDG_MENU_PREFIX "arch-"
fish_add_path ~/.local/bin/
fish_add_path $HOME/.cargo/bin
fish_add_path ~/.npm-global/bin

# ==============================================================================
# Claude Code / AIHubMix Settings
# ==============================================================================
if test -f ~/.config/fish/secrets.fish
    source ~/.config/fish/secrets.fish
end

# ==============================================================================
# Functiosn
# ==============================================================================
function fish_greeting
end

function mkcd
    mkdir -p $argv; and cd $argv
end

function ex
    if test -f $argv[1]
        switch $argv[1]
            case '*.tar.bz2'; tar xjf $argv[1]
            case '*.tar.gz';  tar xzf $argv[1]
            case '*.bz2';     bunzip2 $argv[1]
            case '*.rar';     unrar x $argv[1]
            case '*.gz';      gunzip $argv[1]
            case '*.tar';     tar xvf $argv[1]
            case '*.tbz2';    tar xjf $argv[1]
            case '*.tgz';     tar xzf $argv[1]
            case '*.zip';     unzip $argv[1]
            case '*.Z';       uncompress $argv[1]
            case '*.7z';      7z x $argv[1]
            case '*';         echo "'$argv[1]' geçerli bir arşiv formatı değil"
        end
    else
        echo "'$argv[1]' geçerli bir dosya değil"
    end
end

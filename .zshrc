# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="simple"
#source $HOME/.config/zsh/headline.zsh-theme
#source $HOME/.config/zsh/ziraga.zsh-theme

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  fzf
  fzf-tab
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"
export TERM=xterm-256color
export FZF_DEFAULT_COMMAND="fd --type f"
export FZF_DEFAULT_OPTS="--bind tab:up,btab:down,ctrl-space:toggle"
zstyle ':fzf-tab:*' fzf-flags \
  --exact \
  --bind='tab:transform:((FZF_MATCH_COUNT == 1)) && echo accept || echo down' \
#  --bind='bspace:backward-delete-char,ctrl-h:backward-delete-char'

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# User aliases
alias l='ls -CF'
alias la='ls -A'
alias lt='ls -ahlFt'
alias ll='ls -ahlF'
alias llh='ls -alF'
alias lf='du -ahlc --max-depth=1'
alias lfh='du -alc --max-depth=1'

alias vi='nvim'
alias lg='lazygit'
alias bfg='java -jar ~/.cache/usr/bfg-1.15.0.jar'

# IDE aliases
# alias vivado23_1="/opt/Xilinx/Vivado/2023.1/bin/vivado"
# alias vivado24_1="/opt/Xilinx/Vivado/2024.1/bin/vivado"
# alias vivado24_2="/opt/Xilinx/Vivado/2024.2/bin/vivado"
#
# alias vitis23_1="/opt/Xilinx/Vitis/2023.1/bin/vivado"
# alias vitis24_1="/opt/Xilinx/Vitis/2024.1/bin/vivado"
# alias vitis24_2="/opt/Xilinx/Vitis/2024.2/bin/vivado"
#
# alias petalinux23_1="source /opt/petalinux/v2023.1/settings.sh ; zsh"
# alias petalinux24_1="source /opt/petalinux/v2024.1/settings.sh ; zsh"
# alias petalinux24_2="source /opt/petalinux/v2024.2/settings.sh ; zsh"

# vivado & petalinux configs
# echo
# echo "------------------------------------------"
# echo "=====  PETALINUX  2024.1  WORKSPACE  ====="
# echo "----------------+========+----------------"
# source /opt/petalinux/v2024.1/settings.sh
# source /tools/Xilinx/Vivado/2024.1/settings64.sh
# echo "------------------------------------------"
# echo

# pyenv configs
# export PYENV_ROOT="$HOME/.pyenv"
# [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init - zsh)"
# eval "$(pyenv init --path)"

# starts rc
# source ~/.profile
# xhost +localhost 1> /dev/null
# fastfetch

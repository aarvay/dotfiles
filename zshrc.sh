# Load antigen
source ~/code/aarvay/dotfiles/antigen/antigen.zsh

# Use oh-my-zsh
antigen use oh-my-zsh

# Set prompt
PURE_PROMPT_SYMBOL=λ
antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure

# Install the plugins
antigen bundle rupa/z # z FTW!
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting

# Tell antigen that you're done.
antigen apply

# Load asdf completions
. $HOME/.asdf/completions/asdf.bash

# My custom aliases
alias em="emacsclient -n -c"

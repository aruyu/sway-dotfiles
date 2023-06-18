#!/bin/zsh
# ziraga ZSH Prompt


autoload -U colors && colors

function my_git_prompt() {
  tester=$(git rev-parse --git-dir 2> /dev/null) || return

  INDEX=$(git status 2> /dev/null)
  STATUS=""
  if $(echo "$INDEX" | grep -i 'nothing to commit' &> /dev/null) ; then
      STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_CLEAN"
  fi
  # is branch ahead?
  if $(echo "$(git log origin/$(current_branch)..HEAD 2> /dev/null)" | grep '^commit' &> /dev/null); then
    STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_AHEAD"
  fi

  # is anything staged?
  if $(echo "$INDEX" | grep -E -e 'Changes to be committed' &> /dev/null); then
    STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_STAGED"
  fi

  # is anything unstaged?
  if $(echo "$INDEX" | grep -E -e 'Changes not staged' &> /dev/null); then
    STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_UNSTAGED"
  fi

  # is anything untracked?
  if $(echo "$INDEX" | grep 'Untracked files' &> /dev/null); then
    STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_UNTRACKED"
  fi

  # is anything unmerged?
  if $(echo "$INDEX" | grep -E -e 'unmerged' &> /dev/null); then
    STATUS="$STATUS$ZSH_THEME_GIT_PROMPT_UNMERGED"
  fi

  if [[ -n $STATUS ]]; then
    STATUS=" $STATUS"
  fi

  echo "$ZSH_THEME_GIT_PROMPT_PREFIX$(my_current_branch) branch$STATUS$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

function my_current_branch() {
  echo $(current_branch || echo "(no branch)")
}

function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || hostname -s
}

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '® ' && return
    echo '○ '
}

PROMPT='╭─ %{$FG[040]%}%n%{$reset_color%} %{$FG[098]%}at%{$reset_color%} %{$FG[033]%}$(box_name)%{$reset_color%} %{$FG[098]%}in%{$reset_color%} %~ $(my_git_prompt)
╰─ $(virtualenv_info)$(prompt_char)'
#160 is red
#033 is blue
ZSH_THEME_GIT_PROMPT_PREFIX="%{$FG[098]%}on the%{$reset_color%} %{$fg[255]%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$FG[040]%} ✔ "
ZSH_THEME_PROMPT_RETURNCODE_PREFIX="%{$fg_bold[red]%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg_bold[magenta]%}↑ "
ZSH_THEME_GIT_PROMPT_STAGED="%{$FG[040]%}● Files Staged "
ZSH_THEME_GIT_PROMPT_UNSTAGED="%{$FG[178]%}● Files Unstaged "
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[red]%}● Files Untracked "
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg_bold[red]%}✕ "
ZSH_THEME_GIT_PROMPT_SUFFIX=" %{$FG[040]%}  %{$reset_color%}"

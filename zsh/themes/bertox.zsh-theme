wrap() {
    echo -n "%{$fg[$1]%B%}[%{%b%}$2%{$fg[$1]%B%}]%{%b%}"
}
prompt_who(){
    wrap yellow "%{$fg[blue]%}%n@%m"
}
prompt_pwd() {
    wrap yellow "%{$fg_no_bold[blue]%}%~"
}

# SSH: 
prompt_ssh() {
    if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
        echo -n "%{$fg[black]$bg[blue]%B%} SSH: %{%k%b%}"
    fi
}

# Status:
# - was there an error
# - am I root
# - are there background jobs?
prompt_status() {
  local symbols
  symbols=()
  [[ $RETVAL -ne 0 ]] && symbols+="%{%F{red}%}✘"
  [[ $UID -eq 0 ]] && symbols+="%{%F{yellow}%}⚡"
  [[ $(jobs -l | wc -l) -gt 0 ]] && symbols+="%{%F{cyan}%}⚙"

  [[ -n "$symbols" ]] && wrap yellow "$symbols"
}

# Virtualenv: current working virtualenv
prompt_virtualenv() {
  local virtualenv_path="$VIRTUAL_ENV"
  if [[ -n $virtualenv_path && -n $VIRTUAL_ENV_DISABLE_PROMPT ]]; then
      wrap yellow "%{$fg[white]%}venv:`basename $virtualenv_path`"
  fi
}

# Git: branch/detached head, dirty status
prompt_git() {
  local ref dirty mode repo_path
  repo_path=$(git rev-parse --git-dir 2>/dev/null)

  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    dirty=$(parse_git_dirty)
    ref=$(git symbolic-ref HEAD 2> /dev/null) || ref="➦ $(git show-ref --head -s --abbrev |head -n1 2> /dev/null)"
    
    if [[ -e "${repo_path}/BISECT_LOG" ]]; then
      mode=" <B>"
    elif [[ -e "${repo_path}/MERGE_HEAD" ]]; then
      mode=" >M<"
    elif [[ -e "${repo_path}/rebase" || -e "${repo_path}/rebase-apply" || -e "${repo_path}/rebase-merge" || -e "${repo_path}/../.dotest" ]]; then
      mode=" >R>"
    fi

    setopt promptsubst
    autoload -Uz vcs_info

    zstyle ':vcs_info:*' enable git
    zstyle ':vcs_info:*' get-revision true
    zstyle ':vcs_info:*' check-for-changes true
    zstyle ':vcs_info:*' stagedstr '✚'
    zstyle ':vcs_info:git:*' unstagedstr '●'
    zstyle ':vcs_info:*' formats ' %u%c'
    zstyle ':vcs_info:*' actionformats ' %u%c'
    vcs_info
    git_prompt="${ref/refs\/heads\// }${vcs_info_msg_0_%% }${mode}"

    if [[ -n $dirty ]]; then
      wrap red "%{$fg[red]%}$git_prompt"
    else
      wrap green "%{$fg[default]%}$git_prompt"
    fi

  fi
}

prompt_end() {
    #echo "%{$reset_color%} %(!.#.$) %{%f%}"
    echo "%{$reset_color%} %(!.#.$) "
}

build_prompt() {
    RETVAL=$?
    prompt_ssh
    prompt_status
    prompt_who
    prompt_pwd
    prompt_end
}

build_rprompt() {
    RETVAL=$?
    prompt_virtualenv
    prompt_git
}
#PROMPT='%f%b%k$fg[blue][$fg[red]some text$fg[blue]]$reset_color $ '
#PROMPT="$(wrap blue $( test )) %{$fg_no_bold[blue]%}[%~] $(prompt_end)"

PROMPT='%{%f%b%k%}$(build_prompt)'
RPROMPT='$(build_rprompt)'

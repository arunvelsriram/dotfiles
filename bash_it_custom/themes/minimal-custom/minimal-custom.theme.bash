#!/usr/bin/env bash

SCM_THEME_PROMPT_PREFIX="${cyan}[${green}"
SCM_THEME_PROMPT_SUFFIX="${cyan}]"
SCM_THEME_PROMPT_DIRTY=" ${red}✗"
SCM_THEME_PROMPT_CLEAN=" ${green}✓"

prompt() {
  local kubecontext="${cyan}[${yellow}$(kube-tmux '{{ .Context }}')${cyan}::${yellow}$(kube-tmux '{{ .Namespace }}')${cyan}]${reset_color}"
  local prompt_char="${cyan}\$${reset_color}"
  PS1="$(scm_prompt_info)${reset_color}${kubecontext} ${cyan}\W${reset_color} ${prompt_char} "
}

safe_append_prompt_command prompt

SCM_THEME_PROMPT_CLEAN="${green} ✓${reset_color}"
SCM_THEME_PROMPT_PREFIX=" "
SCM_THEME_PROMPT_SUFFIX=""
GIT_SHA_PREFIX="${blue}"
GIT_SHA_SUFFIX="${reset_color}"

function prompt() {
    local workdir="${green}\w${reset_color}"
    local git_branch="${cyan}$(scm_prompt_info)${reset_color}"
    local prompt_char="${purple}>_${reset_color} "

    PS1="\n${workdir} ${git_branch}\n${prompt_char}"
}

safe_append_prompt_command prompt

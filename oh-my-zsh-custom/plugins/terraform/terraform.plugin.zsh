alias tg='terragrunt'
alias tf='terraform'

# find and clean .terragrunt-cache directories
tgcacheclean() {
    local files=$(fd -HI .terragrunt-cache)
    local response
    [ -z "$files" ] && echo "Nothing to clean" && return
    echo $files
    response=$(yesno "Delete All ?")
    [ $response = "y" ] && rm -rfv $(echo $files | xargs)
}

# find and clean local tfstate files
tfstateclean() {
    local files=$(fd -HI terraform.tfstate)
    local response
    [ -z "$files" ] && echo "Nothing to clean" && return
    echo $files
    response=$(yesno "Delete All ?")
    [ $response = "y" ] && rm -rfv $(echo $files | xargs)
}

tgjson() {
  terragrunt render-json --terragrunt-working-dir=${1:-.} --terragrunt-json-out=/dev/stdout | jq
}

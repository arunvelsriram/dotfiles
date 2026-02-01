alias findsubscription='az account list | jq -r ".[] | [.id, .name] | @tsv" | fzf --height=20 --ansi --reverse'

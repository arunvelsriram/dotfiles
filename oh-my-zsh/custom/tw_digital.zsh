# SSH to any machine through the bounce box eg. bounce agent09 will SSH in to goagent09
alias "bounce=ssh -t -t -C -A bounce@bounce.webteam.thoughtworks.com 'bounce-to arunvelsriram $*'"

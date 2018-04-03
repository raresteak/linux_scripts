TMOUT=6000
export TMOUT
HISTSIZE=20000
export HISTSIZE



export JAVA_HOME=/opt/jre1.8.0_144
export PATH=$PATH:/opt/jre1.8.0_144/bin:~/bin

alias ccat='pygmentize -O bg=dark,style=colorful'

#http://termbin.com/
alias tb="nc termbin.com 9999"

alias ~="cd ~"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias .......="cd ../../../../../.."
alias ........="cd ../../../../../../.."
alias .........="cd ../../../../../../../.."
alias ..........="cd ../../../../../../../../.."

alias myip="curl http://ipecho.net/plain; echo"

# Serving HTTP on 0.0.0.0 port 8000 with Python 2.x
alias simpleServer='python -m SimpleHTTPServer'

# Disk Utilization sorted smallest to largest
alias big='du -sk * | sort -n'


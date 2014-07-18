# for M-x shell

alias ls='gls --color=auto'
alias grep='grep --color=auto'
export PS1="\t \W \\$ "

function my_ext_ip
{
    curl -s http://whatismyip.akamai.com/
}

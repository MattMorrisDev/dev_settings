export PS1="[\[\e[36;40m\]\u\[\e[m\]@\[\e[33;40m\]\w\[\e[m\]]:\\$ "
LSCOLORS=exfxcxdxbxegedabagacad
HISTFILESIZE=10000000

alias l="ls"
alias lt='ls -alrt'
alias ll='ls -al'
alias ls='ls -GFh'
alias f="open ."
alias cls="clear"
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'

alias gco="git checkout --recurse-submodules"
alias gpl="git pull --recurse-submodules"
alias s="git s"
alias br='git br'
alias b='git br'
alias gl='git log'
alias fr='git fetch && git rebase origin/master'


alias editBashProfile='vim ~/.bash_profile'
alias srcBashProfile='source ~/.bash_profile'


# cd to directory currently open in Finder
cdf() {
    target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
    if [ "$target" != "" ]; then
        cd "$target"; pwd
    else
        echo 'No Finder window found' >&2
    fi
}



defaults write com.apple.finder ShowAllFiles TRUE
defaults write com.apple.finder AppleShowAllFiles YES
defaults write com.apple.LaunchServices LSQuarantine -bool false
defaults write com.apple.BezelServices kDimTime -int 300
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
defaults write com.apple.finder FXPreferredViewStyle -string “Nlsv”


killPort () {
        kill -9 $(lsof -i:$1)
}


movToMp4 () {
ffmpeg -i $1 -vcodec copy -acodec copy $2.mp4
}

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

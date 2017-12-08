#Aliases
alias dir='ls -alF --color'
alias ll='dir'
alias pic='ps ax'
alias cde='cd /etc'
alias emacs_c='emacs -nw'
alias ls='ls --color'
alias ifconfig='/sbin/ifconfig'
alias iptraf='sudo /usr/sbin/iptraf'
alias reboot='sudo /sbin/reboot'
alias shutdown='sudo /sbin/shutdown -h now'
alias mosquitto='sudo /usr/sbin/mosquitto'
alias node='sudo /usr/bin/node'
alias ip='sudo /sbin/ip'
alias route='sudo /sbin/route'
alias lspci='sudo /sbin/lspci'
alias lsusb='sudo /sbin/lsusb'
alias openocd='sudo openocd'
alias mount='sudo /bin/mount'
alias umount='sudo /bin/umount'
alias lsusb='sudo /usr/bin/lsusb'
alias minicom='sudo /usr/bin/minicom -c on'
alias findf='/usr/bin/find -iname'

#Programs in $PATH
export PATH=$PATH:/usr/local/sbin/gcc-arm-none-eabi-5_2-2015q4/bin

# Git branch in prompt.

parse_git_branch() {

    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'

}

export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

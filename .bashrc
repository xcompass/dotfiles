[ -n "$PS1" ] && source ~/.bash_profile;

# added by travis gem
#[ -f /Users/compass/.travis/travis.sh ] && source /Users/compass/.travis/travis.sh


[ -f ~/.fzf.bash ] && source ~/.fzf.bash

source /Users/compass/.docker/init-bash.sh || true # Added by Docker Desktop

export CLICOLOR=1
export LSCOLORS=Cxfxdxdxhxegedabagacad
export BASH_SILENCE_DEPRECATION_WARNING=1

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'

source /usr/local/bin/virtualenvwrapper.sh

#for FreeSurfer:
export FREESURFER_HOME=/Applications/freesurfer

#for tmux
export ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX=YES

# miniconda path
# export PATH="$HOME/miniconda3/bin:$PATH"  # commented out by conda initialize

# python packages
export PYTHONPATH=$PYTHONPATH:/Users/pferreira/Documents/1_work/2_code/spectrome/
export PYTHONPATH=$PYTHONPATH:/Users/pferreira/Documents/1_work/2_code/tf_utils/
export PYTHONPATH=$PYTHONPATH:/Users/pferreira/Documents/1_work/2_code/cortography/
export PYTHONPATH=$PYTHONPATH:/Users/pferreira/Documents/1_work/2_code/knee-deploy/

#ruby
export PATH=/usr/local/opt/ruby/bin:$PATH
export PATH=$HOME/.gem/ruby/2.7.0/bin:$PATH
#export LDFLAGS="-L/usr/local/opt/ruby/lib"
#export CPPFLAGS="-I/usr/local/opt/ruby/include"
#export PKG_CONFIG_PATH="/usr/local/opt/ruby/lib/pkgconfig"

#aliases
## logins
alias rscp='rsync -avz -e ssh'
alias comet='ssh damascus@comet-ln2.sdsc.xsede.org'
alias comet-gpu='ssh damascus@comet-gpu.sdsc.xsede'
alias mNorms='python /Users/pferreira/Documents/1_work/2_code/mNormsFS53/mNormsFS53/mNormsFS53.py'
alias injavis='java -jar /Users/pferreira/Documents/1_work/2_code/injavis/injavis/bin/injavis.jar'
alias rsachin='ssh -Y rajlab@10.19.79.61'
alias sachin='ssh pablodamasceno@10.19.79.61'
alias stampede='ssh -X pablod@stampede2.tacc.xsede.org'
alias wynton='ssh pferreira@plog1.wynton.ucsf.edu'
alias tantrum='ssh pferreira@tantrum.radiology.ucsf.edu'
alias torch='ssh -Y torch.radiology.ucsf.edu'
alias cronus='ssh cronus.radiology.ucsf.edu'
alias bone='ssh bone-vm1.radiology.ucsf.edu'
alias brain='ssh -X brain-vm1.radiology.ucsf.edu'

## others
alias ll="ls -lth"
alias rscp='rsync -avz -e ssh'
alias source_freesurfer='source $FREESURFER_HOME/SetUpFreeSurfer.sh'

#functions
function hist { history | grep "$1"; }

#fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}
# fh - search in your command history and execute selected command
fh() {
  eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/pferreira/google-cloud-sdk/path.bash.inc' ]; then . '/Users/pferreira/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/pferreira/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/pferreira/google-cloud-sdk/completion.bash.inc'; fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/pferreira/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/pferreira/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/pferreira/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/pferreira/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash" || true

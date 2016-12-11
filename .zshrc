ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(git ssh-agent)

source $ZSH/oh-my-zsh.sh

export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin
export EDITOR=vim

ssh-add ~/.ssh/github  &> /dev/null
ssh-add ~/.ssh/aws_ct_key.pem &> /dev/null

alias pjt='python -m json.tool'
alias ct='cd ~/dev/clustertruck';
alias ct-web='cd ~/dev/clustertruck/clustertruck-web-react';
alias ct-api='cd ~/dev/clustertruck/clustertruck-api';
alias ct-salt="cd /Users/dmcfadden/dev/clustertruck/clustertruck-salt";
alias vssh='ct-api && vagrant ssh'

export ANDROID_HOME=/Users/dmcfadden/Library/Android/sdk;

function salt_sync {
  echo "syncing local salt to salt";
  rsync -avz --delete /Users/dmcfadden/dev/clustertruck/clustertruck-salt/salt ubuntu@salt:;
  rsync -avz --delete /Users/dmcfadden/dev/clustertruck/clustertruck-salt/pillar ubuntu@salt:;
}

function salt_sync_stage {
  echo "syncing local salt to salt-stage";
  rsync -avz --delete /Users/dmcfadden/dev/clustertruck/clustertruck-salt/salt root@salt-stage:;
  rsync -avz --delete /Users/dmcfadden/dev/clustertruck/clustertruck-salt/pillar root@salt-stage:;
}

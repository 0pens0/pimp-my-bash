#!/bin/bash
apt-get -y install jq

#Install pv for the demo-scripts
apt-get -y install pv

#Install kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

#docker
sudo apt install docker

#Helm
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

#Install kube-ps1
git clone https://github.com/jonmosco/kube-ps1
chmod +x kube-ps1/kube-ps1.sh

#source ~/kube-ps1/kube-ps1.sh
#PS1='[\e[0;33m\w $(kube_ps1)]\$ '

#Install zsh
sudo apt install zsh

#Install ohmyzsh
sudo sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#Change Theme
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/g' ~/.zshrc
 
#Change default shell
sudo chsh -s $(which zsh)


#Alias
alias kubectx='kubectl config get-contexts'
alias kubeset='kubectl config use-context'
alias k=kubectl
alias h='history |grep'
alias getcon='kubectl config get-contexts'
alias usecon='kubectl config use-context'
alias delcon='kubectl config delete-context'
alias recon='kubectl config rename-context'
alias usens='k config set-context --current --namespace='
alias tdep='tanzu resource deploy'
alias tsvc='tanzu service instance'
alias tpush='tanzu resource deploy --from-buid $(tanzu build)'
alias tctx='tanzu context'
alias tspace='tanzu space'
alias tproj='tanzu project'
alias tops='tanzu ops'
alias tbuild='tanzu build'

PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%F{yellow}%1~%f%b%)'
source ~/kube-ps1/kube-ps1.sh
PROMPT='$(kube_ps1)'$PROMPT

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{240}(%b)%r%f'
zstyle ':vcs_info:*' enable git



#If zsh not working run 'zsh' to test and add the follwing to .bashrc #
#https://blog.joaograssi.com/windows-subsystem-for-linux-with-oh-my-zsh-conemu/
#if test -t 1; then
#exec zsh
#fi

#To uninstall zsh https://askubuntu.com/questions/963874/uninstall-oh-my-zsh
#sudo chmod 777 ~/.oh-my-zsh/tools/uninstall.sh
#~/.oh-my-zsh/tools/uninstall.sh

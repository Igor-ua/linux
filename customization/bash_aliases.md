**Custom Ubuntu .bash_aliases config**

```
if xhost >& /dev/null ; then
	alias mc='EDITOR=subl mc'
else
	alias mc='EDITOR=nano mc';
fi

function rm_duplicates_from_path {
if [ -n "$PATH" ]; then
  old_PATH=$PATH:; PATH=
  while [ -n "$old_PATH" ]; do
    x=${old_PATH%%:*}       # the first remaining entry
    case $PATH: in
      *:"$x":*) ;;          # already there
      *) PATH=$PATH:$x;;    # not there yet
    esac
    old_PATH=${old_PATH#*:}
  done
  PATH=${PATH#:}
  unset old_PATH x
fi
}

rm_duplicates_from_path

alias ports='sudo netstat -naptu | grep LISTEN'
alias cli='redis-cli -p 6400'
alias build='mvn clean install -Dmaven.test.skip=true'
alias bdev='mvn clean install -Dmaven.test.skip=true -Pdevelopment'
alias dep='mvn dependency:tree'
alias ant-build='ant dist -Dskip.patches=true -d'
alias oshift='ssh key@domain'
# Win-like cd..
alias cd..='cd ..'
alias hg-log='hg log --limit 5'
alias clean-recent='rm ~/.local/share/recently-used.xbel'
alias aa='ant all'
alias services='sudo service --status-all | grep +'

alias sb='virtualbox startvm "builder Ubuntu x32 (XR)" --type headless'
alias se='systemctl list-unit-files | grep enabled'
alias sr='systemctl | grep running'
# systemctl list-units --type service
# systemctl list-dependencies --type service

# Example of the tail -f:
# alias file-log='tail -f ~/path/to/log.log'

export SYBASE_JRE6="/home/sybase/shared/JRE-6_0_6_64BIT"
export SYBROOT="/home/sybase"

export JAVA_HOME
export M2_HOME

PATH=$PATH:$JAVA_HOME/bin
PATH=$PATH:$M2_HOME/bin

# Docker
alias dcu='docker-compose up'
alias dcd='docker-compose down'
alias dps='docker ps'
alias dcc='docker rm $(docker ps -aq)'
alias dci='docker rmi $(docker images --filter "dangling=true" -q --no-trunc)'
alias dcn='docker network prune'
alias procd='ps aux | grep docker | tr -s " " | cut -d" " -f2'

function datt {
	docker exec -it $1 bash
}

function ds {
	docker stop $1
}

function drmi {
	# executes only with 1 param
	if [ $# -eq 1 ]; then
    	docker rmi -f $(docker images | grep $1 | awk '{print $3}')
    else
    	# executes with any other amount of params
    	echo "Cann't execute function with params not equal to one"
	fi
}

function run_portainer() {
  docker volume create portainer_data
  echo 'Data created'
  docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer
  echo 'Portainer runed'
}

rc-update () {
	cd ~/path/to
	build
	cd ~/another/path/to/target
	\cp file.jar ~/third/path/to/file.jar
	~/path/bin/load.sh
	~/path/bin/startup.sh run
}

proxy-set () {
	echo Proxy set
	export http_proxy=http://user:password@ip:port/
	export https_proxy=https://user:password@ip:port/
}

proxy-unset () {
	echo Proxy unset
	unset http_proxy
	unset https_proxy
}

function rdesktop_proxy () {
  socat TCP4-LISTEN:51515,bind=127.0.0.1,reuseaddr PROXY:proxy-ip:target-domain-or-ip:target-port,proxyport=proxy-port,proxyauth=user:password &
  xfreerdp 127.0.0.1:51515
}

function rb() {
    . ~/.bash_aliases
    rm_duplicates_from_path
    echo 'DONE'
}

function bash-help () {
	cat ~/.bash_aliases
}

function p3 () {
	echo "[!]........Pushing into p3 rev: " $1
	hg push -f p3 -r $1
	echo "[!]........Done"
}

function p2 () {
	echo "[!]........Pushing into p2 rev: " $1
	hg push -f p2 -r $1
	echo "[!]........Done"
}

function wtt () {
	proxy-set
	curl wttr.in/Dnepr
	proxy-unset
}

function lazy-git() {
	git add .
	git commit -m "lazy-git commit"
	git push
}
```
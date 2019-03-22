JAVA_HOME=/usr/lib/jvm/java-8-oracle/jre
M2_HOME=/home/<*user_dir*>/.sdkman/candidates/maven/current

export JAVA_HOME
export M2_HOME

PATH=$PATH:$JAVA_HOME/bin
PATH=$PATH:$M2_HOME/bin

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

alias mc='EDITOR=subl mc'

alias ins_list='apt list --installed'

#Maven
alias mci='mvn clean install'
alias mcist='mvn clean install -DskipTests'

#Docker
alias dcu='docker-compose up'
alias dcd='docker-compose down'
alias dcc='docker rm $(docker ps -aq)'
alias dci='docker rmi $(docker images -f "dangling=true" -q)'
alias start_dns='sudo systemctl start dnsdock'

function drmi {
  if [ $# -eq 1 ]
    then
    #When you put one parameter
    #In order to put two parameters as one use: "1 2"
    docker rmi -f $(docker images | grep $1 | awk '{print $3}')
  else
    #When you put more then one parameter
    echo 'Only one parameter is allowed'
  fi
}

function run_portainer() {
  docker volume create portainer_data
  echo 'Data created'
  docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer
  echo 'Portainer runed'
}

function docker_att () {
docker exec -it $1 bash
}

#Networking
alias ports='sudo netstat -naptu | grep LISTEN'

alias star_wars='telnet towel.blinkenlights.nl'

function rb() {
    . ~/.bash_aliases
    rm_duplicates_from_path
    echo 'DONE'
}

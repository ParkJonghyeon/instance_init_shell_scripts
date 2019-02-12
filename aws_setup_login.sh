#!/bin/bash
# 제어용 컴퓨터의 정보
DESKTOP_USER=""
DESKTOP_IP=""
DESKTOP_PASS=""
DESKTOP_HOME=""

INSTANCE_PASS=""

# ssh key 사용 위한 패키지 설치 및 키 생성
echo $INSTANCE_PASS | sudo -kS apt-get -y install sshpass ssh-client ssh-server
ssh-keygen -t rsa -q -f $HOME/.ssh/id_rsa -N ""

# 제어용 컴퓨터에 rsa 키 배포
cat $HOME/.ssh/id_rsa.pub | sshpass -p $DESKTOP_PASS ssh $DESKTOP_USER@$DESKTOP_IP "cat >> $DESKTOP_HOME/.ssh/authorized_keys"

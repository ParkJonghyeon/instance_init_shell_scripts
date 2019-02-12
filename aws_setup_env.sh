#!/bin/bash
# 제어용 컴퓨터의 정보
DESKTOP_USER=""
DESKTOP_IP=""
DESKTOP_PASS=""
DESKTOP_HOME=""

INSTANCE_PASS=""

DOCKER_HUB_ID=""
DOCKER_HUB_PASS=""

# 현재 인스턴스의 번호 입력
read -p 'instance number: ' INSTANCE_NUM
#bashrc에 등록해서 영구적으로 사용하도록 할 것

# ssh key 사용 위한 패키지 설치 및 키 생성
echo $INSTANCE_PASS | sudo -kS apt-get -y install sshpass ssh-client ssh-server
ssh-keygen -t rsa -q -f $HOME/.ssh/id_rsa -N ""

# 제어용 컴퓨터에 rsa 키 배포
cat $HOME/.ssh/id_rsa.pub | sshpass -p $DESKTOP_PASS ssh $DESKTOP_USER@$DESKTOP_IP "cat >> $DESKTOP_HOME/.ssh/authorized_keys"

# 제어용 컴퓨터에서 인스턴스로 수집에 필요한 주소 파일들을 가져옴
mkdir shared_dir
mkdir shared_dir/onion_link_set_dir
scp $DESKTOP_USER@$DESKTOP_IP:$DESKTOP_HOME/distribution_links/machine$INSTANCE_NUM.tar shared_dir/onion_link_set_dir/
tar -xf shared_dir/onion_link_set_dir/machine$INSTANCE_NUM.tar -C shared_dir/onion_link_set_dir/
rm machine$INSTANCE_NUM.tar

# 도커의 설치 및 기본정보 등록
echo $INSTANCE_PASS | sudo -kS curl -fsSL https://get.docker.com/ | sh
sudo usermod -aG docker $USER
sudo usermod -aG docker ubuntu
sudo docker login -u $DOCKER_HUB_ID -p $DOCKER_HUB_PASS
#logout

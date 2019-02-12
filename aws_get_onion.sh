#!/bin/bash

DESKTOP_USER=""
DESKTOP_IP=""
DESKTOP_PASS=""
# 수집에 사용할 분할 된 onion address의 경로
DESKTOP_PATH=""

# 현재 인스턴스의 번호(외부에서 입력값을 받아 자동으로 설정 되도록 수정해야함)
INSTANCE_NUM="1"

scp $DESKTOP_USER@$DESKTOP_IP:$DESKTOP_PATH/machine_$INSTANCE_NUM/onion_link.tar shared_dir/onion_link_set_dir/
tar -xf shared_dir/onion_link_set_dir/onion_link.tar -C shared_dir/onion_link_set_dir/
rm shared_dir/onion_link_set_dir/onion_link.tar

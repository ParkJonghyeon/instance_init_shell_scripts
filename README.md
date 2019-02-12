# instance_init_shell_scripts
Init shell scripts for running the crawler on the cloud instance.

---

AWS 인스턴스 생성 후 초기 환경 세팅 자동화를 위한 쉘 스크립트들

### 최초 인스턴스 생성 후 1회 실행 스크립트

* aws_setup_login.sh
  제어용 컴퓨터와 인스턴스간의 로그인 자동화를 위한 ssh 설정 및 RSA 키 교환 스크립트

* aws_setup_env.sh
  aws_setup_login.sh의 기능을 포함. 제어용 컴퓨터로부터 수집을 위한 주소 파일들을 가져오고, Docker의 설치 및 기본정보 등록

* docker_init.sh
  tor 크롤러 이미지와 기본 ubuntu 이미지의 다운로드 및 데이터볼륨 컨테이너와 모니터링 위한 cadvisor의 실행

### crontab으로 주기적으로 실행해야 할 스크립트

* aws_get_onion.sh
  제어용 컴퓨터로부터 갱신 된 주소 세트를 다시 가져오는 스크립트. 다음 크롤링 작업 시작 전에 실행 할 수 있도록 스케쥴링

* docker_manager.sh
  프리징 되거나 시간 초과한 컨테이너들을 종료시키고 다시 컨테이너들을 재시작 시키는 스크립트

* docker_restarter.sh
  브라우저 실행 및 초기화 과정에서 에러가 발생해 실행되지 못한 컨테이너들을 재시작 시키는 스크립트. crontab을 사용해 docker_manager.sh 실행 후 주기적으로(약 5분간격으로 3회) 실행

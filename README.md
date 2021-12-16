# spring_beansFarm

Spring MVC 쇼핑몰 프로젝트

## 차례

[프로젝트 소개](#프로젝트-소개)  
[적용해본 것](#적용해본-것)  
[주요 기능](#주요-기능)  
[링크](#링크)  
[외부 리소스](#외부-리소스)
[추가 자료](#-자료)


## 프로젝트 소개

Spring Framework 를 활용하여 쇼핑몰 사이트를 제작해 보았습니다.

### 환경

- Spring Framework 5.2.6
- JDK 8u202
- Maven 3.8.4
- Server: Tomcat (9.0)

### 구성원

- 허윤정 : [https://github.com/YOONJEONGH](https://github.com/YOONJEONGH)
- 백승엽 : [https://github.com/100choco](https://github.com/100choco)
- 안성용 : [https://github.com/Ragria](https://github.com/Ragria)
- 석주명 : [https://github.com/seokjm0913](https://github.com/seokjm0913)
- 권민성 : [https://github.com/KMS12345f](https://github.com/KMS12345f)
- 최명기 : [https://github.com/hohahoro](https://github.com/hohahoro)

### 기간

- 2021-10-25~2021-12-17 (약 2달)

## 적용해본 것


### 🧲 반응형 디자인

브라우저 크기에 따라 레이아웃이 수정되도록 구성하여 모바일과 PC 에서의 사용자 환경을 동시에 충족시키는 방법을 고려하였습니다.

### 🗃 모듈화

[Ajax](https://log.taedi.net/vanillajs-ajax-module/), [모달창](https://log.taedi.net/vanillajs-modal-window/), [페이징 처리](https://log.taedi.net/spring-mybatis-paging/), 이미지 리사이즈 등 반복적으로 사용되는 기능에 대한 모듈화를 진행하여 코드 중복을 줄이고 유지보수에 신경 썼습니다.

### 📬 이메일 인증

메일 발송 & 암호화/복호화 & 세션을 이용하여 회원 가입시 가입자의 이메일 소유 여부를 인증하는 절차를 구현해 보았습니다.

### 💰 외부 API 활용 (결제 & 도로명 주소 등)

공부 목적으로 가급적 기본 라이브러리와 자체 구현으로 로직을 구성하였으나, 불가피한 부분에 대하여 외부에 공개 된 API를 프로젝트에 적용시켜 기능을 완성하였습니다.




## 주요 기능

### 메인페이지

- 이미지 슬라이더, 그리드 레이아웃


### 로그인 & 회원가입

- 이메일 인증, 로그인 유지, 소셜 & 일반 회원 가입

로그인|회원가입


### 상품상세

- 옵션 선택, 장바구니 &  주문 로직 연동



### 장바구니

- 상품 선택, 수량 변경, 상품 삭제, 주문 로직 연동

### 주문

- 배송지 조회, 결제 로직 연동


### 마이페이지

- 주문 내역, 회원 탈퇴


### 관리자 페이지

- 관리자 설정, 회원 관리, 상품 관리, 주문 조회, 질문 답변


## 외부 리소스

- 아이콘 - [https://fontawesome.com/](https://fontawesome.com/)


##  자료

- 상단의 팀프로젝트(원두팜).pdf 참조

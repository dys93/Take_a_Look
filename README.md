# Take a Look (떼껄룩)

![logO](https://user-images.githubusercontent.com/82743025/126526370-33d97941-8192-4025-825a-099522eef9b9.png)

__펫시터 예약 & 반려동물용품 스토어__   
기간: 2021. 05. 31 ~ 2021. 06. 28  
개발 인원: 5명  
개발 툴: STS, sqlDeveloper  
사용 언어: JAVA(JDK 1.8), Oracle SQL(11g Express), Html5, CSS3, Javascript, JSP&Servlet  

---

# 개발과정    
__문서공유__    
회의를 진행하여 의견을 모으고 해당 내용을 문서로 정리하여 구글 공유문서를 통해 공유.    
__진행상황 공유__    
매일 전날의 진행상황 그리고 오늘의 진행 계획을 정리하여 txt파일로 만들고 해당 내용을 공유함으로서 전체 진행사항을 체크하고 피드백.    
__추가 회의 및 피드백__    
작업시 디스코드에 접속하여 작업을 진행하고 질문이나 오류 등을 공유하고 피드백 해주어 신속한 작업을 가능하게 하고 완성도를 높임.    

<img width="937" alt="진행과정" src="https://user-images.githubusercontent.com/76812787/126892762-4402b793-5c4b-4c99-93f7-53638951e30f.PNG">

---

# 프로젝트 상세 내용
--------------------
## 프로젝트 주제
--------------------
펫시터 서비스와 반려동물용품 판매를 하나의 사이트에서 제공

## 프로젝트 특징
--------------------
- Spring Framework를 학습하고 실제 환경설정을 적용하는 과정에서 Spring에 대한 이해도를 높이고 활용능력을 향상
- 팀 프로젝트 설정 파일을 공통으로 관리하여 협업에서의 효율성을 증가시켰으며 view 페이지와 controller 사이에서의 맵핑을 명확하게 처리
- Tiles Framework를 연동하여 View 페이지에서 레이아웃을 처리하는 과정에 중복적인 코드의 발생을 방지
- Mybatis Framework를 이용하여 mapper를 작성하여 SQL문과 프로그래밍 코드를 분리하여 관리하고 반복적인 쿼리 사용을 줄이고 유지 보수성을 향상
- Ajax를 이용한 비동기 통신으로 불필요한 데이터 요청을 최소화하고 클라이언트에서 처리 가능한 작업을 직접 처리함으로써 XML의 단점인 속도 및 데이터 크기의 문제점을 보완
- JQuery를 사용하여 JavaScript에서의 이벤트 처리와 Ajax 코드를 단순화시켜 작업 효율성을 향상하고 신속한 웹 개발이 가능하도록 함
- 사전에 정교하게 설계한 데이터베이스 모델링을 통해 데이터의 삽입, 삭제, 갱신 이상 현상을 최소화하고 데이터의 중복이 발생하는 것을 방지
- Spring Security를 활용하여 사용자의 비정상적인 접근을 차단하고 인증 (Authentication)과 권한(Authorization) 확인 등 보안 문제를 해결
- HTML5 및 CSS3, Bootstrap, JQuery를 이용하여 화면 확대 비율에 따라 Header 메뉴가 변화하는 반응형 웹 구현
- 관리자 페이지와 클라이언트 페이지를 분리 개발하여 개발 효율성을 증가시키고 사이트 관리에 대한 유지 보수성을 향상
- Spring의 Transaction 처리를 이용하여 데이터의 무결성을 보장

## 사용자 요구사항
-------------------
**메인 페이지**
- 마우스 휠에 따라 한 페이지씩 이동하는 디자인 구현
- 유기동물 공공 데이터를 활용한 통계 그래프 제공
- 판매량과 예약건수에 따른 인기 스토어 상품과 펫시터 리스트 제공

**유기동물 통계**
- 공공데이터를 사용하여 보호 중이거나 입양, 안락사한 유기동물 비율을 실시간으로 그래프에 반영

**로그인**
- 아이디와 패스워드를 입력 받아 로그인 가능
- 아이디 혹은 패스워드를 분실했을 경우 아이디, 패스워드 찾기 기능 제공

**회원 가입**
- 유효성 검사를 통해 정해진 양식의 아이디와 패스워드 및 개인정보를 입력 받아 회원가입

**마이 페이지**
- 회원 가입 시 입력한 개인정보를 확인하고 변경된 개인정보를 수정 가능
- 본인의 스토어 구매내역과 펫시터 예약내역 및 마일리지 적립 히스토리를 리스트로 확인 가능
- 스토어 구매내역과 펫시터 예약내역을 확인하고 해당하는 리뷰를 작성 가능
- 기존 패스워드를 확인하고 새로운 패스워드로 변경 가능

**관리자 페이지**
- 관리자 메인 페이지에서는 일별 회원가입 현황과 스토어 매출 현황을 그래프로 확인할 수 있으며 인기상품 리스트를 확인하고 지난 주 대비 사이트의 변동 추이를 통계 자료로 제공
- 회원리스트를 확인하고 회원의 상세정보를 확인할 수 있으며 회원상태를 잠금 상태로 변경 혹은 잠금 상태인 회원을 활성화할 수 있고 잠금/활성에 따른 히스토리를 확인 가능
- 후원금 관리 페이지에서는 스토어 판매 수익의 50%를 후원금으로 적립함에 따른 후원 내역과 구매자 ID 및 후원일자 등 후원 정보를 확인하고 현재까지의 누적 후원금을 출력
- 마일리지 관리 페이지에서는 마일리지 적립/사용 내역을 구분하여 확인 가능하고 해당하는 마일리지의 금액과 적립/사용된 날짜를 확인 가능
- 스토어 주문 관리 페이지에서는 결제 완료된 주문에 대한 세부 결제 정보를 확인할 수 있으며 배송대기 중인 주문 혹은 배송 중인 주문의 배송상태를 변경시킬 수 있음
- 스토어 상품 관리 페이지에서는 현재 판매가 진행 중인 상품의 정보를 확인하고 가격, 할인율, 재고수량, 옵션에 따른 추가가격을 수정할 수 있음
- 스토어 매출 현황 메뉴에서는 가장 판매량이 높은 6개의 상품에 대한 정보를 원 그래프로 제공하며 일별 배송 조건 별 주문 현황을 막대 그래프를 통해 전주와 금주를 비교하여 볼 수 있음
- 펫시터 예약 관리 페이지에서는 모든 펫시터 예약 내역을 확인 가능
- 펫시터 관리 페이지에서는 현재 활동 중인 펫시터의 세부정보를 확인할 수 있고 새로운 펫시터 아이디를 난수를 이용하여 발급할 수 있음
- 펫시터 매출 현황 메뉴에서는 가장 예약률이 높은 6명의 펫시터에 대한 정보를 원 그래프로 제공하고
일별 예약 현황을 막대 그래프를 통해 확인하여 예약이 많이 발생하는 요일을 분석 가능
- 모든 관리 페이지에서는 출력되는 데이터를 복사하거나 CSV, Excel, PDF로 저장할 수 있으며 Print할 수 있는 기능과 원하는 데이터를 찾을 수 있는 검색 기능과 데이터 정렬 기능 제공
- 등록된 관리자 ID로 로그인한 경우에만 관리자 페이지에 접근 가능

**스토어 페이지**
- 스토어 메인 페이지에서는 전체 상품과 가장 인기있는 상품 리스트를 출력
- 상품을 카테고리 별로 분류하여 검색할 수 있는 카테고리 메뉴를 네비게이션 바를 통해 제공
- 관리자는 상품을 등록할 수 있으며 2개 이상의 Image File을 업로드하여 서버에 저장하고 Smart Editor를 활용하여 제품 상세정보 작성에 대한 편의성 제공
- 관리자는 등록된 상품에 대한 수정, 삭제권한을 가지며 일반 회원에게는 수정 및 삭제를 할 수 있는 버튼이 표시되지 않음
- 상품 세부 페이지에는 해당 상품에 대한 리뷰가 출력되며 일정량 이상의 리뷰 데이터가 존재할 경우 리뷰 더보기를 통해 추가 리뷰를 확인 가능
- 사용자는 구매 제품의 수량을 설정할 수 있으며 구매량에 따라 가격이 변동되는 것을 확인할 수 있음
- 구매 수량에 해당하는 가격과 적립 마일리지를 표시하고 마일리지 사용에 따라서 결제 금액이 변동됨
- 구매버튼을 누르면 AJAX창이 출력되어 최종적으로 결제가 


**펫시터 페이지**
- 동 이름을 검색하여 해당하는 위치에서 활동하고 있거나 Calendar를 활용하여 사용자가 원하는 날짜에 예약이 가능한 펫시터를 검색 가능하고 추가적으로 대형견을 케어해주거나 마당이 있는 펫시터 등 세부적인 검색 기능을 제공
- 펫시터 세부 페이지에서는 펫시터가 등록한 이미지를 슬라이드 형태로 제공하고 현재 등록된 리뷰를 확인 가능하며 일정량 이상의 리뷰 데이터가 존재하는 경우 리뷰 더보기를 통해 추가 리뷰를 확인 가능
- 펫시터 세부 페이지에서는 해당 펫시터의 예약 가능한 날짜를 Calendar를 통해 확인할 수 있으며 펫시터의 위치를 지도 API를 통해 제공
- 소형견, 중형견, 대형견 등 맡기는 반려동물의 크기와 예약일수에 따라 비용이 산정되며 사용자는 지불해야할 비용을 즉시 확인 가능




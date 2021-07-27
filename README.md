# Take a Look (떼껄룩)

![logO](https://user-images.githubusercontent.com/82743025/126526370-33d97941-8192-4025-825a-099522eef9b9.png)

__펫시터 예약 & 반려동물용품 스토어__   


기간 : 2021. 05. 31 ~ 2021. 06. 28  
개발 인원 : 5명 (담당기능: 펫시터 예약 전반)   
개발 툴 : STS, sqlDeveloper  


---

# 개발환경
<img width="942" alt="개발환경" src="https://user-images.githubusercontent.com/76812787/127005816-9dbd03c3-e640-40b8-b07f-a8bf5d54457b.PNG">

---

# 개발과정    
__문서공유__    
회의를 통해 의견을 모으고 해당 내용을 문서로 정리하여 구글 공유문서를 통해 공유  


__진행상황 공유__    
매일 전날의 진행상황 그리고 오늘의 진행계획을 정리하여 txt로 만들고 해당 내용을 공유함으로서 전체 진행상황을 체크   


__피드백__    
디스코드에 접속하여 작업을 진행하고 질문이나 오류 등을 공유하고 피드백을 통해 신속한 작업을 가능하게함<br>


<img width="937" alt="진행과정" src="https://user-images.githubusercontent.com/76812787/126892762-4402b793-5c4b-4c99-93f7-53638951e30f.PNG">

---
# 프로젝트 상세
## 프로젝트 주제
펫시터 서비스와 반려동물용품 판매를 하나의 사이트에서 제공
## 프로젝트 특징
- Spring Framework를 학습하고 실제 환경설정을 적용하는 과정에서 Spring에 대한 이해도를 높이고 활용능력을 향상
- view 페이지와 controller 사이에서의 맵핑을 명확하게 처리
- Tiles Framework를 연동하여 View 페이지에서 레이아웃을 처리하는 과정에 중복적인 코드의 발생 방지
- Mybatis Framework를 이용하여 mapper를 작성, SQL문과 프로그래밍 코드를 분리 및 관리하여 반복적인 쿼리 사용 줄임
- Ajax를 이용한 비동기 통신으로 불필요한 데이터 요청을 최소화하고 XML의 단점인 속도 및 데이터 크기의 문제점을 보완
- JQuery를 사용하여 JavaScript에서의 이벤트 처리와 Ajax 코드를 단순화시켜 작업 효율성 향상
- 사전에 정교하게 설계한 데이터베이스 모델링을 통해 데이터의 삽입, 삭제, 갱신 이상 현상을 최소화하고 데이터의 중복 발생 방지
- Spring Security를 활용하여 사용자의 비정상적인 접근을 차단하고 인증 (Authentication)과 권한(Authorization) 확인 등 보안 문제를 해결
- HTML5 및 CSS3, Bootstrap, JQuery를 이용하여 화면 확대 비율에 따라 Header 메뉴가 변화하는 반응형 웹 구현
- 관리자 페이지와 클라이언트 페이지를 분리 개발하여 개발 효율성을 증가시키고 사이트 관리에 대한 유지 보수성을 향상
- Spring의 Transaction 처리를 이용하여 데이터의 무결성을 보장  

## 주요기능
<img width="941" alt="주요기능" src="https://user-images.githubusercontent.com/76812787/127001479-0c5137b0-5758-4aae-8c39-3f45aa90cd6e.PNG">

## 실행화면  
#### __메인 페이지__    
<img width="942" alt="메인페이지" src="https://user-images.githubusercontent.com/76812787/126910304-a02a7816-defa-4d33-875d-8211cbd1de98.PNG">

- JavaScript를 사용하여 마우스 스크롤 시 페이지가 지정된 영역만큼 한 번에 이동  
- 메인 페이지에서 Bootstrap을 이용하여 한 화면에서 다중 이미지를 슬라이드 형식으로 제공  
- Mybatis와 JSTL을 사용하여 현재 매출을 기반으로한 인기상품과 예약건수를 기반으로한 인기펫시터를 각 화면에 출력  
- 공공데이터 포털의 유기동물 조회 서비스 API를 이용해 메인의 유기동물 통계 부분을 출력  
- 하루 동안의 보호 중, 입양, 반환, 방사, 안락사 등의 통계를 받아 파이 차트와 바 차트로 표시  
- API의 totalCount 정보를 추출하여 메인화면의 footer 부분에 오늘 구조된 동물의 마릿수를 표시    

#### __로그인__  
<img width="936" alt="로그인페이지" src="https://user-images.githubusercontent.com/76812787/126910840-f7a96d5d-466c-48fc-9e3c-bc20ddd2c3a5.PNG">

- 아이디와 비밀번호가 일치하면 로그인에 성공하고 메인 페이지로 리다이렉트  
- 실패하면 하단 부분에 아이디 또는 패스워드가 일치하지 않는다는 메시지를 출력  
- SMTP 기능을 사용하여 아이디를 잊어버린 경우 회원 가입 시 입력했던 이메일 정보를 받아 그 이메일로 회원 아이디를 전송  
- SMTP 기능을 사용하여 비밀번호를 잊어버린 경우회원 아이디를 받아 아이디에 연동된 이메일로 임시 비밀번호를 전송  
- 아이디, 닉네임, 비밀번호에는 Ajax와 정규 표현식을 응용한 유효성 검사가 포함  

#### __마이 페이지__  
<img width="853" alt="마이페이지" src="https://user-images.githubusercontent.com/76812787/126911191-701988c7-5415-40d8-9e2e-440fa38fa769.PNG">

- 회원가입시 입력했던 정보들을 확인가능하며 최초 프로필 사진은 default값으로 기본이미지 설정  
- 정보수정은 jQuery를 이용하여 현재 페이지 정보를 입력폼으로 전환, 변경 후 수정완료로 테이블에 update  
- 유효성검사를 적용하여 설정된 형식을 벗어나면 update하지 못하게 예외처리  
- 우편번호 찾기로 우편번호검색 API를 이용  
- 현재 로그인 된 아이디가 이용했던 주문건 및 예약건의 상세정보 확인 가능  
- 주문번호 및 예약번호 클릭 시 해당 건의 상세 주문내역 페이지로 이동   
- 리뷰작성으로 다중파일을 업로드 가능, 완료된 후기는 스토어의 판매글과 펫시터의 예약글에서 확인 가능  
- 리뷰작성이 완료되면 기능 비활성화  
- 마일리지 내역을 가공하여 현재 보유 마일리지를 계산  
- 비밀번호 변경시 Service에서 로그인중인 계정의 비밀번호와 일치하는지 검사 후 일치할 시 세션을 버리고 로그아웃  

#### __스토어 페이지__
<img width="938" alt="스토어1" src="https://user-images.githubusercontent.com/76812787/126932518-f17f99d1-a2be-43c3-ad94-4d13b2efa955.PNG">
<img width="932" alt="스토어2" src="https://user-images.githubusercontent.com/76812787/126932521-ab17a45e-7cad-4b77-b49c-b98f689e3a7c.PNG">

- 카테고리를 누르면 해당 카테고리에 등록되어 있는 상품들을 확인하고 구매가능  
- 상품이름을 검색하면 키워드를 대조하여 해당 상품을 리스트로 출력  
- 테이블 간 JOIN을 통해 4위까지의 상품을 가져와 메인 화면에 출력   
- 관리자 계정으로 로그인을 할 경우 헤더에 상품등록 링크가 생성  
- 상품 상세페이지에는 상품 수정과 삭제버튼이 생성되어 상품을 관리
- 상위 옵션을 선택하면 AJAX를 통해 하위옵션을 불러와서 SelectBox로 출력 
- 대표 이미지는 다중 파일 처리를 통해 여러장의 경우 상품 상세페이지에서 슬라이드로 상품 이미지 출력
- 상품 수정페이지에서 jQuery를 통해 이미지 파일을 미리 볼 수 있고 해당 이미지를 누르면 삭제
- 상품 등록 시 입력한 상품 가격에 옵션가격을 더해 소비자가격으로 출력하고 할인율 적용시 할인된 가격 표시
- 버튼으로 수량 선택 시 JavaScript를 통해 해당하는 상품의 가격이 계산되어 화면에 출력
- 수량을 선택 후 구매하기 버튼을 누르면 상품번호와 수량에 맞는 최종가격을 결제페이지로 넘김
- 유료배송 상품이라면 JSTL조건문을 통해 분류하고 javsScript로 구매가에 2000원을 더해서 계산
- 주소API로 주소를 검색하고 해당 주소의 우편번호와 주소가 input으로 넘어감
- 마일리지 리스트를 가져와 적립한 마일리지와 사용한 마일리지를 계산하여 보유마일리지 출력 
- 적용 마일리지는 숫자 입력 후 엔터 누르면 최종 가격에서 마일리지가 적용된 가격이 출력
- 결제 버튼을 누르면 결제API(아이엠포트)로 연동

#### __펫시터 페이지__
<img width="940" alt="펫시터 메인1" src="https://user-images.githubusercontent.com/76812787/126934945-74a70722-bf2d-4c25-b688-7b577d7d4fcc.PNG">
<img width="944" alt="펫시터글작성" src="https://user-images.githubusercontent.com/76812787/126934948-3fff2a07-a2cb-4ca8-9132-40178c7f0fc8.PNG">
<img width="861" alt="펫시터예약페이지" src="https://user-images.githubusercontent.com/76812787/126938131-66b473a3-642f-4b1d-bd3e-9e3c9d985e24.png">
<img width="857" alt="펫시터결제" src="https://user-images.githubusercontent.com/76812787/126938651-584c0471-c821-46b4-9c61-116590649bc8.PNG">


- 리스트 페이지에서 동네 검색을 통해 원하는 위치에 있는 펫시터를 검색가능
- 조건 검색을 통해 조건을 다중으로 선택 하여 검색 가능 
- 조건 검색 버튼은 jQuery를 활용하여 한 번 누르면 선택(글자 색상 변경)되고 다시 한 번 누르면 선택 취소 
- 글에 올라온 이미지 여러 장 중에서 join을 활용하여 대표 이미지 한 장만 출력
- 펫시터 글작성시 선택한 조건을 리스트에 출력
- JSP-el을 통해 펫시터 아이디로 로그인 시 하단의 글등록 버튼을 통해 글 등록
- 리스트는 한 페이지에 5개씩 표시되며 하단에 페이징을 구현
- 글작성 페이지에서 제목 및 소개 글은 input태그의 textbox를 통해 작성
- 펫시터의 기본옵션을 radio와 selectbox를 통해 선택
- 근무가능 요일은 추후 달력에 반영되어 스케줄 가능 여부를 나타냄
- 글의 등록, 수정 및 등록 취소가 가능하며 등록 취소 시 리스트 페이지로 리다이렉트
- 예약페이지에서 bootstrap의 사진 슬라이드를 활용하여 여러장의 사진 출력
- 예약건수가 많고 평점이 높으면 우수펫시터로 선정 되어 출력
- Ajax를 이용하여 펫시터에 대한 후기 내용을 불러오며 후기가 3개 이상인 경우 후기 더 보기 버튼이 활성화되어 다음 후기 확인
- 펫시터가 등록한 스케줄이 달력에 표시됨
- datePicker로 구현된 달력을 통해 체크인, 체크아웃 날짜 선택
- jQuery를 통해 종류별 마릿수를 선택할 시 해당 비용을 산정하여 출력
- 카카오 지도 API를 활용하여 펫시터의 주소를 회원정보에서 가져와 지도에 표시 
- JSP-el을 활용하여 글을 작성한 펫시터 아이디로 글 보기를 하면 수정과 삭제 버튼이 활성화 
- 결제 페이지에서 펫시터가 업로드 한 이미지 중 한 장을 join으로 가져와 출력
- 선택한 옵션과 그에 대한 최종 금액을 한 눈에 보여줌
- 결제금액과 일자 등 결제에 관한 정보를 보여주고 하단의 결제하기 버튼을 누르면 결제 API(아이엠포트)로 넘어가서 결제


#### __관리자 페이지__  
<img width="939" alt="관리자페이지1" src="https://user-images.githubusercontent.com/76812787/126940688-3f45f26a-487c-49f6-99dc-7b254f40ffbc.PNG">
<img width="929" alt="관리자페이지2" src="https://user-images.githubusercontent.com/76812787/126940694-506bca54-b800-4b40-babc-a29f327d8c7b.PNG">

- 관리자 페이지는 Security를 사용하여 관리자만 접근이 가능
- 관리자가 아닌 사용자가 관리자 페이지에 접근할 경우 접근제한 페이지를 출력하고 메인 페이지로 이동
- 관리자 페이지 메인에서는 주간 사이트 가입자 추이와 주간 매출 현황을 차트 출력
- 현재 가장 많이 판매된 상품 리스트를 제공하여 상품명과 가격, 누적 판매량 확인
- 통계에서 전 주 대비 총 예약 건수와 스토어 매출액, 사이트 가입자의 증감을 아이콘과 함께 제공
- 회원 관리 메뉴에서 Ajax를 이용하여 회원 아이디를 클릭할 경우 회원의 상세정보를 페이지 이동 없이 Modal을 통해 출력
- 회원 상세정보에서는 계정 상태를 잠금 처리하거나 잠금 계정을 활성 상태로 변경할 수 있고 잠금 처리된 계정은 다시 관리자가 활성화하기 전까지 로그인이 제한됨
- 회원 상세정보에서 자세히 버튼을 클릭시 사용자의 잠금 / 활성 내역을 Modal을 통해 출력
- 모든 회원의 최근 로그인 시간을 기록하여 6개월 간 로그인하지 않으면 자동으로 해당 계정은 잠금 상태로 변경
- 상품 관리 메뉴에서는 현재 스토어에서 판매 중인 모든 상품을 확인 및 변경 가능
- 주문 상세정보 창에서는 배송대기 상태의 주문을 배송 중으로 변경 가능
- 펫시터 관리 메뉴에서 새로운 펫시터 아이디를 발급하며 펫시터 아이디 등록 버튼을 클릭하면 아이디와 패스워드 정보가 담긴 Modal을 출력 
- 아이디는 정해진 기본 영문자에 6자리 난수를 추가하여 생성하고 아이디와 동일한 임시 패스워드와 임시 닉네임을 설정
- 활동중인 펫시터의 아이디를 클릭하면 펫시터 상세정보 Modal을 출력
- 스토어 매출 현황 메뉴에서는 스토어 인기 상품 점유율을 Donut Chart 형태로 제공
- 지난 주 배송 조건 별 주문현황을 Stack Bar Chart 형태로 제공
- 펫시터 매출 현황 메뉴에서는 인기 펫시터 현황 및 점유율을 Pie Chart 형태로 제공
- 주간 일별 예약 현황을 Bar Chart 형태로 제공

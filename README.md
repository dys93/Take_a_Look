# Take a Look (떼껄룩)

![logO](https://user-images.githubusercontent.com/82743025/126526370-33d97941-8192-4025-825a-099522eef9b9.png)

__펫시터 예약 & 반려동물용품 스토어__   


기간 : 2021. 05. 31 ~ 2021. 06. 28  
개발 인원 : 5명 
개발 툴 : STS, sqlDeveloper  


---

# 개발환경
<img width="942" alt="개발환경" src="https://user-images.githubusercontent.com/76812787/127005816-9dbd03c3-e640-40b8-b07f-a8bf5d54457b.PNG">


# 개발과정    
__문서공유__    
회의를 진행하여 의견을 모으고 해당 내용을 문서로 정리하여 구글 공유문서를 통해 공유  


__진행상황 공유__    
매일 전날의 진행상황 그리고 오늘의 진행 계획을 정리하여 txt파일로 만들고 해당 내용을 공유함으로서 전체 진행사항을 체크하고 피드백    


__추가 회의 및 피드백__    
작업시 디스코드에 접속하여 작업을 진행하고 질문이나 오류 등을 공유하고 피드백 해주어 신속한 작업을 가능하게 하고 완성도를 높임    


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
- 하루 동안의 보호 중, 입양, 반환, 방사, 기증, 자연사, 안락사 상태의 통계를 받아 파이 차트(백분율 표시), 바 차트(마릿수 표시)로 표시  
- API의 totalCount 정보를 추출하여 footer 부분에 오늘 구조된 동물의 마릿수를 표시    

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
- JavaScript에서 유효성검사를 및 비밀번호 검사를 진행하고, Service에서 로그인중인 계정의 비밀번호와 일치하는지 검사. 일치할 시 세션을 모두 버리고 로그아웃  

#### __스토어 페이지__
<img width="938" alt="스토어1" src="https://user-images.githubusercontent.com/76812787/126932518-f17f99d1-a2be-43c3-ad94-4d13b2efa955.PNG">
<img width="932" alt="스토어2" src="https://user-images.githubusercontent.com/76812787/126932521-ab17a45e-7cad-4b77-b49c-b98f689e3a7c.PNG">

- 카테고리를 누르면 해당 카테고리에 등록되어 있는 상품들을 확인하고 구매가능  
- 상품이름을 검색하면 키워드를 대조하여 해당 상품을 리스트로 출력  
- 테이블 간 JOIN을 통해 4위까지의 상품을 가져와 메인 화면에 출력   
- 관리자 계정으로 로그인을 할 경우 헤더에 상품등록 링크가 생성된다  
- 상품 상세페이지에는 상품 수정과 삭제버튼이 생성되어 상품을 관리할 수 있다
- 상위 옵션을 선택하면 AJAX를 통해 하위옵션을 불러와서 SelectBox로 출력해준다. 대표 이미지는 다중 파일 처리를 통해 1개 이상의 사진 올리면 상품 상세페이지에서 슬라이드로 상품 이미지를 확인
- 대표 이미지 이외에도 제품 상세정보에서 사진을 업로드하여 제품정보를 명확히 제시하였고 상품 등록을 시도하면 정규표현식을 통해 입력 폼을 확인하고 정확하게 입력된 경우에만 등록이 될 수 있게 구현
- 상품 수정페이지에서 jQuery를 통해 이미지 파일을 미리 볼 수 있고 해당 이미지를 누르면 삭제
- 상품 등록 시 입력한 상품 가격과 옵션가격을 더하여 소비자가격으로 출력한 후 할인율이 적용되었다면 좌측 상단의 가격처럼 원가에서 할인된 가격을 표시
- 상품 원가와 할인 가격을 두개 모두 화면에 출력하여 할인된 가격을 알 수 있다. 버튼을 눌러 수량을 선택하면 JavaScript를 통해 선택한 수량에 해당하는 상품의 가격이 계산되어 화면에 출력된다. 수량 0을 입력하면 가격 또한 0원으로 출력되며 그 이하의 수를 입력하려고 하면 0으로 막는다. 수량을 선택 후 구매하기 버튼을 누르면 상품번호와 수량에 맞는 최종가격이 결제페이지로 넘어가게 된다
- 상품을 구매한 고객에 한해서 구매후기를 작성할 수 있다. 마이페이지에서 제목 내용을 작성하고 평점을 부여하면 상품 상세페이지 하단에 후기 리스트가 AJAX로 출력되는 것을 확인할 수 있다. 구매후기가 없는 상품은 구매후기가 없다는 안내 문구가 대신 출력된다.
- 결제 가격의 0.5%로 계산하여 사용자에게 제공
- 배송의 경우 무료와 유료로 나뉘어져 있는데 유료 배송 상품이라면 배송비로 2000원을 추가하게 된다. 배송비는 JSTL조건문을 통해 배송비 상황을 분류하고 유료배송 상품은 javsScript로 구매가에 2000원을 더 해서 계산하여 결제 확인의 최종가격에 계산된 가격
- 첫 번째 라디오 버튼을 누르면 로그인 되어있는 아이디에서 사용자의 정보를 가져와 javsScript로 배송지에 기본 값으로 제공한다. 
- 검색을 누르면 주소API로 주소를 검색하고 사용자가 주소를 선택하면 해당 주소의 우편번호와 주소가 input에 자동으로 값이 넣어진다
- 할인정보는 로그인한 아이디에서 마일리지 리스트를 가져와서 적립한 마일리지와 사용한 마일리지를 controller에서 계산하여 결제페이지 보유마일리지로 보여준다. 보유마일리지는 사용 가능한 마일리지 수가 되고 적용 마일리지는 수를 입력하고 엔터를 치면 최종 가격에서 마일리지가 적용된 가격을 볼 수 있다
- 결제 버튼을 누르면 결제API로 연동이 되고 해당 상품의 이름과 이름을 확인 수 있고 카드를 고르고 결제까지 완료하면 DB에 관련 테이들이 한 번에 INSERT

#### __펫시터 페이지__
<img width="940" alt="펫시터 메인1" src="https://user-images.githubusercontent.com/76812787/126934945-74a70722-bf2d-4c25-b688-7b577d7d4fcc.PNG">
<img width="944" alt="펫시터글작성" src="https://user-images.githubusercontent.com/76812787/126934948-3fff2a07-a2cb-4ca8-9132-40178c7f0fc8.PNG">
<img width="861" alt="펫시터예약페이지" src="https://user-images.githubusercontent.com/76812787/126938131-66b473a3-642f-4b1d-bd3e-9e3c9d985e24.png">
<img width="857" alt="펫시터결제" src="https://user-images.githubusercontent.com/76812787/126938651-584c0471-c821-46b4-9c61-116590649bc8.PNG">

- 동네 검색을 통해 원하는 위치에 있는 펫시터를 검색
- 조건 검색을 통해 조건을 다중으로 선택 하여 검색이 가능하다. 조건 검색 버튼은 한 번 누르면 선택되고 다시 한 번 누르면 선택이 취소된다. 이를 통해 원하는 조건의 펫시터를 빠르게 찾아볼 수 있어 시간을 절약할 수 있다
- 글에 올라온 이미지 여러 장 중에서 조인을 활용하여 대표 이미지 한 장만 표현한다
- 펫시터 개개인의 가능 조건을 표시하여 글을 클릭하여 확인하기 이전에 먼저 선별이 가능하다
- 펫시터 아이디로 로그인 할 시 하단의 글등록 버튼을 통해 글을 등록할 수 있다
- 한 페이지에 5개씩 표시되며 하단에 페이징을 구현하여 다음 페이지로 넘어갈 수 있다
- 제목 및 소개 글은 input태그의 textbox를 통해 작성된다
- 펫시터의 기본옵션을 radio와 selectbox를 통해 선택하여 고객들이 다양한 조건을 고려할 수 있다
- 근무가능 요일은 추후 달력에 반영되어 스케줄 가능 여부를 나타낸다
- 글의 등록, 수정 및 등록 취소가 가능하며 등록 취소 시 리스트 페이지로 리다이렉트
- 부트스트랩의 사진 슬라이드를 활용하여 여러 장으로 올라온 이미지를 가독성 있게 볼 수 있다. 다양한 사진을 통해 회원들이 원하는 분위기의 펫시팅 공간을 고르는 데 도움을 준다. 
- 펫시터의 프로필 사진과 제공하는 조건의 내용을 확인
- 예약건수가 많고 평점이 높으면 우수펫시터로 선정 되어 펫시터에 대한 신뢰성을 판단하는데 도움
- Ajax를 이용하여 펫시터에 대한 후기 내용을 불러오며 한 페이지에 3개씩 후기를 불러오고 더 많은 후기가 있을 시에는 후기 더 보기 버튼이 활성화되어 클릭 시 다음 페이지에 해당하는 내용
- 펫시터 서비스를 이용한 사람들이 남긴 후기를 통해 평점을 통해 만족도 정도를 파악해 펫시터를 고르는데 도움
- 펫시터가 등록한 스케줄이 표시되며 이후 의 예약 여부에 따라 예약 가능 스케줄을 파악할 수 있어 예약 날짜 선택 시 활용
- datePicker를 이용하여 구현된 달력을 .통해 체크인, 체크아웃 날짜를 선택한다
- jQuery를 통해 종류별 마릿수를 선택할 시 해당 비용을 산정하여 알려준다. 트랜젝션을 통해 정확하고 일관적인 정보를 저장
- 카카오 지도 API를 활용하여 펫시터의 주소를 지도에 표시한다. 회원들은 해당 주소를 통해 검색 없이도 쉽게 위치를 파악
- 글을 작성한 펫시터 아이디로 글 보기를 하면 수정과 삭제 버튼이 활성화되어 사용할 
- 펫시터가 업로드 한 이미지 중 한 장을 조인으로 가져와 보여줌
- 선택한 옵션과 그에 대한 최종 금액을 한 눈에 파악할 수 있도록 제공하여 가독성
- 결제금액과 일자 등 결제에 관한 정보를 보여주고 하단의 결제하기 버튼을 누르면 결제 API로 넘어가서 결제를 가능하게 한다. 다양한 결제 방법을 이용할 수 있어 선택의 폭을 넓혀준다. 


#### __관리자 페이지__  
<img width="939" alt="관리자페이지1" src="https://user-images.githubusercontent.com/76812787/126940688-3f45f26a-487c-49f6-99dc-7b254f40ffbc.PNG">
<img width="929" alt="관리자페이지2" src="https://user-images.githubusercontent.com/76812787/126940694-506bca54-b800-4b40-babc-a29f327d8c7b.PNG">

- 관리자 페이지는 Security를 사용하여 관리자만 접근이 가능
- 관리자가 아닌 사용자가 관리자 페이지에 접근할 경우 접근제한 페이지를 출력하고 메인 페이지로 이동
- 관리자 페이지 메인에서는 주간 사이트 가입자 추이와 주간 매출 현황을 차트를 통해 시각적으로 제공한다. 지난 주와 현재 주의 데이터를 일 별로 출력하여 관리자가 사이트의 전체 상황을 한 눈에 확인할 수 있다.
- 현재 가장 많이 판매된 상품 리스트를 제공하여 사용자들에게 인기 있는 상품의 상품명과 가격, 누적 판매량을 관리자가 쉽게 파악
- 통계에서는 지난 주와 비교한 사이트 상황을 보여준다. 전 주 대비 총 예약 건수와 스토어 매출액, 사이트 가입자의 증감을 아이콘과 함께 제공한다. 비교 상황에 따라 아이콘의 색과 개수를 변경
- 모든 관리 메뉴에서는 컬럼 구분없이 원하는 데이터를 찾을 수 있는 검색 기능을 제공한다. 관리자는 검색 기능을 통해 원하는 데이터를 필터링하여 확인할 수 있다. 또한 검색에 따라 현재 화면에 표시되고 있는 데이터의 개수와 기존 데이터의 총 개수를 함께 출력하여 검색에 따른 데이터의 총 개수를 쉽게 파악할 수 있다.
- 회원 관리 메뉴에서는 관리자를 제외한 일반회원과 펫시터 회원을 모두 확인할 수 있다. Ajax를 이용하여 회원 아이디를 클릭할 경우 회원의 상세정보를 페이지 이동 없이 Modal을 통해 출력
- 회원 상세정보에서는 계정 상태를 잠금 처리하거나 잠금 계정을 활성 상태로 변경할 수 있다. 잠금 처리된 계정은 다시 관리자가 활성화하기 전까지 로그인이 제한
- 회원 상세정보에서 자세히 버튼을 클릭하면 현재까지 사용자의 잠금 / 활성 내역을 Modal을 통해 출력
- 모든 회원의 최근 로그인 시간을 기록하여 6개월 간 로그인하지 않으면 자동으로 해당 계정은 잠금 상태로 변경
- 상품 관리 메뉴에서는 현재 스토어에서 판매 중인 모든 상품을 확인할 수 있다. 관리자는 상품의 가격과 할인율, 재고수량, 옵션에 따른 추가가격을 변경할 수 있다.
- 주문 관리 메뉴에서는 현재 결제가 완료된 모든 주문을 확인할 수 있다. 주문 일자부터 주문자와 배송지에 대한 상세 정보, 결제 금액과 적립 마일리지 등 관리자는 주문에 사용된 모든 정보를 확인할 수 있다
- 주문 상세정보 창에서는 배송대기 상태의 주문을 배송 중으로 변경할 수 있다. 배송대기 중인 상품은 배송 완료 상태로 변경할 수 없으며 배송대기 – 배송 중 – 배송완료 순서의 정해진 상태 변경에 따르지 않으면 배송상태가 변경되지 않으며 경고창을 출력
- 모든 관리 메뉴에서는 원하는 데이터를 PDF, Excel, CSV 형식의 파일로 다운로드 가능하다. 또한 Copy 버튼을 통해 데이터를 클립보드에 저장할 수 있고 데이터를 Print할 수 있도록 Print 버튼을 클릭하면 인쇄 페이지로 연결
- 펫시터 관리 메뉴에서는 새로운 펫시터 아이디를 발급할 수 있다. 펫시터 아이디 등록 버튼을 클릭하면 아이디와 패스워드 정보가 담긴 Modal을 출력한다. 아이디는 정해진 기본 영문자에 6자리 난수를 추가하여 생성하고 아이디와 동일한 임시 패스워드와 임시 닉네임을 설정한다. Ajax를 이용하여 페이지 이동없이 발급 버튼을 누르면 새로운 펫시터 아이디를 생성한다
- 펫시터 관리 메뉴에서 현재 활동하지 않고 있는 펫시터를 클릭할 경우 펫시터 상세정보 창을 띄우지 않고 활동중인 펫시터의 세부정보만 확인 가능하다는 경고창을 출력한다
- 활동중인 펫시터의 아이디를 클릭하면 펫시터 상세정보 Modal을 출력한다. 해당 Modal에서는 펫시터 등록 시 입력한 모든 정보를 확인하기 쉽게 출력
- 스토어 매출 현황 메뉴에서는 스토어 인기 상품 점유율을 Donut Chart 형태로 제공한다. 관리자는 가장 판매량이 높은 6가지의 상품의 순위와 점유율을 차트를 통해 한 눈에 볼 수 있으며 각 인기 상품의 순위와 상품번호, 제품명을 제공하고 클릭 시 해당 상품의 상세페이지로 이동
- 지난 주 배송 조건 별 주문현황을 Stack Bar Chart 형태로 제공한다. 무료 배송 상품과 일반 배송 상품의 배송 조건에 따른 각 요일의 판매량을 차트를 통해 시각적으로 제공한다. 또한 지난 주 배송 조건에 따른 총 판매량을 비교하여 관리자가 쉽게 파악할 수 있게 출력
- 펫시터 매출 현황 메뉴에서는 인기 펫시터 현황 및 점유율을 Pie Chart 형태로 제공한다. 가장 많은 누적 예약 횟수를 가진 펫시터를 6명까지 확인할 수 있다. 각 인기 펫시터의 순위와 아이디, 누적 예약 수를 출력하고 클릭 시 해당 펫시터의 예약 페이지로 이동
- 주간 일별 예약 현황을 Bar Chart 형태로 제공한다. 지난 주와 이번 주의 예약 현황을 각 요일별로 보여주며 관리자는 어느 요일에 펫시터 예약이 많이 발생하는지 확인하여 유효한 데이터를 얻을 수 있다. 또한 지난 주와 이번 주의 총 예약수를 비교하여 관리자가 확인하기 편하도록 제공

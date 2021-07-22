<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<style>
@font-face {
    font-family: 'Cafe24Ssurround';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24Ssurround.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
@font-face {/*본문 내용*/
    font-family: 'Cafe24SsurroundAir';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
.myPetsitList {
	margin-top: 50px;
	font-size: 14px;
	width: 100%;
	padding: 0px;
	font-family: Cafe24SsurroundAir;
}

.myPetsitList .body-container {
	width: 1300px;
}

.myPetsitList .body-title h3 {
    font-family: Cafe24Ssurround;
    text-align: left;
}

.myPetsitList .body-main {
	width: 100%;
	height: 1000px;
}

.myPetsitList .body-itmeList table {
	width: 100%;
	border-collapse: collapse;
	border-spacing: 0px;
	text-align: center;
}
.myPetsitList .body-itmeList table tr:nth-child(1) td {
	height: 40px;
	border-top: 1px solid;
	border-bottom: 1px solid;
}

.myPetsitList .body-itmeList table tr:nth-child(1) label {
	margin: 0px 0px 0px 0px;
}

.myPetsitList .body-itmeList img {
	width: 80px;
	height: 80px;
}

.myPetsitList .body-itmeList .items {
	height: 100px;
	padding: 10px;
}

.myPetsitList .body-itmeList .items p {
	margin: 0px 0px 0px 0px;
}

.myPetsitList .body-itmeList .items:hover {
	background: #eee;
}

.myPetsitList .modal {
 	display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
	z-index: 5; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0,0,0); /* Fallback color */
	background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

.myPetsitList .modal-content {
	background-color: #fefefe;
	margin: 15% auto; /* 15% from the top and centered */
	padding: 30px;
	border: 1px solid #888;
	width: 30%; /* Could be more or less, depending on screen size */
	text-align: left;
}

.myPetsitList .modal-content table {
	width: 100%;
}

.myPetsitList label i {
	color: #007bff;
}

.myPetsitList .findOrderNum:hover {
	color: #14aaff;
	cursor: pointer;
}
.myPetsitList .stBtn {
    border: none;
    width: 70px;
    height: 30px;
    border-radius: 5px;
    box-shadow: 0px 0px 2px 0px rgb(0 0 0 / 10%);
}

</style>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery/js/jquery.form.js"></script>
<script>
$(function() {
	
	var f = document.reviewForm;
	
	var orderNumTemp;
	
	// 후기 작성 버튼 클릭
	$("body").on("click", "#writeReview", function(e) {
		// 선택한 리스트에있는 값 중에서 주문번호를 form에 셋팅하는 작업
		orderNumTemp = $(this).closest(".items").find(".findOrderNum").text();
		
		$("#orderNum").attr("value", orderNumTemp);
		
		
		$(".modal").fadeIn();
	});
	
	// 모달창 닫기
	window.onclick = function(e) {
		if (e.target == document.getElementById('modal')) {
			document.getElementById('modal').style.display = "none";
		}
    }
	
	// 후기작성 완료
	$("body").on("click", "#sendRivew", function(e) {
		
		//json 형식으로 데이터 set
		var formData = new FormData($('#reviewForm')[0]);
		
		
		// ajax
		$.ajax({
			type:"POST",
			processData: false,
			contentType: false,
			data: formData,
			url:"${pageContext.request.contextPath}/mypage/review",
			success:function(data){
				if(data.state == true) {
					alert("리뷰 작성 완료 !!! 감사합니다^^");
					location.reload();
				}
				if(data.state == false) {
					alert("이미지 파일은 5개 이하만 가능합니다.");
				}
			},
			error:function(e){
				alert("이미지 파일 용량 초과입니다.");
			}
		});
		
	});
	
	// 상세 주문 내역 페이지 이동
	$("body").on("click", ".findOrderNum", function(e) {
		var f = document.orderNumForm;
		f.orderNum.value = $(this).attr("data-orderNum");
		f.action = "${pageContext.request.contextPath}/mypage/orderDetail";
		f.submit();
	});
	
});

</script>

<div class="myPetsitList" align="center">
	<div class="body-container">
		<div class="body-title">
			<h3> <i class="fas fa-paw"></i> 예약 내역 </h3>
		</div>
		<div class="body-main">
			<div class="body-itmeList" style="min-height: 100px;">
				<form name="orderNumForm" method="post">
				<table>
					<tr>
						<td width="35%" colspan="2">
							<label> 예약정보 </label>
						</td>
						
						<td width="15%">
							<label> 예약일자 </label>
						</td>
						
						<td width="15%">
							<label> 예약번호 </label>
						</td>
						
						<td width="15%">
							<label> 예약금액 </label>
						</td>
						
						<td width="20%" colspan="2">
							<label> 예약 상태 </label>
						</td>
					</tr>
					
					<c:forEach items="${list}" var="dto">
					<tr class="items">
						<td width="10%">
							<img src="${pageContext.request.contextPath}/upload/petsit/${dto.petImg}">
						</td>
						<td style="text-align: left;">
							<p><b> ${dto.petTitle} </b></p>
							<p style="color: #777777;"> ${dto.checkIn} - ${dto.checkOut} </p>
						</td>
						
						<td>
							<p> ${dto.rDate} </p>
						</td>
						
						<td>
							<p class="findOrderNum" data-orderNum="${dto.orderNum}"> ${dto.orderNum} </p>
						</td>
						
						<td>
							<p> ${dto.finalPrice}원 </p>
						</td>
						
						<td>
							<c:choose>
							 <c:when test="${dto.orderState == 0}">
							 	<p> 결제대기 </p>
							 </c:when>
							 <c:when test="${dto.orderState == 1}">
							 	<p> 결제완료 </p>
							 </c:when>
							</c:choose>
						</td>
						<td>
							<c:choose>
							 <c:when test="${dto.reviewOk == 0}">
							 	<input class="stBtn" id="writeReview" type="button" value="후기작성">
							 </c:when>
							 <c:otherwise>
							 	<input class="stBtn" id="blockReview" type="button" value="작성완료" disabled="disabled">
							 </c:otherwise>
							</c:choose>
						</td>
					</tr>
					</c:forEach>
					
				</table>
				<input type="hidden" name="orderNum">
				</form>
				
			</div>		
			<p> ${dataCount==0? "내역이 없습니다." : paging} </p>
		
		</div>
	</div>
	
	<div id="modal" class="modal">
		<div class="modal-content">
			<form id="reviewForm" method="post" enctype="multipart/form-data">
			<table>
			
				<tr>
					<td>
						<label>  </label>
					</td>	
					<td>
						<label style="font-size: 16px; font-weight: 600;"> <i class="far fa-edit" style="color: #023047;"></i> 예약 후기 작성 </label>
					</td>				
				</tr>
			
				<tr>
					<td>
						<label> 제목 </label>
					</td>
					<td>
						<input id="rTitle" name="rTitle" type="text" style="width: 100%;">
					</td>					
				</tr>
				
				<tr>
					<td>
						<label> 내용 </label>
					</td>
					<td>
						<textarea id="rContent" name="rContent" rows="5" style="width: 100%;"></textarea>
					</td>					
				</tr>
				
				<tr>
					<td>
					
					</td>
					<td>
						<input id="uploads" name="uploads" multiple="multiple" type="file">
					</td>					
				</tr>
				
				<tr	>
					<td>
					
					</td>
					<td style="padding-top: 10px;">
						<input type="radio" value="1" id="rGrade" name="rGrade"> <label> <i class="fas fa-star"></i> </label> &nbsp;
						<input type="radio" value="2" id="rGrade" name="rGrade"> <label> <i class="fas fa-star"></i><i class="fas fa-star"></i> </label> &nbsp;
						<input type="radio" value="3" id="rGrade" name="rGrade"> <label> <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i> </label> &nbsp;
						<input type="radio" value="4" id="rGrade" name="rGrade"> <label> <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i> </label> &nbsp;
						<input type="radio" value="5" id="rGrade" name="rGrade" checked="checked"> <label> <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i> </label>
					</td>					
				</tr>
				
				<tr>
					<td>
						<input type="hidden" id="orderNum" name="orderNum">
					</td>
					<td style="text-align: right;">
						<input class="stBtn" id="sendRivew" type="button" value="작성하기">
					</td>					
				</tr>
				
				
			</table>
			</form>
		</div>
	</div>
</div>
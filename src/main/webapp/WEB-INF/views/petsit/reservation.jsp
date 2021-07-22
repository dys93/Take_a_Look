<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    


<style>

@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&display=swap');

@font-face {/*본문 내용*/
    font-family: 'Cafe24SsurroundAir';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
@font-face {/*강조하는 곳*/
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

.petsitReserve {
	font-family: 'Cafe24SsurroundAir';
}

.petsitReserve h3{
	 font-family: 'GmarketSansMedium';
}

.petsitReserve h4{
	 font-family: 'GmarketSansMedium';
}

.petsitReserve h5{
	 font-family: 'GmarketSansMedium';
}

.petsitReserve h6{
	 font-family: 'GmarketSansMedium';
}

.petsitReserve .textDate {
	display: inline-block;
	width: 33px;
	height: 33px;
}

.petsitReserve .rList {
	display: flex;
    flex-direction: column;
    border-top: 1px solid rgb(235, 235, 235);
    padding: 38px 0px 0px 0px;
    width: 100%;
}


.petsitReserve .paging {
	text-align: center;
	color: orange;
	font-weight: 500;
}

.petsitReserve .reviewTop {
	display: flex;
    flex-direction: row;
    align-items: center;
}

.petsitReserve .rTContent {
	margin-left: 18px;
}

.petsitReserve .rTContent p:first-child {
	font-family: "Noto Sans KR", sans-serif;
    font-size: 15px;
    letter-spacing: -0.2px;
    line-height: 22px;
    color: rgb(56, 60, 72);
}

.petsitReserve .rTContent p:last-child {
	font-size: 13px;
    line-height: 19px;
    color: rgb(76, 80, 86);
    margin-top: 6px;
}
   
.petsitReserve .rList p:first-child{
	font-size: 17px;
	line-height: 25px;
	color: rgb(57, 60, 71);
	margin-top: 17px;
}
   
.petsitReserve .rlist p:last-child{
	font-size: 15px;
    color: rgb(76, 80, 86);
    margin-top: 18px;
    margin-bottom: 18px;
}   
   
.petsitReserve .reviewPic {
	display: flex;
	margin-bottom: 25px;
}
   
.petsitReserve .rpicture {
	margin-right: 10px;
}   
 
 
.petsitReserve .quantity {
	border:none;
	width: 46px;
	height: 18px;
	text-align: center;
}

.petsitReserve .subQty {
	border:none;
	width: 13px;
	height: 18px;
	text-align: center;
}

.petsitReserve .sum {
	
}

.petsitReserve .sumInput {
	border: none;
	width: 70px;
	height: 20px;
	text-align: right;
	margin: 0px 0px;
}

.petsitReserve .sumPrice input{
	text-align: right;
	
}

.petsitReserve .day {
	border: none;
	width: 20px;
	height: 20px;
	text-align: right;
}

.petsitReserve .listReviewFooter{
	text-align: center;
	margin-top: 25px;
	margin-bottom: 25px;
}
.petsitReserve .more{
	font-weight: 500;
	
}

.petsitReserve .paymentPart{
	margin-top: 17px;
}

.petsitReserve .sum span{
	font-weight: 300px;
	font-size: 20px;
}

.petsitReserve .inputSum{
	font-weight: 300px;
	font-size: 20px;
}

.petsitReserve .sumPrice{
	margin-bottom: 7px;
}


</style>

<script type="text/javascript">
//펫시터글 수정시 이전 등록된 사진 삭제 
<c:if test="${sessionScope.member.mId=='admin' || sessionScope.member.mId==dto.mId}">
function deletePetsit() {
	var query = "petNum=${dto.petNum}&${query}";
	var url = "${pageContext.request.contextPath}/petsit/delete?" + query;

    if(confirm("정말 삭제 하시 겠습니까 ? ")) {
  	  location.href=url;
    }
}
</c:if>    

//datepicker의 기본 설정
$(function() {
	$("#checkIn, #checkOut").datepicker({
		 showMonthAfterYear: true
		,minDate:"0"
		,maxDate:"+3M"
		,showAnim:"slide"		
	});
});

//글수정, 삭제 글쓴이 한테만 보이기
$(function() {
	$(".btn").hide()
	
	var uid="${sessionScope.member.mId}";
	var id="${dto.mId}";
	if(uid==id) 
		$(".btn").show()
});

function login() {
	location.href="${pageContext.request.contextPath}/member/login";
}

function ajaxFun(url, method, query, dataType, fn) {
	$.ajax({
		type:method,
		url:url,
		data:query,
		dataType:dataType,
		success:function(data) {
			fn(data);
		},
		beforeSend:function(jqXHR) {
			jqXHR.setRequestHeader("AJAX", true);
		},
		error:function(jqXHR) {
			if(jqXHR.status===403) {
				login();
				return false;
			}
	    	
			console.log(jqXHR.responseText);
		}
	});
}

//달력 part
$(function(){
	var y, m, d;
	var now = new Date();
	y = now.getFullYear();
	m = now.getMonth() + 1;
	if(m<10) m = "0"+m;
	d = now.getDate();
	if(d<0) d = "0"+d;
	var s = y+""+m+""+d;
	schView(s);
	
	function schView(date) {
		var fn = function(data){
			$(".schedule").html(data);
		};
		
		var url="${pageContext.request.contextPath}/petsitSchedule/sch";
		query="date="+date+"&petsiterId=${dto.mId}";
		
		ajaxFun(url, "get", query, "html", fn);
	}
	
	$("body").on("click", ".btnChange", function(){
		var date = $(this).attr("data-date");
		schView(date);
	});
	
});

$(function(){
	listPage(1);
});

function listPage(page) {
	var url="${pageContext.request.contextPath}/petsit/reviewList";
	var query="pageNo="+page+"&petNum=${dto.petNum}";

	var fn = function(data){
		printReview(data);
	};
	
	ajaxFun(url, "get", query, "json", fn);
}


function printReview(data) {
	var memId="${sessionScope.member.mId}";
	var dataCount = data.dataCount;
	var page = data.pageNo;
	var totalPage = data.total_page;
	
	$("#listReviewBody").attr("data-pageNo", page); //현재 화면상에 보이는 페이지
	$("#listReviewBody").attr("data-totalPage", totalPage); //전체 데이터 갯수
	
	$(".more").hide(); //숨겨놓음
	
	var out="";
	if(dataCount==0) { //리뷰 데이터가 0개일 때 
		out="<div class='paging'>";
		out+="    <p style='font-size:16px;'>아직 등록된 후기가 없습니다 <i class='far fa-sad-tear'></i></p>";
		out+="    <p style='font-size:16px;'>펫시터 서비스를 이용하고 이용 후기를 남겨보세요!</p>";
		out+="</div>"
		
		$("#listReviewBody").html(out);

		return;
	}
	
	if(page == 1) { //1페이지면 기존 내용 지우고 다시 추가 
		$("#listReviewBody").empty();
	}
	
	for(var idx=0; idx<data.reviewList.length; idx++) {
		var rNum=data.reviewList[idx].rNum;
		//var mId=data.reviewList[idx].mId;
		var mNick=data.reviewList[idx].mNick;
		var rTitle=data.reviewList[idx].rTitle;
		var rContent=data.reviewList[idx].rContent;
		var rCreated=data.reviewList[idx].rCreated;
		var rGrade=data.reviewList[idx].rGrade;
		var imagefilename=data.reviewList[idx].imagefilename;
		var mProfileImg=data.reviewList[idx].mProfileImg;
		var img=[];
		if(imagefilename){
			img = imagefilename.split(",");
		}

		out+="<div class='rList'>"
		out+="<div class='reviewTop'>";
		out+="    <div class='rImg'style='width:70px; height:70px;'><img style='width:70px; height:70px; border-radius:12px;'src='${pageContext.request.contextPath}/upload/profileImages/"+mProfileImg+"'></div>";
		out+="    <div class='rTContent'><p>"+mNick+"</p><p>"+rCreated+"</p></div>";
		out+="</div>";		
		out+="<p>후기 평점:"+rGrade+"</p>";
		out+="<p>"+rTitle+"</p>";
		out+="<p>"+rContent+"</p>";
		out+="<div calss='reviewPic' style='display:flex; margin-bottom:25px;'>"
		if(img.length>0){
			for(var i=0; i<img.length; i++) {
				var s="${pageContext.request.contextPath}/upload/reviewImages/"+img[i];		
				
				out+="<div class='rpicture'><img src='"+s+"' width='100px;' height='100px';></div>";
			}
			
		}
		out+="</div>"
	}
	$("#listReviewBody").append(out); //append로 해야 기존 내용 지워지지 x
	
	if(page<totalPage) { //데이터가 더 존재하는 경우
		$(".more").show(); //데이터를 보여줌
	}
}

//리뷰 더보기 
$(function(){
	$(".review-list .more").click(function(){
		var page = $("#listReviewBody").attr("data-pageNo");
		var totalPage = $("#listReviewBody").attr("data-totalPage");

		if(page<totalPage) {
			page++;	
			listPage(page);
		}
	});
});

var date=0;
//몇박인지 계산 
$(function(){
	var chIn=0;
	$("input[name=checkIn]").change(function(){
		if(! $(this).val()) return false;
		var ch1 = $(this).val();
		
		var d = ch1.split("-");
		chIn = parseInt(d[2]);
	});
	
	$("input[name=checkOut]").change(function(){
		if(! $(this).val()) return false;
		var ch2 = $(this).val();
		
		var dd = ch2.split("-");
		var chOut = parseInt(dd[2]);
			
		
		date = (chOut-chIn);	
		$("input[name=dayCnt]").val(date);
		
	});
});

//옵션 part
function sendReservation() {
	var f = document.rvForm;
	
	//날짜, 옵션 선태 안 했을시 alert창 띄우기 
	
	//결제 페이지로 넘기기
	f.action="${pageContext.request.contextPath}/petsit/payment";
	//서버로 넘김
    f.submit();
}


//옵션수량 조정
$(function(){		
	var s=0;
	var t=0;
	var finalPrice=0;
	$(".body-main").on("click", ".btnSP", function(){
		var qty = parseInt($("input[name=small]").val());
		var price = 40000;
		
		qty=qty+1;
		s += price*date;
		t += (price*0.1)*date;
		finalPrice = (s+t);
		$("input[name=small]").val(qty);
		$("input[name=sum]").val(s);
		$("input[name=tax]").val(t);
		$("input[name=finalPrice]").val(finalPrice);
	});			
	
	$(".body-main").on("click", ".btnSM", function(){
		var qty = parseInt($("input[name=small]").val());
		var price = 40000;
	
		qty=qty-1;
		if(qty<0){
			qty=0;
		}
		if(s<0){
			s=0;
		s -= price*date;
		t -= (price*0.1)*date;
		finalPrice = s+t;
		
		}
		$("input[name=small]").val(qty);
		$("input[name=sum]").val(s);
		$("input[name=tax]").val(t);
		$("input[name=finalPrice]").val(tot);
	});	
	$(".body-main").on("click", ".btnMP", function(){
		var qty = parseInt($("input[name=medium]").val());
		var price = 50000;
	
		qty=qty+1;
		s += price*date;
		t += (price*0.1)*date;
		finalPrice = s+t;
		$("input[name=medium]").val(qty);
		$("input[name=sum]").val(s);
		$("input[name=tax]").val(t);
		$("input[name=finalPrice]").val(finalPrice);
	});			
	
	$(".body-main").on("click", ".btnMM", function(){
		var qty = parseInt($("input[name=medium]").val());
		var price = 50000;
	
		qty=qty-1;
		if(qty<0){
			qty=0;
		}
		if(s<0){
			s=0;
		}
		s -= price*date;
		t -= (price*0.1)*date;
		finalPrice =s+t;
		
		$("input[name=medium]").val(qty);
		$("input[name=sum]").val(s);
		$("input[name=tax]").val(t);
		$("input[name=finalPrice]").val(finalPrice);
	});	
	$(".body-main").on("click", ".btnLP", function(){
		var qty = parseInt($("input[name=large]").val());
		var price = 60000;
	
		qty=qty+1;
		s +=price*date;
		t += (price*0.1)*date;
		finalPrice =s+t;
		$("input[name=large]").val(qty);
		$("input[name=sum]").val(s);
		$("input[name=tax]").val(t);
		$("input[name=finalPrice]").val(finalPrice);
	});			
	
	$(".body-main").on("click", ".btnLM", function(){
		var qty = parseInt($("input[name=large]").val());
		var price = 60000;
	
		qty=qty-1;
		if(qty<0){
			qty=0;
		}
		if(s<0){
			s=0;
		}
		s -= price*date;
		t -= (price*0.1)*date;
		finalPrice = finalPrice+t;
		
		$("input[name=large]").val(qty);
		$("input[name=sum]").val(s);
		$("input[name=tax]").val(t);
		$("input[name=finalPrice]").val(finalPrice);
	});	
});

//예약하기
function sendReservation() {
	var f = document.rvForm;

	//결제 페이지로 넘기기
	f.action="${pageContext.request.contextPath}/petsit/payment";
	//서버로 넘김
    f.submit();
	
}

</script>

<div class="petsitReserve">
<!-- 사진 슬라이드 영역-->
<div style="width:1300px; margin-left: 140px;" align="center" >	
	<div class="slide-body" align="center">
		<div id="carouselExampleIndicators" class="carousel slide picture" data-ride="carousel">
			<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			</ol>
  		<div class="carousel-inner">
  		<c:forEach var="vo" items="${listFile}" varStatus="status">
			<div class="carousel-item ${status.index==0?'active':'' }">
            	<img src="${pageContext.request.contextPath}/upload/petsit/${vo.petImg}" class="d-block w-100">
          	</div>
		</c:forEach>
  		</div>	
		<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			<span class="sr-only">Previous</span>
		</a>
		<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
		</div>
	</div>
</div>
<!-- 실제 예약 영역-->
<div class="body-main">
<div style="width: 1100px; margin: auto; min-height: 2000px;">
	<div class="body-left">
		<div class="profile">
			<div class="profile-p">
			<img src="${pageContext.request.contextPath}/upload/profileImages/${dto.mProfileImg}">
			</div>
			<div class="frofile-t">
				<h6>${dto.petAddr} 펫시터 ${dto.mNick}&nbsp;님</h6>
				<h4>${dto.petTitle}</h4>
				<div class="fofile-c">
				<p><c:if test="${dto.petYN ne 0}">#반려동물 있어요&nbsp; </c:if></p>
				<p><c:if test="${dto.petYard ne 0}">#마당 보유&nbsp; </c:if></p>
				<p><c:if test="${dto.petLarge ne 0}">#대형견 가능&nbsp; </c:if></p>								
				<p><c:if test="${dto.petWalk ne 0}">#산책로 있어요&nbsp; </c:if></p>			
				<p><c:if test="${dto.petLiving eq 1}">#아파트&nbsp; </c:if></p>
				<p><c:if test="${dto.petLiving eq 2}">#단독주택&nbsp; </c:if></p>
				<p><c:if test="${dto.petLiving eq 3}">#빌라&nbsp; </c:if></p>
				<p><c:if test="${dto.petLiving eq 4}">#오피스텔&nbsp; </c:if></p>
				<p><c:if test="${dto.petFamily eq 1}">#2인 이하 가구&nbsp; </c:if></p>
				<p><c:if test="${dto.petFamily eq 2}">#3인 가구&nbsp; </c:if></p>
				<p><c:if test="${dto.petFamily eq 3}">#4인 가구&nbsp; </c:if></p>
				<p><c:if test="${dto.petFamily eq 4}">#5인 이상 가구&nbsp; </c:if></p>
				<p><c:if test="${dto.petChild eq 2}">#미취학 아동 자녀 있어요&nbsp; </c:if></p>
				<p><c:if test="${dto.petChild eq 3}">#초등생 자녀 있어요&nbsp; </c:if></p>	
				</div>
			</div>
		</div>
		
			<div class="best">
				<div>
					<i class="fas fa-medal"></i>&nbsp;&nbsp;<span>땡시터님은 우수 펫시터 입니다</span>
				</div>
				<p>우수 펫시터는 다수의 예약 진행 경험과 함께, 높은 고객 만족도를 받은 펫시터입니다</p>
			</div>

		<div class="intro">
			<h5><span>${dto.mNick}</span>님을 소개합니다</h5>
			<p class="intro-d">
			${dto.petContent}
			</p>
		</div>
		<div class="certif">
			<h5>자격증 및 수료증</h5>
			<div class="certif-d">
				<div class="certf-dp">
				<img src="${pageContext.request.contextPath}/resources/images/petsit/certif.PNG">
				</div>
				<div class="certf-de">
					<p class="certif-title">펫시터 전문가 교육</p>
					<p>(사) K.S.D 문화교육원</p>
					<p class="certif-date"> ${dto.petCertif} 에 취득하였습니다</p>
				</div>
			</div>
		</div>
		<div class="review-list" id="listReview" style="margin-top: 60px;">
			<div class="reviewT">
				<h3>펫시터 후기</h3>
				<div class="star">
	            <i class="fas fa-star"></i>
	            <i class="fas fa-star"></i>
	            <i class="fas fa-star"></i>
	            <i class="fas fa-star"></i>
	            <i class="fas fa-star"></i>
	         	</div>	         
         	</div>
			<div id="listReviewBody" data-pageNo="0" data-totalPage="0"></div>
			<div id="listReviewFooter" class="listReviewFooter">
				<span class="more">후기 더보기</span>
			</div>
		</div>
	</div>
	
	<div class="body-right" align="right">
		<div class="schedule"></div>
		<div class="reverve-detail">
			<form id="rvForm" name="rvForm" method="POST" >
			<div class="reserve-date">
				<p><b>언제 펫시터가 필요한가요?</b></p>
				<div class="dateBar">
					<div class="checkinCal">
						<button class="dateButton"><i class="fas fa-calendar-alt"></i></button>
					</div>
					<div>
						<input class="checkDate" type="text" id="checkIn" name="checkIn" value="" placeholder=" 체크인 날짜">	
					</div>
					<div class="pointR">
						<i class="fas fa-arrow-right"></i>
					</div>
					<div>
						<input class="checkDate" type="text" id="checkOut" name="checkOut" placeholder=" 체크아웃 날짜">	
					</div>
				</div>
			</div>
			<div class="reserve-time">
				<p> 체크인 가능 시간은 오후 14:00 이후 이며,</p>
				<p> 체크아웃 가능 시간은 오전  11:00 까지 입니다.</p>
			</div>			
			<p class="pet-p"><b>맡기시는 반려동물</b></p>		
			<div class="selectB" id="selectBox">
				<div class="boxLine">
					<div class="lineL">
						<p>소형견</p>
						<p>7kg 미만</p>
					</div>
					<div class="lineR">
						<div class="pmBtn">
						<input type="button" value=" - " class="pmBtn btnSM">
						</div>
						<input type="text" name="small" value="0" class="quantity" readonly="readonly">
						<div class="pmBtn">
						<input type="button" value=" + " class="pmBtn btnSP" >
						</div>
					</div>
				</div>
				<div class="boxLine sth">
					<div class="lineL">
						<p>중형견</p>
						<p>7-14.9kg 미만</p>
					</div>
					<div class="lineR">
						<div class="pmBtn">
						<input type="button" value=" - " class="pmBtn btnMM">
						</div>
						<input type="text" name="medium" value="0" class="quantity" readonly="readonly">
						<div class="pmBtn">
						<input type="button" value=" + " class="pmBtn btnMP" >
						</div>
					</div>
				</div>
				<div class="boxLine sth">
					<div class="lineL">
						<p>대형견</p>
						<p>15kg 이상</p>
					</div>
					<div class="lineR">
						<c:choose>
						<c:when test="${dto.petLarge eq 0}">
						<div class="pmBtn">
						<input type="button" value=" - " class="pmBtn btnLM" disabled="disabled">
						</div>
						<input type="text" name="large" value="0" class="quantity" readonly="readonly" disabled="disabled">
						<div class="pmBtn">
						<input type="button" value=" + " class="pmBtn btnLP" disabled="disabled" >
						</div>
						</c:when>
						<c:otherwise>
						<div class="pmBtn">
						<input type="button" value=" - " class="pmBtn btnLM">
						</div>
						<input type="text" name="large" value="0" class="quantity" readonly="readonly">
						<div class="pmBtn">
						<input type="button" value=" + " class="pmBtn btnLP" >
						</div>
						</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="bFooter">
					<p>최대 4마리 까지만 선택 가능합니다.</p>
				</div>
			</div>	
			<div class="paymentPart">
				<div class="sum">
				<span>합계비용</span><input type="text" name="finalPrice" class="sumInput inputSum"  value="" readonly="readonly">원
				</div>
				<div class="bar" ></div>	
				<div class="sumPrice">
				<span><input type="text" name="dayCnt" class="day" value="" readonly="readonly">박</span> /&nbsp; 
				<span>소형</span><input type="text" name="small" value="0" class="quantity subQty" readonly="readonly">
				<span>중형</span><input type="text" name="medium" value="0" class="quantity subQty" readonly="readonly">
				<span>대형</span><input type="text" name="large" value="0" class="quantity subQty" readonly="readonly">
				<span><input type="text" name="sum" class="sumInput" value="" readonly="readonly">원</span>
				</div>			
				<div>
				<span>부가세(10%)</span><span><input type="text" name="tax" class="sumInput" value="" readonly="readonly">원</span>
				</div>				
				<span></span>		
			</div>
			<div class="reserve-send">
				<button type="button" class="rvBtn" onclick="sendReservation()"><p>예약요청</p></button>
			</div>
         	<input type="hidden" name="petImg" value="${listFile[0].petImg}"> <!-- 펫시터가 등록한 사진 -->	
         	<input type="hidden" name="petNum" value="${dto.petNum}">	<!-- 현재 글의 petNum -->
			</form>		
		</div>
		<div class="price">
			<div class="price-title">
				<p>이용요금</p>			
			</div>	
			<div class="bar" ></div>	
			<div class="pet-type">
				<div class="type-L">
					<p>소형견</p>
					<p>7kg 미만</p>
				</div>
				<div class="type-R">
					<p>40,000원</p>
				</div>
			</div>
			<div class="pet-type">
				<div class="type-L">
					<p style="font-size: 16px;">중형견</p>
					<p>15kg 미만</p>
				</div>
				<div class="type-R">
					<p>50,000원</p>
				</div>
			</div>
			<div class="pet-type">
				<div class="type-L">
					<p style="font-size: 18px;">대형견</p>
					<p>15kg 이상</p>
				</div>
				<div class="type-R">
					<p>60,000원</p>
				</div>
			</div>
		</div>	
		<div class="location">
			<div class="lTop">
				<div class="topContent">
					<p>펫시터님 위치</p>
					<div class="ContentR">
						<p>${dto.petAddr}</p>
						<p>정확한 주소는 예약 완료후 확인 가능합니다.</p>
					</div>
				</div>
			</div>
			<div class="lBottom" id="map">
			</div>
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=615fa488f5c1cadec65f32fb7cdad8bc&libraries=services"></script>
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=615fa488f5c1cadec65f32fb7cdad8bc"></script>
			<script>	
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    				mapOption = { center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        						  level: 4 // 지도의 확대 레벨
    				};  
				// 지도를 생성합니다    
				var map = new kakao.maps.Map(mapContainer, mapOption); 
				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new kakao.maps.services.Geocoder();
				var coords=""; 
				
				// 주소로 좌표를 검색합니다
				geocoder.addressSearch('${dto.mAddr1}', function(result, status) {
				    // 정상적으로 검색이 완료됐으면 
				     if (status === kakao.maps.services.Status.OK) {
						 coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다				     		        				  
				        map.setCenter(coords);
				      	// 지도에 표시할 원을 생성합니다

				        var circle = new kakao.maps.Circle({
						    center : new kakao.maps.LatLng(coords.Ma , coords.La),  // 원의 중심좌표 입니다 
						    radius: 200, // 미터 단위의 원의 반지름입니다 
						    strokeWeight: 3, // 선의 두께입니다 
						    strokeColor: '#75B8FA', // 선의 색깔입니다
						    strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
						    strokeStyle: 'solid', // 선의 스타일 입니다
						    fillColor: '#CFE7FF', // 채우기 색깔입니다
						    fillOpacity: 0.7  // 채우기 불투명도 입니다   
						}); 
						// 지도에 원을 표시합니다 
						circle.setMap(map);		        
    				} 
				}); 			
				//map.setDraggable(false); //드래그 불가
				//map.setZoomable(false); //확대,축소 불가
			</script>
		</div>
		<div class="sitBottom">
			<c:choose>
				<c:when test="${sessionScope.member.mId==dto.mId}">
			    	<button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/petsit/update?petNum=${dto.petNum}&page=${page}';">수정</button>
			    </c:when>
			    <c:otherwise>
			    	<button type="button" class="btn" disabled="disabled">수정</button>
			    </c:otherwise>
			 </c:choose>
			    	
			 <c:choose>
			    <c:when test="${sessionScope.member.mId==dto.mId || sessionScope.member.mId=='admin'}">
			    	<button type="button" class="btn" onclick="deletePetsit();">삭제</button>
			    </c:when>
			    <c:otherwise>
			    	<button type="button" class="btn" disabled="disabled">삭제</button>
			    </c:otherwise>
			</c:choose>
		</div>
	</div>	
</div>
</div>


</div>

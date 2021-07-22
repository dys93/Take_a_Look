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
.myMileage {
	margin-top: 50px;
	font-size: 14px;
	width: 100%;
	padding: 0px;
	font-family: Cafe24SsurroundAir;
}

.myMileage .body-container {
	width: 1300px;
}

.myMileage .body-title h3 {
    font-family: Cafe24Ssurround;
    text-align: left;
}

.myMileage .body-status {
	text-align: left;
}

.myMileage .body-main {
	width: 100%;
	height: 1000px;
	padding-top: 5px;
}

.myMileage .body-itmeList table {
	width: 100%;
	border-collapse: collapse;
	border-spacing: 0px;
	text-align: center;
}
.myMileage .body-itmeList table tr:nth-child(1) td {
	height: 40px;
	border-top: 1px solid;
	border-bottom: 1px solid;
}

.myMileage .body-itmeList table tr:nth-child(1) label {
	margin: 0px 0px 0px 0px;
}


.myMileage .body-itmeList .items {
	height: 100px;
	padding: 10px;
}

.myMileage .body-itmeList .items p {
	margin: 0px 0px 0px 0px;
}

.myMileage .body-itmeList .items:hover {
	background: #eee;
}

.myMileage .btm {
	border-bottom: 1px solid #f1f1f1;
}

.myMileage .noMar {
	margin: 0px 0px 0px 0px;
}

.myMileage .stBtn {
    border: none;
    width: 70px;
    height: 30px;
    border-radius: 1px;
    box-shadow: 0px 0px 2px 0px rgb(0 0 0 / 10%);
}

</style>

<script>
$(function () {
	
	$("body").on("click", "#all", function() {
		var f = document.searchForm;
		f.keyword.value = "";
		f.submit();
	});
	
	$("body").on("click", "#add", function() {
		var f = document.searchForm;
		f.keyword.value = "1";
		f.submit();
	});
	
	$("body").on("click", "#use", function() {
		var f = document.searchForm;
		f.keyword.value = "0";
		f.submit();
	});
	
});

</script>


<div class="myMileage" align="center">
	<div class="body-container">
		<div class="body-title">
			<h3> <i class="fas fa-coins"></i> 마일리지</h3>
		</div>
		
		<div class="body-status">
			보유 마일리지 : <span> <b>${totMile}점</b> </span>
		</div>
		
		<div align="left">
		<form name="searchForm" method="post" action="${pageContext.request.contextPath}/mypage/mileage">
			<button class="stBtn" id="all">전체</button>
			<button class="stBtn" id="add">적립</button>
			<button class="stBtn" id="use">사용</button>
			<input type="hidden" name="keyword">
		</form>	
		</div>
		
		<div class="body-main">
			<div class="body-itmeList" style="min-height: 100px;">
				<table>
					<tr>
						<td width="20%">
							<label> 마일리지 </label>
						</td>
						
						<td width="65%">
							<label> 적립 구분 </label>
						</td>
						
						<td width="15%">
							<label> 적립/사용 날짜 </label>
						</td>
					</tr>
					
					<c:forEach items="${list}" var="dto">
						
						<tr class="btm">
							<td style="height: 80px;">
								<p class="noMar" style="padding-top: 17px;"> ${dto.mileType==1?'+':'-'}${dto.milePrice} <p>
							</td>
							
							<td align="left">
								<label class="noMar"> ${dto.mileHistory} </label>
							</td>
							
							<td>
								<label class="noMar"> ${dto.mileDate} </label>
							</td>
						</tr>
						
					</c:forEach>
				</table>
				
			</div>		
				<p> ${dataCount==0? "내역이 없습니다." : paging} </p>
		</div>
	</div>
	
</div>
	



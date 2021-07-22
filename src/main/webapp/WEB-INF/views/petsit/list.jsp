<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
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
</style>


<script type="text/javascript">

//펫시터  한테만 글쓰기 보이기
$(function() {
	$(".btn").hide()
	
	var uid="${sessionScope.member.mRole}";
	if(uid==2) 
		$(".btn").show()
});

//datepicker의 기본 설정
$(function() {
	$("#datepicker1, #datepicker2").datepicker({
		 showMonthAfterYear: true
		,minDate:"0"
		,maxDate:"+3M"
		,showAnim:"slide"
	});
});


$(function(){
	$(".condition").click(function(){
				
		var c = $(this).attr("data-condition");
		
		var b = false;
		$(".conList input[name=condition]").each(function(){
			var $this = $(this);
			if($(this).val() == c) {
				$this.remove();
				b = true;
				return false;
			}
		});
		
		if(! b) {
			$(".conList").append("<input type='hidden' name='condition' value='"+c+"'> ");
		}
		
		var f=document.searchForm;
		f.submit();
	});
});

$(function(){
	$(".conList input[name=condition]").each(function(){
		var s = $(this).val();
		
		$(".searchCondition ul .condition").each(function(){
			var a = $(this).attr("data-condition");
			if(s === a) {
				$(this).css("color", "#073f5a");
				return false;
			}
		});
	});
});

</script>

<div class="petsitList">
	<!-- 검색영역 -->
	<div style="width: 1300px;" align="center" >
	<div class="search" align="center">
		<form name="searchForm" method="post">			
				<div class="searchL">
					<div class="searchAddr">
						<p><i class="fas fa-home"></i>&nbsp;<b>어디에 사시나요?</b></p>
						<div class="inputbtn">
						<input class="searchDong" type="text" name="addr" placeholder=" 동 이름을 검색하세요(예.논현동)" value="${addr}">
						<button class="serchbtn" onclick="serchList()"><i class="fas fa-search"></i>&nbsp;검색</button>
						</div>
					</div>
					<div class="searchCondition">
						<p><i class="fas fa-check"></i>&nbsp;<b>원하는 조건을 설정하세요</b></p>
						<ul>
							<li><div class="condition" data-condition="petLarge">대형견 가능</div></li>
							<li><div class="condition" data-condition="petYard">마당 있음</div></li>
							<li><div class="condition" data-condition="petYN">반려동물 없음</div></li>
							<li><div class="condition" data-condition="petWalk">산책로 있음</div></li>
						</ul>
						<div class="conList">
							<c:forEach var="condition" items="${conList}">
								<input type="hidden" name="condition" value="${condition}">
							</c:forEach>
						</div>
					</div>			 							
				</div>
				<div class="searchR" style="margin: 0px 0px;">
					<img class="searchPic" src="${pageContext.request.contextPath}/resources/images/petsit/dog.jpg">
				</div>						
			</form>			
		</div>
	</div>
	<!-- 펫시터 리스트 -->
	<div class="list" align="center">
		<div style="width: 1300px; min-height: 1800px;">	
			<div class="list-body">
				<div class="list-title">
					<p>원하는 조건의 검증된 펫시터들을 확인해 보세요. 생생한 후기와 만족도까지 확인할 수 있습니다!</p>
					<div style="display: flex;">
						<div class="list-titleR">
							<p><i class="fas fa-dog"></i></p>
							<p><i class="fas fa-baby-carriage"></i></p>
							<p><i class="fas fa-child"></i></p>
							<p><i class="fas fa-seedling"></i></p>
							<p><i class="fas fa-tree"></i></p>
							<p><i class="fas fa-users"></i></p>
						</div>
					</div>
				</div>
				<c:forEach var="dto" items="${list}"> <!--var:조건의 결과를 저장할 변수 이름 items:리스트가 받아올 배열이름 -->
				<div class="listbody">
					<div class="listEach">
						<div class="photo">
							<img src="${pageContext.request.contextPath}/upload/petsit/${dto.petImg}">
						</div>
						<a href="${reservationUrl}&petNum=${dto.petNum}">
							<div class="listInfo-title">
								<p>${dto.petAddr}</p>
								<p>${dto.petTitle }</p>
							</div>
							<div class="listInfo-main">
								<div class="main-L">
									<p>
									<c:if test="${dto.petYN ne 1}">#반려동물 있어요&nbsp; </c:if>
									<c:if test="${dto.petYard ne 0}">#마당 보유&nbsp; </c:if>
									<c:if test="${dto.petLarge ne 0}">#대형견 가능&nbsp; </c:if>								
									<c:if test="${dto.petWalk ne 0}">#산책로 있어요&nbsp; </c:if>			
									<c:if test="${dto.petLiving eq 1}">#아파트&nbsp; </c:if>
									<c:if test="${dto.petLiving eq 2}">#단독주택&nbsp; </c:if>
									<c:if test="${dto.petLiving eq 3}">#빌라&nbsp; </c:if>
									<c:if test="${dto.petLiving eq 4}">#오피스텔&nbsp; </c:if>
									<c:if test="${dto.petFamily eq 1}">#2인 이하 가구&nbsp; </c:if>
									<c:if test="${dto.petFamily eq 2}">#3인 가구&nbsp; </c:if>
									<c:if test="${dto.petFamily eq 3}">#4인 가구&nbsp; </c:if>
									<c:if test="${dto.petFamily eq 4}">#5인 이상 가구&nbsp; </c:if>
									<c:if test="${dto.petChild eq 2}">#미취학 아동 자녀 있어요&nbsp; </c:if>
									<c:if test="${dto.petChild eq 3}">#초등생 자녀 있어요&nbsp; </c:if>			
									</p>
								</div>
								<div class="main-R">
								</div>
							</div>
						</a>
					</div>
				</div>
				</c:forEach>
				<div style="text-align: right; width: 1000px; margin-top: 10px;">
			    <c:if test="${sessionScope.member.mRole == 2}">
			    	<button  style="border: 1.5px solid #023047;" type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/petsit/write';">글등록</button>
			    </c:if>
			    </div>
			</div>
			<div class="paging">${paging}</div>	
		</div>
	</div>
</div>
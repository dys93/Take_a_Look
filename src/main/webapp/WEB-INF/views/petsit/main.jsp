<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="petsitMain">
	<!-- 검색영역 -->
	<div class="search" align="center">
		<form name="searchForm">
			<div style="width: 1300px;">
				<div class="searchAddr">
					<p><i class="fas fa-home"></i>&nbsp;<b>어디에 사시나요?</b></p>
					<input class="searchDong" type="text" name="addr" placeholder=" 동 이름을 검색하세요(예.논현동)">
				</div>
				<div class="reserve-detail">
					<p><i class="fas fa-paw"></i>&nbsp;<b>언제 펫시터가 필요한가요?</b></p>
					<div class="dateBar">
						<div class="checkinCal">
						<button class="dateButton"><i class="fas fa-calendar-alt"></i></button>
						</div>
						<div>
							<input class="checkDate" type="text" placeholder=" 체크인 날짜">	
						</div>
						<div class="pointR">
							<i class="fas fa-arrow-right"></i>
						</div>
						<div>
							<input class="checkDate" type="text" placeholder=" 체크아웃 날짜">	
						</div>
					</div>
				</div>
				<div class="searchCondition">
					<p><i class="fas fa-check"></i>&nbsp;<b>원하는 조건을 설정하세요</b></p>
					<ul>
						<li><div class="condition"><p>없음</p></div></li>
						<li><div class="condition"><p>대형견</p></div></li>
						<li><div class="condition"><p>소형견</p></div></li>
						<li><div class="condition"><p>반려묘</p></div></li>
					</ul>
				</div>
				<div class="searchButton">
					<div class="button">
						<p style="color: white;"><i class="fas fa-search"></i>&nbsp;<b>검색하기</b></p>
					</div>
				</div>
			</div>
		</form>
	</div>
	<!-- 펫시터 리스트 -->
	
	<div class="petList" align="center">
		<div style="width: 1300px;">
			<div class="petListTitle">
				<p class="titleL">HOT 펫시터 모아보기</p>	
				<a class="titleR"><span>더보기</span>&nbsp;<i class="fas fa-chevron-right" style="color: gray;"></i></a>
			</div>
			<div class="petListItem" align="center">
				<div class="card cardEach" style="width: 305px;">
           			<img src="${pageContext.request.contextPath}/resources/images/petsit/mong.jpg" class="card-img-top" alt="...">
           			<div class="card-body">
             			<h5 class="card-title">시터땡땡땡님</h5>
               			<p class="card-text">강아지를 사랑하는 시터입니다. 안심하고 아이를 맡겨주세요. 사랑으로 보살피고 케어하겠습니다! </p>
             			<a href="#" class="btn btn-primary">시터 만나기</a>
           			</div>
       			</div>
       			<div class="card cardEach" style="width: 305px;">
           			<img src="${pageContext.request.contextPath}/resources/images/petsit/mong.jpg" class="card-img-top" alt="...">
           			<div class="card-body">
             			<h5 class="card-title">시터땡땡땡님</h5>
               			<p class="card-text">강아지를 사랑하는 시터입니다. 안심하고 아이를 맡겨주세요. 사랑으로 보살피고 케어하겠습니다! </p>
             			<a href="#" class="btn btn-primary">시터 만나기</a>
           			</div>
       			</div>    			
       			<div class="card cardEach cardEachL" style="width: 305px;">
           			<img src="${pageContext.request.contextPath}/resources/images/petsit/mong.jpg" class="card-img-top" alt="...">
           			<div class="card-body">
             			<h5 class="card-title">시터땡땡땡님</h5>
               			<p class="card-text">강아지를 사랑하는 시터입니다. 안심하고 아이를 맡겨주세요. 사랑으로 보살피고 케어하겠습니다! </p>
             			<a href="#" class="btn btn-primary">시터 만나기</a>
           			</div>
       			</div>
       			<div class="card cardEach cardEachL" style="width: 305px;">
           			<img src="${pageContext.request.contextPath}/resources/images/petsit/mong.jpg" class="card-img-top" alt="...">
           			<div class="card-body">
             			<h5 class="card-title">시터땡땡땡님</h5>
               			<p class="card-text">강아지를 사랑하는 시터입니다. 안심하고 아이를 맡겨주세요. 사랑으로 보살피고 케어하겠습니다! </p>
             			<a href="#" class="btn btn-primary">시터 만나기</a>
           			</div>
       			</div>		
       		</div>			
		</div>
	</div>
	<!-- 펫시터 리스트 -->
	<div class="petList" align="center">
		<div style="width: 1300px;">
			<div class="petListTitle">
				<p class="titleL">HOT 펫시터 모아보기</p>	
				<a class="titleR"><span>더보기</span>&nbsp;<i class="fas fa-chevron-right" style="color: gray;"></i></a>
			</div>
			<div class="petListItem">
				<div class="card cardEach" style="width: 305px;">
           			<img src="${pageContext.request.contextPath}/resources/images/petsit/mong.jpg" class="card-img-top" alt="...">
           			<div class="card-body">
             			<h5 class="card-title">시터땡땡땡님</h5>
               			<p class="card-text">강아지를 사랑하는 시터입니다. 안심하고 아이를 맡겨주세요. 사랑으로 보살피고 케어하겠습니다! </p>
             			<a href="#" class="btn btn-primary">시터 만나기</a>
           			</div>
       			</div>
       			<div class="card cardEach" style="width: 305px;">
           			<img src="${pageContext.request.contextPath}/resources/images/petsit/mong.jpg" class="card-img-top" alt="...">
           			<div class="card-body">
             			<h5 class="card-title">시터땡땡땡님</h5>
               			<p class="card-text">강아지를 사랑하는 시터입니다. 안심하고 아이를 맡겨주세요. 사랑으로 보살피고 케어하겠습니다! </p>
             			<a href="#" class="btn btn-primary">시터 만나기</a>
           			</div>
       			</div>    			
       			<div class="card cardEach cardEachL" style="width: 305px;">
           			<img src="${pageContext.request.contextPath}/resources/images/petsit/mong.jpg" class="card-img-top" alt="...">
           			<div class="card-body">
             			<h5 class="card-title">시터땡땡땡님</h5>
               			<p class="card-text">강아지를 사랑하는 시터입니다. 안심하고 아이를 맡겨주세요. 사랑으로 보살피고 케어하겠습니다! </p>
             			<a href="#" class="btn btn-primary">시터 만나기</a>
           			</div>
       			</div>
       			<div class="card cardEach cardEachL" style="width: 305px;">
           			<img src="${pageContext.request.contextPath}/resources/images/petsit/mong.jpg" class="card-img-top" alt="...">
           			<div class="card-body">
             			<h5 class="card-title">시터땡땡땡님</h5>
               			<p class="card-text">강아지를 사랑하는 시터입니다. 안심하고 아이를 맡겨주세요. 사랑으로 보살피고 케어하겠습니다! </p>
             			<a href="#" class="btn btn-primary">시터 만나기</a>
           			</div>
       			</div>				
			</div>
		</div>	
	</div>
	<!-- 펫시터 리스트 -->
	<div class="petList" align="center">
		<div style="width: 1300px;">
			<div class="petListTitle">
				<p class="titleL">HOT 펫시터 모아보기</p>	
				<a class="titleR"><span>더보기</span>&nbsp;<i class="fas fa-chevron-right" style="color: gray;"></i></a>
			</div>
			<div class="petListItem">
				<div class="card cardEach" style="width: 305px;">
           			<img src="${pageContext.request.contextPath}/resources/images/petsit/mong.jpg" class="card-img-top" alt="...">
           			<div class="card-body">
             			<h5 class="card-title">시터땡땡땡님</h5>
               			<p class="card-text">강아지를 사랑하는 시터입니다. 안심하고 아이를 맡겨주세요. 사랑으로 보살피고 케어하겠습니다! </p>
             			<a href="#" class="btn btn-primary">시터 만나기</a>
           			</div>
       			</div>
       			<div class="card cardEach" style="width: 305px;">
           			<img src="${pageContext.request.contextPath}/resources/images/petsit/mong.jpg" class="card-img-top" alt="...">
           			<div class="card-body">
             			<h5 class="card-title">시터땡땡땡님</h5>
               			<p class="card-text">강아지를 사랑하는 시터입니다. 안심하고 아이를 맡겨주세요. 사랑으로 보살피고 케어하겠습니다! </p>
             			<a href="#" class="btn btn-primary">시터 만나기</a>
           			</div>
       			</div>    			
       			<div class="card cardEach cardEachL" style="width: 305px;">
           			<img src="${pageContext.request.contextPath}/resources/images/petsit/mong.jpg" class="card-img-top" alt="...">
           			<div class="card-body">
             			<h5 class="card-title">시터땡땡땡님</h5>
               			<p class="card-text">강아지를 사랑하는 시터입니다. 안심하고 아이를 맡겨주세요. 사랑으로 보살피고 케어하겠습니다! </p>
             			<a href="#" class="btn btn-primary">시터 만나기</a>
           			</div>
       			</div>
       			<div class="card cardEach cardEachL" style="width: 305px;">
           			<img src="${pageContext.request.contextPath}/resources/images/petsit/mong.jpg" class="card-img-top" alt="...">
           			<div class="card-body">
             			<h5 class="card-title">시터땡땡땡님</h5>
               			<p class="card-text">강아지를 사랑하는 시터입니다. 안심하고 아이를 맡겨주세요. 사랑으로 보살피고 케어하겠습니다! </p>
             			<a href="#" class="btn btn-primary">시터 만나기</a>
           			</div>
       			</div>				
			</div>
		</div>	
	</div>
	<!-- 펫시터 리스트 -->
	<div class="petList" align="center">
		<div style="width: 1300px;">
			<div class="petListTitle">
				<p class="titleL">HOT 펫시터 모아보기</p>	
				<a class="titleR"><span>더보기</span>&nbsp;<i class="fas fa-chevron-right" style="color: gray;"></i></a>
			</div>
			<div class="petListItem">
				<div class="card cardEach" style="width: 305px;">
           			<img src="${pageContext.request.contextPath}/resources/images/petsit/mong.jpg" class="card-img-top" alt="...">
           			<div class="card-body">
             			<h5 class="card-title">시터땡땡땡님</h5>
               			<p class="card-text">강아지를 사랑하는 시터입니다. 안심하고 아이를 맡겨주세요. 사랑으로 보살피고 케어하겠습니다! </p>
             			<a href="#" class="btn btn-primary">Go somewhere</a>
           			</div>
       			</div>
       			<div class="card cardEach" style="width: 305px;">
           			<img src="${pageContext.request.contextPath}/resources/images/petsit/mong.jpg" class="card-img-top" alt="...">
           			<div class="card-body">
             			<h5 class="card-title">시터땡땡땡님</h5>
               			<p class="card-text">강아지를 사랑하는 시터입니다. 안심하고 아이를 맡겨주세요. 사랑으로 보살피고 케어하겠습니다! </p>
             			<a href="#" class="btn btn-primary">Go somewhere</a>
           			</div>
       			</div>    			
       			<div class="card cardEach cardEachL" style="width: 305px;">
           			<img src="${pageContext.request.contextPath}/resources/images/petsit/mong.jpg" class="card-img-top" alt="...">
           			<div class="card-body">
             			<h5 class="card-title">시터땡땡땡님</h5>
               			<p class="card-text">강아지를 사랑하는 시터입니다. 안심하고 아이를 맡겨주세요. 사랑으로 보살피고 케어하겠습니다! </p>
             			<a href="#" class="btn btn-primary">시터 만나기</a>
           			</div>
       			</div>
       			<div class="card cardEach cardEachL" style="width: 305px;">
           			<img src="${pageContext.request.contextPath}/resources/images/petsit/mong.jpg" class="card-img-top" alt="...">
           			<div class="card-body">
             			<h5 class="card-title">시터땡땡땡님</h5>
               			<p class="card-text">강아지를 사랑하는 시터입니다. 안심하고 아이를 맡겨주세요. 사랑으로 보살피고 케어하겠습니다! </p>
             			<a href="#" class="btn btn-primary">시터 만나기</a>
           			</div>
       			</div>				
			</div>
		</div>
	</div>
</div>
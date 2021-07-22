<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="storeHeader">

<div class="top-bar fixed-top">
	<div class="container flex-center">
		<div class="top-info">
		             <a href="${pageContext.request.contextPath}/" class="headTitleA" style="text-decoration: none;">
                <span class="titleTop">
                <img alt=""  width="160px" src="${pageContext.request.contextPath}/resources/images/product/logoWW.png">                         
                </span>
            </a>
		</div>
		<div class="top-links">
			<c:choose>
				<c:when test="${not empty sessionScope.member}">
					<c:choose>
						<c:when test="${sessionScope.member.mRole eq 0}">
			                <span class="headerUserName">${sessionScope.member.mNick}</span>님
			                &nbsp;|&nbsp;
			                <a href="${pageContext.request.contextPath}/member/logout"><span>로그아웃</span></a>
			                &nbsp;|&nbsp;             
							<a href="${pageContext.request.contextPath}/admin"><i class="fas fa-user-secret"></i></a>
						</c:when>
						<c:otherwise>
			                <span class="headerUserName">${sessionScope.member.mNick}</span>님
			                &nbsp;|&nbsp;
			                <a href="${pageContext.request.contextPath}/member/logout"><span>로그아웃</span></a>
			                &nbsp;|&nbsp;
						</c:otherwise>
					</c:choose>
                </c:when>
				<c:otherwise>
					<a href="${pageContext.request.contextPath}/member/login" title="로그인">로그인</a>			
					<a href="${pageContext.request.contextPath}/"><i class="fas fa-user-alt"></i>
	            	</a>
	            	&nbsp;&nbsp;|
	            	<a class="headerIcon" href="${pageContext.request.contextPath}/"><i class="fas fa-shopping-cart"></i>
	        		</a>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>

<div class="headerBottom">
<nav class="navbar navbar-expand-lg navbar-light ">


  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto"> 
      <li class="nav-item active item">
	        <a class="nav-link" href="${pageContext.request.contextPath}/mypage/profile">프로필정보 <span class="sr-only">(current)</span></a>
	      </li>
		<li class="nav-item active item">
	        <a class="nav-link" href="${pageContext.request.contextPath}/mypage/storeList">구매 내역 <span class="sr-only">(current)</span></a>
	    </li>   
		<li class="nav-item active item">
	        <a class="nav-link" href="${pageContext.request.contextPath}/mypage/petsitList">예약 내역 <span class="sr-only">(current)</span></a>
	    </li>
	    <li class="nav-item active item">
	        <a class="nav-link" href="${pageContext.request.contextPath}/mypage/mileage">마일리지 <span class="sr-only">(current)</span></a>
	    </li> 
		<li class="nav-item active item">
	        <a class="nav-link" href="${pageContext.request.contextPath}/mypage/changePwd">비밀번호 변경 <span class="sr-only">(current)</span></a>
	    </li>
		<li class="nav-item active item">
	        <a class="nav-link" href="${pageContext.request.contextPath}/center/notice">공지사항 <span class="sr-only">(current)</span></a>
	    </li>	       	                              
    </ul>

  </div>
</nav>
</div>
</div>

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
                               
                <img alt=""  width="150px" src="${pageContext.request.contextPath}/resources/images/product/logoWW.png">
              
                </span></a>
		</div>
		<div class="top-links">
			<c:choose>
				<c:when test="${not empty sessionScope.member}">
					<c:choose>
						<c:when test="${sessionScope.member.mRole eq 0}">
			                <a class="headerUserName" href="${pageContext.request.contextPath}/admin"><span>${sessionScope.member.mNick}님</span></a>
			                <a href="${pageContext.request.contextPath}/admin"><i class="fas fa-user-cog"></i></a>
			                &nbsp;|&nbsp;
			                <a href="${pageContext.request.contextPath}/member/logout"><span>로그아웃</span></a>         
						</c:when>
						<c:otherwise>
			                <span class="headerUserName">${sessionScope.member.mNick}</span>님
							<a href="${pageContext.request.contextPath}/mypage/profile"><i class="fas fa-user-alt"></i></a>			                
							&nbsp;|&nbsp;
			                <a href="${pageContext.request.contextPath}/member/logout"><span>로그아웃</span></a>
						</c:otherwise>
					</c:choose>
                </c:when>
				<c:otherwise>
					<a href="${pageContext.request.contextPath}/member/login" title="로그인">회원 로그인</a>			
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>

<div class="headerBottom">
<nav class="navbar navbar-expand-lg navbar-light bg-light navfont">

  <a class="navbar-brand title" href="${pageContext.request.contextPath}/product/main">떼껄룩 스토어</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>  

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto"> 
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
       	 사료
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="${pageContext.request.contextPath}/product/cateList/1">강아지 사료</a>
          <a class="dropdown-item" href="${pageContext.request.contextPath}/product/cateList/5">고양이 사료</a>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
       	   간식
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="${pageContext.request.contextPath}/product/cateList/4">강아지 간식</a>
          <a class="dropdown-item" href="${pageContext.request.contextPath}/product/cateList/8">고양이 간식</a>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
       	   외출용품
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="${pageContext.request.contextPath}/product/cateList/2">강아지 외출용품</a>
          <a class="dropdown-item" href="${pageContext.request.contextPath}/product/cateList/6">고양이 외출용품</a>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
       	   장난감
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="${pageContext.request.contextPath}/product/cateList/3">강아지 장난감</a>
          <a class="dropdown-item" href="${pageContext.request.contextPath}/product/cateList/7">고양이 장난감</a>
          </div>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="${pageContext.request.contextPath}/product/list">전체상품 <span class="sr-only">(current)</span></a>
      </li>      
       <c:if test="${sessionScope.member.mRole eq 0}">
       <li class="nav-item active">
        <a class="nav-link" style="color: orange;"  href="${pageContext.request.contextPath}/product/created">상품 등록 <span class="sr-only">(current)</span></a>
      </li>     
       </c:if>         
    </ul>
    <form class="form-inline my-2 my-lg-0" name="searchForm" action="${pageContext.request.contextPath}/product/list" method="post">
      <input class="form-control mr-sm-2" type="search"  name="keyword" placeholder="상품검색" aria-label="Search">
      <button class="btn btn-outline-warning my-2 my-sm-0 mainBtn" type="submit">검색</button>
    </form>
  </div>
</nav>
</div>
</div>

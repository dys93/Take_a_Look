<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<style type="text/css">
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
.storeBody .productTitle{
	font-size: 30px;
    text-align: center;
    margin-top: 100px;
    margin-bottom: 30px;
	color: #023047; 
	font-family: Cafe24Ssurround;
}

.storeSlide{

	font-family: Cafe24SsurroundAir;
}

.totProductView{
	float: right;
	font-family: Cafe24SsurroundAir;
	text-decoration: none;
}

.popularCard{
	 height: 350px;
}
.toycardImg{
	width: 1000px;
	margin: auto;
}
.card-title{
	font-family: GmarketSansMedium;
}
.card-text{
	font-family: Cafe24SsurroundAir;
}

.btnToy{
	width: 300px;
    height: 35px;
    border: none;
    color: whitesmoke;
    border-radius: 5px;
    font-size: 17px; 
	background: #023047;
	box-shadow:inset -2px -2px 7px 1px rgb(0 0 0 / 10%), 4px 3px 7px 1px rgb(0 0 0 / 10%);
	transition: 0.3s;  
	font-family: GmarketSansMedium;	 	
}

.btnToy:hover{
    color: whitesmoke;
	background: #073f5a;
	box-shadow: inset -5px -3px 7px 1px rgb(0 0 0 / 10%),4px 3px 7px 1px rgb(0 0 0 / 10%);	
	font-family: GmarketSansMedium;
}



.storeBody .imgstore{
	height: 300px;
}

</style>

<div class="storeBody">
		<div id="carouselExampleCaptions" class="carousel slide storeSlide" data-ride="carousel">
		  <ol class="carousel-indicators">
		    <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
		    <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
		    <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
		  </ol>
		  <div class="carousel-inner">
		    <div class="carousel-item active imgstore">
		      <img src="${pageContext.request.contextPath}/resources/images/storeMain/slide4.png" class="d-block w-100 " alt="...">
		      <div class="carousel-caption d-none d-md-block">
		        <h5>떼껄룩 스토어의 일부 수익금은 유기동물 보호를 위해 사용됩니다</h5>
		      </div>
		    </div>
		    <div class="carousel-item imgstore">
		      <img src="${pageContext.request.contextPath}/resources/images/storeMain/slide3.png" class="d-block w-100 " alt="...">
		      <div class="carousel-caption d-none d-md-block">
		        <h5>고객 감사 이벤트</h5>
		        <p>강아지/고양이 사료 일부품목 무료 배송 이벤트 진행 중</p>
		      </div>
		    </div>
		    <div class="carousel-item imgstore">
		      <img src="${pageContext.request.contextPath}/resources/images/storeMain/slide1.png" class="d-block w-100 "  alt="...">
		      <div class="carousel-caption d-none d-md-block">
		        <h5>집에서 안전하게 놀아요</h5>
		        <p>실내에서도 반려동물의 에너지를 발산시킬 수 있는 장난감 상품 입고</p>
		      </div>
		    </div>
		  </div>
		  <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="sr-only">Previous</span>
		  </a>
		  <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="sr-only">Next</span>
		  </a>
		</div>
		
		<div class="storebody-main">
		
		<div id="popularWhole">
		<div class="popularProductText productTitle">
			떼껄룩의 인기상품들을 만나보세요
		</div>	
			<div class="card-deck ">
				<c:forEach var="dto" items="${listBestProduct}">
					<div class="card popularCard">
						<a href="${pageContext.request.contextPath}/product/article?category=${dto.pCateNum}&page=1&pNum=${dto.pNum}"><img src="${pageContext.request.contextPath}/uploads/product/${dto.pImgName}" class="main-img" style="width: 200px;" alt="..."></a>
						<div class="card-body">
							<fmt:parseNumber value="${(dto.pPrice + dto.pDetailPrice)*(1-(dto.pDiscountRate/100))}" var="price" type="number" integerOnly="true"/>
				    		<h5 class="card-text"> ${price} 원</h5>
			    			<p class="card-text">${dto.pName}</p>					
						</div>
					</div>
				</c:forEach>	
			</div>														
		</div>
		<div id="totalProductWhole">
		<div class="totalProductText productTitle">
			떼껄룩스토어 전체상품
		</div>			
			<div class="card-deck ">
				<c:forEach var="dto" items="${listTotProduct}">
					<div class="card popularCard">
						<a href="${pageContext.request.contextPath}/product/article?category=${dto.pCateNum}&page=1&pNum=${dto.pNum}"><img src="${pageContext.request.contextPath}/uploads/product/${dto.pImgName}" class="main-img "style="width: 200px;" alt="..."></a>
						<div class="card-body">
							<fmt:parseNumber value="${(dto.pPrice + dto.pDetailPrice)*(1-(dto.pDiscountRate/100))}" var="price" type="number" integerOnly="true"/>
				    		<h5 class="card-text"> ${price} 원</h5>
			    			<p class="card-text">${dto.pName}</p>					
						</div>
					</div>
				</c:forEach>	
			</div>
			<a href="${pageContext.request.contextPath}/product/list" class="totProductView" style="color: orange;">전체상품 더보기</a>
		</div>			
		<div class="banner donation">
			<img src="${pageContext.request.contextPath}/resources/images/storeMain/do3.jpg" class="d-block w-100 " alt="...">
		</div>		
		<div class="card border-light cardBoarder">
		  <img src="${pageContext.request.contextPath}/resources/images/storeMain/dogRun.jpg" class="card-img-top toycardImg">
			  <div class="card-body">
			    <h5 class="card-title">외출시에도 걱정 없이</h5>
			    <p class="card-text">활동량이 많고 활발한 견종들을 위한 외출용품들이 구비되어있습니다. 외출준비하러 가볼까요?</p>
			    <a href="${pageContext.request.contextPath}/product/cateList/2" class="btn btnToy" style="color: white;">구매하기</a>
			  </div>
		</div>		
		<div class="newProductText productTitle">
			새로 들어온 상품들을 구경해 보세요!
		</div>			
			<div class="card-deck ">
				<c:forEach var="dto" items="${listNewProduct}">
					<div class="card popularCard">
						<a href="${pageContext.request.contextPath}/product/article?category=${dto.pCateNum}&page=1&pNum=${dto.pNum}"><img src="${pageContext.request.contextPath}/uploads/product/${dto.pImgName}" class="main-img " style="width: 200px;" alt="..."></a>
						<div class="card-body">
							<fmt:parseNumber value="${(dto.pPrice + dto.pDetailPrice)*(1-(dto.pDiscountRate/100))}" var="price" type="number" integerOnly="true"/>
				    		<h5 class="card-text"> ${price} 원</h5>
			    			<p class="card-text">${dto.pName}</p>					
						</div>
					</div>
				</c:forEach>	
			</div>
		<div class="banner donation">
				<img src="${pageContext.request.contextPath}/resources/images/storeMain/bannerBottom.jpg" class="card-img" alt="...">
		</div>								
	</div>
</div>




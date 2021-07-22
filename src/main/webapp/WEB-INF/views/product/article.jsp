<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- 상품 상세정보 소비자에게 보임-->

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

.sumBox{
	width: 150px;
    text-align: right;
    border:  1px solid white;
}

.imgLayout {
	max-width: 700px;
	padding: 5px;
	box-sizing: border-box;
	border: 1px solid #ccc;
	display: flex; /* 자손요소를 flexbox로 변경 */
	flex-direction: row; /* 정방향 수평나열 */
	flex-wrap: nowrap;
	overflow-x: auto;
}
.imgLayout img {
	width: 100px; height: 100px;
	margin-right: 5px;
	flex: 0 0 auto;
	cursor: pointer;
}
.productArticleBody{
	margin: 0; padding: 0;
}

.productArticleMain{
	width: 1300px;
	margin: auto;
}
#carouselExampleFade{
	width: 500px;
	float: left;
}

.productName{

    font-size: 25px;
    padding-bottom: 15px;
}

.inform{
	float: left;
	width: 500px;
	margin-top: 50px;
	font-family: GmarketSansMedium;	
}

.inform tr:nth-child(1){
	font-size: 20px;
}
.buyingProduct{
    float: right;
    width: 300px;
    margin-top: 50px;
    font-family: GmarketSansMedium;
    margin-right: 200px;
    font-size: 20px;
}

.content{
	clear: both;
}
.topContent{
	margin: auto;
	width: 1000px;
}
.adminController{
	clear: both;
	width: 1000px;
	margin: auto;
	margin-top: 50px;
}
.adminController td{
	padding-left: 50px;
}
.btnQty{
	background-color: whitesmoke;
    font-size: 18px;
    border-radius: 8px;	
    transition: 0.5s;
	box-shadow: 0px 0px 2px 0px rgb(0 0 0 / 10%);     
	border: none;	

}
.btnQty:hover{
	background-color: #023047;
	color: #efefef;
	box-shadow: 1px 0px 2px 0px rgb(0 0 0 / 10%);  

}

.btnBig{
	width: 300px;
    height: 35px;
    border: none;
    background: #ffb84d;
    border-radius: 5px;
	color: white;
    font-size: 17px;    
}

.btnBuy{
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
.btnBuy:hover{
    color: whitesmoke;
	background: #073f5a;
	box-shadow: inset -5px -3px 7px 1px rgb(0 0 0 / 10%),4px 3px 7px 1px rgb(0 0 0 / 10%);	
	font-family: GmarketSansMedium;
}

.margin{
	margin-left: 50px;
    margin-right: 30px;
}

.quantityBorder{
	border: none;
    width: 158px;
    text-align: center;
}
.payProduct{
/*
	clear: both;
    width: 500px;
    float: right;

*/
}

.qty{
	width: 50px;
}

 .paging {
   text-align: center;
   color: orange;
   font-weight: 500;
}

.listReviewFooter{
   text-align: center;
   margin-top: 25px;
}
.more{
   font-weight: 500;
   
}

.rList {
   display: flex;
    flex-direction: column;
    border-top: 1px solid rgb(235, 235, 235);
    padding: 38px 0px 0px 0px;
    width: 100%;
    font-size: 20px;
    font-family: Cafe24SsurroundAir;
}

.review-list{
	padding-left: 200px;
}

.reviewT{
	font-family: GmarketSansMedium;
}
.reviewGrade{
	color: tomato;
	font-weight: bold;
}

.buyPrice{
float: right;
}
</style>
<script type="text/javascript">

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

function pay(){
	
	var f = document.articleform;
	
	var str = f.sDetailQty.value;
	
	if(str=="" || str == 0){
		alert("수량을 선택해 주세요.")
		f.sDetailQty.focus();
		return;
	}
	
	f.action = "${pageContext.request.contextPath}/product/order";

	f.submit();
	
}

function deleteProduct(){
	var query = "${query}&pNum=${dto.pNum}";
	var url = "${pageContext.request.contextPath}/product/delete?"+query;
	
	if(confirm("해당 상품 게시물을 삭제하시겠습니까? ")){
		location.href = url;
	}
	
}

$(function(){
	
	$(".productArticleBody").on("click", ".btnPlus", function(){
		var qty = parseInt($("input[name=sDetailQty]").val());
		var price = parseInt($("input[name=sum]").attr("data-price"));
				
		qty=qty+1;
		var s = qty * price;
		
		$("input[name=sDetailQty]").val(qty);
		$("input[name=sum]").val(s);
	});
	
	$(".productArticleBody").on("click", ".btnMinus", function(){
		var qty = parseInt($("input[name=sDetailQty]").val());
		var price = parseInt($("input[name=sum]").attr("data-price"));		
		
		qty=qty-1;
		var s = qty*price;
		if(qty<0){
			qty=0;
			
		}
		if(s<0){
			s=0;
		}
		
		$("input[name=sDetailQty]").val(qty);
		$("input[name=sum]").val(s);				
	});	
	
});

$(function(){
	$(".price").css({
	"text-decoration" :"line-through"
	});
});

$(function(){
	listPage(1);
});


function listPage(page){
	var url = "${pageContext.request.contextPath}/product/reviewList";
	var query = "pageNo="+page+"&pNum=${dto.pNum}";
	
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
		out+="    <p style='font-size:16px;'>등록된 후기가 없습니다 <i class='far fa-sad-tear'></i></p>";
		out+="    <p style='font-size:16px;'>상품을 구매하시고 이용 후기를 남겨보세요!</p>";
		out+="</div>"
		
		$("#listReviewBody").html(out);

		return;
	}
	
	if(page == 1) { //1페이지면 기존 내용 지우고 다시 추가 
		$("#listReviewBody").empty();
	}
	
	for(var idx=0; idx<data.reviewList.length; idx++) {
		var rNum=data.reviewList[idx].rNum;
		var mNick=data.reviewList[idx].mNick;
		//var mId=data.reviewList[idx].mId;
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
		out+="    <div class='rImg'style='border: 1px solid black; width:70px; height:70px;'><img style='width:70px; height:70px;'src='${pageContext.request.contextPath}/upload/profileImages/"+mProfileImg+"'></div>";
		out+="    <div class='rTContent'><p>"+mNick+"</p><p>"+rCreated+"</p></div>";
		out+="</div>";		
		out+="<p>후기 평점:<span class='reviewGrade'>"+rGrade+"</span></p>";
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
	console.log(page);
	console.log(totalPage);
	
}
//더보기
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


</script>

<div class="productArticleBody">
	<div class="productArticleMain">
		<table class="adminController">
			<tr>
				<td>
					<c:if test="${sessionScope.member.mRole eq 0}">
						<button type="button" class="btnBig margin" onclick="javascript:location.href='${pageContext.request.contextPath}/product/update?category=${category}&page=${page}&pNum=${dto.pNum}';">수정</button>
						<button type="button" class="btnBig margin" onclick="deleteProduct();">삭제</button>
					</c:if>
				</td>
			</tr>
		</table>		
		<div class="topContent">
			<c:if test="${listProductImage.size() > 0}">
			<div id="carouselExampleFade" class="carousel slide carousel-fade" data-ride="carousel">	  
			  <div class="carousel-inner">
			  	<c:forEach var="vo" items="${listProductImage}" varStatus="status">
				    <div class="carousel-item ${status.index==0?'active':'' }">
				      <img src="${pageContext.request.contextPath}/uploads/product/${vo.pImgName}" class="d-block w-100" alt="...">
				    </div>
			    </c:forEach>
			  </div>
			  <a class="carousel-control-prev" href="#carouselExampleFade" role="button" data-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="sr-only">Previous</span>
			  </a>
			  <a class="carousel-control-next" href="#carouselExampleFade" role="button" data-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="sr-only">Next</span>
			  </a>
			</div>
			</c:if>
			
			<table class="inform">
				<tr style="font-size: 20px;">
					<td class="productName">
						${dto.pName}
					</td>
				</tr>
				<c:choose>
					<c:when test="${dto.pDiscountRate != 0}">		
						<tr class="price">
							<td style="font-size: 20px;">
								판매가 ${dto.productPrice}									
							</td>
						</tr>			
						<tr>
							<td style="font-size: 27px;  color: orange; font-weight: bold;">
								할인가 ${dto.totPrice}
							</td>
						</tr>	
					</c:when>
					<c:otherwise>
						<tr>
							<td>
								판매가 ${dto.productPrice}									
							</td>
						</tr>				
					</c:otherwise>
				</c:choose>
				<tr>
					<td>
						<c:if test="${dto.delivType ==0}">
							무료배송
						</c:if>						
					</td>
				</tr>
				
				</table>

				<table class="buyingProduct">
				<tr>
					<td>
						
						<form name="articleform" method="get" >
							수량 : <input type=hidden name="pNum"  value="${dto.pNum}">
							<input type="hidden" name="page" value="${page}">
							<input type="text" name="sDetailQty" value="1" class="quantityBorder">
							<input type="button" value=" - " class="btnMinus btnQty">
							<input type="button" value=" + " class="btnPlus btnQty" ><br>
							
							<c:choose>
								<c:when test="${dto.pDiscountRate != 0}">
									<span>TOTAL</span>
									<div class="buyPrice">
									<input type="text" name="sum" data-price="${dto.totPrice}" value="${dto.totPrice}" readonly="readonly" class="sumBox"><span>원</span>
									</div>
								</c:when>
								<c:otherwise>
									<span>₩</span><input type="text" name="sum" data-price=" ${dto.productPrice}" value="${dto.productPrice}" readonly="readonly" class="sumBox">								
								</c:otherwise>
							</c:choose>
						</form>					
					</td>						
				</tr>			
				</table>
				<div class="payProduct">				
					<button class="btnBuy" type="button" onclick="pay()">구매하기</button>
				</div>						
			
		</div>
		<div class="content">
			${dto.pContent}
		</div>
		
		<div class="review-list" id="listReview" style="margin-top: 50px;">
			<div class="reviewT">
				<h3>상품구매 후기</h3>
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

</div>
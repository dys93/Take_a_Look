<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<style type="text/css">

/*
파란색
#023047;
hover#116a96;

#219ebc;
hover#1f91ad;

하늘색
background: #8ecae6;
background: #8cbdd4;

background: #023047;
그림자 거의 없는 것
0px 0px 2px 0px rgb(0 0 0 / 10%);

그림자 약간 있는 것
box-shadow: 1px 3px 3px 0px rgb(0 0 0 / 10%);	
box-shadow: 2px 4px 3px 0px rgb(0 0 0 / 10%);

그림자 진한것
box-shadow: inset -5px -3px 7px 1px rgb(0 0 0 / 10%),4px 3px 7px 1px rgb(0 0 0 / 10%);
box-shadow: inset -6px -7px 7px 1px rgb(0 0 0 / 10%),4px 3px 7px 1px rgb(0 0 0 / 10%);
	
.testbtn{
   	background-color: #219ebc;
   	color: white;
   	border-radius: 3px;
   	border: 1px solid white;
   	width: 130px;
   	height: 50px;
	box-shadow: inset -5px -3px 7px 1px rgb(0 0 0 / 10%),4px 3px 7px 1px rgb(0 0 0 / 10%);
  	cursor: pointer;
 	transition: 0.5s;   	
   	
}
.testbtn:hover{
	background: #1f91ad;
	box-shadow: inset -6px -7px 7px 1px rgb(0 0 0 / 10%),4px 3px 7px 1px rgb(0 0 0 / 10%);
	
}



*/

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


.through{
	text-decoration: line-through;
	color: gray;	
}

.productListBody .prodcutListTop{
	font-family: GmarketSansMedium;
}

.productListBody{
	font-family: Cafe24SsurroundAir
}

.productListBody .productPrice{
    float: right;
    width: auto;
    font-size: 18px;
    height: 30px;
    line-height: 30px;
    clear: both;
}

.blue{
	color: #fb8500;
    font-weight: bolder;
    font-size: 23px;
}




</style>



<script type="text/javascript">

function article(pNum) {
	var url="${articleUrl}&pNum="+pNum;
	location.href=url;
}

</script>

<div class="productListBody">
	<div class="productListForm">	
		<div class="prodcutListTop">
				<div class="productListTitle">
					<h2>전체상품</h2>
				</div>
			<ul class="pageCountRight">
				<li class="pageCount">
					총 ${dataCount}개(${page}/${total_page}페이지)
				</li>
			</ul>
		</div>

		<table class="tables">
			<c:forEach var="dto" items="${list}" varStatus="status">
				<c:if test="${status.index==0}">
					<tr>
				</c:if>			
				<c:if test="${status.index!=0 && status.index%3==0}">
					<c:out value="</tr><tr>" escapeXml="false"/>									
				</c:if>
				<td width="210" align="center">
					<div class="imgLayout">
						<img src="${pageContext.request.contextPath}/uploads/product/${dto.pImgName}" width="400" height="500" border="0"
						onclick="javascript:article('${dto.pNum}');">
						<div class="product productName" onclick="javascript:article('${dto.pNum}');" >
							${dto.pName}
						</div>	
						<c:choose>
							<c:when test="${dto.pDiscountRate != 0}">
								<div class="product productPrice">		
									<span class="through">	
										₩${dto.productPrice}													
									</span>			
									<span class="bold blue">	
										₩${dto.totPrice}					
									</span>
								</div>	
							</c:when>
							<c:otherwise>
								<div class="product productPrice bold" >
									₩${dto.productPrice}									
								</div>				
							</c:otherwise>
						</c:choose>											
					</div>				
				</td>		
			</c:forEach>					
	
			<c:set var="n" value="${list.size()}"/>	
			<c:if test="${n>0&&n%3!=0}">
				<c:forEach var="i" begin="${n%3+1}" end="3" step="1">
					<td width="210">
						<div class="imgLayout">&nbsp;</div>
					</td>				
				</c:forEach>
			</c:if>

			<c:if test="${n!=0}">
				<c:out value="</tr>" escapeXml="false"/>
			</c:if>	
		</table>

		<table class="tables">
			<tr>
				<td align="center">
					${dataCount==0?"등록된 게시물이 없습니다.":paging}					
				</td>
			</tr>
		</table>


	</div>
</div>
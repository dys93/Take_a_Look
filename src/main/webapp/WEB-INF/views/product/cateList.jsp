<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<style type="text/css">
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
				<h2>${title}</h2>
			</div>
			<ul class="pageCountRight">				
					<li class="pageCount">
					총 ${dataCount}개(${page}/${total_page}페이지)
					</li>
			</ul>			
		</div>	
	<table class="tables">
			<c:forEach var="dto" items="${list}" varStatus="status">
				<c:if test="${category==dto.pCateNum}">
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
							<div  class="product productPrice bold"  >
									 ₩${dto.productPrice}									
							</div>				
							</c:otherwise>
						</c:choose>		
							
							
							
											
					</div>				
				</td>
				</c:if>
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
			<ul>
				<li>
				${dataCount==0?"등록된 게시물이 없습니다.":paging}	
				</li>
			</ul>
		
	</div>
</div>
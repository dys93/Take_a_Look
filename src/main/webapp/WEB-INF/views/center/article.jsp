<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style type="text/css">

div {
	font-family: 'Cafe24SsurroundAir';
	font-size: 15px;
}

.table-content tr > td {
	padding-left: 5px; padding-right: 5px;
}
</style>

<script type="text/javascript">
<c:if test="${sessionScope.member.mId=='admin'}">
	function deleteSend() {
		var query = "nNum=${dto.nNum}&${query}";
		var url = "${pageContext.request.contextPath}/center/delete?" + query;
	
		if(confirm("위 자료를 삭제하시겠습니까 ? ")) {
			location.href=url;
		}
	}
</c:if>
</script>

<div class="container body-container">
    <div class="body-title">
		<h2><i class="icofont-clip-board"></i> 공지사항 </h2>
    </div>
    
    <div class="body-main wx-700 ml-30 pt-15">
		<table class="table table-border table-content">
			<tr>
				<td colspan="2" align="center">
					${dto.nTitle}
				</td>
			</tr>
			
			<tr>
				<td width="50%" align="right">
					${dto.nCreated} | 조회 ${dto.nHit}
				</td>
			</tr>
			
			<tr>
				<td colspan="2" valign="top" height="200">
					${dto.nContent}
				</td>
			</tr>
			
			<c:forEach var="vo" items="${listFile}">
				<tr>
					<td colspan="2">
						<a href="${pageContext.request.contextPath}/center/download?fileNum=${vo.nFileNum}"><i class="icofont-file-alt"></i> ${vo.nOriginalFile}</a>
						(<fmt:formatNumber value="${vo.nFileSize/1024}" pattern="0.00"/> KByte)
					</td>
				</tr>
			</c:forEach>
			
			<tr>
				<td colspan="2">
					이전글 :
					<c:if test="${not empty preReadDto}">
						<a href="${pageContext.request.contextPath}/center/article?${query}&nNum=${preReadDto.nNum}">${preReadDto.nTitle}</a>
					</c:if>
				</td>
			</tr>
			
			<tr>
				<td colspan="2">
					다음글 :
					<c:if test="${not empty nextReadDto}">
						<a href="${pageContext.request.contextPath}/center/article?${query}&nNum=${nextReadDto.nNum}">${nextReadDto.nTitle}</a>
					</c:if>
				</td>
			</tr>
		</table>
			
		<table class="table">
			<tr>
				<td width="50%" align="left">
					<c:choose>
						<c:when test="${sessionScope.member.mId=='admin'}">
			    			<button type="button" style="border: 1px solid gray;" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/center/update?nNum=${dto.nNum}&page=${page}';">수정</button>
			    		</c:when>
			    		<c:otherwise>
			    			<button type="button" style="border: 1px solid gray;" class="btn" disabled="disabled">수정</button>
			    		</c:otherwise>
			    	</c:choose>
			    	
			    	<c:choose>
			    		<c:when test="${sessionScope.member.mId=='admin'}">
			    			<button type="button" style="border: 1px solid gray;" class="btn" onclick="deleteSend();">삭제</button>
			    		</c:when>
			    		<c:otherwise>
			    			<button type="button" style="border: 1px solid gray;" class="btn" disabled="disabled">삭제</button>
			    		</c:otherwise>
			    	</c:choose>
				</td>
			
				<td align="right">
					<button type="button" style="border: 1px solid gray;" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/center/notice?${query}';">리스트</button>
				</td>
			</tr>
		</table>
    </div>
    
</div>
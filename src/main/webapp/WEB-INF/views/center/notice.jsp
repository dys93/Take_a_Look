<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style type="text/css">

.body-container {
	font-family: 'Cafe24SsurroundAir';
	font-size: 15px;
	text-align: center;
}

.table-content tr {
	font-family: 'Cafe24SsurroundAir';
	font-size: 15px;
	text-align: center;
	text-align: center;
}
.table-content tr:first-child {
	font-family: 'Cafe24SsurroundAir';
	font-size: 15px;
	font-color: white;
	text-align: center;
	background-color: #F7BE81;
}
.table-content tr > th {
	font-family: 'Cafe24SsurroundAir';
	font-size: 15px;
	text-align: center;
	color: #777;
}
.table-content tr > td:nth-child(2) {
	font-family: 'Cafe24SsurroundAir';
	font-size: 15px;
	box-sizing: border-box;
	padding-left: 10px;
	text-align: left;
}

</style>

<script type="text/javascript">
function searchList() {
	var f=document.searchForm;
	f.submit();
}
</script>

<div class="container body-container">
    <div class="body-title">
		<h2><i class="icofont-clip-board"></i> 공지사항 </h2>
    </div>
    
    <div class="body-main wx-800 ml-30">
		<table class="table">
			<tr>
				<td align="left" width="50%">
					${dataCount}개(${page}/${total_page} 페이지)
				</td>
				<td align="right">
					&nbsp;
				</td>
			</tr>
		</table>
		
		<table class="table table-border table-content">
			<tr> 
				<th width="60">번호</th>
				<th width="500">제목</th>
				<th width="100">작성자</th>
				<th width="100">작성일</th>
				<th width="60">조회수</th>
				<th width="50">첨부</th>
			</tr>
		 
			<c:forEach var="dto" items="${noticeList}">
			<tr> 
				<td><span style="display: inline-block;padding:1px 3px; background: #ED4C00; color: #fff">${dto.nCateName}</span></td>
				<td>
					<a href="${articleUrl}&nNum=${dto.nNum}">${dto.nTitle}</a>
				</td>
				<td>${dto.mId}</td>
				<td>${dto.nCreated}</td>
				<td>${dto.nHit}</td>
				<td>
					<c:if test="${dto.fileCount != 0}">
						<a href="${pageContext.request.contextPath}/center/zipdownload?nNum=${dto.nNum}"><i class="far fa-file"></i></a>
					</c:if>		      
				</td>
			</tr>
			</c:forEach>
		 
			<c:forEach var="dto" items="${list}">
			<tr> 
				<td>${dto.listNum}</td>
				<td>
					<a href="${articleUrl}&nNum=${dto.nNum}">${dto.nTitle}</a>
				</td>
				<td>${dto.mId}</td>
				<td>${dto.nCreated}</td>
				<td>${dto.nHit}</td>
				<td>
					<c:if test="${dto.fileCount != 0}">
						<a href="${pageContext.request.contextPath}/center/zipdownload?nNum=${dto.nNum}"><i class="far fa-file"></i></a>
					</c:if>		      
				</td>
			</tr>
			</c:forEach>
		</table>
		 
		<table class="table">
			<tr>
				<td align="center">
					${dataCount==0 ? "등록된 게시물이 없습니다.":paging}
				</td>
			</tr>
		</table>
		
		<table class="table">
			<tr>
				<td align="left" width="100">
					<button type="button" style="width: 120%; border: 1px solid gray;" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/center/notice';">새로고침</button>
				</td>
				<td align="center">
					<form name="searchForm" action="${pageContext.request.contextPath}/center/notice" method="post">
						<select name="condition" class="selectField">
							<option value="all" ${condition=="all"?"selected='selected'":""}>모두</option>
							<option value="subject" ${condition=="subject"?"selected='selected'":""}>제목</option>
							<option value="content" ${condition=="content"?"selected='selected'":""}>내용</option>
							<option value="mId" ${condition=="mId"?"selected='selected'":""}>작성자</option>
							<option value="created" ${condition=="created"?"selected='selected'":""}>등록일</option>
						</select>
						<input type="text" name="keyword" value="${keyword}" class="boxTF">
						<button type="button" class="btn" onclick="searchList()">검색</button>
					</form>
				</td>
				<td align="right" width="100">
					<c:if test="${sessionScope.member.mId=='admin'}">
						<button type="button" style="width: 120%; border: 1px solid gray;" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/center/created';">글올리기</button>
					</c:if>
				</td>
			</tr>
		</table>
	</div>

</div>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<style type="text/css">

</style>

<div class="modal-detail">
<table style="margin: 10px auto 20px; width: 100%; border-spacing: 1px; background: #ccc">
	<tr class="detail detail-top">
		<td class="detail-bold" align="center" width="15%" style="padding-right: 7px;"><label style="font-weight: 900;">아이디</label></td>
		<td class="detail-normal" align="left" width="35%" style="padding-left: 5px;"><span>${dto.mId}</span></td>
		<td class="detail-bold" align="center" width="15%" style="padding-right: 7px;"><label style="font-weight: 900;">고객번호</label></td>
		<td class="detail-normal" align="left" width="35%" style="padding-left: 5px;"><span>${dto.mNum}</span></td>
	</tr>
	<tr class="detail detail-top">
		<td class="detail-bold" align="center" style="padding-right: 9px;"><label style="font-weight: 900;">이름</label></td>
		<td class="detail-normal" align="left" style="padding-left: 5px;"><span>${dto.mName}</span></td>
		<td class="detail-bold" align="center" style="padding-right: 9px;"><label style="font-weight: 900;">생년월일</label></td>
		<td class="detail-normal" align="left" style="padding-left: 5px;"><span>${dto.mBirth}</span></td>
	</tr>
	<tr class="detail detail-top">
		<td class="detail-bold" align="center" style="padding-right: 9px;"><label style="font-weight: 900;">전화번호</label></td>
		<td class="detail-normal" align="left" style="padding-left: 5px;"><span>${dto.mTel}</span></td>
		<td class="detail-bold" align="center" style="padding-right: 9px;"><label style="font-weight: 900;">이메일</label></td>
		<td class="detail-normal" align="left" style="padding-left: 5px;"><span>${dto.mEmail}</span></td>
	</tr>
	<tr class="detail detail-top">
		<td class="detail-bold" align="center" style="padding-right: 9px;"><label style="font-weight: 900;">회원가입일</label></td>
		<td class="detail-normal" align="left" style="padding-left: 5px;"><span>${dto.createdDate}</span></td>
		<td class="detail-bold" align="center" style="padding-right: 9px;"><label style="font-weight: 900;">최근로그인</label></td>
		<td class="detail-normal" align="left" style="padding-left: 5px;"><span>${dto.lastLogin}</span></td>
	</tr>
	
	<tr class="detail detail-top">
		<td class="detail-bold" align="center" width="15%" style="padding-right: 9px;"><label style="font-weight: 900;">계정상태</label></td>
		<td class="detail-normal" align="left" colspan="3" style="padding-left: 5px;">
			${dto.mState==0?"활성":"잠금"}
			<c:if test="${dto.mState==1 && not empty memberState}">, ${memberState.memo}</c:if>
			&nbsp;<span class="btn" onclick="memberStateDetailView('${dto.mId}');" style="cursor: pointer;">자세히</span>
		</td>
	</tr>
</table>

<form id="detailedMemberForm" name="detailedMemberForm" method="post">
	<h3 style="font-size: 17px; font-weight: 700;">유저 상태 변경</h3>
	
	<table style="margin: 5px auto 0; width: 100%; border-spacing: 1px; background: #ccc">
		<tr height="37" style="background: #fff;">
			<td class="detail-bold" align="center" width="15%" style="padding-right: 9px;"><label style="font-weight: 900;">계정상태</label></td>
			<td class="detail-normal" style="padding-left: 5px;">
				<select class="selectField" id="msCode" name="msCode" onchange="selectStateChange()">
					<option value="">::상태코드::</option>
					<c:choose>
						<c:when test="${dto.mState==1}">
							<option value="0">잠금 해제</option>
						</c:when>
						<c:otherwise>
							<option value="2">불법적인 방법으로 로그인</option>
							<option value="3">불건전한 후기 등록</option>
							<option value="4">펫시터/회원 간 분쟁</option>
							<option value="5">타 계정 도용</option>
							<option value="6">기타 약관 위반</option>
						</c:otherwise>
					</c:choose>
				</select>
			</td>
		</tr>
		<tr height="37" style="background: #fff;">
			<td class="detail-bold" align="center" width="15%" style="padding-right: 9px;"><label style="font-weight: 900;">메모</label></td>
			<td class="detail-normal" style="padding-left: 5px;">
				<input type="text" id="memo" name="memo" class="boxTF" style="width: 90%;">
			</td>
		</tr>
	</table>
	
	<input type="hidden" name="mNum" value="${dto.mNum}">
	<input type="hidden" name="mId" value="${dto.mId}">
	<input type="hidden" name="registerId" value="${sessionScope.member.mId}">
</form>

<div id="memberStateDetail" style="display: none;"> ${dto.mId}
	<table style="margin: 10px auto 5px; width: 100%; border-spacing: 1px; background: #ccc">
		<tr height="30" align="center" bgcolor="#fff">
			<td class="detail-bold">내용</td>
			<td class="detail-bold" width="130">변경아이디 </td>
			<td class="detail-bold" width="200">등록일</td>
		</tr>
		
		<c:forEach var="vo" items="${listState}">
			<tr height="30" align="center" bgcolor="#fff">
				<td class="detail-normal" align="left" style="padding-left: 5px;">${vo.memo} (${vo.msCode})</td>
				<td class="detail-normal">${vo.registerId}</td>
				<td class="detail-normal">${vo.registration_date}</td>
			</tr>
		</c:forEach>
  
		<c:if test="${listState.size()==0}">
			<tr height="30" align="center" bgcolor="#fff">
				<td class="detail-normal" colspan="3">등록된 정보가 없습니다.</td>
			</tr>  
		</c:if>
	</table>  
</div>
</div>
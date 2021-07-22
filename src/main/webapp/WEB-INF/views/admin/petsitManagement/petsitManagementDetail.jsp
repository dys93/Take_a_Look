<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<style type="text/css">

.detail-top {
	heigh: 37px;
	background: #fff;
	font-size: 20px;
}

table {
    border-collapse: inherit;
}


</style>

<form id="detailedPetsitForm" name="detailedPetsitForm" method="post">
<div class="modal-detail">
<table style="margin: 10px auto 20px; width: 100%; border-spacing: 1px; background: #ccc">
	<tr class="detail detail-top">
		<td class="detail-bold" align="right" width="20%" style="padding-right: 7px;"><label style="font-weight: 900;">펫시터 ID</label></td>
		<td class="detail-normal" align="left" width="30%" style="padding-left: 5px;"><span>${dto.mId}</span></td>
		<td class="detail-bold" align="right" width="20%" style="padding-right: 7px;"><label style="font-weight: 900;">펫시터 닉네임</label></td>
		<td class="detail-normal" align="left" width="30%" style="padding-left: 5px;"><span>${dto.mNick}</span></td>
	</tr>
	<tr class="detail detail-top">
		<td class="detail-bold" align="right" style="padding-right: 9px;"><label style="font-weight: 900;">근무시작일</label></td>
		<td class="detail-normal" align="left" width="30%" style="padding-left: 5px;"><span>${dto.petStart}</span></td>
		<td class="detail-bold" align="right" style="padding-right: 9px;"><label style="font-weight: 900;">급여계좌</label></td>
		<td class="detail-normal" align="left" width="30%" style="padding-left: 5px;"><span>${dto.petAct}</span></td>
	</tr>
	<tr class="detail detail-top">
		<td class="detail-bold" align="right" style="padding-right: 9px;"><label style="font-weight: 900;">자격 취득 일자</label></td>
		<td class="detail-normal" align="left" width="30%" style="padding-left: 5px;"><span>${dto.petCertif}</span></td>
		<td class="detail-bold" align="right" style="padding-right: 9px;"><label style="font-weight: 900;">반려동물</label></td>
		<td class="detail-normal" align="left" width="30%" style="padding-left: 5px;"><span>${dto.petYN==0?"반려동물없음":"반려동물있음"}</span></td>
	</tr>
	<tr class="detail detail-top">
		<td class="detail-bold" align="right" style="padding-right: 9px;"><label style="font-weight: 900;">마당유무</label></td>
		<td class="detail-normal" align="left" width="30%" style="padding-left: 5px;"><span>${dto.petYard==0?"마당없음":"마당있음"}</span></td>
		<td class="detail-bold" align="right" style="padding-right: 9px;"><label style="font-weight: 900;">대형견가능여부</label></td>
		<td class="detail-normal" align="left" width="30%" style="padding-left: 5px;"><span>${dto.petLarge==0?"대형견불가능":"대형견가능"}</span></td>
	</tr>
	<tr class="detail detail-top">
		<td class="detail-bold" align="right" style="padding-right: 9px;"><label style="font-weight: 900;">산책로</label></td>
		<td class="detail-normal" align="left" width="30%" style="padding-left: 5px;"><span>${dto.petWalk==0?"산책로없음":"산책로있음"}</span></td>
		<td class="detail-bold" align="right" style="padding-right: 9px;"><label style="font-weight: 900;">가족형태</label></td>
		<td class="detail-normal" align="left" width="30%" style="padding-left: 5px;"><span>${dto.petFamily==1?"2인 이하 가구":dto.petFamily==2?"3인가구":dto.petFamily==3?"4인가구":"5인 이상 가구"}</span></td>
	</tr>
	<tr class="detail detail-top">
		<td class="detail-bold" align="right" style="padding-right: 9px;"><label style="font-weight: 900;">주거형태</label></td>
		<td class="detail-normal" align="left" width="30%" style="padding-left: 5px;"><span>${dto.petLiving==1?"아파트":dto.petLiving==2?"단독주택":dto.petLiving==3?"빌라":"오피스텔"}</span></td>
		<td class="detail-bold" align="right" style="padding-right: 9px;"><label style="font-weight: 900;">자녀</label></td>
		<td class="detail-normal" align="left" width="30%" style="padding-left: 5px;"><span>${dto.petChild==1?"자녀없음":dto.petFamily==2?"미취학 아동":"초등생 자녀"}</span></td>
	</tr>
	
</table>
	
</div>
</form>

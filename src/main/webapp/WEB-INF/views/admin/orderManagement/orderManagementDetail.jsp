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

<form id="detailedOrderForm" name="detailedOrderForm" method="post">
<div class="modal-detail">
<table style="margin: 10px auto 20px; width: 100%; border-spacing: 1px; background: #ccc">
	<tr class="detail detail-top">
		<td class="detail-bold" align="right" width="20%" style="padding-right: 7px;"><label style="font-weight: 900;">주문 코드</label></td>
		<td class="detail-normal" align="left" width="30%" style="padding-left: 5px;"><span>${dto.orderNum}</span></td>
		<td class="detail-bold" align="right" width="20%" style="padding-right: 7px;"><label style="font-weight: 900;">주문 일자</label></td>
		<td class="detail-normal" align="left" width="30%" style="padding-left: 5px;"><span>${dto.sDate}</span></td>
	</tr>
	<tr class="detail detail-top">
		<td class="detail-bold" align="right" style="padding-right: 9px;"><label style="font-weight: 900;">주문자명</label></td>
		<td class="detail-normal" align="left" width="30%" style="padding-left: 5px;"><span>${dto.orderName}</span></td>
		<td class="detail-bold" align="right" style="padding-right: 9px;"><label style="font-weight: 900;">주문자 번호</label></td>
		<td class="detail-normal" align="left" width="30%" style="padding-left: 5px;"><span>${dto.orderTel}</span></td>
	</tr>
	<tr class="detail detail-top">
		<td class="detail-bold" align="right" style="padding-right: 9px;"><label style="font-weight: 900;">배송료</label></td>
		<td class="detail-normal" align="left" width="30%" style="padding-left: 5px;"><span>${dto.sDelivCharge}</span></td>
		<td class="detail-bold" align="right" style="padding-right: 9px;"><label style="font-weight: 900;">배송지 우편번호</label></td>
		<td class="detail-normal" align="left" width="30%" style="padding-left: 5px;"><span>${dto.sZip}</span></td>
	</tr>
	<tr class="detail detail-top">
		<td class="detail-bold" align="right" style="padding-right: 9px;"><label style="font-weight: 900;">배송지 주소</label></td>
		<td class="detail-normal" align="left" width="30%" style="padding-left: 5px;"><span>${dto.sAddr1}</span></td>
		<td class="detail-bold" align="right" style="padding-right: 9px;"><label style="font-weight: 900;">배송시 상세주소</label></td>
		<td class="detail-normal" align="left" width="30%" style="padding-left: 5px;"><span>${dto.sAddr2}</span></td>
	</tr>
	<tr class="detail detail-top">
		<td class="detail-bold" align="right" style="padding-right: 9px;"><label style="font-weight: 900;">결제 금액</label></td>
		<td class="detail-normal" align="left" width="30%" style="padding-left: 5px;"><span>${dto.finalPrice}</span></td>
		<td class="detail-bold" align="right" style="padding-right: 9px;"><label style="font-weight: 900;">결제 상태</label></td>
		<td class="detail-normal" align="left" width="30%" style="padding-left: 5px;"><span>${dto.orderState==0?"결제대기":"결제완료"}</span></td>
	</tr>
	<tr class="detail detail-top">
		<td class="detail-bold" align="right" style="padding-right: 9px;"><label style="font-weight: 900;">적립 마일리지</label></td>
		<td class="detail-normal" align="left" width="30%" style="padding-left: 5px;"><span>${dto.aMilePrice}</span></td>
		<td class="detail-bold" align="right" style="padding-right: 9px;"><label style="font-weight: 900;">배송상태</label></td>
		<td class="detail-normal" align="left" width="30%" style="padding-left: 5px;"><span>${dto.deliveryState==0?"배송대기":dto.deliveryState==1?"배송중":"배송완료"}</span></td>
	</tr>
	
</table>
	
</div>
</form>

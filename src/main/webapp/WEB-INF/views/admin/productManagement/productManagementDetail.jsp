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

<form id="detailedProdcutForm" name="detailedProductForm" method="post">
<div class="modal-detail">
<table style="margin: 10px auto 20px; width: 100%; border-spacing: 1px; background: #ccc">
	<tr class="detail detail-top">
		<td class="detail-bold" align="right" width="15%" style="padding-right: 7px;"><label style="font-weight: 900;">상품코드</label></td>
		<td class="detail-normal" align="left" width="35%" style="padding-left: 5px;"><span>${dto.pNum}</span></td>
		<td class="detail-bold" align="right" width="15%" style="padding-right: 7px;"><label style="font-weight: 900;">상품명</label></td>
		<td class="detail-normal" align="left" width="35%" style="padding-left: 5px;"><span>${dto.pName}</span></td>
	</tr>
	<tr class="detail detail-top">
		<td class="detail-bold" align="right" style="padding-right: 9px;"><label style="font-weight: 900;">가격</label></td>
		<td class="detail-normal" align="left" style="padding-left: 5px;">
			<input type="text" id="pPrice" name="pPrice" class="boxTF" value="${dto.pPrice}">
		</td>
		<td class="detail-bold" align="right" style="padding-right: 9px;"><label style="font-weight: 900;">할인율(%)</label></td>
		<td class="detail-normal" align="left" style="padding-left: 5px;">
			<input type="text" id="pDiscountRate" name="pDiscountRate" class="boxTF" value="${dto.pDiscountRate}">
		</td>
	</tr>
	<tr class="detail detail-top">
		<td class="detail-bold" align="right" style="padding-right: 9px;"><label style="font-weight: 900;">배송조건</label></td>
		<td class="detail-normal" align="left" width="35%" style="padding-left: 5px;"><span>${dto.delivType==0?"무료배송":"일반배송"}</span></td>
		<td class="detail-bold" align="right" style="padding-right: 9px;"><label style="font-weight: 900;">등록일</label></td>
		<td class="detail-normal" align="left" width="35%" style="padding-left: 5px;"><span>${dto.pDate}</span></td>
	</tr>
	<tr class="detail detail-top">
		<td class="detail-bold" align="right" style="padding-right: 9px;"><label style="font-weight: 900;">재고수량</label></td>
		<td class="detail-normal" align="left" style="padding-left: 5px;">
			<input type="text" id="pDetailCnt" name="pDetailCnt" class="boxTF" value="${dto.pDetailCnt}">
		</td>
		<td class="detail-bold" align="right" style="padding-right: 9px;"><label style="font-weight: 900;">옵션추가가격</label></td>
		<td class="detail-normal" align="left" style="padding-left: 5px;">
			<input type="text" id="pDetailPrice" name="pDetailPrice" class="boxTF" value="${dto.pDetailPrice}">
		</td>
	</tr>
</table>
	<input type="hidden" name="pNum" value="${dto.pNum}">
</div>
</form>

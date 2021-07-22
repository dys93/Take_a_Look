<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<style>
@font-face {
    font-family: 'Cafe24Ssurround';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24Ssurround.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
@font-face {/*본문 내용*/
    font-family: 'Cafe24SsurroundAir';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
.orderDetail {
	margin-top: 50px;
	font-size: 14px;
	width: 100%;
	padding: 0px;
	font-family: Cafe24SsurroundAir;
}

.orderDetail .body-container {
	width: 1300px;
}

.orderDetail .body-title h3 {
    font-family: Cafe24Ssurround;
    text-align: left;
}

.orderDetail .body-title p {
    text-align: left;
}

.orderDetail .body-main {
	width: 100%;
	height: 1000px;
}

.orderDetail .body-itmeList table {
	width: 100%;
	border-collapse: collapse;
	border-spacing: 0px;
	text-align: center;
}
.orderDetail .body-itmeList table tr:nth-child(1) td {
	height: 40px;
	border-top: 1px solid;
	border-bottom: 1px solid;
}

.orderDetail .body-itmeList table tr:nth-child(1) label {
	margin: 0px 0px 0px 0px;
}

.orderDetail .body-itmeList img {
	width: 80px;
	height: 80px;
}

.orderDetail .body-itmeList .items {
	height: 100px;
	padding: 10px;
}

.orderDetail .body-itmeList .items p {
	margin: 0px 0px 0px 0px;
}

.orderDetail label i {
	color: #007bff;
}


.float-left {
	float: left;
}

.clear {
	clear: both;
}

.orderDetail .detail {
	width: 50%;
}

.orderDetail .detail-title {
	font-size: 16px;
	text-align: left;
}
.orderDetail .detail table {
	border-collapse: collapse;
	border-spacing: 0;
	text-align: left;
	width: 100%;
	margin-bottom: 10px;
}
.orderDetail .detail table p, .orderDetail .detail table label {
	margin: 0;
	padding: 0;
}

.orderDetail .detail table tr:nth-child(1) td {
	border-top: 1px solid;
}
.orderDetail .detail table tr td {
	height: 40px;
	border-bottom: 1px solid #f1f1f1;
}

.orderDetail ul {
	color: #777777;
	text-align: left;
}




</style>

<script>
$(function() {

});
</script>

<div class="orderDetail" align="center">
	<div class="body-container">
		<div class="body-title">
			<h3> <i class="fas fa-dollar-sign"></i> 상세 내역 </h3>
			<p>${type=='petsit'?'예약번호':'주문번호'} <b> ${dto.orderNum} </b> &nbsp;&nbsp;&nbsp; 주문일자 <b> ${type=='petsit'?dto.rDate:dto.sDate} </b> </p>
		</div>
		<div class="body-main">
			<div class="body-itmeList">
				<table>
					<tr>
						<td width="35%" colspan="2">
							<label> ${type=='petsit'?'펫시터':'상품'} </label>
						</td>
						
						<td width="15%">
							<label> ${type=='petsit'?'체크인':'옵션'} </label>
						</td>
						
						<td width="15%">
							<label> ${type=='petsit'?'체크아웃':'수량'} </label>
						</td>
						
						<td width="15%">
							<label> ${type=='petsit'?'가격':'가격'} </label>
						</td>
						
						<td width="20%" colspan="2">
							<label> ${type=='petsit'?'예약 상태':'배송 상태'} </label>
						</td>
					</tr>
					
					<tr class="items">
						<td width="10%">
							<img src="${pageContext.request.contextPath}/${type=='petsit'?'upload':'uploads'}/${type=='petsit'?'petsit':'product'}/${type=='petsit'?dto.petImg:dto.pImgName}">
						</td>
						<td style="text-align: left;">
							<p> ${type=='petsit'?dto.petTitle:dto.pName} </p>
						</td>
						
						<td>
							<c:if test="${type == 'petsit'}">
							<p style="color: #777777;"> ${dto.checkIn} 14:00 </p>
							</c:if>
							<c:if test="${type == 'store'}">
							<p style="color: #777777;"> ${dto.storeMainOptName}: ${dto.storeSubOptName} </p>
							</c:if>
						</td>
						
						<td>
							<c:if test="${type == 'petsit'}">
								<p style="color: #777777;"> ${dto.checkOut} 11:00 </p>
							</c:if>
							<c:if test="${type == 'store'}">
								<p> ${dto.sDetailQty}개 </p>
							</c:if>
						</td>
						
						<td>
							<p> ${type == 'petsit'?dto.finalPrice:dto.sDetailPrice}원 </p>
						</td>
						
						<td>
							<c:if test="${type == 'petsit'}">
							<c:choose>
							 <c:when test="${dto.orderState == 0}">
							 	<p> 입금 대기 </p>
							 </c:when>
							 <c:when test="${dto.orderState == 1}">
							 	<p> 예약 완료 </p>
							 </c:when>
							</c:choose>
							</c:if>
							<c:if test="${type == 'store'}">
							<c:choose>
							 <c:when test="${dto.deliveryState == 0}">
							 	<p> 배송 준비 </p>
							 </c:when>
							 <c:when test="${dto.deliveryState == 1}">
							 	<p> 배송중 </p>
							 </c:when>
							 <c:when test="${dto.deliveryState == 2}">
							 	<p> 배송 완료 </p>
							 </c:when>
							</c:choose>
							</c:if>
						</td>
						
						<td>
						
						</td>
						
					</tr>
				</table>		
				
			</div>
			
			<div style="margin-bottom: 100px; margin-top: 15px">
				<ul>
					<li> 스토어 구매 시 동일한 주문번호라도 2개 이상의 브랜드에서 주문하신 경우 출고지 주소가 달라 각각 출고됩니다. (택배 박스를 2개 이상 수령 가능) </li>
					<li> 출고 완료 직후 교환 / 환불 요청을 하더라도 상품을 수령하신 후 택배 업체를 통해 보내주셔야 처리 가능합니다. </li>
					<li> 쿠폰 및 마일리지는 스토어 이용 시에만 사용 가능합니다.  </li>
					<li> 자세한 내용은 FAQ를 확인하여 주시기 바랍니다. </li>
				</ul>
			</div>
			
			<div class = "body-detail">
				<div class="detail float-left">
					<div class="detail-title">
						<p>${type=='petsit'?'예약자 정보':'주문자 정보'}</p>
					</div>
					<table class="float-left">
						<tr>
							<td width="30%">
								<label> ${type=='petsit'?'예약자명':'주문자명'} </label>
							</td>
							
							<td>
								<p> ${dto.orderName} </p>
							</td>
						</tr>
						
						<tr>
							<td>
								<label> 연락처 </label>
							</td>
							
							<td>
								<p> ${dto.orderTel} </p>
							</td>
						</tr>
						
						<tr>
							<td>
								<label> 이메일 </label>
							</td>
							
							<td>
								<p> ${dto.orderEmail} </p>
							</td>
						</tr>
						
						<c:if test="${type == 'store'}">
						<tr>
							<td>
								<label> 배송지 주소 </label>
							</td>
							
							<td>
								<p> (${dto.sZip}) &nbsp; ${dto.sAddr1} &nbsp; ${dto.sAddr2} </p>
							</td>
						</tr>
						</c:if>
						
					</table>
					<div>
						<ul>
							<li> 자세한 내용은 FAQ를 확인하여 주시기 바랍니다. </li>
						</ul>
					</div>
				</div>
				
				<c:if test="${type == 'petsit'}">
				<div class="detail float-left" style="padding-left: 10px; height: 260px;">
					<div class="detail-title">
						<p> 펫시터 정보 </p>
					</div>
					<table class="float-left">
						<tr>
							<td width="30%">
								<label> 소형견 </label>
							</td>
							
							<td>
								<p> ${dto.small} 마리 </p>
							</td>
						</tr>
						
						<tr>
							<td>
								<label> 중형견 </label>
							</td>
							
							<td>
								<p> ${dto.medium} 마리 </p>
							</td>
						</tr>
						
						<tr>
							<td>
								<label> 대형견 </label>
							</td>
							
							<td>
								<p> ${dto.large} 마리 </p>
							</td>
						</tr>
						
						<tr>
							<td>
								<label> 추가 요금 </label>
							</td>
							
							<td>
								<p style="color: #14aaff;"> ${-(dto.small*10000)+(dto.large*10000)} 원 </p>
							</td>
						</tr>
						
						
					</table>
					<div>
						<ul>
							<li> 자세한 내용은 FAQ를 확인하여 주시기 바랍니다. </li>
						</ul>
					</div>
				</div>
				
				
				<div class="detail float-left" style="padding-top: 50px;">
					<div class="detail-title">
						<p> 최종 결제 정보 </p>
					</div>
					
					<table class="float-left">
						<tr>
							<td width="30%">
								<label> 기본 이용료 </label>
							</td>
							
							<td>
								<p> 50000 * ${dto.gap} = ${50000*dto.gap} 원 </p>
							</td>
						</tr>
						
						<tr>
							<td>
								<label> 추가 요금 </label>
							</td>
							
							<td>
								<p style="color: #14aaff;"> ${-(dto.small*10000)+(dto.large*10000)} 원 </p>
							</td>
						</tr>
						
						<tr>
							<td>
								<label> <b>부가 가치세</b> </label>
							</td>
							
							<td>
								<p style="color: #14aaff;"> 10% </p>
							</td>
						</tr>
						
						<tr>
							<td>
								<label> <b>최종 결제 금액</b> </label>
							</td>
							
							<td>
								<h5> ${dto.finalPrice}원 </h5>
							</td>
						</tr>
						
					</table>
					
				</div>
				</c:if>
					
				<c:if test="${type == 'store'}">
				<div class="detail float-left" style="padding-left: 10px; height: 260px;">
					<div class="detail-title">
						<p> 할인 정보 </p>
					</div>
					<table class="float-left">
						<tr>
							<td width="30%">
								<label> 배송비 </label>
							</td>
							
							<td>
								<p style="color: #14aaff;"> ${dto.delivType == '0'?'-2000원':'-0원'} </p>
							</td>
						</tr>
						
						<tr>
							<td>
								<label> 마일리지 사용 </label>
							</td>
							
							<td>
								<p style="color: #14aaff;"> -${dto.uMilePrice}원 </p>
							</td>
						</tr>
						
						
					</table>
					<div>
						<ul>
							<li> 자세한 내용은 FAQ를 확인하여 주시기 바랍니다. </li>
						</ul>
					</div>
				</div>
				
				
				<div class="detail float-left" style="padding-top: 50px;">
					<div class="detail-title">
						<p> 최종 결제 정보 </p>
					</div>
					
					<table class="float-left">
						<tr>
							<td width="30%">
								<label> 상품 합계 </label>
							</td>
							
							<td>
								<p> ${dto.sTotPrice}원 </p>
							</td>
						</tr>
						
						<tr>
							<td>
								<label> 배송료 </label>
							</td>
							
							<td>
								<p> 2000원 </p>
							</td>
						</tr>
						
						<tr>
							<td>
								<label> <b>할인 합계</b> </label>
							</td>
							
							<td>
								<p style="color: #14aaff;"> -${dto.totSale}원 </p>
							</td>
						</tr>
						
						<tr>
							<td>
								<label> <b>최종 결제 금액</b> </label>
							</td>
							
							<td>
								<h5> ${dto.finalPrice}원 </h5>
								<c:if test="${type=='store'}">
								<p style="color: #777777;"> 
									예상 적립금 ${dto.aMilePrice}원
								</p>
								</c:if>
							</td>
						</tr>
						
					</table>
					
				</div>
				</c:if>
			</div>
			
		</div>
	</div>
	
	
</div>
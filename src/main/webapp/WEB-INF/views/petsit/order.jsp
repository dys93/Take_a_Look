<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<style type="text/css">

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

.productPayBody{
	margin: 0;
	padding: 0;
	font-family: Cafe24SsurroundAir;
}

.payTitle,.addressInform,.addressInform,.finalPayment{
	font-family: GmarketSansMedium;
}

.table{
	width: 100%;
}

.productPayMain{
	width: 1300px;
	margin: auto;	
}
h3{
	margin-top: 40px;
}

.orderTable tr:first-child th, .orderTable tr:first-child td{
    border-top: 2px solid #d6d6d6;
}

.orderTable th{
	width:20%;
    background: #f4f4f4;
    padding: 15px 0 15px 18px;
    text-align: left;
    color: #222;
    border-bottom: 1px solid #e6e6e6;

}
.orderTable td{
    padding: 15px 20px;
    border-bottom: 1px solid #e6e6e6;
    font-size: 14px;
    color: #222;
    line-height: 28px;

}

.payTitle{
    margin-top: 30px;
}
.cntNotice{
    margin-top: 30px;
    margin-bottom: 15px;
    background: #fff8f5;
    height: 40px;
    line-height: 40px;
    padding-left: 20px;    
}

.orderTable input[type=text], .selectmEmail{
	height: 35px;
    border-radius: 8px;
    border: 1px solid darkgray;	
}

.topTb th{
	height: 60px;
    border-top: 2px solid #d6d6d6;
    border-bottom: 1px solid #ccc;
    background: #fafafa;	
	display: table-cell;
    vertical-align: inherit;
    font-weight: bold;
	text-align: center;
	
}

.alignNone{
	text-align: left;
	padding-left: 50px;
}
.tbl_cell{
    display: table-cell;
    vertical-align: middle;
}

.priceTop{
	padding-right: 30px;
}
.w600{
	width: 600px;
}
.w100{
	width: 100px;
}

.adderSelect{
	margin-top: 50px;
    border-top: 1px solid gray;
    padding-top: 30px;
}


.addr{
	padding-top: 10px;
	padding-bottom: 10px;
}

.address1{
	margin-bottom: 10px;
}

.addrBtn{
    border: none;
    width: 60px;
    height: 30px;
    border-radius: 5px;
    box-shadow: 0px 0px 2px 0px rgb(0 0 0 / 10%);  
}

.addrBtn:hover{
	 box-shadow: inset -2px -1px 2px 0px rgb(0 0 0 / 10%);
}

.middleTb td {
	padding-left: 20px;
}

.bottomTb td{
	padding-left: 20px;
}

.content{
    height: 200px;
    line-height: 200px;
    border-bottom: 1px solid lightgray;
    text-align: center;
}

.content span{
	margin-left: 100px;
    font-size: 25px;	
}
.mile{
    height: 50px;
    line-height: 50px;
    border-bottom: 1px solid lightgray;
    text-align: right;
}
.totmon{
	height: 50px;
    line-height: 50px;
    text-align: right;
}

.borderNone{
	border: none;
    text-align: center;
}

.orderProductBtn{
	border: 1px solid white;
    border-radius: 5px;	
}

</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/se/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" >
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


function orderOk(){
	var f = document.orderForm;
	var str;
	
	str = f.orderName.value;
	
	if(! /^[가-힣]{2,5}$/.test(str)){
		alert("이름을 입력해주세요.");
			f.orderName.focus();
			return;			
	}
	
	str = f.sZip.value;
	if(! str){
		alert("우편번호를 선택 해 주세요")
			f.sZip.focus();
			return;
	}
	
	str = f.sAddr2.value;
	
	if(! str){
		alert("상세주소를 입력 해 주세요.")
		f.sAddr2.focus();
		return;
	}
	
	str = f.tel1.value;
	
	if(! /^\d{3}$/.test(str)){
		alert("휴대번호를 입력해 주세요")
			f.tel1.focus();
			return;	
	}
	
	str = f.tel2.value;	
	
	if(! /^\d{4}$/.test(str)){
		alert("휴대번호를 입력해 주세요")
			f.tel2.focus();
			return;
	}
	
	str = f.tel3.value;	
	
	if(! /^\d{4}$/.test(str)){
		alert("휴대번호를 입력해 주세요")
			f.tel3.focus();
			return;
	}	

	str = f.email1.value;	
	
	if(! str){
		alert("이메일을 입력해주세요.");
		f.email1.focus();
		return;
	}
	
	str = f.email2.value;
	if(! str){
		alert("이메일을 입력해주세요.");
		f.email2.focus();
		return;
	}	
	
	iamport();
	
}

function changemEmail(){
	var f = document.orderForm;
	var str = f.selectmEmail.value;
	
	if(str !="direct"){
		f.email2.value=str;
		f.email2.readOnly = true;
		f.email1.focus();
	}else{
		f.email2.value="";
		f.email2.readOnly = false;
		f.email1.focus();
	}
	
}

$(function(){//회원 정보로 기본 배송지 설정하기
	$("form[name=orderForm] #memAddr").click(function(){

		var orderName =$("input[name=orderName]").attr("data-name");
		$("input[name=orderName]").val(orderName);		
		$("input[name=orderName]").attr("readonly", true);	
		
		var sZip = $("input[name=sZip]").attr("data-name");
		$("input[name=sZip]").val(sZip);
		$("input[name=sZip]").attr("readonly", true);	
		
		var sAddr1 = $("input[name=sAddr1]").attr("data-name");
		$("input[name=sAddr1]").val(sAddr1);
		$("input[name=sAddr1]").attr("readonly", true);	
		
		var sAddr2 = $("input[name=sAddr2]").attr("data-name");
		$("input[name=sAddr2]").val(sAddr2);
		$("input[name=sAddr2]").attr("readonly", true);	
		
		var tel1 = $("input[name=tel1]").attr("data-name");
		$("input[name=tel1]").val(tel1);
		$("input[name=tel1]").attr("readonly", true);			
		
		var tel2 = $("input[name=tel2]").attr("data-name");
		$("input[name=tel2]").val(tel2);		
		$("input[name=tel2]").attr("readonly", true);		
		
		var tel3 = $("input[name=tel3]").attr("data-name");
		$("input[name=tel3]").val(tel3);
		$("input[name=tel3]").attr("readonly", true);		
		
		var email1 = $("input[name=email1]").attr("data-name");
		$("input[name=email1]").val(email1);
		$("input[name=email1]").attr("readonly", true);		
		
		var email2 = $("input[name=email2]").attr("data-name");
		$("input[name=email2]").val(email2);		
		$("input[name=email2]").attr("readonly", true);			
		
		$(".selectmEmail").attr("disabled", "disabled");
	
	});
	
	
	$("form[name=orderForm] #newAddr").click(function(){
		
		$(".middleTb input").attr("readonly", false);		
		$(".middleTb input").val("");	
		$(".selectmEmail").removeAttr("disabled", "disabled");		
		
	});
	
});


$(function(){
	$("input[name=finalPrice]").val($("input[name=sumDeliv]").val())
});


$(function(){//배송비 더해서 최종가격 계산
	
	$("input[name=uMilePrice]").on("propertychange change keyup paste input", function(){		
		var newValue = $(this).val();
	});

	if("${dto.delivType == 0}"){//배송비가 없는 경우	
		var DelivNonePrice = $("input[name=sTotPrice]").val();

		$("input[name=finalPrice]").val(DelivNonePrice);
		$("input[name=finalPrice]").attr("data-price", DelivNonePrice);

	}
	
	if("${dto.delivType != 0}"){ //배송비가 있는경우
		var DelivOkPrice = $("input[name=sTotPrice]").val();	

		var DelivTotPrice = parseInt(DelivOkPrice)+2000;
	
	
		$("input[name=finalPrice]").val(DelivTotPrice);			
		$("input[name=finalPrice]").attr("data-price", DelivTotPrice);
	}
	
});

$(function(){//최종가격에 마일리지 사용
	$("input[name=uMilePrice]").on("blur", function(){
		
	var uMilePrice = $("input[name=uMilePrice]").val();
	var totMile = $("input[name=totMile]").val();
	var finalPrice = $("input[name=finalPrice]").val();
	
	var defaultPrice = $("input[name=finalPrice]").attr("data-price");

	var uMilePrice =parseInt(uMilePrice)
	var totMile = parseInt(totMile)
	
	if(uMilePrice> totMile ){
		alert("마일리지가 부족합니다.")
		return;
	}else{ 
		var totPrice = finalPrice -uMilePrice;				
	}
	
	if(uMilePrice == "" || uMilePrice == 0){
		$("input[name=finalPrice]").val(defaultPrice);
	}else{
	 $("input[name=finalPrice]").val(totPrice);		
	}
	
	

	});
	
});


function iamport(){
	
	var f = document.orderForm;

	var url = "${pageContext.request.contextPath}/product/orders";

	var query = $('form[name=orderForm]').serialize();
	
	//alert(query);
	var fn = function(data){
		var state = data.state;
		console.log(state);
	};
	ajaxFun(url, "post", query, "json", fn);		
	
	/*
	
	var finalPrice = $("input[name=finalPrice]").val();
	
	var IMP = window.IMP; // 생략가능
	IMP.init('imp49401778');	
	IMP.request_pay({
	    pg : 'inicis',
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '${dto.pName}',
	    amount : finalPrice,
	    buyer_email : '${member.mEmail}',
	    buyer_name : '${member.mName}',
	    buyer_tel : '${member.mTel}',
	    buyer_addr : '${dto.buyerAddr}',
	    buyer_postcode : '${member.mZip}'
	}, function(rsp) {
		if ( rsp.success ) {
	

			
			if ( everythings_fine ) {
    			var msg = '결제가 완료되었습니다.';
    			msg += '\n고유ID : ' + rsp.imp_uid;
    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
    			msg += '\결제 금액 : ' + rsp.paid_amount;
    			msg += '카드 승인번호 : ' + rsp.apply_num;

    			alert(msg);
    		} else {
    			//[3] 아직 제대로 결제가 되지 않았습니다.
    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
    		}
			
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;

	        alert(msg);
	    }
	});
	*/
}



</script>


<div class="productPayBody">
	<div class="productPayMain">
		<div class="payTitle">
			<h3>주문정보</h3>
		</div>
	
		<div class="cntNotice">
			! 상품 수량 변경은 상품상세 페이지에서 가능합니다.
		</div>	
		<form name="orderForm">		
		<table class="topTb table">
			<tr>
				<th class="alignNone">
					상품정보
				</th>
				<th>
					수량
				</th>
				<th>
					적립 마일리지
				</th>
				<th>
					구매가
				</th>
			</tr>	
		
			<tr class="content">
				<td class="w600 tbl_cell alignNone">
					&nbsp;<img src="${pageContext.request.contextPath}/uploads/product/${dto.pImgName}" width="100" height="200" border="0">
					${dto.pName}	
				</td>
				<td class="w100 tbl_cell">
					<input type="text" name="sDetailQty" value="${sDetailQty}" class="borderNone" readonly="readonly">
				</td>
				<td class="w100 tbl_cell">
					<input type="text" name="aMilePrice" value="${dto.aMilePrice}" class="borderNone" readonly="readonly">
				</td>
				<td class="w100 tbl_cell">
					₩${sum}	
				</td>				
			</tr>
			<tr class="totmon">
				<td colspan="4" class="priceTop">
					<span>합계 : 상품구매금액 + 배송비 = </span>  
					<c:choose>
						<c:when test="${dto.delivType != 0}">
							<input type="text"  value="${sum}" class="borderNone" readonly="readonly">
							+
							<input type="text" name="sDelivCharge" value="2000" class="borderNone" readonly="readonly">
							&#61;
							<input type="text" name="sdPrice" value="${sum+2000}" class="borderNone" readonly="readonly">
							
							<input type="text" name="sTotPrice" value="${sum}" class="borderNone" readonly="readonly">
							
						</c:when>
						<c:otherwise>
							<input type="text" value="${sum}" class="borderNone" readonly="readonly">
							+
							<input type="text" name="sDelivCharge" value="${dto.sDelivCharge}" class="borderNone" readonly="readonly">
							&#61;
							<input type="text" name="sTotPrice"  value="${sum}" class="borderNone" readonly="readonly">

						</c:otherwise>
					</c:choose>
					
				</td>
			</tr>
		</table>
		
		<div class="addressInform">
			<h3>배송지 정보</h3>
		</div>

			<table class="orderTable middleTb table">	
			<tr>
				<th>
					배송지 선택
				</th>
				<td>
					<label><input type="radio" name="address" id="memAddr" value="1"> 회원정보와 동일 </label>&nbsp;&nbsp;&nbsp; 				
					<label><input type="radio" name="address" id="newAddr" value="0" checked="checked"> 새로운 배송지</label>	
				</td>
			</tr>	
			<tr>
				<th>
					받으시는 분*
				</th>
				<td>
					<input type="text" name="orderName" data-name="${member.mName}" value="${dto.orderName}">
				</td>
			</tr> 
			<tr>
				<th>
					주소*
				</th>
				<td class="address">
					<div class="addr">
						<div class="address1">
							<span>우편번호</span>
								<input type="text" id="sZip" name="sZip" data-name="${dtto.mZip}" value="${dto.sZip}" readonly="readonly">
								<button type="button" name="" class="addrBtn" onclick="daumPostcode();">검색</button>	
							</div>
						<div class="address2">						
							<span>주소</span>
								<input type="text"  id="sAddr1" name="sAddr1" data-name="${dtto.mAddr1}" value="${dto.sAddr1}" style="width: 500px;" height="35px;">
								<input type="text"  id="sAddr2" name="sAddr2" data-name="${dtto.mAddr2}" value="${dto.sAddr2}" style="width: 350px;" height="35px;" >						
						</div>
					</div>		
				</td>
			</tr> 				
			<tr>
				<th>
					휴대전화*
				</th>
				<td>
					<input type="text" name="tel1" maxlength="3" data-name="${dtto.tel1}" value="${dto.tel1}">-
					<input type="text" name="tel2" maxlength="4" data-name="${dtto.tel2}" value="${dto.tel2}">-
					<input type="text" name="tel3" maxlength="4" data-name="${dtto.tel3}" value="${dto.tel3}">
				</td>
			</tr> 		
			<tr>
				<th>
					이메일*
				</th>
				<td>
					<div>
						<select name="selectmEmail" onchange="changemEmail();" class="selectmEmail">
							<option value="">선 택</option>
							<option value="naver.com" ${dto.email2 == "naver.com" ? "selected='selected'" : ""}>네이버 메일</option>
							<option value="daum.net" ${dto.email2 == "daum.net" ? "selected='selected'" : ""}>다음이메일</option>
							<option value="hotmail.com" ${dto.email2 == "hotmail.com" ? "selected='selected'" : ""}>핫메일</option>
							<option value="gmail.com" ${dto.email2 == "gmail.com" ? "selected='selected'" : ""}>지메일</option>
							<option value="direct">직접입력</option>
						</select>						
							<input type="text" class="" name="email1" maxlength="30" data-name="${dtto.email1}" value="${dto.email1}" >
						      <span class="" style=" background: none; border: none;">@</span>
						   <input type="text" class="" name="email2" maxlength="30"  data-name="${dtto.email2}" value="${dto.email2}" readonly="readonly">
											
					</div>
				</td>
			</tr> 		
			</table >
		
		<div class="addressInform">
			<h3>할인 정보</h3>
		</div>		
		<table class="orderTable bottomTb table">
			<tr>
				<th>
					보유 마일리지
				</th>
				<td>
					
					<input type="text" readonly="readonly" name="totMile" value="${dto.totMile}">
				</td>
			</tr>
			<tr>
				<th>
					적용 마일리지
				</th>
				<td>
					<input type="text" id="uMilePrice"  name="uMilePrice" value="0"> 
					<div id="result" ></div>
			
				</td>
			</tr>
		</table>	
		
		<div class="finalPayment">
			<h3>결제 확인</h3>
		</div>		
		<table class="orderTable table">
			<tr>
				<td>
					최종 결제 금액
				</td>
				<td>
					<input type="text" id="finalPrice" name="finalPrice" data-price="${dto.finalPrice}" value="${dto.finalPrice}" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td>
					배송 예정일
				</td>
				<td>
					<input type="text" name="sDelivDate" value="${dto.sDelivDate}" readonly="readonly">
				</td>
			</tr>			
			<tr>
				<td>
					<button type="button" class="orderProductBtn" onclick="orderOk(); ">결제하기</button>
					<input type="text" name="sDetailPrice" value="${dto.sDetailPrice}" hidden="hidden">
					<input type="text" name="storeMainOptNum" value="${dto.storeMainOptNum}" hidden="hidden">
					<input type="text" name="storeSubOptNum" value="${dto.storeSubOptNum}" hidden="hidden">
					<input type="text" name="storeDetailOptNum" value="${dto.storeDetailOptNum}" hidden="hidden">
				</td>
			</tr>
		</table>
	</form>	
	</div>
	
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function daumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sZip').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sAddr1').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sAddr2').focus();
            }
        }).open();
    }
</script>		

</div>
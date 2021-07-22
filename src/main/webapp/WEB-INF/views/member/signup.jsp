<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.body-container {
	max-width: 850px; margin: 10px auto 5px; padding-top: 20px;
}
</style>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/dateUtil.js"></script>
<script type="text/javascript">
function memberOk() {
	
	var f = document.memberForm;
	var str;

	str = f.mId.value;
	if(!str) {
		alert("아이디를 입력하세요.");
		f.mId.focus();
		return;
	}
	if(!/^[a-z][a-z0-9_]{4,9}$/i.test(str)) { 
		alert("아이디는 5~10자이며 첫 글자는 영문자이어야 합니다.");
		f.mId.focus();
		return;
	}
	
	str = f.mNick.value;
	if(!str) {
		alert("닉네임을 입력하세요.");
		f.mNick.focus();
		return;
	}
	if(!/^[가-힣][가-힣0-9_]{2,9}$/i.test(str)) { 
		alert("닉네임은 3~10자이며 한글과 숫자만 사용할 수 있습니다.");
		f.mNick.focus();
		return;
	}

	str = f.mPwd.value;
	if(!str) {
		alert("비밀번호를 입력하세요. ");
		f.mPwd.focus();
		return;
	}
	if(!/^(?=.*[a-z])(?=.*[!@#$%^*+=-]|.*[0-9]).{5,10}$/i.test(str)) { 
		alert("비밀번호는 5~10자이며 하나 이상의 숫자나 특수문자가 포함되어야 합니다.");
		f.mPwd.focus();
		return;
	}

	if(str!= f.mPwdCheck.value) {
        alert("비밀번호가 일치하지 않습니다. ");
        f.mPwdCheck.focus();
        return;
	}
	
    str = f.mName.value;
    if(!str) {
        alert("이름을 입력하세요. ");
        f.mName.focus();
        return;
    }

    str = f.mBirth.value;
    if(!str || !isValidDateFormat(str)) {
        alert("생년월일을 입력하세요[YYYY-MM-DD]. ");
        f.mBirth.focus();
        return;
    }
    
    str = f.selectmEmail.value;
    if(!str) {
        alert("이메일을 입력하세요. ");
        f.selectmEmail.focus();
        return;
    }
    
    str = f.mEmail1.value;
    if(!str) {
        alert("이메일을 입력하세요. ");
        f.mEmail1.focus();
        return;
    }

    str = f.mEmail2.value;
    if(!str) {
        alert("이메일을 입력하세요. ");
        f.mEmail2.focus();
        return;
    }
    
    str = f.mTel1.value;
    if(!str) {
        alert("전화번호를 입력하세요. ");
        f.mTel1.focus();
        return;
    }
    if(!/^(\d+)$/.test(str)) {
        alert("숫자만 가능합니다. ");
        f.mTel1.focus();
        return;
    }
    
    str = f.mTel2.value;
    if(!str) {
        alert("전화번호를 입력하세요. ");
        f.mTel2.focus();
        return;
    }
    if(!/^(\d+)$/.test(str)) {
        alert("숫자만 가능합니다. ");
        f.mTel2.focus();
        return;
    }

    str = f.mTel3.value;
    if(!str) {
        alert("전화번호를 입력하세요. ");
        f.mTel3.focus();
        return;
    }
    if(!/^(\d+)$/.test(str)) {
        alert("숫자만 가능합니다. ");
        f.mTel3.focus();
        return;
    }

 	f.action = "${pageContext.request.contextPath}/member/${mode}";
    f.submit();
}

function changemEmail() {
    var f = document.memberForm;
	    
    var str = f.selectmEmail.value;
    if(str!="direct") {
        f.mEmail2.value=str; 
        f.mEmail2.readOnly = true;
        f.mEmail1.focus(); 
    }
    else {
        f.mEmail2.value="";
        f.mEmail2.readOnly = false;
        f.mEmail1.focus();
    }
}

function mIdCheck() {
	console.log(1);
	var str = $("#mId").val();
	str = str.trim();
	if(!/^[a-z][a-z0-9_]{4,9}$/i.test(str)) { 
		$("#mId").focus();
		return;
	}
	// jquery - AJAX : json-post 방식
	var url = "${pageContext.request.contextPath}/member/mIdCheck";
	$.post(url, {mId:str}, function(data){
		console.log(3);
		var p=data.passed;
		console.log(p);
		if(p=="true") {
			console.log(4);
			var s="<span style='color:green;font-weight:bold;'>"+str+"</span> 아이디는 사용 가능합니다.";
			//$("#mId").parent().next(".help-block").html(s);
			$("#help_block").html(s);
		} else {
			console.log(5);
			var s="<span style='color:red;font-weight:bold;'>"+str+"</span> 아이디는 사용할 수 없습니다.";
			//$("#mId").parent().next(".help-block").html(s);
			$("#help_block").html(s);
			$("#mId").val("");
			$("#mId").focus();
		}
	}, "json");
	
}

function mNickCheck() {
	var str = $("#mNick").val();
	str = str.trim();
	if(!/^[가-힣][가-힣0-9_]{2,9}$/i.test(str)) {
		$("#mNick").focus();
		return;
	}
	
	var url="${pageContext.request.contextPath}/member/mNickCheck";
	var query="mNick="+str;
	
	$.ajax({
		type:"post"
		,url:url
		,data:query
		,dataType:"json"
		,success:function(data) {
			var p=data.passed;
			if(p==="true") {
				console.log("aaaa");
				var s="<span style='color:green;font-weight:bold;'>"+str+"</span> 닉네임은 사용 가능합니다.";
				$("#mNick").next(".help-block").html(s);
			} else {
				var s="<span style='color:red;font-weight:bold;'>"+str+"</span> 닉네임은 사용할 수 없습니다.";
				$("#mNick").next(".help-block").html(s);
				$("#mNick").val("");
				$("#mNick").focus();
			}
		}
	    ,error:function(e) {
	    	console.log(e.responseText);
	    }
	});
	
}

</script>

<style>
div {
	text-align: center;
	font-family: 'Cafe24SsurroundAir';
	font-size: 15px;
}
</style>

<div class="body-container">
	<div class="body-title">
		<h3><i class="fas fa-paw"></i> 회원 가입 </h3>
	</div>
	
    <div class="alert alert" style="background-color:#F7BE81; color:white;">
        <i class="fas fa-cat"></i> Take A Look에 가입하고 길 위의 천사들을 만나 보세요.
    </div>

	<div class="body-main">
		<form name="memberForm" method="post">
			<div class="form-group form-row">
				<label class="col-sm-2 col-form-label" for="mId">아이디</label>
				<div class="col-sm-8">
					<input class="form-control" id="mId" name="mId" type="text" value="${dto.mId}" 
							${mode=="update" ? "readonly='readonly' ":""}
							onchange="mIdCheck();"
							placeholder="아이디">
					<small id="help_block" class="form-text text-muted help-block">아이디는 5~10자 이내이며, 첫 글자는 영문자로 시작해야 합니다.</small>
				</div>
			</div>
			
			<div class="form-group form-row">
				<label class="col-sm-2 col-form-label" for="mId">닉네임</label>
				<div class="col-sm-8">
					<input class="form-control" id="mNick" name="mNick" type="text" value="${dto.mNick}"
							${mode=="update" ? "readonly='readonly' ":""}
							onchange="mNickCheck();"
							placeholder="닉네임">
					<small class="form-text text-muted help-block">닉네임은 3~10자이며 한글과 숫자만 사용할 수 있습니다.</small>
				</div>
			</div>
		 
			<div class="form-group form-row">
				<label class="col-sm-2 col-form-label" for="mPwd">비밀번호</label>
				<div class="col-sm-8">
		            <input class="form-control" id="mPwd" name="mPwd" type="password" placeholder="비밀번호">
		            <small class="form-text text-muted">비밀번호는 5~10자이며 하나 이상의 숫자나 특수문자가 포함되어야 합니다.</small>
		        </div>
		    </div>
		    
		    <div class="form-group form-row">
		        <label class="col-sm-2 col-form-label" for="mPwdCheck">비밀번호 확인</label>
		        <div class="col-sm-8">
		            <input class="form-control" id="mPwdCheck" name="mPwdCheck" type="password" placeholder="비밀번호 확인">
		            <small class="form-text text-muted">비밀번호를 한 번 더 입력해 주세요.</small>
		        </div>
		    </div>
		 
		    <div class="form-group form-row">
		        <label class="col-sm-2 col-form-label" for="mName">이름</label>
		        <div class="col-sm-8">
		            <input class="form-control" id="mName" name="mName" type="text" value="${dto.mName}" 
		            		${mode=="update" ? "readonly='readonly' ":""}
		            		placeholder="이름">
		        </div>
		    </div>
		 
		    <div class="form-group form-row">
		        <label class="col-sm-2 col-form-label" for="mBirth">생년월일</label>
		        <div class="col-sm-8">
		            <input class="form-control" id="mBirth" name="mBirth" type="text" value="${dto.mBirth}" placeholder="생년월일">
		            <small class="form-text text-muted">생년월일은 2000-01-01 형식으로 입력합니다.</small>
		        </div>
		    </div>
		
		    <div class="form-group form-row">
		        <label class="col-sm-2 col-form-label" for="mEmail">이메일</label>
		        <div class="col-sm-8 form-row">
					<div class="col col-sm-3" style="padding-right: 5px;">
						<select name="selectmEmail" onchange="changemEmail();" class="form-control">
							<option value="">선 택</option>
							<option value="naver.com" ${dto.mEmail2=="naver.com" ? "selected='selected'" : ""}>네이버 메일</option>
							<option value="hanmail.net" ${dto.mEmail2=="hanmail.net" ? "selected='selected'" : ""}>한메일</option>
							<option value="hotmail.com" ${dto.mEmail2=="hotmail.com" ? "selected='selected'" : ""}>핫메일</option>
							<option value="gmail.com" ${dto.mEmail2=="gmail.com" ? "selected='selected'" : ""}>지메일</option>
							<option value="direct">직접입력</option>
						</select>
					</div>
					
					<div class="col col-sm-8 input-group">
						<input type="text" class="form-control" name="mEmail1" maxlength="30" value="${dto.mEmail1}" >
					    <div class="input-group-prepend">
					      <div class="input-group-text" style=" background: none; border: none;">@</div>
					    </div>
					   <input type="text" class="form-control" name="mEmail2" maxlength="30" style="background-color:#F5D0A9;" value="${dto.mEmail2}" readonly="readonly">
					</div>					

		        </div>
		    </div>
		    
		    <div class="form-group form-row">
		        <label class="col-sm-2 col-form-label" for="mTel1">연락처</label>
		        <div class="col-sm-8 form-row">
					<div class="col col-sm-2">
						<input class="form-control" id="mTel1" name="mTel1" type="text" value="${dto.mTel1}" maxlength="3">
					</div>
					<div class="col col-sm-1" style="width: 1%; padding-right: 5px;">
						<p class="form-control-plaintext text-center">-</p>
					</div>
					<div class="col col-sm-2" style="padding-right: 5px;">
						<input class="form-control" id="mTel2" name="mTel2" type="text" value="${dto.mTel2}" maxlength="4">
					</div>
					<div class="col col-sm-1" style="width: 1%; padding-right: 5px;">
						<p class="form-control-plaintext text-center">-</p>
					</div>
					<div class="col col-sm-2">
						<input class="form-control" id="mTel3" name="mTel3" type="text" value="${dto.mTel3}" maxlength="4">
					</div>
		        </div>
		    </div>
		
		    <div class="form-group form-row">
		        <label class="col-sm-2 col-form-label" for="mZip">우편번호</label>
		        <div class="col-sm-5">
		       		<div class="input-group">
		           		<input class="form-control" id="mZip" name="mZip" placeholder="우편번호" style="background-color:#F5D0A9;" value="${dto.mZip}" readonly="readonly">
		           		<span class="input-group-btn">
		           			<button class="btn btn-light" type="button" style="margin-left: 5px; " onclick="daumPostcode();">우편번호 검색</button>
		           		</span>
		           	</div>
				</div>
		    </div>
	
		    <div class="form-group form-row">
		        <label class="col-sm-2 col-form-label" for="addr1">주소</label>
		        <div class="col-sm-8">
		       		<div>
		           		<input class="form-control" id="mAddr1" name="mAddr1" placeholder="기본 주소" style="background-color:#F5D0A9;" value="${dto.mAddr1}" readonly="readonly">
		           	</div>
		       		<div style="margin-top: 5px;">
		       			<input class="form-control" id="mAddr2" name="mAddr2" placeholder="상세 주소" value="${dto.mAddr2}">
					</div>
				</div>
		    </div>

		    <div class="form-group form-row">
		        <label class="col-sm-2 col-form-label" for="agree">약관 동의</label>
				<div class="col-sm-8" style="padding-top: 5px;">
					<input id="agree" name="agree" type="checkbox" checked="checked"
						style="margin-left: 0;"
						onchange="form.sendButton.disabled = !checked">
					<label>
						<a href="#">이용약관</a>에 동의합니다.
					</label>
				</div>
		    </div>
		
		    <div class="form-group form-row">
		        <div class="col-sm-12">
		            <button type="button" name="sendButton" class="btn btn-secondary" onclick="memberOk();" style="background-color:#F7BE81; border: solid 1px #F7BE81;"> 회원가입 </button>
		            <button type="button" class="btn btn-light" onclick="javascript:location.href='${pageContext.request.contextPath}/';">가입취소</button>
		        </div>
		    </div>
		
		    <div class="form-group row">
				<div class="col-sm-12">
					<p class="form-control-plaintext">${message}</p>
		        </div>
		    </div>
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
                document.getElementById('mZip').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('mAddr1').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('mAddr2').focus();
            }
        }).open();
    }
</script>	
</div>

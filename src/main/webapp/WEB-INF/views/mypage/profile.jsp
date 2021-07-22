<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script type="text/javascript">


$(function() {
	// 수정
	$("body").on("click", ".edit", function(e) {
		
		$(this).html("<span class='editOk'> 수정완료 </span>");
		
		var s;
		var arr = [];
		
		// 닉네임
		s = "<input type='text' name='mNick' id='mNick' class='boxTF sm' value='${dto.mNick}'>";
		$(".mNick").html(s);
		s="";
		
		// 이름
		s = "<input type='text' name='mName' id='mName' class='boxTF sm' value='${dto.mName}'>";
		$(".mName").html(s);
		s="";
		
		// 생년월일
		s = "<input type='text' name='mBirth' id='mBirth' class='boxTF md' value='${dto.mBirth}'>";
		$(".mBirth").html(s);
		s="";
		
		// 우편번호, 주소1, 주소2
		s = "<input type='text' name='mZip' id='mZip' class='boxTF sm' value='${dto.mZip}' readonly='readonly'>";
		s += "<button type='button' onClick='daumPostcode();'>우편번호</button>";
		$(".mZip").html(s);
		s="";
		
		s = "<input type='text' name='mAddr1' id='mAddr1' class='boxTF lg' value='${dto.mAddr1}' readonly='readonly'>";
		$(".mAddr1").html(s);
		s="";
		
		s = "<input type='text' name='mAddr2' id='mAddr2' class='boxTF lg' value='${dto.mAddr2}'>";
		$(".mAddr2").html(s);
		s="";
		
		// 전화번호
		s = "${dto.mTel}";
		arr = s.split("-");
		s="";
		s = "<input type='text' name='mTel1' id='mTel1' class='boxTF sm' value="+arr[0]+">";
		s += "<span> - </span>"
		s += "<input type='text' name='mTel2' id='mTel2' class='boxTF sm' value="+arr[1]+">";
		s += "<span> - </span>"
		s += "<input type='text' name='mTel3' id='mTel3' class='boxTF sm' value="+arr[2]+">";
		$(".mTel").html(s);
		arr="";
		s="";
		
		// 이메일
		s = "${dto.mEmail}";
		arr = s.split("@");
		s="";
		s = "<input type='text' name='mEmail1' id='mEmail1' class='boxTF md' value="+arr[0]+">";
		s += "<span> @ </span>"
		s += "<input type='text' name='mEmail2' id='mEmail2' class='boxTF md' value="+arr[1]+">";
		$(".mEmail").html(s);
		s="";
		arr="";
		
		// 프로필 사진
		s = "<input type='file' id='upload' name='upload' accept='image/*'>";
		$(".mProfileImg").append(s);
		s="";
		
		// .one
		$(this).off(e);
	});
	
	// 프로필사진 수정 중 변경사항 적용
	$("body").on("change", "#upload", function(e) {
		var file = this.files[0];
		
		if(! file.type.match("image.*")) {
			this.focus();
			return false;
		}
		
		var reader = new FileReader();
		reader.onload = function(e) {
			$(".mProfileImg").find("img").attr("src", e.target.result);
		};
		reader.readAsDataURL(file);
	});
	
	// 수정완료
	$("body").on("click", ".editOk", function(e) {
		editOk();
	});
	

	
	
	
});
</script>


<div class="mypageProfile" align="center">
<form name="memberForm" method="post" enctype="multipart/form-data">
	<div class="body-container" style="width: 700px;">
		<div class="body-title">
	        <h3><i class="fas fa-user"></i> 회원 기본 정보 </h3>
		</div>
		<div class="body-profile">
			<p class="mProfileImg">
				<img src="${pageContext.request.contextPath}/upload/profileImages/${dto.mProfileImg}" style="width: 105px; height: 105px; border-radius: 15px;">
			</p>
		</div>
		<div class="body-edit">
	        <span class="edit"> 정보수정 </span>
		</div>
	    
		<div class="body-main">
			<table class="table table-content">
				<tr>
					<td>
						<label>아이디</label>
					</td>
					<td>
						<p>
							<span>${dto.mId}</span>
						</p>
					</td>
					
				</tr>
				
				<tr>
					<td>
						<label>닉네임</label>
					</td>
					<td>
						<p class="mNick">
							<span>${dto.mNick}</span>
						</p>
					</td>
				</tr>
				
				<tr>
					<td>
						<label>이름</label>
					</td>
					<td>
						<p class="mName">
							<span>${dto.mName}</span>
						</p>
					</td>
				</tr>
				
				<tr>
					<td>
						<label>생년월일</label>
					</td>
					<td>
						<p class="mBirth">
							${dto.mBirth}
						</p>
					</td>
				</tr>
				  
				<tr>
					<td>
						<label>우편번호</label>
					</td>
					<td>
						<p class="mZip">
							<span>${dto.mZip}</span>       
						</p>
					</td>
				</tr>
				  
				<tr>
					<td>
						<label>주소</label>
					</td>
					<td>
						<p class="mAddr1">
							<span>${dto.mAddr1}</span>
						</p>
						<p class="mAddr2">
							<span>${dto.mAddr2}</span>
						</p>
					</td>
				</tr>
				
				<tr>
					<td>
						<label>전화번호</label>
					</td>
					<td>
						<p class="mTel">
							<span>${dto.mTel}</span>
						</p>
					</td>
				</tr>
								
				<tr>
					<td>
						<label>이메일</label>
					</td>
					<td>
						<p class="mEmail">
							<span>${dto.mEmail}</span>
						</p>
					</td>
				</tr>
				
			</table>
		</div>
	</div>
</form>
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
                document.getElementById('mAddr2').value = "";
                document.getElementById('mAddr2').focus();
            }
        }).open();
    }
    
    function editOk() {
		var f = document.memberForm;
		var str;
		
		str = f.mNick.value;
	    if(!str) {
	        alert("닉네임을 입력하세요. ");
	        f.mNick.focus();
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
	        alert("생년월일을 입력하세요. [YYYY-MM-DD] ");
	        f.mBirth.focus();
	        return;
	    }
	    
		
	    str = f.mTel1.value;
	    if(!str) {
	        alert("전화번호를 입력하세요. ");
	        f.mTel1.focus();
	        return;
	    }
	    if(!/^[0-9]{3}$/.test(str)) {
	        alert("숫자만 가능합니다. [010-xxxx-xxxx]");
	        f.mTel1.focus();
	        return;
	    }

	    str = f.mTel2.value;
	    if(!str) {
	        alert("전화번호를 입력하세요. ");
	        f.mTel2.focus();
	        return;
	    }
	    if(!/^[0-9]{4}$/.test(str)) {
	        alert("숫자만 가능합니다. [010-xxxx-xxxx]");
	        f.mTel2.focus();
	        return;
	    }

	    str = f.mTel3.value;
	    if(!str) {
	        alert("전화번호를 입력하세요. ");
	        f.mTel3.focus();
	        return;
	    }
	    if(!/^[0-9]{4}$/.test(str)) {
	        alert("숫자만 가능합니다. [010-xxxx-xxxx]");
	        f.mTel3.focus();
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
		
		
		f.action = "${pageContext.request.contextPath}/mypage/profile";
	    f.submit();
	}
    
    function isValidDateFormat(str) {
    	if(!/^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/.test(str)) {
    		return false;
    	}
    	return true;
	}

</script>
</div>
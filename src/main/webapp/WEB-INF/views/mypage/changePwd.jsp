<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script>
$(function() {
	$("body").on("click", "#changePwd", function(e) {
		
		// 유효성검사
		var str;
		
	    str = $("#mPwd").val();
	    if(!str) {
	        alert("비밀번호를 입력해주세요.");
	        $("#mPwd").focus();
	        return;
	    }
	    
	    str = $("#pwdOk").val();
	    if(!str) {
	        alert("비밀번호를 입력해주세요.");
	        $("#pwdOk").focus();
	        return;
	    }
 		if(str != $("#mPwd").val()) {
 			alert("비밀번호가 일치하지 않습니다.");
 			$("#pwdOk").focus();
	        return;
	    }
	    
	    str = $("#currPwd").val();
	    if(!str) {
	        alert("비밀번호를 입력해주세요.");
	        $("#currPwd").focus();
	        return;
	    }
		
		
		// json 형식으로 데이터 set
		var params = {
			mPwd : $("#mPwd").val()
			,currPwd : $("#currPwd").val()
		}
		
		// ajax
		$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/mypage/changePwd",
			data:params,
			success:function(data){
				if(data.state == "true") {
					alert("비밀번호 변경 완료! 다시 로그인 해주세요.");
					location.replace("${pageContext.request.contextPath}/");
				}
				if(data.state == "false") {
					alert("비밀번호가 틀렸습니다.");
				}
			},
			error:function(){
				alert("error");
			}
		});
		
	});
});
</script>


<div class="mypagePwd" align="center">
	<div class="body-container">
		<div class="body-title">
			 <h3> <i class="fas fa-key"></i> 비밀번호 변경 </h3>
		</div>
		<div class="body-main">
			<table>
			
				<tr>
					<td>
						<p> <input type="password" id="mPwd" class="form-control" placeholder="변경할 비밀번호"> </p>
					</td>
				</tr>
				
				<tr>
					<td>
						<p> <input type="password" id="pwdOk" class="form-control" placeholder="비밀번호 확인"> </p>
					</td>
				</tr>
				
				<tr>
					<td>
						<p> <input type="password" id="currPwd" class="form-control" placeholder="현재 비밀번호"> </p>
					</td>
				</tr>
				
				<tr>
					<td>
						<p> <button type="button" id="changePwd"  class="btn btn-lg btn-primary" style="width: 100%;"> 변경하기 </button> </p>
					</td>
				</tr>
				
			</table>
		</div>
	</div>
	
</div>
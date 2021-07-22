<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.members-form {
	font-family: 'Cafe24SsurroundAir';
	font-size: 15px;
	width: 430px;
	padding: 45px 10px 15px;
    margin: 0 auto;
    background: #fefeff;
}

.members-form .members-title {
	font-family: 'Cafe24SsurroundAir';
	font-size: 15px;
	text-align: center;
	padding: 10px 0 20px;
}
.members-form .members-title > h3 {
	font-family: 'Cafe24SsurroundAir';
	font-weight: bold; font-size:26px; color: #424951;
}

.members-form .info-box {
	font-family: 'Cafe24SsurroundAir';
	font-size: 15px;
	padding: 30px 20px;
	margin-bottom: 100px;
    box-shadow: 0 0 15px 0; color: orange;
}
/*rgb(2 59 109 / 10%)*/

.members-form .row {
	font-family: 'Cafe24SsurroundAir';
	font-size: 15px;
	margin-bottom: 1.5rem;
}
input:focus {outline:none;}
.members-form input {
	display: block;
	width: 100%;
	padding: 10px 10px;
}

.members-message {
	font-family: 'Cafe24SsurroundAir';
    margin: 0 auto;
	padding: 5px 5px 20px;
}
.members-message p {
	font-family: 'Cafe24SsurroundAir';
	color: #023b6d;
}
</style>

<script type="text/javascript">
function sendOk() {
	var f = document.pwdForm;

	var str = f.mEmail.value;
	if(!str) {
		alert("이메일을 입력하세요. ");
		f.mEmail.focus();
		return;
	}

	f.action = "${pageContext.request.contextPath}/member/findId";
	f.submit();
}
</script>

<style>
div {
	text-align: center;
}
</style>

<div class="container body-container">
	<div class="inner-page">
		<div class="members-form">
			<div class="members-title">
				<h3><i class="far fa-id-badge"></i>   아이디 찾기</h3>
			</div>
			<div class="info-box" style="border: ; border-radius: 50px; -moz-border-radius: 50px; -khtml-border-radius: 50px;
			-webkit-border-radius: 50px;">
				<form name="pwdForm" method="post">
					<div class="text-center" style="color: black;">
						<i class="fas fa-dog"></i>     회원 이메일을 입력하세요.
					</div>
					<br>
					<div class="row">
						<input name="mEmail" type="text" class="box" placeholder="이메일" style="border:1px solid gray; border-radius: 50px; -moz-border-radius: 50px; -khtml-border-radius: 50px;
			-webkit-border-radius: 50px;">
					</div>
					<div>
						<button type="button" class="btnConfirm" onclick="sendOk();" style="border:1px solid gray; border-radius: 50px; -moz-border-radius: 50px; -khtml-border-radius: 50px;
			-webkit-border-radius: 50px;">확인</button>
					</div>
				</form>
			</div>
		</div>
		<div class="members-message">
			<p class="text-center">${message}</p>
		</div>
    </div>
</div>

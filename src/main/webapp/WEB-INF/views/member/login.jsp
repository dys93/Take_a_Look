<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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


.form-signin {
  max-width: 400px;
  padding: 15px;
  margin: 0 auto;
}

@media (min-width: 768px) {
  .form-signin {
    padding-top: 5px;
  }
}

.form-signin-heading {
  text-align: center;
  font-weight:bold;  
  font-family: GmarketSansMedium;
  margin: 10px 0px 10px;
}

.logInBody-main {
  text-align: center;
  font-family: Cafe24SsurroundAir;
  margin-bottom: 80px;
}

.loginTF {
  max-width: 370px; height:45px;
  padding: 5px;
  padding-left: 15px;
  margin-top:5px; margin-bottom:15px;
}

.pc{
  width: 250px;
  height: 50px;
  margin: 0px auto;
  margin-top: 50px;
}

.pc .painting {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.center {
  margin-top: 10px; 
  text-align: center;
}
.center a{
	color: orange;
}
.message {
  margin-top: 10px; 
  text-align: center;
}

.msg {
  text-align: center; 
  margin-top: 10px; 
}
.loginBtn{
	width: 370px;
    height: 50px;
    border: none;
    color: whitesmoke;
    border-radius: 5px;
    font-size: 17px; 
	background: #023047;
	box-shadow:inset -2px -2px 7px 1px rgb(0 0 0 / 10%), 4px 3px 7px 1px rgb(0 0 0 / 10%);
	transition: 0.5s;  
	font-family: GmarketSansMedium;	 
}
.loginBtn:hover{
    color: whitesmoke;
	background: #073f5a;
	box-shadow: inset -5px -3px 7px 1px rgb(0 0 0 / 10%),4px 3px 7px 1px rgb(0 0 0 / 10%);	
	font-family: GmarketSansMedium;
}

.btn { 
	display:block; 
	width: 370px;
    height: 50px;
	line-height:40px; 
	border:1px #8ecae6 solid; 
	margin:15px auto; 
	background-color: #8ecae6;
	text-align:center; 
	font-size: 17px; 
	cursor: pointer; 
	color:#333; 
	transition:all 0.9s, color 0.7; 
	font-family: GmarketSansMedium;	 
	box-shadow:inset -2px -2px 7px 1px rgb(0 0 0 / 10%), 4px 3px 7px 1px rgb(0 0 0 / 10%);
}
.btn:hover{
	color:#fff;
}

.hover1:hover{
 box-shadow:370px 0 0 0 rgba(0,0,0,0.5) inset; 
 }
 
.textHead{
    background: orange;
    color: white;
    width: 380px;
    margin: auto;
    height: 30px;
    line-height: 30px;
    font-weight: bold;
}
</style>

<script type="text/javascript">
function sendLogin() {
	var f = document.loginForm;

	var str = f.mId.value;
	if(!str) {
		f.mId.focus();
		return;
	}

	str = f.mPwd.value;
	if(!str) {
		f.mPwd.focus();
		return;
	}

	f.action = "${pageContext.request.contextPath}/member/login";
	f.submit();
}
</script>
<div class="body-container">
	<div class="logInBody-main">
	        <div class="pc">
	        </div>
	        <div class="textHead">떼껄룩의 회원이 되어 다양한 혜택을 누려보세요</div >

	    <form class="form-signin" name="loginForm" method="post" style="margin-top: 30px;">
	        <h3 class="form-signin-heading">떼껄룩 회원 로그인</h3>  
	        <input type="text" id="mId" name="mId" class="form-control loginTF" autofocus="autofocus" placeholder="아이디">
	        <input type="password" id="mPwd" name="mPwd" class="form-control loginTF" placeholder="패스워드">
	        <button class="btn hover1"" type="button" onclick="sendLogin();">로그인 <span class="glyphicon glyphicon-ok"></span></button>
	        <hr>
		<div class="pc">
	    	<img src="${pageContext.request.contextPath}/resources/images/login/painting.jpg" class="painting">
	    </div>
	    <span>회원서비스 이용하기</span> 
	    		 		
	        <div class="center">
					<a href="${pageContext.request.contextPath}/member/signup">회원가입</a> <span>|</span>
					<a href="${pageContext.request.contextPath}/member/findId">아이디 찾기</a> <span>|</span>
					<a href="${pageContext.request.contextPath}/member/findPwd">패스워드 찾기</a>
	        </div>
	        <div class="message">${message}</div>
	    </form>
	</div>
</div>



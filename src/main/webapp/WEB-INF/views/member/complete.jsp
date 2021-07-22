<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">

.container{
	font-family: 'Cafe24SsurroundAir';
	font-size: 15px;
	text-align: center;
	align: center;
}

.info-message{
	width: 100%;
	padding: 30px 20px;
	margin-bottom: 100px;
    box-shadow: 0 0 15px 0; color: orange;
    text-align: center;
}

</style>

<div class="container body-container">
	<div class="inner-page">
		<div class="info-container">
			<div class="info-title" style="margin-top:20px; margin-bottom:100px;">
				<h3>${title}</h3>
			</div>
			<br>
			<div class="info-box">
				<div class="info-message" style="margin-top:20px; margin-bottom:100px; border: ;">
					${message} 
				</div>
				<br>
				<div class="info-footer">
					<button type="button" class="btnConfirm" style="margin-top:20px; margin-bottom:100px; border:1px solid gray; border-radius: 50px; -moz-border-radius: 50px; -khtml-border-radius: 50px;
			-webkit-border-radius: 50px; background-color: white; font-color: black;" onclick="javascript:location.href='${pageContext.request.contextPath}/';">메인 화면으로 이동</button>
				</div>
			</div>
		</div>
    </div>
</div>

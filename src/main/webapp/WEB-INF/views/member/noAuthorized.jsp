<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">

@font-face {
    font-family: 'Cafe24Ssurround';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24Ssurround.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

.container {
	font-family: Cafe24Ssurround, sans-serif;
}

</style>

<div class="container body-container" style="min-height: 700px; text-align: center; padding-top:100px;">
	<div class="inner-page">
		<div class="info-continer">
			<div class="info-title">
				<h3 style="color: red;"><strong style="font-size: 40px; font-weight: 800;">경고 !</strong></h3>
			</div>
			<div class="info-box">
				<div class="info-message" style="padding-top: 20px; font-size:30px;">
					해당 페이지에 접근 할 수 있는 권한이 없습니다.
				</div>
				<div class="info-footer" style="padding-top: 30px; width:100%;">
					<button type="button" class="btn btn-lg btn-primary" onclick="javascript:location.href='${pageContext.request.contextPath}/';" style="font-size:25px; width:30%;">메인화면으로 이동</button>
				</div>
			</div>
		</div>
    </div>
</div>
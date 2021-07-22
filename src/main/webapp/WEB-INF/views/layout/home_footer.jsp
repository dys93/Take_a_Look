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

.footer {
	font-family: Cafe24Ssurround, sans-serif;
	position: absolute;
	margin: 0;
	padiing: 0;
	bottom:0;
	width: 100%;
	z-index: 6;
	color: white;
	position: fixed;
	border-top: 2px solid white;
}

.footer-stat {
	padding: 10px;
	display: inline-block;
	float: left;
	font-size: 15px;
	font-weight: 700;
	border-right: 2px solid white;
}

.footer-contact {
	padding: 10px;
	display: inline-block;
	float: right;
	font-size: 15px;
	font-weight: 700;
	border-right: 2px solid white;
}

</style>

<footer>
<div class="footer">
	<div class="footer-content">
		<span id="count" class="footer-stat"></span>
		<span class="footer-contact">Contact Us &nbsp;&nbsp; TakeALook@TakeA.Look</span>
	</div>
	
</div>


</footer>


<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>

	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title><tiles:insertAttribute name="title"/></title>
	<link rel="icon" href="data:;base64,iVBORw0KGgo=">
	
	 
	<!-- bootstrap4 -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/jquery/css/smoothness/jquery-ui.min.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap4/css/bootstrap.min.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap4/css/bootstrap-icons.css" type="text/css">
	
	<!-- css (작업하신 css파일 링크는 여기에...) -->

	
	<!-- header -->
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header/header.css" type="text/css">	
	
	<!-- product css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/product/main.css" type="text/css">
		
	<!-- petsit css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/petsit/main.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/petsit/reservation.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/petsit/write.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/petsit/list.css" type="text/css">
	
	<!-- mypage -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/profile.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/changePwd.css" type="text/css">
		
	<!-- stat -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/stat/stat.css" type="text/css">
	
	<!-- fontawesome -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fontawesome/css/all.css" rel="stylesheet">
	
	<!-- highcharts -->
	<script src="https://code.highcharts.com/highcharts.js"></script>
	
	<!-- jquery -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/util-jquery.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery/js/jquery.mousewheel.min.js"></script>
	
	
	<script type="text/javascript">
	
	$(function(){
		$(document)
		   .ajaxStart(function(){ // AJAX 시작
			   $("#loadingImage").center();
			   $("#loadingLayout").fadeTo("slow", 0.5);
		   })
		   .ajaxComplete(function(){ // AJAX 종료
			   $("#loadingLayout").hide();
		   });
	});
	</script>
</head>

	<header>
	    <tiles:insertAttribute name="header"/>
	</header>
		
	<main>
	    <tiles:insertAttribute name="body"/>
	</main>
	
	<footer>
	    <tiles:insertAttribute name="footer"/>
	</footer>

	<div id="loadingLayout" style="display: none; position: absolute; left: 0; top:0; width: 100%; height: 100%; z-index: 9000; background: #eeeeee;">
		<i id="loadingImage" class="fa fa-cog fa-spin fa-fw" style="font-size: 70px; color: 333;"></i> 
	</div>
	
	<!-- javascript -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/bootstrap4/js/popper.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/bootstrap4/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery/js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery/js/jquery.ui.datepicker-ko.js"></script>
	
	
</html>
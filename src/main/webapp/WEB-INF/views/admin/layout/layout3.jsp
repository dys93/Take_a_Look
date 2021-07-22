<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title><tiles:insertAttribute name="title"/></title>
	<link rel="icon" href="data:;base64,iVBORw0KGgo=">

	
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">
	
	<!-- dataTable css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
	
	<!-- Google Font: Source Sans Pro -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
	<!-- Font Awesome Icons -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fontawesome/css/all.min.css">
	<!-- IonIcons -->
	<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
	<!-- Theme style -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/dist/css/adminlte.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/dist/css/add.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/dist/css/icofont.min.css">
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/jquery/css/smoothness/jquery-ui.min.css" type="text/css">

	<!--  JQuery -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/plugins/jquery/jquery.min.js"></script>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/util-jquery.js"></script>
	
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


<body class="hold-transition sidebar-mini">
	<header class="header">
	    <tiles:insertAttribute name="header"/>
	</header>
		
	<main>
	    <tiles:insertAttribute name="body"/>
	</main>
	
	<footer class="main-footer">
	    <tiles:insertAttribute name="footer"/>
	</footer>

	<div id="loadingLayout" style="display: none; position: absolute; left: 0; top:0; width: 100%; height: 100%; z-index: 9000; background: #eeeeee;">
		<i id="loadingImage" class="fa fa-cog fa-spin fa-fw" style="font-size: 70px; color: 333;"></i> 
	</div>

	<!-- OPTIONAL SCRIPTS -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/plugins/chart.js/Chart.min.js"></script>
	
	<!-- Java Script -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/dist/js/management.js"></script>
	
	<!-- Bootstrap -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/jquery/js/jquery-ui.min.js"></script>

	<!-- AdminLTE -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/dist/js/adminlte.js"></script>
	
	<!-- DataTables  & Plugins -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/plugins/datatables/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/plugins/jszip/jszip.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/plugins/pdfmake/pdfmake.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/plugins/pdfmake/vfs_fonts.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/plugins/datatables-buttons/js/buttons.html5.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/plugins/datatables-buttons/js/buttons.print.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/plugins/datatables-buttons/js/buttons.colVis.min.js"></script>


</body>
</html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<style type="text/css">
.hover-tr:hover {
	cursor: pointer;
	background: #BDBDBD;
}

</style>

<script type="text/javascript">
function ajaxFun(url, method, query, dataType, fn) {
	$.ajax({
		type:method,
		url:url,
		data:query,
		dataType:dataType,
		success:function(data){
			fn(data);
		},
		beforeSend : function(jqXHR) {
			jqXHR.setRequestHeader("AJAX", true);
		},
		error : function(jqXHR) {
			if (jqXHR.status == 403) {
				location.href="${pageContext.request.contextPath}/member/login";
				return false;
			}
			console.log(jqXHR.responseText);
		}
	});
}

function detailedProduct(pNum) {
	var dlg = $("#product-dialog").dialog({
		  autoOpen: false,
		  modal: true,
		  buttons: {
		       " 수정 " : function() {
		    	   updateOk(); 
		       },
		       " 닫기 " : function() {
		    	   $(this).dialog("close");
		       }
		  },
		  height: 520,
		  width: 800,
		  title: "제품상세정보",

	});

	var url = "${pageContext.request.contextPath}/admin/productManagement/productManagementDetail";
	var query = "pNum="+pNum;
	
	var fn = function(data){
		$('#product-dialog').html(data);
		dlg.dialog("open");
	};
	ajaxFun(url, "post", query, "html", fn);
}

function updateOk() {
	var f = document.detailedProductForm;
	
	if(! $.trim(f.pPrice.value)) {
		f.pPrice.focus();
		return;
	}
	if(! $.trim(f.pDiscountRate.value)) {
		f.pDiscountRate.focus();
		return;
	}
	if(! $.trim(f.pDetailCnt.value)) {
		f.pDetailCnt.focus();
		return;
	}
	if(! $.trim(f.pDetailPrice.value)) {
		f.pDetailPrice.focus();
		return;
	}
	
	var url = "${pageContext.request.contextPath}/admin/productManagement/updateProductState";
	var query=$("#detailedProdcutForm").serialize();

	var fn = function(data){

	};
	ajaxFun(url, "post", query, "json", fn);
		
	$('#product-dialog').dialog("close");
}

</script>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>상품관리</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin">Home</a></li>
              <li class="breadcrumb-item active">상품관리</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table id="example1" class="table table-bordered table-striped">
                  <thead>
                  <tr>
                    <th>제품코드</th>
                    <th>상품명</th>
                    <th>배송조건</th>
                    <th>카테고리</th>
                    <th>등록일</th>
                  </tr>
                  </thead>
                  <tbody>
                  	<c:forEach var="dto" items="${list}">
                  	<tr>
                  		<td class="hover-tr" onclick="detailedProduct('${dto.pNum}');">${dto.pNum}</td>
                  		<td>${dto.pName}</td>
                  		<td>${dto.delivType==0?"무료배송":"일반배송"}</td>
                  		<td>${dto.pCateName}</td>
                  		<td>${dto.pDate}</td>
                  	</tr>
                  	</c:forEach>
                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div>
      <!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <div id="product-dialog" style="display: none;"></div>

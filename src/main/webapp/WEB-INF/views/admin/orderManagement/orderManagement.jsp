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

function detailedOrder(orderNum, deliveryState) {
	
	var dlg = $("#order-dialog").dialog({
		  autoOpen: false,
		  modal: true,
		  buttons: {
		       " 배송 중 " : function() {
		    	   updateOk(orderNum, deliveryState); 
		       },
		       " 배송 완료 " : function() {
		    	   updateOk2(orderNum, deliveryState); 
		       },
		       " 닫기 " : function() {
		    	   $(this).dialog("close");
		       }
		  },
		  height: 520,
		  width: 800,
		  title: "주문 상세정보",

	});

	var url = "${pageContext.request.contextPath}/admin/orderManagement/orderManagementDetail";
	var query = "orderNum="+orderNum;
	
	var fn = function(data){
		$('#order-dialog').html(data);
		dlg.dialog("open");
	};
	ajaxFun(url, "post", query, "html", fn);
}

function updateOk(orderNum, deliveryState) {
	var f = document.detailedOrderForm;
	
	if(deliveryState == 0) {
		var url = "${pageContext.request.contextPath}/admin/orderManagement/updateOrderStateIng";
		var query = "orderNum="+orderNum;
	
		var fn = function(data){
	
		};
		ajaxFun(url, "post", query, "json", fn);
			
		$('#order-dialog').dialog("close");
		return;
	}
	
	
	alert("현재 배송준비 중인 주문이 아닙니다.");
	return;
}

function updateOk2(orderNum, deliveryState) {
	var f = document.detailedOrderForm;
	
	if(deliveryState == 1) {
		var url = "${pageContext.request.contextPath}/admin/orderManagement/updateOrderStateOk";
		var query = "orderNum="+orderNum;
	
		var fn = function(data){
	
		};
		ajaxFun(url, "post", query, "json", fn);
		
		$('#order-dialog').dialog("close");
		return;
	}
	
	alert("현재 배송이 진행중인 주문이 아닙니다.");
	return;
}


</script>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>주문관리</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin">Home</a></li>
              <li class="breadcrumb-item active">주문관리</li>
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
                    <th>주문코드</th>
                    <th>고객번호</th>
                    <th>결제상태</th>
                    <th>결제금액</th>
                    <th>구매자명</th>
                  </tr>
                  </thead>
                  <tbody>
                  	<c:forEach var="dto" items="${list}">
                  	<tr>
                  		<td class="hover-tr" onclick="detailedOrder('${dto.orderNum}', '${dto.deliveryState}');">${dto.orderNum}</td>
                  		<td>${dto.mNum}</td>
                  		<td>${dto.orderState==0?"결제대기":"결제완료"}</td>
                  		<td>${dto.finalPrice}</td>
                  		<td>${dto.orderName}</td>
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
  <div id="order-dialog" style="display: none;"></div>

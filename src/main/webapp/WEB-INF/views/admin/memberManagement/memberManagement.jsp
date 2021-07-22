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

function detailedMember(mId) {
	var dlg = $("#member-dialog").dialog({
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
		  title: "회원상세정보",

	});

	var url = "${pageContext.request.contextPath}/admin/memberManagement/memberManagementDetail";
	var query = "mId="+mId;
	
	var fn = function(data){
		$('#member-dialog').html(data);
		dlg.dialog("open");
	};
	ajaxFun(url, "post", query, "html", fn);
}

function updateOk() {
	var f = document.detailedMemberForm;
	
	if(! f.msCode.value) {
		f.msCode.focus();
		return;
	}
	if(! $.trim(f.memo.value)) {
		f.memo.focus();
		return;
	}
	
	var url = "${pageContext.request.contextPath}/admin/memberManagement/updateMemberState";
	var query=$("#detailedMemberForm").serialize();

	var fn = function(data){

	};
	ajaxFun(url, "post", query, "json", fn);
		
	$('#member-dialog').dialog("close");
}

function memberStateDetailView(mId) {
	$('#memberStateDetail').dialog({
		  modal: true,
		  minHeight: 100,
		  maxHeight: 450,
		  width: 750,
		  title: '계정상태 상세 ',
		  close: function(event, ui) {
				$(this).dialog("destroy");
		  }
	  });	
}

function selectStateChange() {
	var f = document.detailedMemberForm;
	
	var s = f.msCode.value;
	var txt = f.msCode.options[f.msCode.selectedIndex].text;
	
	f.memo.value = "";	
	if(! s) {
		return;
	}

	if(s!="0" && s!="6") {
		f.memo.value = txt;
	}
	
	f.memo.focus();
}

</script>


  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>회원관리</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin">Home</a></li>
              <li class="breadcrumb-item active">회원관리</li>
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
                <h3 class="card-title"></h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table id="example1" class="table table-bordered table-striped">
                  <thead>
                  <tr>
                    <th>회원 아이디</th>
                    <th>이름</th>
                    <th>생년월일</th>
                    <th>회원구분</th>
                    <th>고객번호</th>
                  </tr>
                  </thead>
                  <tbody>
                  	<c:forEach var="dto" items="${list}">
                  	<tr>
                  		<td class="hover-tr" onclick="detailedMember('${dto.mId}');">${dto.mId}</td>
                  		<td>${dto.mName}</td>
                  		<td>${dto.mBirth}</td>
                  		<td>${dto.mRole==1?"일반회원":"펫시터"}</td>
                  		<td>${dto.mNum}</td>
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
  <div id="member-dialog" style="display: none;"></div>
  

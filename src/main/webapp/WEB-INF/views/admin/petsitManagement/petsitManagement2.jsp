<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script type="text/javascript">
function petsitAdd() {
	var str = $("#mId").text();
	str = str.trim();
	var url="${pageContext.request.contextPath}/admin/petsitAdd";
	
	var query="mId="+str;
	
	$.ajax({
		type:"POST"
		,url:url
		,data:query
		,dataType:"json"
		,success:function(data) {
			
		}
	    ,error:function(e) {
	    	console.log(e.responseText);
	    }
	});
}


function petsitPrint() {
	$(".modal-body").empty();
	
	var url="${pageContext.request.contextPath}/admin/petsitPrint";
	
	$.ajax({
		type:"GET"
		,url:url
		,dataType:"json"
		,success:function(data) {
			
			var html = "";
			
			html += "아이디 : <span id='mId'>" + data.mId + "</span><br>";
			html += "임시 패스워드 : " + data.mPwd + " (변경 후 사용)<br>";
			html += "임시 닉네임 : " + data.mNick + " (변경 후 사용)<br>";
			
			
			$(".modal-body").append(html);
		}
	    ,error:function(e) {
	    	console.log(e.responseText);
	    }
	});
}

$(document).ready(function(){
	var url = "${pageContext.request.contextPath}/admin/petsitList";
	$.ajax({
		type:"GET"
		,url:url
		,dataType:"json"
		,success:function(data) {
			$("#petsitTbody").empty();
		
			for(var i=0; i<data.list.length; i++) {
				var html = "";
				
				html += "<tr><td>"+data.list[i].mId+"</td>";
				html += "<td>"+data.list[i].petStart+"</td>";
				html += "<td>"+data.list[i].petOnoff+"</td>";
				html += "<td>"+data.list[i].petAct+"</td>";
				html += "<td>스케쥴</td></tr>";
				
				$("#petsitTbody").append(html);
			}				
		}
		,error:function(e) {
	    	console.log(e.responseText);
		}
	})
});

</script>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>펫시터관리</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin">Home</a></li>
              <li class="breadcrumb-item active">펫시터관리</li>
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
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" onclick="petsitPrint();" style="float:right">
				  펫시터 아이디 등록
				</button>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table id="example1" class="table table-bordered table-striped">
                  <thead>
                  <tr>
                    <th>아이디</th>
                    <th>근무시작일</th>
                    <th>활동상태</th>
                    <th>급여계좌</th>
                    <th>근무가능 요일</th>
                  </tr>
                  </thead>
                  <tbody id="petsitTbody">

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
  
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">새로운 펫시터 아이디 발급</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" onclick="petsitAdd();" data-dismiss="modal">등록하기</button>
      </div>
    </div>
  </div>
</div>
  

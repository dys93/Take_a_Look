<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>후원금관리</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin">Home</a></li>
              <li class="breadcrumb-item active">후원금관리</li>
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
                <h3 class="card-title">총 누적 후원금액 : ${totalDonation} 원</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table id="example1" class="table table-bordered table-striped">
                  <thead>
                  <tr>
                    <th>후원 번호</th>
                    <th>아이디</th>
                    <th>후원자명</th>
                    <th>후원금액(원)</th>
                    <th>후원일자</th>
                  </tr>
                  </thead>
                  <tbody>
                  	<c:forEach var="dto" items="${list}">
                  	<tr>
                  		<td>${dto.orderNum}</td>
                  		<td>${dto.mId}</td>
                  		<td>${dto.mName}</td>
                  		<fmt:parseNumber value="${dto.finalPrice/2}" var="price" type="number" integerOnly="true"/>
                  		<td>${price}</td>
                  		<td>${dto.sDate}</td>
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
  

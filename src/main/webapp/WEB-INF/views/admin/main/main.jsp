<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">떼껄룩 관리자 페이지</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item active">관리자 메인</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <div class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-lg-6">
            <div class="card">
              <div class="card-header border-0">
                <div class="d-flex justify-content-between">
                  <h3 class="card-title">사이트 가입자 추이</h3>
                </div>
              </div>
              <div class="card-body">
                <div class="d-flex">
                  <p class="d-flex flex-column">
                    <span class="text-bold text-lg">${joinLastWeek.jTotLastWeek}&nbsp;명</span>
                    <span>지난 주 총 가입자</span>
                  </p>
                  <p class="ml-auto d-flex flex-column text-right">
                    <span class="font-weight-bold">
					<span class="text-bold text-lg">${joinThisWeek.jTotThisWeek}&nbsp;명</span>
                    </span>
                    <span class="text-muted">이번 주 총 가입자</span>
                  </p>
                </div>
                <!-- /.d-flex -->

                <div class="position-relative mb-4">
                  <canvas id="visitors-chart" height="200"></canvas>
                </div>

                <div class="d-flex flex-row justify-content-end">
                  <span class="mr-2">
                    <i class="fas fa-square text-primary"></i> This Week
                  </span>

                  <span>
                    <i class="fas fa-square text-gray"></i> Last Week
                  </span>
                </div>
              </div>
            </div>
            <!-- /.card -->

            <div class="card">
              <div class="card-header border-0">
                <h3 class="card-title">인기제품</h3>
              </div>
              <div class="card-body table-responsive p-0">
                <table class="table table-striped table-valign-middle">
                  <thead>
                  <tr style="text-align: center">
                    <th>상품명</th>
                    <th>상품가격</th>
                    <th>총 판매량</th>
                    <th>상품 바로가기</th>
                  </tr>
                  </thead>
                  <tbody> 
					  <c:forEach var="dto" items="${bestStore}">
	                  	<tr>
	                  	  <td>${dto.pName}</td>
	                  	  <td style="text-align: right">${dto.pPrice}&nbsp;원</td>
	                  	  <td style="text-align: right">${dto.sumQty}&nbsp;개</td>
	                      <td style="text-align: center">
	                      	<a href="${pageContext.request.contextPath}/product/article?category=${dto.pCateNum}&page=1&pNum=${dto.pNum}" class="text-muted"> 
	                        	<i class="fas fa-search"></i> 
	                     	</a>
	                   	  </td>
	                  	</tr>
	                  </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col-md-6 -->
          <div class="col-lg-6">
            <div class="card">
              <div class="card-header border-0">
                <div class="d-flex justify-content-between">
                  <h3 class="card-title">스토어 매출 현황</h3>
                  <a href="${pageContext.request.contextPath}/admin/saleStatus">View Report</a>
                </div>
              </div>
              <div class="card-body">
                <div class="d-flex">
                  <p class="d-flex flex-column">
                    <span class="text-bold text-lg">${storeLastWeek.sTotLastWeek} 원</span>
                    <span>지난주 총 매출액</span>
                  </p>
                  <p class="ml-auto d-flex flex-column text-right">
                    <span class="font-weight-bold">
                    <span class="text-bold text-lg">${storeThisWeek.sTotThisWeek} 원</span>
                    </span>
                    <span class="text-muted">이번주 총 매출액</span>
                  </p>
                </div>
                <!-- /.d-flex -->

                <div class="position-relative mb-4">
                  <canvas id="sales-chart" height="200"></canvas>
                </div>

                <div class="d-flex flex-row justify-content-end">
                  <span class="mr-2">
                    <i class="fas fa-square text-primary"></i> This week
                  </span>

                  <span>
                    <i class="fas fa-square text-gray"></i> Last week
                  </span>
                </div>
              </div>
            </div>
            <!-- /.card -->

            <div class="card">
              <div class="card-header border-0">
                <h3 class="card-title">통계</h3>
              </div>
              <div class="card-body">
                <div class="d-flex justify-content-between align-items-center border-bottom mb-3">
                    	<c:choose>
                    		<c:when test="${petLastWeek.pTotLastWeek < petThisWeek.pTotThisWeek}">
                    			<p class="text-success text-xl">
                    				<i class="fas fa-dog"></i>
                    				<i class="fas fa-dog"></i>
                    				<i class="fas fa-dog"></i>
                    				<i class="fas fa-dog"></i>
                    				<i class="fas fa-dog"></i>
                  				</p>
                      		</c:when>
                      		<c:otherwise>
                      			<c:choose>
                      				<c:when test="${petLastWeek.pTotLastWeek > petThisWeek.pTotThisWeek}">
		                    			<p class="text-danger text-xl">
		                    				<i class="fas fa-dog"></i>
		                  				</p>
                      				</c:when>
                      				<c:otherwise>
		                    			<p class="text-warning text-xl">
		                    				<i class="fas fa-dog"></i>
		                    				<i class="fas fa-dog"></i>
		                    				<i class="fas fa-dog"></i>
		                  				</p>
                      				</c:otherwise>
                      			</c:choose>
                      		</c:otherwise>
                     	</c:choose>
                  <p class="d-flex flex-column text-right">
                    <span class="font-weight-bold">
                    	<c:choose>
                    		<c:when test="${petLastWeek.pTotLastWeek < petThisWeek.pTotThisWeek}">
                      			<i class="ion ion-android-arrow-up text-success"></i><span>&nbsp;&nbsp;${petThisWeek.pTotThisWeek-petLastWeek.pTotLastWeek}&nbsp;건</span>
                      		</c:when>
                      		<c:otherwise>
                      			<c:choose>
                      				<c:when test="${petLastWeek.pTotLastWeek > petThisWeek.pTotThisWeek}">
                      					<i class="ion ion-android-arrow-down text-danger"></i><span>&nbsp;&nbsp;${petLastWeek.pTotLastWeek-petThisWeek.pTotThisWeek}&nbsp;건</span>
                      				</c:when>
                      				<c:otherwise>
                      					<span>&nbsp;&nbsp;${petLastWeek.pTotLastWeek-petThisWeek.pTotThisWeek}&nbsp;건</span>
                      				</c:otherwise>
                      			</c:choose> 
                      		</c:otherwise>
                     	</c:choose>
                    </span>
                    <span class="text-muted">전주 대비 제품 펫시터 예약 증감</span>
                  </p>
                </div>
                <!-- /.d-flex -->
                <div class="d-flex justify-content-between align-items-center border-bottom mb-3">
                    	<c:choose>
                    		<c:when test="${storeLastWeek.sTotLastWeek < storeThisWeek.sTotThisWeek}">
                    			<p class="text-success text-xl">
                    				<i class="fas fa-shopping-cart"></i>
                    				<i class="fas fa-shopping-cart"></i>
                    				<i class="fas fa-shopping-cart"></i>
                    				<i class="fas fa-shopping-cart"></i>
                    				<i class="fas fa-shopping-cart"></i>
                  				</p>
                      		</c:when>
                      		<c:otherwise>
                      			<c:choose>
                      				<c:when test="${storeLastWeek.sTotLastWeek > storeThisWeek.sTotThisWeek}">
		                    			<p class="text-danger text-xl">
		                    				<i class="fas fa-shopping-cart"></i>
		                  				</p>
                      				</c:when>
                      				<c:otherwise>
		                    			<p class="text-warning text-xl">
		                    				<i class="fas fa-shopping-cart"></i>
		                    				<i class="fas fa-shopping-cart"></i>
		                    				<i class="fas fa-shopping-cart"></i>
		                  				</p>
                      				</c:otherwise>
                      			</c:choose>
                      		</c:otherwise>
                     	</c:choose>
                  <p class="d-flex flex-column text-right">
                    <span class="font-weight-bold">
                    	<c:choose>
                    		<c:when test="${storeLastWeek.sTotLastWeek < storeThisWeek.sTotThisWeek}">
                      			<i class="ion ion-android-arrow-up text-success"></i><span>&nbsp;&nbsp;${storeThisWeek.sTotThisWeek-storeLastWeek.sTotLastWeek}&nbsp;원</span>
                      		</c:when>
                      		<c:otherwise>
                      			<c:choose>
                      				<c:when test="${storeLastWeek.sTotLastWeek > storeThisWeek.sTotThisWeek}">
                      					<i class="ion ion-android-arrow-down text-danger"></i><span>&nbsp;&nbsp;${storeLastWeek.sTotLastWeek-storeThisWeek.sTotThisWeek}&nbsp;원</span>
                      				</c:when>
                      				<c:otherwise>
                      					<span>&nbsp;&nbsp;${storeLastWeek.sTotLastWeek-storeThisWeek.sTotThisWeek}&nbsp;원</span>
                      				</c:otherwise>
                      			</c:choose> 
                      		</c:otherwise>
                     	</c:choose>
                    </span>
                    <span class="text-muted">전주 대비 제품 판매 매출액 증감</span>
                  </p>
                </div>
                <!-- /.d-flex -->
                <div class="d-flex justify-content-between align-items-center mb-0">
                    	<c:choose>
                    		<c:when test="${joinLastWeek.jTotLastWeek < joinThisWeek.jTotThisWeek}">
                    			<p class="text-success text-xl">
                    				<i class="fas fa-users"></i>
                    				<i class="fas fa-users"></i>
                    				<i class="fas fa-users"></i>
                    				<i class="fas fa-users"></i>
                    				<i class="fas fa-users"></i>
                  				</p>
                      		</c:when>
                      		<c:otherwise>
                      			<c:choose>
                      				<c:when test="${joinLastWeek.jTotLastWeek > joinThisWeek.jTotThisWeek}">
		                    			<p class="text-danger text-xl">
		                    				<i class="fas fa-users"></i>
		                  				</p>
                      				</c:when>
                      				<c:otherwise>
		                    			<p class="text-warning text-xl">
		                    				<i class="fas fa-users"></i>
		                    				<i class="fas fa-users"></i>
		                    				<i class="fas fa-users"></i>
		                  				</p>
                      				</c:otherwise>
                      			</c:choose>
                      		</c:otherwise>
                     	</c:choose>
                  <p class="d-flex flex-column text-right">
                    <span class="font-weight-bold">
                    	<c:choose>
                    		<c:when test="${joinLastWeek.jTotLastWeek < joinThisWeek.jTotThisWeek}">
                      			<i class="ion ion-android-arrow-up text-success"></i><span>&nbsp;&nbsp;${joinThisWeek.jTotThisWeek-joinLastWeek.jTotLastWeek}&nbsp;명</span>
                      		</c:when>
                      		<c:otherwise>
                      			<c:choose>
                      				<c:when test="${joinLastWeek.jTotLastWeek > joinThisWeek.jTotThisWeek}">
                      					<i class="ion ion-android-arrow-down text-danger"></i><span>&nbsp;&nbsp;${joinLastWeek.jTotLastWeek-joinThisWeek.jTotThisWeek}&nbsp;명</span>
                      				</c:when>
                      				<c:otherwise>
                      					<span>&nbsp;&nbsp;${joinLastWeek.jTotLastWeek-joinThisWeek.jTotThisWeek}&nbsp;명</span>
                      				</c:otherwise>
                      			</c:choose>
                      		</c:otherwise>
                     	</c:choose>
                    </span>
                    <span class="text-muted">전주 대비 가입자 증감</span>
                  </p>
                </div>
                <!-- /.d-flex -->
              </div>
            </div>
          </div>
          <!-- /.col-md-6 -->
        </div>
        <!-- /.row -->
      </div>
      <!-- /.container-fluid -->
    </div>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  

<!-- AdminLTE for demo purposes -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin/dist/js/demo.js"></script>

<script type="text/javascript">

$(function () {
	  'use strict'

	  var ticksStyle = {
	    fontColor: '#495057',
	    fontStyle: 'bold'
	  }

	  var mode = 'index'
	  var intersect = true

	  var $salesChart = $('#sales-chart')
	  // eslint-disable-next-line no-unused-vars
	  var salesChart = new Chart($salesChart, {
	    type: 'bar',
	    data: {
	      labels: ['월', '화', '수', '목', '금', '토', '일'],
	      datasets: [
	        {
	          backgroundColor: '#007bff',
	          borderColor: '#007bff',
	          data: [${storeThisWeek.mon}, ${storeThisWeek.tue}, ${storeThisWeek.wed}, ${storeThisWeek.thu}, ${storeThisWeek.fri}, ${storeThisWeek.sat}, ${storeThisWeek.sun}]
	        }, 
	        {
	          backgroundColor: '#ced4da',
	          borderColor: '#ced4da',
	          data: [${storeLastWeek.mon}, ${storeLastWeek.tue}, ${storeLastWeek.wed}, ${storeLastWeek.thu}, ${storeLastWeek.fri}, ${storeLastWeek.sat}, ${storeLastWeek.sun}]
	        }
	      ]
	    },
	    options: {
	      maintainAspectRatio: false,
	      tooltips: {
	        mode: mode,
	        intersect: intersect
	      },
	      hover: {
	        mode: mode,
	        intersect: intersect
	      },
	      legend: {
	        display: false
	      },
	      scales: {
	        yAxes: [{
	          // display: false,
	          gridLines: {
	            display: true,
	            lineWidth: '4px',
	            color: 'rgba(0, 0, 0, .2)',
	            zeroLineColor: 'transparent'
	          },
	          ticks: $.extend({
	            beginAtZero: true,

	            // Include a dollar sign in the ticks
	            callback: function (value) {
	              if (value >= 1000) {
	                value /= 1000
	                value += 'k'
	              }

	              return '￦' + value
	            }
	          }, ticksStyle)
	        }],
	        xAxes: [{ 
	          display: true,
	          gridLines: {
	            display: false
	          },
	          ticks: ticksStyle
	        }]
	      }
	    }
	  })

	  var $visitorsChart = $('#visitors-chart')
	  // eslint-disable-next-line no-unused-vars
	  var visitorsChart = new Chart($visitorsChart, {
	    data: {
	      labels: ['월', '화', '수', '목', '금', '토', '일'], 
	      datasets: [{
	        type: 'line',
	        data: [${joinThisWeek.mon}, ${joinThisWeek.tue}, ${joinThisWeek.wed}, ${joinThisWeek.thu}, ${joinThisWeek.fri}, ${joinThisWeek.sat}, ${joinThisWeek.sun}],
	        backgroundColor: 'transparent',
	        borderColor: '#007bff',
	        pointBorderColor: '#007bff',
	        pointBackgroundColor: '#007bff',
	        fill: false
	        // pointHoverBackgroundColor: '#007bff',
	        // pointHoverBorderColor    : '#007bff'
	      },
	      {
	        type: 'line',
	        data: [${joinLastWeek.mon}, ${joinLastWeek.tue}, ${joinLastWeek.wed}, ${joinLastWeek.thu}, ${joinLastWeek.fri}, ${joinLastWeek.sat}, ${joinLastWeek.sun}],
	        backgroundColor: 'tansparent',
	        borderColor: '#ced4da',
	        pointBorderColor: '#ced4da',
	        pointBackgroundColor: '#ced4da',
	        fill: false 
	        // pointHoverBackgroundColor: '#ced4da',
	        // pointHoverBorderColor    : '#ced4da' 
	      }]
	    },
	    options: {
	      maintainAspectRatio: false,
	      tooltips: {
	        mode: mode,
	        intersect: intersect
	      }, 
	      hover: {
	        mode: mode,
	        intersect: intersect
	      },
	      legend: {
	        display: false
	      },
	      scales: {
	        yAxes: [{
	          // display: false,
	          gridLines: {
	            display: true,
	            lineWidth: '4px',
	            color: 'rgba(0, 0, 0, .2)',
	            zeroLineColor: 'transparent'
	          }, 
	          ticks: $.extend({
	            beginAtZero: true,
	            suggestedMax: 12
	          }, ticksStyle)
	        }],
	        xAxes: [{
	          display: true,
	          gridLines: {
	            display: false 
	          },
	          ticks: ticksStyle
	        }]
	      }
	    }
	  })
	}) 

</script>

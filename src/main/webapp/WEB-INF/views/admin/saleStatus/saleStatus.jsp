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
            <h1>스토어 매출 현황</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin">Home</a></li>
              <li class="breadcrumb-item active">스토어 매출 현황</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-6">
            <div class="card card-primary" style="display: none;">
              <div class="card-header">
                <h3 class="card-title">Area Chart</h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse">
                    <i class="fas fa-minus"></i>
                  </button>
                  <button type="button" class="btn btn-tool" data-card-widget="remove">
                    <i class="fas fa-times"></i>
                  </button>
                </div>
              </div>
              <div class="card-body">
                <div class="chart">
                  <canvas id="areaChart" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
                </div>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- DONUT CHART -->
            <div class="card card-danger">
              <div class="card-header">
                <h3 class="card-title">스토어 인기상품 점유율</h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse">
                    <i class="fas fa-minus"></i>
                  </button>
                  <button type="button" class="btn btn-tool" data-card-widget="remove">
                    <i class="fas fa-times"></i>
                  </button>
                </div>
              </div>
              <div class="card-body">
                <canvas id="donutChart" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
                
              </div>
              <!-- /.card-body -->
			  <c:forEach var="dto" items="${bestProduct}">
			      <p style="padding-left: 20px; font-weight:700;"><a href="${pageContext.request.contextPath}/product/article?category=${dto.pCateNum}&page=1&pNum=${dto.pNum}" style="color:black;">${dto.rank}위 상품번호 : ${dto.pNum}번 &nbsp; 누적판매량 : ${dto.sumQty}개 &nbsp; 제품명 : ${dto.pName}</a> </p>
		      </c:forEach> 
            </div>
            <!-- /.card -->

          </div>
          <!-- /.col (LEFT) -->
          <div class="col-md-6">

            <!-- STACKED BAR CHART -->
            <div class="card card-success">
              <div class="card-header">
                <h3 class="card-title">지난 주 배송조건 별 주문현황</h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse">
                    <i class="fas fa-minus"></i>
                  </button>
                  <button type="button" class="btn btn-tool" data-card-widget="remove">
                    <i class="fas fa-times"></i>
                  </button>
                </div>
              </div>
              <div class="card-body">
                <div class="chart">
                  <canvas id="stackedBarChart" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
                </div>
              </div> 
              <!-- /.card-body -->
              <div style="padding-left: 20px; font-weight:700; text-align:center; padding-bottom: 10px;">
              	지난 주 무료배송 상품 판매량 : ${freeLastWeek.freeDelivTot}건 &nbsp;&nbsp;&nbsp;&nbsp;
              	지난 주 일반배송 상품 판매량 : ${normalLastWeek.normalDelivTot}건 <br><br>
              	지난 주 
              	<c:choose>
              		<c:when test="${freeLastWeek.freeDelivTot > normalLastWeek.normalDelivTot}">
              			무료배송 상품이 일반배송 상품에 비해 ${freeLastWeek.freeDelivTot - normalLastWeek.normalDelivTot}건 추가 주문되었습니다.
              		</c:when>
              		<c:otherwise>
              			<c:choose>
              				<c:when test="${freeLastWeek.freeDelivTot < normalLastWeek.normalDelivTot}">
              					일반배송 상품이 무료배송 상품에 비해 ${normalLastWeek.normalDelivTot - freeLastWeek.freeDelivTot}건 추가 주문되었습니다.
              				</c:when>
              				<c:otherwise>
              					무료배송 상품과 일반배송 상품의 판매량은 동일합니다.
              				</c:otherwise>
              			</c:choose>
              		</c:otherwise>
              	</c:choose>
              </div>
            </div>
            <!-- /.card -->

          </div>
          <!-- /.col (RIGHT) -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  

  
<script type="text/javascript">

$(function () {
	
    //--------------
    //- AREA CHART -
    //--------------

    // Get context with jQuery - using jQuery's .get() method.
    var areaChartCanvas = $('#areaChart').get(0).getContext('2d')

    var areaChartData = {
      labels  : ['월', '화', '수', '목', '금', '토', '일'],
      datasets: [
        {
          label               : '무료배송 상품',
          backgroundColor     : 'rgba(60,141,188,0.9)',
          borderColor         : 'rgba(60,141,188,0.8)',
          pointRadius          : false,
          pointColor          : '#3b8bba',
          pointStrokeColor    : 'rgba(60,141,188,1)',
          pointHighlightFill  : '#fff',
          pointHighlightStroke: 'rgba(60,141,188,1)',
          data                : [${freeLastWeek.mon}, ${freeLastWeek.tue}, ${freeLastWeek.wed}, ${freeLastWeek.thu}, ${freeLastWeek.fri}, ${freeLastWeek.sat}, ${freeLastWeek.sun}]
        }, 
        {
          label               : '일반 상품',
          backgroundColor     : 'rgba(210, 214, 222, 1)',
          borderColor         : 'rgba(210, 214, 222, 1)',
          pointRadius         : false,
          pointColor          : 'rgba(210, 214, 222, 1)',
          pointStrokeColor    : '#c1c7d1',
          pointHighlightFill  : '#fff',
          pointHighlightStroke: 'rgba(220,220,220,1)',
          data                : [${normalLastWeek.mon}, ${normalLastWeek.tue}, ${normalLastWeek.wed}, ${normalLastWeek.thu}, ${normalLastWeek.fri}, ${normalLastWeek.sat}, ${normalLastWeek.sun}]
        },
      ]
    }

    var areaChartOptions = {
      maintainAspectRatio : false,
      responsive : true,
      legend: {
        display: false
      },
      scales: {
        xAxes: [{
          gridLines : {
            display : false,
          }
        }],
        yAxes: [{
          gridLines : {
            display : false,
          }
        }]
      }
    }

    // This will get the first returned node in the jQuery collection.
    new Chart(areaChartCanvas, {
      type: 'line',
      data: areaChartData,
      options: areaChartOptions
    })
	
	//-------------
	//- DONUT CHART -
	//-------------
	// Get context with jQuery - using jQuery's .get() method.
	var donutChartCanvas = $('#donutChart').get(0).getContext('2d')
	var donutData        = {
	  labels: [
		  <c:forEach var="dto" items="${bestProduct}">
		      ${dto.pNum}, 
	      </c:forEach> 
	  ], 
	  datasets: [
	    {
	      data: [  
	    	 	<c:forEach var="dto" items="${bestProduct}">
			      	${dto.sumQty},
	      		</c:forEach> 
	    	  ],
	      backgroundColor : ['#f56954', '#00a65a', '#f39c12', '#00c0ef', '#3c8dbc', '#d2d6de'],
	    }
	  ]
	}
	var donutOptions     = {
	  maintainAspectRatio : false,
	  responsive : true,
	}
	//Create pie or douhnut chart
	// You can switch between pie and douhnut using the method below.
	new Chart(donutChartCanvas, {
	  type: 'doughnut',
	  data: donutData,
	  options: donutOptions
	})
	
	//---------------------
	//- STACKED BAR CHART -
	//---------------------
	var stackedBarChartCanvas = $('#stackedBarChart').get(0).getContext('2d')
	var stackedBarChartData = $.extend(true, {}, areaChartData)
	
	var stackedBarChartOptions = {
	  responsive              : true,
	  maintainAspectRatio     : false,
	  scales: {
	    xAxes: [{
	      stacked: true,
	    }],
	    yAxes: [{
	      stacked: true
	    }]
	  }
	}
	
	new Chart(stackedBarChartCanvas, {
	  type: 'bar',
	  data: stackedBarChartData,
	  options: stackedBarChartOptions
	})
});

</script>
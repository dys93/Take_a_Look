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
            <h1>펫시터 매출 현황</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin">Home</a></li>
              <li class="breadcrumb-item active">펫시터 매출 현황</li>
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

            <!-- PIE CHART -->
            <div class="card card-danger">
              <div class="card-header">
                <h3 class="card-title">인기 펫시터 현황</h3>

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
                <canvas id="pieChart" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
              </div>
              <!-- /.card-body -->
			  <c:forEach var="dto" items="${bestPetsit}">
			      <p style="padding-left: 50px; font-weight:700;"><a href="${pageContext.request.contextPath}/petsit/reservation?page=1&condition=all&petNum=${dto.petNum}" style="color:black;">${dto.rank}위 &nbsp; 펫시터ID : ${dto.mId}님 &nbsp; 누적예약수 : ${dto.count}건</a> </p>
		      </c:forEach> 
            </div>
            <!-- /.card -->

          </div>
          <!-- /.col (LEFT) -->
          <div class="col-md-6">

            <!-- BAR CHART -->
            <div class="card card-success">
              <div class="card-header">
                <h3 class="card-title">주간 일별 예약 현황</h3>

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
                  <canvas id="barChart" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
                </div>
              </div>
              <!-- /.card-body -->
              <div style="padding-left: 20px; font-weight:700; text-align:center; padding-bottom: 10px;">
              	지난 주 총 예약 수 : ${petsitLastWeek.pTotLastWeek}건 &nbsp;&nbsp;&nbsp;&nbsp;
              	이번 주 총 예약 수 : ${petsitThisWeek.pTotThisWeek}건 <br><br>
              	지난 주 대비 이번주 예약건은
              	<c:choose>
              		<c:when test="${petsitThisWeek.pTotThisWeek > petsitLastWeek.pTotLastWeek}">
              			${petsitThisWeek.pTotThisWeek - petsitLastWeek.pTotLastWeek}건 증가했습니다.
              		</c:when>
              		<c:otherwise>
              			<c:choose>
              				<c:when test="${petsitThisWeek.pTotThisWeek < petsitLastWeek.pTotLastWeek}">
              					${petsitLastWeek.pTotLastWeek - petsitThisWeek.pTotThisWeek}건 감소했습니다.
              				</c:when>
              				<c:otherwise>
              					지난 주와 동일합니다.
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
          label               : '이번 주',
          backgroundColor     : 'rgba(60,141,188,0.9)',
          borderColor         : 'rgba(60,141,188,0.8)',
          pointRadius          : false,
          pointColor          : '#3b8bba',
          pointStrokeColor    : 'rgba(60,141,188,1)',
          pointHighlightFill  : '#fff',
          pointHighlightStroke: 'rgba(60,141,188,1)',
          data                : [${petsitThisWeek.mon}, ${petsitThisWeek.tue}, ${petsitThisWeek.wed}, ${petsitThisWeek.thu}, ${petsitThisWeek.fri}, ${petsitThisWeek.sat}, ${petsitThisWeek.sun}]
        },
        {
          label               : '지난 주',
          backgroundColor     : 'rgba(210, 214, 222, 1)',
          borderColor         : 'rgba(210, 214, 222, 1)',
          pointRadius         : false,
          pointColor          : 'rgba(210, 214, 222, 1)',
          pointStrokeColor    : '#c1c7d1',
          pointHighlightFill  : '#fff',
          pointHighlightStroke: 'rgba(220,220,220,1)',
          data                : [${petsitLastWeek.mon}, ${petsitLastWeek.tue}, ${petsitLastWeek.wed}, ${petsitLastWeek.thu}, ${petsitLastWeek.fri}, ${petsitLastWeek.sat}, ${petsitLastWeek.sun}]
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
	//- BAR CHART -
	//-------------
	var barChartCanvas = $('#barChart').get(0).getContext('2d')
	var barChartData = $.extend(true, {}, areaChartData)
	var temp0 = areaChartData.datasets[0]
	var temp1 = areaChartData.datasets[1]
	barChartData.datasets[0] = temp1
	barChartData.datasets[1] = temp0
	
	var barChartOptions = {
	  responsive              : true,
	  maintainAspectRatio     : false,
	  datasetFill             : false
	}
	
	new Chart(barChartCanvas, {
	  type: 'bar',
	  data: barChartData,
	  options: barChartOptions
	})
	
	//-------------
	//- PIE CHART -
	//-------------
	// Get context with jQuery - using jQuery's .get() method.
	var pieChartCanvas = $('#pieChart').get(0).getContext('2d')
	var pieData        = {
	    labels: [
			<c:forEach var="dto" items="${bestPetsit}">
		      '${dto.mId}',
	      	</c:forEach>
	    ], 
	    datasets: [
	      {
	        data: [
	    	 	<c:forEach var="dto" items="${bestPetsit}">
		     	 	${dto.count},
	      		</c:forEach> 
	        	],
	        backgroundColor : ['#f56954', '#00a65a', '#f39c12', '#00c0ef', '#3c8dbc', '#d2d6de'],
	      }
	    ]
	  }
	
	var pieOptions     = {
	  maintainAspectRatio : false,
	  responsive : true,
	}
	//Create pie or douhnut chart
	// You can switch between pie and douhnut using the method below.
	new Chart(pieChartCanvas, {
	  type: 'pie',
	  data: pieData,
	  options: pieOptions
	})
});

</script>
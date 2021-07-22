<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-3d.js"></script>
<script type="text/javascript">

function ajaxFun(url, method, dataType, query, fn) {
	$.ajax({
		type:method,
		url:url,
		data:query,
		dataType:dataType,
		success:function(data){
			 fn(data);
			 //console.log(data);
			 var count=' &nbsp;&nbsp;<i class="fas fa-ambulance"></i> 오늘 구조된 동물 :'+data.response.body.items.item.length+'마리 &nbsp;&nbsp;';
			 $("#count").html(count);
			 
		},
		error:function(e) {
			console.log(e.responseText);
		}
	});
}

$(function(){
	var url="${pageContext.request.contextPath}/stat/stat";
	
	var now = new Date();
	var y = now.getFullYear();
	var m = now.getMonth()+1;
	if(m<10) m="0"+m;
	var d = now.getDate();
	if(d<0) d="0"+d;
	var date2=y+""+m+""+d;
	
	var query="date2="+date2;
	
	var fn = function(data){
		// console.log(data);
		
		printAnimal(data);
	}
	
	ajaxFun(url, "get", "json", query, fn);
	
	function printAnimal(data) {
		console.log(data);
	
		var p=0, ad=0, e=0, b=0, don=0, n=0, a=0;

		$.each(data.response.body.items.item, function(index, item) {
 			
			if(item.processState=="보호중") p++;
			else if(item.processState=="종료(입양)") ad++;
			else if(item.processState=="종료(반환)") e++;
			else if(item.processState=="종료(방사)") b++;
			else if(item.processState=="종료(기증)") don++;
			else if(item.processState=="종료(자연사)") n++;
			else if(item.processState=="종료(안락사)") a++;
		});
		
		var arr=[];
 		
		arr.push({name:"보호 중", y:p});
		arr.push({name:"입양", y:ad}); // y:ad==0?5:0
		arr.push({name:"반환", y:e});
		arr.push({name:"방사", y:b});
		arr.push({name:"기증", y:don});
		arr.push({name:"자연사", y:n});
		arr.push({name:"안락사", y:a});
		
		Highcharts.chart('dogCatcontainer', {
			colors: ['#ffa500', '#F4FA58', '#82FA58', '#58FA82', '#81F7F3', '#BCA9F5', '#FA5858'],
		    chart: {
		    	backgroundColor: '#FFFFFF',
		        plotBackgroundColor: '#FFFFFF',
		        plotBorderWidth: null,
		        plotShadow: false,
		        type: 'pie'
		    },
		    
		    title: {
		        text: '오늘의 유기동물 현황'
		    },
		    tooltip: {
		        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
		    },
		    accessibility: {
		        point: {
		            valueSuffix: '%'
		        }
		    },
		    plotOptions: {
		        pie: {
		            allowPointSelect: true,
		            cursor: 'pointer',
		            dataLabels: {
		                enabled: true,
		                format: '<b>{point.name}</b>: {point.percentage:.1f} %'
		            }
		        }
		    },
		    series: [{
		        name: '동물수',
		        colorByPoint: true,
		        data: arr
		    }]
		});		
		
		Highcharts.chart('Catdogcontainer', {
			colors: ['#ffa500', '#F4FA58', '#82FA58', '#58FA82', '#81F7F3', '#BCA9F5', '#FA5858'],
		    chart: {
		    	backgroundColor: '#FFFFFF',
		        plotBackgroundColor: '#FFFFFF',
		        plotBorderWidth: null,
		        plotShadow: false,
		        type: 'bar'
		    },
		    
		    title: {
		        text: '오늘의 유기동물 현황'
		    },
		    xAxis: {
		        categories: ['보호중', '입양', '반환', '방사', '기증', '자연사', '안락사'],
		    },
		    yAxis: {
		        min: 0,
		        title: {
		            text: '단위: 마리'
		        }
		    },
		    legend: {
		        reversed: true
		    },
		    plotOptions: {
		        series: {
		            stacking: 'normal'
		        }
		    },
		    series: [{
		        name: '마릿수', 
		        data: arr
		    } ]
		});
	}
});
</script>

<div class="home">
<div class="section window1">
	<div class="cover cover1">
			<div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
			  <ol class="carousel-indicators">
			    <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
			    <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
			    <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
			    <li data-target="#carouselExampleCaptions" data-slide-to="3"></li>
			  </ol>
			  <div class="carousel-inner">
			    <div class="carousel-item active">
			      <img class="imghome" src="${pageContext.request.contextPath}/resources/images/home/home_ani1.jpg" class="d-block w-100" alt="...">
			      <div class="carousel-caption d-none d-md-block">
			        <h2 class="carousel-title">Adopt Animals Adopt Family</h2>
			        <p class="carousel-content">유기동물들은 여러분들의 도움이 필요해요</p>
			      </div>
			    </div>
			    <div class="carousel-item">
			      <img class="imghome" src="${pageContext.request.contextPath}/resources/images/home/home_ani2.jpg" class="d-block w-100" alt="...">
			      <div class="carousel-caption d-none d-md-block">
			        <a href="${pageContext.request.contextPath}/stat/stat"><button type="button" class="btn btn-outline-light btn-main">Statistics</button></a>
			        <p class="carousel-content">여러분의 후원금은 유기동물의 처우개선을 위해 사용됩니다</p>
			      </div>
			    </div>
			    <div class="carousel-item">
			      <img class="imghome" src="${pageContext.request.contextPath}/resources/images/home/home_ani3.png" class="d-block w-100" alt="...">
			      <div class="carousel-caption d-none d-md-block">
			        <a href="${pageContext.request.contextPath}/petsit/list"><button type="button" class="btn btn-outline-light btn-main">Pet Sitter</button></a>
			        <p class="carousel-content">검증된 펫시터들을 만나보세요</p>
			      </div>
			    </div>
			    <div class="carousel-item">
			      <img class="imghome" src="${pageContext.request.contextPath}/resources/images/home/home_ani4.jpg" class="d-block w-100" alt="...">
			      <div class="carousel-caption d-none d-md-block">
			        <a href="${pageContext.request.contextPath}/product/main"><button type="button" class="btn btn-outline-light btn-main">Store</button></a>
			        <p class="carousel-content">스토어 수익금의 50%는 유기동물 보호단체에 기부됩니다</p>
			      </div>
			    </div>
			  </div>
			  <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="sr-only">Previous</span>
			  </a>
			  <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="sr-only">Next</span>
			  </a>
			</div>
	</div>
</div>

<div class="section window2">
	<div class="cover cover2">
		<h2 class="home-head donation-head">
			Take A Look !
		</h2> 
		<div class="container maindonation" style=" text-align: center;">
			<div>
				<img class="donaimg" style="height: 60%; margin-top: 100px; margin-bottom:20px; float: left;" src="${pageContext.request.contextPath}/resources/images/home/dona_ani.jpg" class="card-img-top" alt="...">
			</div>
			<div>
				<div style="margin-top: 100px; width: 40%; float: right; color: #4C4C4C; font-size: 25px;">
					안녕하세요 <br>
					펫시터 예약 & 반려동물 스토어 <br>
					<span style="font-size: 35px">Take A Look</span> 입니다 <br><br>
					매년 10만마리 이상의 유기동물이<br>
					보호소로 구조되고 있습니다<br>
					안타깝게도 이 중 절반에 가까운 동물들이<br>
					안락사되거나 자연사하고 있습니다
				</div>
				<div style="width: 100%; margin-top:10px; float:left; color: white; font-size: 31px;">
					Take A Look 스토어 수익금의 50%는 유기동물의 처우개선을 위해 사용됩니다
				</div>
			</div>
		</div>
	</div>
</div>
	
<div class="section window3">
	<div class="cover cover2">
		<h2 class="home-head static-head">
			유기동물 통계
		</h2> 
		<div class="container mainstatic">
			<div class="mainchart" id="dogCatcontainer" style="margin-top: 80px">
			</div>
			<div class="mainchart" id="Catdogcontainer" style="margin-top: 80px">
			</div>
		</div>
	</div>
</div>

<div class="section window4">
	<div class="cover cover3">
		<h2 class="home-head petsit-head">
			검증된 펫시터들을 만나보세요
		</h2> 
		<div class="container mainpetsit">
			<div class="store-content">
				<h2>가장 인기있는 펫시터</h2>
			</div>
			<c:forEach var="dto" items="${bestPetsit}">
				<div class="card">
					<a href="${pageContext.request.contextPath}/petsit/reservation?page=1&petNum=${dto.petNum}"><img src="${pageContext.request.contextPath}/upload/petsit/${dto.petImg}" class="card-img-top"></a>
			  		<div class="card-body">
			    		<h5 class="card-title">${dto.mNick} 님</h5>
			    		<p class="card-text">${dto.petTitle}</p>
			  		</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>

<div class="section window5">
	<div class="cover cover3">
		<h2 class="home-head store-head">
			유기동물과 함께하는 떼껄룩 스토어
		</h2> 
		<div class="container mainstore">
			<div class="store-content">
				<h2>인기상품을 만나보세요</h2>
			</div>
			
			<c:forEach var="dto" items="${bestStore}">
				<div class="card">
					<a href="${pageContext.request.contextPath}/product/article?category=${dto.pCateNum}&page=1&pNum=${dto.pNum}"><img src="${pageContext.request.contextPath}/uploads/product/${dto.pImgName}" class="card-img-top"></a>
			  		<div class="card-body">
			  			<fmt:parseNumber value="${(dto.pPrice + dto.pDetailPrice)*(1-(dto.pDiscountRate/100))}" var="price" type="number" integerOnly="true"/>
			    		<h5 class="card-title"> ${price} 원</h5>
			    		<p class="card-text">${dto.pName}</p>
			  		</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
</div>
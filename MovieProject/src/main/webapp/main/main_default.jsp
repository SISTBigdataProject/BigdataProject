<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.1/css/all.css" integrity="sha384-O8whS3fhG2OnA5Kas0Y9l3cfpmYjapjI0E4theH4iuMD+pLhbf6JI0jIMfYcK3yZ" crossorigin="anonymous">
<title>영화 연구소</title>
<style>

body {
  font-family: Arial;
  padding: 25px;
  background-color: #f5f5f5;
  color: #808080;
  	text-align: center;	
}

/*-=-=-=-=-=-=-=-=-=-=-=- */
/* Column Grids */
/*-=-=-=-=-=-=-=-=-=-=-=- */

.col_half { width: 49%; }
.col_third { width: 32%; }. 
.col_fourth { width: 23.5%; }
.col_fifth { width: 18.4%; }
.col_sixth { width: 15%; }
.col_three_fourth { width: 74.5%;}
.col_twothird{ width: 66%;}
.col_half,
.col_third,
.col_twothird,
.col_fourth,
.col_three_fourth,
.col_fifth{
	position: relative;
	display:inline;
	display: inline-block;
	float: left;
	margin-right: 2%;
	margin-bottom: 20px;
}
.end { margin-right: 0 !important; }
/* Column Grids End */

.wrapper { width: 980px; margin: 30px auto; position: relative;}
.counter { background-color: #ffffff; padding: 20px 0; border-radius: 5px;}
.count-title { font-size: 40px; font-weight: normal;  margin-top: 10px; margin-bottom: 0; text-align: center; }
.count-text { font-size: 13px; font-weight: normal;  margin-top: 10px; margin-bottom: 0; text-align: center; }
.fa-2x { margin: 0 auto; float: none; display: table; color: #4ad1e5; }

</style>
</head>
<body>
	<!-- carousel 시작 -->
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
			<li data-target="#myCarousel" data-slide-to="3"></li>
			<li data-target="#myCarousel" data-slide-to="4"></li>
		</ol>
		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<img src="../img/harry.jpg" alt="New York">
				<div class="carousel-caption">
					<h3>New York</h3>
					<p>The atmosphere in New York is lorem ipsum.</p>
				</div>
			</div>
			<div class="item">
				<img src="../img/chewie.jpg" alt="Chicago">
				<div class="carousel-caption">
					<h3>Chicago</h3>
					<p>Thank you, Chicago - A night we won't forget.</p>
				</div>
			</div>
			<div class="item">
				<img src="../img/coco.jpg" alt="Chicago">
				<div class="carousel-caption">
					<h3>Chicago</h3>
					<p>Thank you, Chicago - A night we won't forget.</p>
				</div>
			</div>
			<div class="item">
				<img src="../img/wakanda.jpeg" alt="Chicago">
				<div class="carousel-caption">
					<h3>Chicago</h3>
					<p>Thank you, Chicago - A night we won't forget.</p>
				</div>
			</div>
			<div class="item">
				<img src="../img/inside-out.jpg" alt="Los Angeles" width="1200">
				<div class="carousel-caption">
					<h3>LA</h3>
					<p>Even though the traffic was a mess, we had the best time
						playing at Venice Beach!</p>
				</div>
			</div>
		</div>
		<!-- Left and right controls -->
		<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev"> 
			<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> 
			<span class="sr-only">Previous</span>
		</a> 
		<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next"> 
			<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
	
	<!-- Carousel 자동 플레이 스크립트 -->
	<script>
		$('.carousel').carousel({
			  interval: 2500
		})
	</script>
	<!-- carousel 끝-->
		
	<!-- Container -->
	<div class="container text-center">
		<h3>영화 연구소</h3>
		<p>
			<em>We love movie!</em>
		</p>
		<p>
			우리는 영화 데이터를 제공하고, 분석하고, 네이버 댓글 및 평점 데이터를 jsoup으로 훔쳐서 가공 후 사용하는 사이트를 계획했고,<br>
			진행 중이고, 이제 할 일은 뭐가 남았냐면 보자보자 분석 페이지 디자인 (그래프 골라서 활용 방안 논의해야 함), 박스오피스 정보,<br>
			뭐 딱 그 정도 인듯. 디자인도 거의 다 끝났고, 취직만 하면 되겠습니다. 
			우리는 영화 데이터를 제공하고, 분석하고, 네이버 댓글 및 평점 데이터를 jsoup으로 훔쳐서 가공 후 사용하는 사이트를 계획했고,
			진행 중이고, 이제 할 일은 뭐가 남았냐면 보자보자 분석 페이지 디자인 (그래프 골라서 활용 방안 논의해야 함), 박스오피스 정보,<br>
			뭐 딱 그 정도 인듯. 디자인도 거의 다 끝났고, 취직만 하면 되겠습니다. <br>
		</p>
		<br>

		<div class="row text-center">
			<div class="col-sm-4">
				<div class="counter">
			      <i class="fas fa-film fa-2x"></i>
			      <h2 class="timer count-title count-number" data-to="${mdcount }" data-speed="800"></h2>
			       <p class="count-text ">무비 디테일 카운트</p>
			    </div>	
			</div>
			<div class="col-sm-4">
				<div class="counter">
			       <i class="fas fa-star fa-2x"></i>
			      <h2 class="timer count-title count-number" data-to="${mgcount }" data-speed="800"></h2>
			       <p class="count-text ">별점 카운트</p>
			    </div>					
			</div>
			<div class="col-sm-4">
				<div class="counter">
			      <i class="fas fa-keyboard fa-2x"></i>
			      <h2 class="timer count-title count-number" data-to="${mrcount }" data-speed="800"></h2>
			       <p class="count-text ">리뷰 카운트</p>
			    </div>			
			</div>
		</div>
	</div>
	<script>
	(function ($) {
		$.fn.countTo = function (options) {
			options = options || {};
			
			return $(this).each(function () {
				// set options for current element
				var settings = $.extend({}, $.fn.countTo.defaults, {
					from:            $(this).data('from'),
					to:              $(this).data('to'),
					speed:           $(this).data('speed'),
					refreshInterval: $(this).data('refresh-interval'),
					decimals:        $(this).data('decimals')
				}, options);
				
				// how many times to update the value, and how much to increment the value on each update
				var loops = Math.ceil(settings.speed / settings.refreshInterval),
					increment = (settings.to - settings.from) / loops;
				
				// references & variables that will change with each update
				var self = this,
					$self = $(this),
					loopCount = 0,
					value = settings.from,
					data = $self.data('countTo') || {};
				
				$self.data('countTo', data);
				
				// if an existing interval can be found, clear it first
				if (data.interval) {
					clearInterval(data.interval);
				}
				data.interval = setInterval(updateTimer, settings.refreshInterval);
				
				// initialize the element with the starting value
				render(value);
				
				function updateTimer() {
					value += increment;
					loopCount++;
					
					render(value);
					
					if (typeof(settings.onUpdate) == 'function') {
						settings.onUpdate.call(self, value);
					}
					
					if (loopCount >= loops) {
						// remove the interval
						$self.removeData('countTo');
						clearInterval(data.interval);
						value = settings.to;
						
						if (typeof(settings.onComplete) == 'function') {
							settings.onComplete.call(self, value);
						}
					}
				}
				
				function render(value) {
					var formattedValue = settings.formatter.call(self, value, settings);
					$self.html(formattedValue);
				}
			});
		};
		
		$.fn.countTo.defaults = {
			from: 0,               // the number the element should start at
			to: 0,                 // the number the element should end at
			speed: 1000,           // how long it should take to count between the target numbers
			refreshInterval: 100,  // how often the element should be updated
			decimals: 0,           // the number of decimal places to show
			formatter: formatter,  // handler for formatting the value before rendering
			onUpdate: null,        // callback method for every time the element is updated
			onComplete: null       // callback method for when the element finishes updating
		};
		
		function formatter(value, settings) {
			return value.toFixed(settings.decimals);
		}
	}(jQuery));

	jQuery(function ($) {
	  // custom formatting example
	  $('.count-number').data('countToOptions', {
		formatter: function (value, options) {
		  return value.toFixed(options.decimals).replace(/\B(?=(?:\d{3})+(?!\d))/g, ',');
		}
	  });
	  
	  // start all the timers
	  $('.timer').each(count);  
	  
	  function count(options) {
		var $this = $(this);
		options = $.extend({}, options || {}, $this.data('countToOptions') || {});
		$this.countTo(options);
	  }
	});
	</script>
	<!-- 계절별 네이버 영화 댓글 분석 페이지 이동 --> 
	<div class="container-fluid bg-1">
		<div class="row" style="padding-top: 25px; padding-left: 85px;">
			<h3>계절별 네이버 영화 댓글 분석 페이지</h3>
			<p> 네이버 평점 순위 1위에서 2000위까지의 영화 댓글, 평점, 리뷰 데이터를 작성 월 기준으로 분석하여, <br> 
				연관어, 감성, 언급량 추이 등을 그래프로 보여주는 페이지입니다.</p>
		</div>
			<div class="cont s--inactive">
			<!-- cont inner start -->
			<div class="cont__inner">
				<!-- 봄 -->
				<div class="el">
					<div class="el__overflow">
						<div class="el__inner">
							<div class="el__bg"></div>
							<div class="el__preview-cont">
								<h2 class="el__heading">첫번째 계절</h2>
							</div>
							<div class="el__content">
								<div class="el__text">3월, 4월, 5월에 작성된 네이버 영화 리뷰 데이터 분석</div>
								<div class="el__close-btn"></div>
							</div>
						</div>
					</div>
					<div class="el__index">
						<div class="el__index-back">봄</div>
						<div class="el__index-front">
							<div class="el__index-overlay" data-index="봄">봄</div>
						</div>
					</div>
				</div>
				<!-- 여름 -->
				<div class="el">
					<div class="el__overflow">
						<div class="el__inner">
							<div class="el__bg"></div>
							<div class="el__preview-cont">
								<h2 class="el__heading">두번째 계절</h2>
							</div>
							<div class="el__content">
								<div class="el__text">6월, 7월, 8월에 작성된 네이버 영화 리뷰 데이터 분석</div>
								<div class="el__close-btn"></div>
							</div>
						</div>
					</div>
					<div class="el__index">
						<div class="el__index-back">여름</div>
						<div class="el__index-front">
							<div class="el__index-overlay" data-index="여름">여름</div>
						</div>
					</div>
				</div>
				<!-- 가을 -->
				<div class="el">
					<div class="el__overflow">
						<div class="el__inner">
							<div class="el__bg"></div>
							<div class="el__preview-cont">
								<h2 class="el__heading">세번째 계절</h2>
							</div>
							<div class="el__content">
								<div class="el__text">9월, 10월, 11월에 작성된 네이버 영화 리뷰 데이터 분석</div>
								<div class="el__close-btn"></div>
							</div>
						</div>
					</div>
					<div class="el__index">
						<div class="el__index-back">가을</div>
						<div class="el__index-front">
							<div class="el__index-overlay" data-index="가을">가을</div>
						</div>
					</div>
				</div>
				<!-- 겨울 -->
				<div class="el">
					<div class="el__overflow">
						<div class="el__inner">
							<div class="el__bg"></div>
							<div class="el__preview-cont">
								<h2 class="el__heading">네번째 계절</h2>
							</div>
							<div class="el__content">
								<div class="el__text">12월, 1월, 2월에 작성된 네이버 영화 리뷰 데이터 분석</div>
								<div class="el__close-btn"></div>
							</div>
						</div>
					</div>
					<div class="el__index">
						<div class="el__index-back">겨울</div>
						<div class="el__index-front">
							<div class="el__index-overlay" data-index="겨울">겨울</div>
						</div>
					</div>
				</div>
		</div>
	</div>
	<script src="js/index.js"></script>
	</div>
	<!-- 계절별 네이버 영화 댓글 분석 페이지 이동 섹션 끝 --> 

	<!-- 영화 예매 순위  -->
	<div id="band" class="container-fluid" style="margin:30px 30px;">
		<div class="row text-center" style="padding-top: 25px; padding-bottom:20px;">
			<h3>박스오피스</h3>
			<p> 네이버 평점 순위 1위에서 2000위까지의 영화 댓글, 평점, 리뷰 데이터를 작성 월 기준으로 분석하여, <br> 
				연관어, 감성, 언급량 추이 등을 그래프로 보여주는 페이지입니다.</p>
		</div>
		<div class="row">	
		<c:forEach var="vo" items="${rlist }" begin="0" end="11" varStatus="status">			
			<c:if test="${status.index%6 eq '0' }"><div class="row"></c:if>
			<div class="col-sm-2">
				<div class="mcard">					     
					        <a class="mcard-link" href="movie_rank.do?code=${vo.code }"></a>			  
					  <img src="${vo.poster }" alt="Avatar" style="width:100%">
					  <div class="mcardcontainer">
					    <span class="badge badge-success">${status.index+1}위</span> 
					    <p id="title"><b>${vo.title }</b> 
					    <p><b>예매율</b> ${vo.rsvRate }%<br/>
				  		<p><b>감독</b> ${vo.director }<br/>
				 		<p><b>출연</b> ${vo.actor }<br/></p>
					  </div>
				</div>
			</div>
			<c:if test="${status.index%6 eq '5'}"></div></c:if>
			</c:forEach>
		</div>
	</div>
	
	
	<!-- 영화 뉴스 / 칼럼 -->
	<div id="tour" class="container-fluid bg-1">
		<div class="container">
			<div class="row">
			    } // End if
			  });
			<h3 class="text-center">영화 뉴스</h3>
			<h4 class="text-center">by 맥스무비</h4>
			</div>
			<c:forEach var="vo" items="${nlist }" begin="0" end="7" varStatus="status">			
			<c:if test="${status.index%4 eq '0' }"><div class="row"></c:if>
				<div class="col-sm-3">
					<div class="card">
					 <a class="card-link" href="${vo.newslink}" target="_blank"></a>
					  <img src="${vo.newsimg }" alt="Avatar" style="width:100%">
					  <div class="cardcontainer">
					    <span class="badge badge-pill badge-danger">뉴스</span> 
					    <p id="title"><b>${vo.newstit }</b></p> 
					    <p>${vo.cont }</p> 
					  </div>
					</div>
				</div>
				<c:if test="${status.index%4 eq '3'}"></div></c:if>
			</c:forEach>
			<hr>
			<div class="row">
			<h3 class="text-center">영화 칼럼</h3>
			<h4 class="text-center">by 씨네21</h4>
			</div>
			<c:forEach var="vo" items="${clist }" begin="0" end="7" varStatus="status">			
			<c:if test="${status.index%4 eq '0' }"><div class="row"></c:if>
				<div class="col-sm-3">
					<div class="card">
					 <a class="card-link" href="${vo.newslink}" target="_blank"></a>
					  <img src="${vo.newsimg }" alt="Avatar" style="width:100%">
					  <div class="cardcontainer">
					    <span class="badge badge-pill badge-danger">칼럼</span> 
					    <p id="title"><b>${vo.newstit }</b></p> 
					    <p>${vo.cont }</p> 
					  </div>
					</div>
				</div>
				<c:if test="${status.index%4 eq '3'}"></div></c:if>
			</c:forEach>
		</div>
	</div>
	
	<!-- 개봉작 정보 -->
	<div id="contact" class="container-fluid bg-3 text-center">		
		<c:forEach var="vo" items="${flist}" begin="0" end="11"	varStatus="status">
			<c:if test="${status.index%6 eq '0' }"><div class="row no-gutter"></c:if>
				<div class="col-sm-2">
					<a href="movie_detail.do?code=${vo.code }">
						<img src="${vo.poster }" style="width: 100%; height: 510px; object-fit: cover;" alt="Image">
					</a>
				</div>
			<c:if test="${status.index%6 eq '5'}"></div></c:if>
		</c:forEach>
	</div>

		<script>
			$(document).ready(function(){
				
			  // Initialize Tooltip
			  $('[data-toggle="tooltip"]').tooltip(); 
			  
			  // Add smooth scrolling to all links in navbar + footer link
			  $(".navbar a, footer a[href='#myPage']").on('click', function(event) {
			
			    // Make sure this.hash has a value before overriding default behavior
			    if (this.hash !== "") {
			
			      // Prevent default anchor click behavior
			      event.preventDefault();
			
			      // Store hash
			      var hash = this.hash;
			
			      // Using jQuery's animate() method to add smooth page scroll
			      // The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
			      $('html, body').animate({
			        scrollTop: $(hash).offset().top
			      }, 900, function(){
			   
			        // Add hash (#) to URL when done scrolling (default click behavior)
			        window.location.hash = hash;
			      });
			    } // End if
			  });
			})
			
			function myFunction(elmnt,vo) {
				elmnt = clr;
			}
		</script>

</body>
</html>
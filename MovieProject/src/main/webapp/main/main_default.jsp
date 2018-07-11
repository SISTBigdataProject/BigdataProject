<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>영화 연구소</title>
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
			우리는 영화 데이터를 제공하고, 분석하고, 네이버 댓글 및 평점 데이터를 jsoup으로 훔쳐서 가공 후 사용하는 사이트를 계획했고,
			진행 중이고, 이제 할 일은 뭐가 남았냐면 보자보자 분석 페이지 디자인 (그래프 골라서 활용 방안 논의해야 함), 박스오피스 정보,
			뭐 딱 그 정도 인듯. 디자인도 거의 다 끝났고, 취직만 하면 되겠습니다. 
			우리는 영화 데이터를 제공하고, 분석하고, 네이버 댓글 및 평점 데이터를 jsoup으로 훔쳐서 가공 후 사용하는 사이트를 계획했고,
			진행 중이고, 이제 할 일은 뭐가 남았냐면 보자보자 분석 페이지 디자인 (그래프 골라서 활용 방안 논의해야 함), 박스오피스 정보,
			뭐 딱 그 정도 인듯. 디자인도 거의 다 끝났고, 취직만 하면 되겠습니다. 
			우리는 영화 데이터를 제공하고, 분석하고, 네이버 댓글 및 평점 데이터를 jsoup으로 훔쳐서 가공 후 사용하는 사이트를 계획했고,
			진행 중이고, 이제 할 일은 뭐가 남았냐면 보자보자 분석 페이지 디자인 (그래프 골라서 활용 방안 논의해야 함), 박스오피스 정보,
			뭐 딱 그 정도 인듯. 디자인도 거의 다 끝났고, 취직만 하면 되겠습니다. 
		</p>
		<br>
		<div class="row">
			<div class="col-sm-4">
				<p class="text-center">
					<strong>Name</strong>
				</p>
				<br> <a href="#demo" data-toggle="collapse"> <img
					src="bandmember.jpg" class="img-circle person" alt="Random Name"
					width="255" height="255">
				</a>
				<div id="demo" class="collapse">
					<p>Guitarist and Lead Vocalist</p>
					<p>Loves long walks on the beach</p>
					<p>Member since 1988</p>
				</div>
			</div>
			<div class="col-sm-4">
				<p class="text-center">
					<strong>Name</strong>
				</p>
				<br> 
					<a href="#demo2" data-toggle="collapse"> 
					<img src="bandmember.jpg" class="img-circle person" alt="Random Name" width="255" height="255">
				</a>
				<div id="demo2" class="collapse">
					<p>Drummer</p>
					<p>Loves drummin'</p>
					<p>Member since 1988</p>
				</div>
			</div>
			<div class="col-sm-4">
				<p class="text-center">
					<strong>Name</strong>
				</p>
				<br> 
					<a href="#demo3" data-toggle="collapse"> 
					<img src="bandmember.jpg" class="img-circle person" alt="Random Name" width="255" height="255">
				</a>
				<div id="demo3" class="collapse">
					<p>Bass player</p>
					<p>Loves math</p>
					<p>Member since 2005</p>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 계절별 네이버 영화 댓글 분석 페이지 이동 --> 
	<div id="band" class="container-fluid bg-1">
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

	<!-- 장르별  -->
	<div class="container">
		<div class="row">
			<!-- <div class="col-sm-2">
				<a data-toggle="modal" data-target="#myModal"><img src="../img/movie_image.jpg" class="img-responsive" style="width: 100%" alt="Image"></a>
				<button class="btn" data-toggle="modal" data-target="#myModal">기사 보기</button>
			</div>	
		<div style="height:50px;"></div>-->
		
		<div class="col-sm-2">
			<div>
			<h2>예매율 1위 51.8%</h2>
			<a data-toggle="modal" data-target="#myModal"><img src="https://movie-phinf.pstatic.net/20180530_170/1527645793223uhWgz_JPEG/movie_image.jpg" class="img-responsive" style="width: 100%" alt="Image"></a>
			<h3>평점 8.75</h3>
			</div>
			<div>
			 <ul class="list-group list-group-flush">
			  <li class="list-group-item"><em>개요</em></li>
			  <li class="list-group-item"><em>감독</em></li>
			  <li class="list-group-item"><em>출연</em></li>
			  <li class="list-group-item"><em>등급</em></li>
			</ul> 
			</div>
		</div>
	</div>
	
	<!-- 영화 뉴스 / 칼럼 -->
	<div id="tour" class="container-fluid bg-1">
		<div class="container">
			<div class="row">
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
	
	<!-- Modal 영화 디테일! -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog modal-lg">
			Modal content
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">×</button>
					<h4>
						<span class="glyphicon glyphicon-film"></span>영화 상세 정보<span class="glyphicon glyphicon-film"></span>
					</h4>
				</div>
				<div class="modal-body">
					<div class="mcontainer">
						<div class="row">
							<div class="movie-card">
								<div class="moviecontainer">
									<a href="#">
									<img src="../img/movie_image.jpg" alt="cover" class="cover"/></a>
									<div class="hero" style="background: url(https://movie-phinf.pstatic.net/20180601_297/15278193380668Anie_JPEG/movie_image.jpg) 0 0 no-repeat;">
										<div class="details">						
											<div class="title1">스탠바이, 웬디<span>[국내] 12세 관람가</span>
											</div>
											<div class="title2"></div>
											<fieldset class="rating">
												<input type="radio" id="star5" name="rating" value="5" />
												<label class="full" for="star5" title="최고에요! - 5 stars"></label> 
												
												<input type="radio" id="star4half" name="rating" value="4 and a half" />
												<label class="half" for="star4half" title="훌륭해요 - 4.5 stars"></label>
												
												<input type="radio" id="star4" name="rating" value="4" checked />
												<label class="full" for="star4" title="재미있어요 - 4 stars"></label>
												
												<input type="radio" id="star3half" name="rating" value="3 and a half" />
												<label class="half" for="star3half" title="볼만해요 - 3.5 stars"></label> 
												
												<input type="radio" id="star3" name="rating" value="3" />
												<label class="full" for="star3" title="보통이에요 - 3 stars"></label> 
												
												<input type="radio" id="star2half" name="rating" value="2 and a half" />
												<label class="half" for="star2half" title="부족해요 - 2.5 stars"></label>
												
												<input type="radio" id="star2" name="rating" value="2" />
												<label class="full" for="star2" title="별로에요 - 2 stars"></label> 
												
												<input type="radio" id="star1half" name="rating" value="1 and a half" />
												<label class="half" for="star1half" title="재미없어요 - 1.5 stars"></label> 
												
												<input type="radio" id="star1" name="rating" value="1" />
												<label class="full" for="star1" title="싫어요 - 1 star"></label>
												
												<input type="radio" id="starhalf" name="rating" value="half" />
												<label class="half" for="starhalf" title="최악이에요! - 0.5 stars"></label>
											</fieldset>
										</div>
									</div>
									<div class="description">
										<div class="column1">
											<span class="tag">액션</span> 
											<span class="tag">모험</span>
											<span class="tag">SF</span>
										</div>
										<div class="column2">
											<p>
												<em>우리처럼 똑같은 일상을 반복하는 웬디.</em>									
													아침에 샤워를 하고 아침 먹고 아르바이트를 하고 동료들과 휴식시간을 갖고
													집에 와서 TV를 보고 저녁 먹고 글을 쓰다가 자는 일상.
													그런 웬디가 일탈을 한다!? 웬디 왜 그러는거야!
													나에겐 목표와 꿈이 있으니까요!
													스타 트렉 시나리오 공모전에 꼭 참가해야 해요
													웬디의 일탈 시작!
													나아갈 때 비로소 다가오는 것들이 있다!
													웬디가 처음 접하는 모든 것들!
													웬디를 따라 LA여행 모두 함께 해보실래요
													여러분들 웬디의 일탈로 들어오세요~♥ 행복한 소확행을 맛보게 될거예요
											</p>
											<div class="avatars">
												<a href="#" data-tooltip="크리스 프랫" data-placement="top"> 
													<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/195612/hobbit_avatar1.png" alt="avatar1" />
												</a> 
												<a href="#" data-tooltip="브라이스 달라스 하워스" data-placement="top"> 
													<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/195612/hobbit_avatar2.png" alt="avatar2" />
												</a> 
												<a href="#" data-tooltip="제프 골드브럼" data-placement="top"> 
													<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/195612/hobbit_avatar3.png" alt="avatar3" />
												</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>	
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal">
						<span class="glyphicon glyphicon-remove"></span> Cancel
					</button>
					<p>
						Need <a href="#">help?</a>
					</p>
				</div>
			</div>
		</div>
	</div>

	<!-- 개봉작 정보 -->
	<div id="contact" class="container-fluid bg-3 text-center">
	
<%-- 	flist
		<c:forEach var="vo" items="${nlist }" begin="0" end="7" varStatus="status">			
			<c:if test="${status.index%4 eq '0' }"><div class="row"></c:if> --%>
			
	<c:forEach var="vo" items="${flist}" begin="0" end="11"	varStatus="status">
		<c:if test="${status.index%6 eq '0' }"><div class="row no-gutter"></c:if>
			<div class="col-sm-2">
				<img src="${vo.poster }" class="img-responsive" style="width: 100%" alt="Image">
			</div>
		<c:if test="${status.index%4 eq '5'}"></div></c:if>
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
	</script>

</body>
</html>
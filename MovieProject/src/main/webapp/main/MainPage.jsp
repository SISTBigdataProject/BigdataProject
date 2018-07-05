<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>영화 연구소</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- CSS -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- JS  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
<!-- Search bar -->

<!-- Font -->
<link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">

<style>
/* 테스트용 css: 테스트 후 적용 완료 시 style.css 파일로 옮길 것 */

/* 영화 디테일 카드 CSS */
*,
*:before,
*:after {
  box-sizing: border-box;
}

a {
  text-decoration: none;
  color: #5c7fb8;
}

a:hover {
  text-decoration: underline;
}

.movie-card {
  font: 14px/22px "Lato", Arial, sans-serif;
  color: #a9a8a3;
  padding: 40px 0;
}

.mcontainer {
  margin: 0 auto;
  width: 780px;
  height: 700px;
  background: #f0f0ed;
  border-radius: 5px;
  position: relative;
  padding-top: 0;
}

.hero {
  height: 342px;
  margin: 0;
  position: relative;
  overflow: hidden;
  z-index: 1;
  border-top-left-radius: 5px;
  border-top-right-radius: 5px;
}

.hero:before {
  content: "";
  width: 100%;
  height: 100%;
  position: absolute;
  overflow: hidden;
  top: 0;
  left: 0;
  background: red;
  background: url(https://movie-phinf.pstatic.net/20180430_142/1525049443019hJ2Lr_JPEG/movie_image.jpg?type=m427_320_2) 0 0 no-repeat;
  filter: blur(1px);
  background-size: 100%;
  z-index: -1;
  transform: skewY(-2.2deg);
  transform-origin: 0 0;
  -webkit-backface-visibility: hidden;
}

.cover {
  position: absolute;
  top: 160px;
  left: 40px;
  z-index: 2;
  width:200px;
}

.details {
  padding: 190px 0 0 280px;
 }
 
 
.details .title1 {
    color: white;
    font-size: 44px;
    margin-bottom: 13px;
    position: relative;
}

.details span {
      position: absolute;
      top: 3px;
      margin-left: 12px;
      background: #c4af3d;
      border-radius: 5px;
      color: #544c21;
      font-size: 14px;
      padding: 0px 4px;
}
.details .title2 {
    color: #c7c1ba;
    font-size: 23px;
    font-weight: 300;
    margin-bottom: 15px;
  }

.likes {
    margin-left: 24px;
  }

.likes:before {
    content: url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/195612/icon_like.png");
    position: relative;
    top: 2px;
    padding-right: 7px;
 }

.description {
  bottom: 0px;
  height: 200px;
  font-size: 16px;
  line-height: 26px;
  color: #b1b0ac;
}

.column1 {
  padding-left: 50px;
  padding-top: 120px;
  width: 220px;
  float: left;
  text-align: center;
}

.tag {
  background: white;
  border-radius: 10px;
  padding: 3px 8px;
  font-size: 14px;
  margin-right: 4px;
  line-height: 35px;
  cursor: pointer;
}

.tag:hover {
  background: #ddd;
}

.column2 {
  padding-left: 41px;
  padding-top: 30px;
  margin-left: 20px;
  width: 480px;
  float: left;
}

.avatars {
  margin-top: 23px;
  img {
    cursor: pointer;
  }
  img:hover {
    opacity: 0.6;
  }
  a:hover {
    text-decoration: none;
  }
}

fieldset,
label {
  margin: 0;
  padding: 0;
}

/****** Style Star Rating Widget *****/

.rating {
  border: none;
  float: left;
}

.rating > input {
  display: none;
}
.rating > label:before {
  margin: 5px;
  margin-top: 0;
  font-size: 1em;
  font-family: FontAwesome;
  display: inline-block;
  content: "\f005";
}

.rating > .half:before {
  content: "\f089";
  position: absolute;
}

.rating > label {
  color: #ddd;
  float: right;
}

/***** CSS Magic to Highlight Stars on Hover *****/

.rating > input:checked ~ label,
/* show gold star when clicked */ .rating:not(:checked) > label:hover,
/* hover current star */ .rating:not(:checked) > label:hover ~ label {
  color: #ffd700;
} /* hover previous stars in list */

.rating > input:checked + label:hover,
/* hover current star when changing rating */
  .rating
  > input:checked
  ~ label:hover,
.rating > label:hover ~ input:checked ~ label,
/* lighten current selection */ .rating > input:checked ~ label:hover ~ label {
  color: #ffed85;
}


a[data-tooltip] {
  position: relative;
}

a[data-tooltip]::before,
a[data-tooltip]::after {
  position: absolute;
  display: none;
  opacity: 0.85;
}

a[data-tooltip]::before {
  /*
   * using data-tooltip instead of title so we 
   * don't have the real tooltip overlapping
   */
  content: attr(data-tooltip);
  background: #000;
  color: #fff;
  font-size: 13px;
  padding: 5px;
  border-radius: 5px;
  /* we don't want the text to wrap */
  white-space: nowrap;
  text-decoration: none;
}

a[data-tooltip]::after {
  width: 0;
  height: 0;
  border: 6px solid transparent;
  content: "";
}

a[data-tooltip]:hover::before,
a[data-tooltip]:hover::after {
  display: block;
}

/** positioning **/

/* top tooltip */
a[data-tooltip][data-placement="top"]::before {
  bottom: 100%;
  left: 0;
  margin-bottom: 40px;
}

a[data-tooltip][data-placement="top"]::after {
  border-top-color: #000;
  border-bottom: none;
  bottom: 50px;
  left: 20px;
  margin-bottom: 4px;
}

</style>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="50">

	<!-- 네비게이션 바 -->
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
				    <!-- Device의 크기가 일정 크기보다 작아지면 -->
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#myPage">영화 연구소</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav navbar-left">
					<li><a href="#myPage">HOME</a></li>
					<li><a href="#band">BAND</a></li>
					<li><a href="#tour">TOUR</a></li>
					<li><a href="#contact">CONTACT</a></li>
					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#">MORE<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#">Merchandise</a></li>
								<li><a href="#">Extras</a></li>
								<li><a href="#">Media</a></li>
							</ul>
					 </li>
				</ul>
				<!-- Search icon & input form -->
				<div id="wrap">
						  <form action="movie_list.do" autocomplete="on">
						  <input id="search" name="search" type="text" placeholder="찾고 싶은 영화?" required>
						  <input id="search_submit" value="Rechercher" type="submit">
						  </form>
				</div>
			</div>
		</div>
	</nav>
	<!-- 네비게이션 바 끝 -->
	
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
				<br> <a href="#demo2" data-toggle="collapse"> <img
					src="bandmember.jpg" class="img-circle person" alt="Random Name"
					width="255" height="255">
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
				<br> <a href="#demo3" data-toggle="collapse"> <img
					src="bandmember.jpg" class="img-circle person" alt="Random Name"
					width="255" height="255">
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
			<div class="col-sm-2">
				<a data-toggle="modal" data-target="#myModal"><img src="../img/movie_image.jpg" class="img-responsive" style="width: 100%" alt="Image"></a>
				<!-- <button class="btn" data-toggle="modal" data-target="#myModal">기사 보기</button> -->
			</div>
			<div class="col-sm-2">
				<a data-toggle="modal" data-target="#myModal"><img src="../img/movie_image.jpg" class="img-responsive" style="width: 100%" alt="Image"></a>
			</div>
			<div class="col-sm-2">
				<a data-toggle="modal" data-target="#myModal"><img src="../img/movie_image.jpg" class="img-responsive" style="width: 100%" alt="Image"></a>
			</div>
			<div class="col-sm-2">
				<a data-toggle="modal" data-target="#myModal"><img src="../img/movie_image.jpg" class="img-responsive" style="width: 100%" alt="Image"></a>
			</div>
			<div class="col-sm-2">
				<a data-toggle="modal" data-target="#myModal"><img src="../img/movie_image.jpg" class="img-responsive" style="width: 100%" alt="Image"></a>
			</div>
			<div class="col-sm-2">
				<a data-toggle="modal" data-target="#myModal"><img src="../img/movie_image.jpg" class="img-responsive" style="width: 100%" alt="Image"></a>
			</div>
		</div>	
		<div style="height:50px;"></div>
		<div class="row">
			<div class="col-sm-2">
				<a data-toggle="modal" data-target="#myModal"><img src="../img/movie_image.jpg" class="img-responsive" style="width: 100%" alt="Image"></a>
			</div>
			<div class="col-sm-2">
				<a data-toggle="modal" data-target="#myModal"><img src="../img/movie_image.jpg" class="img-responsive" style="width: 100%" alt="Image"></a>
			</div>
			<div class="col-sm-2">
				<a data-toggle="modal" data-target="#myModal"><img src="../img/movie_image.jpg" class="img-responsive" style="width: 100%" alt="Image"></a>
			</div>
			<div class="col-sm-2">
				<a data-toggle="modal" data-target="#myModal"><img src="../img/movie_image.jpg" class="img-responsive" style="width: 100%" alt="Image"></a>
			</div>
			<div class="col-sm-2">
				<a data-toggle="modal" data-target="#myModal"><img src="../img/movie_image.jpg" class="img-responsive" style="width: 100%" alt="Image"></a>
			</div>
			<div class="col-sm-2">
				<a data-toggle="modal" data-target="#myModal"><img src="../img/movie_image.jpg" class="img-responsive" style="width: 100%" alt="Image"></a>
			</div>
		</div>		
	</div>

	<div id="tour" class="bg-1">
		<div class="container">
			<h3 class="text-center">영화 칼럼</h3>
			<h4 class="text-center">by 씨네21</h4>
			<p class="text-center">
				Lorem ipsum we'll play you some music.<br> Remember to book
				your tickets!
			</p>
			<div class="row text-center">
				<div class="col-sm-2 col-sm-offset-1">
					<div class="thumbnail">
						<img src="http://k.kakaocdn.net/dn/bYg9Ur/btqm6Neqdrf/fugDT1ocw3JqHQhqYRwjuk/img.jpg" alt="Paris" width="400" height="300">
						<p>
							<strong>[마감인간의 music] 휘트니 휴스턴 《The Bodyguard Original Soundtrack Album》, 다시, 휘트니</strong>
						</p>
						<button class="btn" data-toggle="modal" data-target="#myModal">기사 보기</button>
					</div>
				</div>
				<div class="col-sm-2">
					<div class="thumbnail">
						<img src="http://k.kakaocdn.net/dn/bYg9Ur/btqm6Neqdrf/fugDT1ocw3JqHQhqYRwjuk/img.jpg" alt="Paris" width="400" height="300">
						<p>
							<strong>[마감인간의 music] 휘트니 휴스턴 《The Bodyguard Original Soundtrack Album》, 다시, 휘트니</strong>
						</p>
						<!-- <p>Friday 27 November 2015</p> -->
						<button class="btn" data-toggle="modal" data-target="#myModal">기사 보기</button>
					</div>
				</div>
				<div class="col-sm-2">
					<div class="thumbnail">
						<img src="http://k.kakaocdn.net/dn/bYg9Ur/btqm6Neqdrf/fugDT1ocw3JqHQhqYRwjuk/img.jpg" alt="Paris" width="400" height="300">
						<p>
							<strong>[마감인간의 music] 휘트니 휴스턴 《The Bodyguard Original Soundtrack Album》, 다시, 휘트니</strong>
						</p>
						<!-- <p>Friday 27 November 2015</p> -->
						<button class="btn" data-toggle="modal" data-target="#myModal">기사 보기</button>
					</div>
				</div>
				<div class="col-sm-2">
					<div class="thumbnail">
						<img src="http://k.kakaocdn.net/dn/bYg9Ur/btqm6Neqdrf/fugDT1ocw3JqHQhqYRwjuk/img.jpg" alt="Paris" width="400" height="300">
						<p>
							<strong>[마감인간의 music] 휘트니 휴스턴 《The Bodyguard Original Soundtrack Album》, 다시, 휘트니</strong>
						</p>
						<!-- <p>Friday 27 November 2015</p> -->
						<button class="btn" data-toggle="modal" data-target="#myModal">기사 보기</button>
					</div>
				</div>
				<div class="col-sm-2">
					<div class="thumbnail">
						<img src="http://k.kakaocdn.net/dn/bYg9Ur/btqm6Neqdrf/fugDT1ocw3JqHQhqYRwjuk/img.jpg" alt="Paris" width="400" height="300">
						<p>
							<strong>[마감인간의 music] 휘트니 휴스턴 《The Bodyguard Original Soundtrack Album》, 다시, 휘트니</strong>
						</p>
						<!-- <p>Friday 27 November 2015</p> -->
						<button class="btn" data-toggle="modal" data-target="#myModal">기사 보기</button>
					</div>
				</div>
			</div>
			<hr>
				<h3 class="text-center">영화 뉴스</h3>
				<h4 class="text-center">by 맥스무비</h4>
			<p class="text-center">
				Lorem ipsum we'll play you some music.<br> Remember to book
				your tickets!
			</p>
			<div class="row text-center">
				<div class="col-sm-2 col-sm-offset-1">
					<div class="thumbnail">
						<img src="http://k.kakaocdn.net/dn/bYg9Ur/btqm6Neqdrf/fugDT1ocw3JqHQhqYRwjuk/img.jpg" alt="Paris" width="400" height="300">
						<p>
							<strong>[마감인간의 music] 휘트니 휴스턴 《The Bodyguard Original Soundtrack Album》, 다시, 휘트니</strong>
						</p>
						<button class="btn" data-toggle="modal" data-target="#myModal">기사 보기</button>
					</div>
				</div>
				<div class="col-sm-2">
					<div class="thumbnail">
						<img src="http://k.kakaocdn.net/dn/bYg9Ur/btqm6Neqdrf/fugDT1ocw3JqHQhqYRwjuk/img.jpg" alt="Paris" width="400" height="300">
						<p>
							<strong>[마감인간의 music] 휘트니 휴스턴 《The Bodyguard Original Soundtrack Album》, 다시, 휘트니</strong>
						</p>
						<button class="btn" data-toggle="modal" data-target="#myModal">기사 보기</button>
					</div>
				</div>
				<div class="col-sm-2">
					<div class="thumbnail">
						<img src="http://k.kakaocdn.net/dn/bYg9Ur/btqm6Neqdrf/fugDT1ocw3JqHQhqYRwjuk/img.jpg" alt="Paris" width="400" height="300">
						<p>
							<strong>[마감인간의 music] 휘트니 휴스턴 《The Bodyguard Original Soundtrack Album》, 다시, 휘트니</strong>
						</p>
						<button class="btn" data-toggle="modal" data-target="#myModal">기사 보기</button>
					</div>
				</div>
				<div class="col-sm-2">
					<div class="thumbnail">
						<img src="http://k.kakaocdn.net/dn/bYg9Ur/btqm6Neqdrf/fugDT1ocw3JqHQhqYRwjuk/img.jpg" alt="Paris" width="400" height="300">
						<p>
							<strong>[마감인간의 music] 휘트니 휴스턴 《The Bodyguard Original Soundtrack Album》, 다시, 휘트니</strong>
						</p>
						<button class="btn" data-toggle="modal" data-target="#myModal">기사 보기</button>
					</div>
				</div>
				<div class="col-sm-2">
					<div class="thumbnail">
						<img src="http://k.kakaocdn.net/dn/bYg9Ur/btqm6Neqdrf/fugDT1ocw3JqHQhqYRwjuk/img.jpg" alt="Paris" width="400" height="300">
						<p>
							<strong>[마감인간의 music] 휘트니 휴스턴 《The Bodyguard Original Soundtrack Album》, 다시, 휘트니</strong>
						</p>
						<button class="btn" data-toggle="modal" data-target="#myModal">기사 보기</button>
					</div>
				</div>
				
			</div>
			
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
									<div class="hero">
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
					<button type="submit" class="btn btn-danger btn-default pull-left"
						data-dismiss="modal">
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
		<div class="row no-gutter">
			<div class="col-sm-2">
				<img src="../img/movie_image.jpg" class="img-responsive" style="width: 100%" alt="Image">
			</div>
			<div class="col-sm-2">
				<img src="../img/movie_image.jpg" class="img-responsive" style="width: 100%" alt="Image">
			</div>
				<div class="col-sm-2">
				<img src="../img/movie_image.jpg" class="img-responsive" style="width: 100%" alt="Image">
			</div>
			<div class="col-sm-2">
				<img src="../img/movie_image.jpg" class="img-responsive" style="width: 100%" alt="Image">
			</div>
				<div class="col-sm-2">
				<img src="../img/movie_image.jpg" class="img-responsive" style="width: 100%" alt="Image">
			</div>
			<div class="col-sm-2">
				<img src="../img/movie_image.jpg" class="img-responsive" style="width: 100%" alt="Image">
			</div>
		</div>
		<div class="row no-gutter">
			<div class="col-sm-2">
				<img src="../img/movie_image.jpg" class="img-responsive" style="width: 100%" alt="Image">
			</div>
			<div class="col-sm-2">
				<img src="../img/movie_image.jpg" class="img-responsive" style="width: 100%" alt="Image">
			</div>
				<div class="col-sm-2">
				<img src="../img/movie_image.jpg" class="img-responsive" style="width: 100%" alt="Image">
			</div>
			<div class="col-sm-2">
				<img src="../img/movie_image.jpg" class="img-responsive" style="width: 100%" alt="Image">
			</div>
				<div class="col-sm-2">
				<img src="../img/movie_image.jpg" class="img-responsive" style="width: 100%" alt="Image">
			</div>
			<div class="col-sm-2">
				<img src="../img/movie_image.jpg" class="img-responsive" style="width: 100%" alt="Image">
			</div>
		</div>
	</div>
	<!-- Footer -->
	<footer class="text-center">
		<a class="up-arrow" href="#myPage" data-toggle="tooltip"
			title="TO TOP"> <span class="glyphicon glyphicon-chevron-up"></span>
		</a><br><br>
		<p>
			Bootstrap Theme Made By <a href="https://www.w3schools.com" data-toggle="tooltip" title="Visit w3schools">www.w3schools.com</a>
		</p>
	</footer>

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

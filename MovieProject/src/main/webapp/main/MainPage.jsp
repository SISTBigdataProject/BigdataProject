<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
<link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="css/style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- Search bar js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
<style>

</style>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="50">
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> 
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#myPage">Logo</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav navbar-left">
					<li><a href="#myPage">HOME</a></li>
					<li><a href="#band">BAND</a></li>
					<li><a href="#tour">TOUR</a></li>
					<li><a href="#contact">CONTACT</a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">MORE <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#">Merchandise</a></li>
							<li><a href="#">Extras</a></li>
							<li><a href="#">Media</a></li>
						</ul></li>
				</ul>					
					<div id="wrap">
						  <form action="" autocomplete="on">
						  <input id="search" name="search" type="text" placeholder="What're we looking for?">
						  <input id="search_submit" value="Rechercher" type="submit">
						  </form>
					</div>
												
			</div>
		</div>
	</nav>

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
		<a class="left carousel-control" href="#myCarousel" role="button"
			data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
			aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel" role="button"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>

<!-- Container (The Band Section) -->
	<div id="band" class="container text-center">
		<h3>THE BAND</h3>
		<p>
			<em>We love music!</em>
		</p>
		<p>We have created a fictional band website. Lorem ipsum dolor sit
			amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt
			ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis
			nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
			consequat. Duis aute irure dolor in reprehenderit in voluptate velit
			esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat
			cupidatat non proident, sunt in culpa qui officia deserunt mollit
			anim id est laborum consectetur adipiscing elit, sed do eiusmod
			tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
			veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex
			ea commodo consequat.</p>
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


	 <div class="cont s--inactive">
  <!-- cont inner start -->
  <div class="cont__inner">
    <!-- el start -->
    <div class="el">
      <div class="el__overflow">
        <div class="el__inner">
          <div class="el__bg"></div>
          <div class="el__preview-cont">
            <h2 class="el__heading">Section 1</h2>
          </div>
          <div class="el__content">
            <div class="el__text">Whatever</div>
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
    <!-- el end -->
    <!-- el start -->
    <div class="el">
      <div class="el__overflow">
        <div class="el__inner">
          <div class="el__bg"></div>
          <div class="el__preview-cont">
            <h2 class="el__heading">Section 2</h2>
          </div>
          <div class="el__content">
            <div class="el__text">Whatever</div>
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
    <!-- el end -->
    <!-- el start -->
    <div class="el">
      <div class="el__overflow">
        <div class="el__inner">
          <div class="el__bg"></div>
          <div class="el__preview-cont">
            <h2 class="el__heading">Section 3</h2>
          </div>
          <div class="el__content">
            <div class="el__text">Whatever</div>
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
    <!-- el end -->
    <!-- el start -->
    <div class="el">
      <div class="el__overflow">
        <div class="el__inner">
          <div class="el__bg"></div>
          <div class="el__preview-cont">
            <h2 class="el__heading">Section 4</h2>
          </div>
          <div class="el__content">
            <div class="el__text">Whatever</div>
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
    <!-- el end -->
  </div>
  <!-- cont inner end -->
</div>
<script  src="js/index.js"></script>
	 
	

	<!-- Container (TOUR Section) -->
	<!-- 개봉작 정보 -->
	<div class="container-fluid bg-3 text-center">
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
				<img src="../img/movie_image.jpg" class="img-responsive"
					style="width: 100%" alt="Image">
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
	<br>
	<br>


	<!-- 포스터 캐로셀 -->
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
		<a class="left carousel-control" href="#myCarousel" role="button"
			data-slide="prev"> <span class="glyphicon glyphicon-chevron-left"
			aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel" role="button"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>


	<!-- <!--??   -->
	<div class="container-fluid">
			<h2>Media Slider Carousel BS3</h2>
		</div>
		<div class="row">
			<div class="carousel slide media-carousel" id="media">
				<div class="carousel-inner">
					<div class="item active">
						<div class="row">
							<div class="col-md-2">
								<a class="thumbnail" href="#"><img class="img-responsive" src="../img/movie_image.jpg"></a>
							</div>
							<div class="col-md-2">
								<a class="thumbnail" href="#"><img class="img-responsive" alt="" src="../img/movie_image.jpg"></a>
							</div>
							<div class="col-md-2">
								<a class="thumbnail" href="#"><img class="img-responsive" alt="" src="../img/movie_image.jpg"></a>
							</div>
							<div class="col-md-2">
								<a class="thumbnail" href="#"><img class="img-responsive" alt="" src="../img/movie_image.jpg"></a>
							</div>
							<div class="col-md-2">
								<a class="thumbnail" href="#"><img class="img-responsive" alt="" src="../img/movie_image.jpg"></a>
							</div>
							<div class="col-md-2">
								<a class="thumbnail" href="#"><img class="img-responsive" alt="" src="../img/movie_image.jpg"></a>
							</div>
						</div>
					</div>
					<div class="item">
						<div class="row">
							<div class="col-md-2">
								<a class="thumbnail" href="#"><img alt="" src="../img/movie_image.jpg"></a>
							</div>
							<div class="col-md-2">
								<a class="thumbnail" href="#"><img alt="" src="../img/movie_image.jpg"></a>
							</div>
							<div class="col-md-2">
								<a class="thumbnail" href="#"><img alt="" src="../img/movie_image.jpg"></a>
							</div>
							<div class="col-md-2">
								<a class="thumbnail" href="#"><img alt="" src="../img/movie_image.jpg"></a>
							</div>
							<div class="col-md-2">
								<a class="thumbnail" href="#"><img alt="" src="../img/movie_image.jpg"></a>
							</div>
							<div class="col-md-2">
								<a class="thumbnail" href="#"><img alt="" src="../img/movie_image.jpg"></a>
							</div>
						</div>
					</div>
					<div class="item">
						<div class="row">
							<div class="col-md-2">
								<a class="thumbnail" href="#"><img alt="" src="../img/movie_image.jpg"></a>
							</div>
							<div class="col-md-2">
								<a class="thumbnail" href="#"><img alt="" src="../img/movie_image.jpg"></a>
							</div>
							<div class="col-md-2">
								<a class="thumbnail" href="#"><img alt="" src="../img/movie_image.jpg"></a>
							</div>
							<div class="col-md-2">
								<a class="thumbnail" href="#"><img alt="" src="../img/movie_image.jpg"></a>
							</div>
							<div class="col-md-2">
								<a class="thumbnail" href="#"><img alt="" src="../img/movie_image.jpg"></a>
							</div>
							<div class="col-md-2">
								<a class="thumbnail" href="#"><img alt="" src="../img/movie_image.jpg"></a>
							</div>
						</div>
					</div>
					</div>
					<a data-slide="prev" href="#media" class="left carousel-control">‹</a>
					<a data-slide="next" href="#media" class="right carousel-control">›</a>
				</div>
			</div>
		</div> -->
		<script>
$(document).ready(function() {
	  $('#media').carousel({
	    pause: true,
	    interval: false,
	  });
	});
</script>
		<!-- <div id="tour" class="bg-1">
  <div class="container">
    <h3 class="text-center">TOUR DATES</h3>
    <p class="text-center">Lorem ipsum we'll play you some music.<br> Remember to book your tickets!</p>
    <ul class="list-group">
      <li class="list-group-item">September <span class="label label-danger">Sold Out!</span></li>
      <li class="list-group-item">October <span class="label label-danger">Sold Out!</span></li> 
      <li class="list-group-item">November <span class="badge">3</span></li> 
    </ul>
    
    <div class="row text-center">
      <div class="col-sm-4">
        <div class="thumbnail">
          <img src="paris.jpg" alt="Paris" width="400" height="300">
          <p><strong>Paris</strong></p>
          <p>Friday 27 November 2015</p>
          <button class="btn" data-toggle="modal" data-target="#myModal">Buy Tickets</button>
        </div>
      </div>
      <div class="col-sm-4">
        <div class="thumbnail">
          <img src="newyork.jpg" alt="New York" width="400" height="300">
          <p><strong>New York</strong></p>
          <p>Saturday 28 November 2015</p>
          <button class="btn" data-toggle="modal" data-target="#myModal">Buy Tickets</button>
        </div>
      </div>
      <div class="col-sm-4">
        <div class="thumbnail">
          <img src="sanfran.jpg" alt="San Francisco" width="400" height="300">
          <p><strong>San Francisco</strong></p>
          <p>Sunday 29 November 2015</p>
          <button class="btn" data-toggle="modal" data-target="#myModal">Buy Tickets</button>
        </div>
      </div>
    </div>
  </div> -->

		<!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">×</button>
						<h4>
							<span class="glyphicon glyphicon-lock"></span> Tickets
						</h4>
					</div>
					<div class="modal-body">
						<form role="form">
							<div class="form-group">
								<label for="psw"><span
									class="glyphicon glyphicon-shopping-cart"></span> Tickets, $23
									per person</label> <input type="number" class="form-control" id="psw"
									placeholder="How many?">
							</div>
							<div class="form-group">
								<label for="usrname"><span
									class="glyphicon glyphicon-user"></span> Send To</label> <input
									type="text" class="form-control" id="usrname"
									placeholder="Enter email">
							</div>
							<button type="submit" class="btn btn-block">
								Pay <span class="glyphicon glyphicon-ok"></span>
							</button>
						</form>
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
	</div>

	<!-- Container (Contact Section) -->
	<div id="contact" class="container">
		<h3 class="text-center">Contact</h3>
		<p class="text-center">
			<em>We love our fans!</em>
		</p>

		<div class="row">
			<div class="col-md-4">
				<p>Fan? Drop a note.</p>
				<p>
					<span class="glyphicon glyphicon-map-marker"></span>Chicago, US
				</p>
				<p>
					<span class="glyphicon glyphicon-phone"></span>Phone: +00
					1515151515
				</p>
				<p>
					<span class="glyphicon glyphicon-envelope"></span>Email:
					mail@mail.com
				</p>
			</div>
			<div class="col-md-8">
				<div class="row">
					<div class="col-sm-6 form-group">
						<input class="form-control" id="name" name="name"
							placeholder="Name" type="text" required>
					</div>
					<div class="col-sm-6 form-group">
						<input class="form-control" id="email" name="email"
							placeholder="Email" type="email" required>
					</div>
				</div>
				<textarea class="form-control" id="comments" name="comments"
					placeholder="Comment" rows="5"></textarea>
				<br>
				<div class="row">
					<div class="col-md-12 form-group">
						<button class="btn pull-right" type="submit">Send</button>
					</div>
				</div>
			</div>
		</div>
		<br>
		<h3 class="text-center">From The Blog</h3>
		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#home">Mike</a></li>
			<li><a data-toggle="tab" href="#menu1">Chandler</a></li>
			<li><a data-toggle="tab" href="#menu2">Peter</a></li>
		</ul>

		<div class="tab-content">
			<div id="home" class="tab-pane fade in active">
				<h2>Mike Ross, Manager</h2>
				<p>Man, we've been on the road for some time now. Looking
					forward to lorem ipsum.</p>
			</div>
			<div id="menu1" class="tab-pane fade">
				<h2>Chandler Bing, Guitarist</h2>
				<p>Always a pleasure people! Hope you enjoyed it as much as I
					did. Could I BE.. any more pleased?</p>
			</div>
			<div id="menu2" class="tab-pane fade">
				<h2>Peter Griffin, Bass player</h2>
				<p>I mean, sometimes I enjoy the show, but other times I enjoy
					other things.</p>
			</div>
		</div>
	</div>

	<!-- Add Google Maps -->
	<div id="googleMap"></div>
	<script>
function myMap() {
var myCenter = new google.maps.LatLng(41.878114, -87.629798);
var mapProp = {center:myCenter, zoom:12, scrollwheel:false, draggable:false, mapTypeId:google.maps.MapTypeId.ROADMAP};
var map = new google.maps.Map(document.getElementById("googleMap"),mapProp);
var marker = new google.maps.Marker({position:myCenter});
marker.setMap(map);
}
</script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBu-916DdpKAjTmJNIgngS6HL_kDIKU0aU&callback=myMap"></script>
	<!--
To use this code on your website, get a free API key from Google.
Read more at: https://www.w3schools.com/graphics/google_maps_basic.asp
-->

	<!-- Footer -->
	<footer class="text-center">
		<a class="up-arrow" href="#myPage" data-toggle="tooltip"
			title="TO TOP"> <span class="glyphicon glyphicon-chevron-up"></span>
		</a><br> <br>
		<p>
			Bootstrap Theme Made By <a href="https://www.w3schools.com"
				data-toggle="tooltip" title="Visit w3schools">www.w3schools.com</a>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
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
											<div class="title1">${vo.title }<span>${vo.grade }</span>
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
											<span class="tag">${vo.genre }</span>
										</div>
										<div class="column2">
											<p>
												${vo.story }
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
</body>
</html>
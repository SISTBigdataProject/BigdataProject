<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- CSS -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- JS  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
<!-- Font -->
<link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
</head>
		<div class="hero-image" style="background-image: url(${vo.photo});">
		  <div class="hero-text">
		    <h1 style="font-size:50px; text-shadow: 2px 2px #000;">${vo.title}</h1>
		    <p>평점: ${vo.eval }</p>
		  </div>
		</div>
	<div class="container">
			<div class="row">
				<div class="col-sm-3">
					<img src="${vo.poster }" alt="cover" class="cover" width="100%" style="vertical-align: moio;"/>							
				</div>
				<div class="col-sm-9">
					
					<h2>${vo.title }
					<c:if test="${countstars>0}">
						<button type="button" class="btn btn-primary btn-sm">Top 2000</button>
					</c:if></h2>				
					 ${vo.regdate}<br/>
					<table class="table">			
					  <tbody>
					  	<tr>
					      <th scope="row" width="8%">등급</th>
					      <td>${vo.grade}</td>
					    </tr>
					    <tr>
					       <th scope="row" width="8%">장르</th>
					      <td>${vo.genre}</td>
					    </tr>					   
					    <tr>
					      <th scope="row" width="8%">감독</th>
					      <td>${vo.director }</td>
					    </tr>
					    <tr>
					       <th scope="row" width="8%">출연</th>
					      <td>${vo.actor }</td>
					    </tr>
					    <%-- <tr>
					       <th scope="row" width="8%">줄거리</th>
					      <td>${vo.story }</td>
					    </tr> --%>
					  </tbody>
					</table>	
				</div>
			</div>
			<div class="text-center">
					<h3>줄거리</h3>
					<hr>
					     ${vo.story }<br/>
			</div>
			<div class="row text-center">
			 	<br/>
				<h3>감독 및 출연</h3>
				<hr>
				<div class="col-sm-2">
					<img src="${vo.directorImage}"><br/><br/>
					${vo.director }
				</div>
				
				<c:set var="actorImages" value="${fn:split(vo.actorImage,',')}" />
				<c:set var="actornames" value="${fn:split(vo.actor,',')}" />
				
				<c:forEach var="actorimg" items="${actorImages}" varStatus="status">
					<div class="col-sm-2">
						<img src="${actorimg}"><br/><br/>	
						${actornames[status.index]}
					</div>	
				</c:forEach>			
			</div>				
		</div>
		
		<c:if test="${countstars>0}">
			<jsp:include page="${movie_graph}"></jsp:include>
		</c:if>
</body>
</html>
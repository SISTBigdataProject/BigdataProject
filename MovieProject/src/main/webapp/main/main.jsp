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

</style>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="50">
	<!-- 네비게이션 바 -->
	<jsp:include page="navbar.jsp"/>

	<jsp:include page="${movie_jsp}"></jsp:include>

	<!-- Footer -->
	<jsp:include page="footer.jsp"/>
</body>
</html>
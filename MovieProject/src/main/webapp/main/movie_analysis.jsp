<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<h1>#tag</h1>			
				<c:forEach var="vo" items="${rlist}">
				<c:if test="${vo.count>20}">
				#${vo.word }&nbsp;
				</c:if>
				</c:forEach>	
			<h1>word cloud</h1>
		</div>
	</div>
</body>
</html>
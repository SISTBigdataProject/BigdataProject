<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="table.css">
<style>
.table {
	vertical-align: middle;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<br/>
			<h1>'${search}'에 대한 영화 통합검색결과 입니다.</h1>
			<h2>(총 ${total}건)</h2>
			<br/>
			<table class="table">
				<tbody>
					<c:if test="${list.size()>0}">
						<c:forEach var="vo" items="${list }" varStatus="idx">
							<tr>
								<th scope="row" onclick="">${idx.index+1}</th>
								<td class="text-center"><img src="${vo.poster }" width="65px;"></td>
								<td><a href="movie_detail.do?code=${vo.code}"><b>${vo.title }</b></a><br/>
								<br/> 감독: ${vo.director }<br/> ${vo.genre} | ${vo.country} | ${vo.regdate}<br/> 출연: ${vo.actor }<br/></td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
			<div class="row">
					<a href="movie_find.do?search=${search }&page=${curpage>1?curpage-1:curpage }" class="previous">&laquo; 이전</a>	
						${curpage }page/ ${totalpage } pages				
					<a href="movie_find.do?search=${search }&page=${curpage<totalpage?curpage+1:curpage }" class="next">다음 &raquo;</a>						
			</div>
		</div>
	</div>
</body>
</html>
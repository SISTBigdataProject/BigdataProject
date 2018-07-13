<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="table.css">
</head>
<body>
<div class="container">
<div class="row">
  <!--  -->
  <table id="table-content" width=100%>
    <tr bgcolor="gray">
      <th width=10%>번호</th>
      <th width=30%></th>
      <th width=25%>영화명</th> 
      <th width=35%>배우</th>
    </tr>
    <h1>입력하신 "${search }"의 검색 결과입니다.</h1>
    
    <c:if test="${list.size()==0}">
    <h2>입력하신 검색결과가 0개 입니다.</h2>
    </c:if>
    <c:if test="${list.size()>0}">
    <h3>입력하신 검색결과가 ${total}개 입니다.</h3>
    <c:forEach var="vo" items="${list }">
      <tr class="dataTr">
       <td width=10% align="center">${vo.code }</td>
       <td width=30% align="center">
        <img src="${vo.poster }" width=30 height=30>
       </td>
       <td width=25% align="left"><a href="movie_detail.do?code=${vo.code }">${vo.title }</a></td>
       <td width=35% align="left">${vo.actor }</td>
      </tr>     
    </c:forEach>
    </c:if>
  </table>
  		  <div class="row">
		   <ul>
			  <li><a href="movie_find.do?search=${search }&page=${curpage>1?curpage-1:curpage }">이전</a></li>
			  <li>${curpage } page / ${totalpage } pages</li>
			  <li><a href="movie_find.do?search=${search }&page=${curpage<totalpage?curpage+1:curpage }">다음</a></li>
			</ul> 
  </div>
  </div>
  </div>
</body>
</html>



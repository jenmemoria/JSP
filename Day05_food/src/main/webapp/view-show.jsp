<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>view-show.jsp</title>
</head>
<body>

<h1>상세보기 : ${dto.store }</h1>
<hr>

<table border="1" cellpadding="10" cellspacing="0">
	<tr>
		<th>번호</th>
		<td>${dto.idx }</td>
	</tr>
	<tr>
		<th>매장명</th>
		<td>${dto.store }</td>
	</tr>
	<tr>
		<th>음식1</th>
		<td>${dto.food1 }</td>
	</tr>
	<tr>
		<th>음식2</th>
		<td>${dto.food2 }</td>
	</tr>
	<tr>
		<th>음식3</th>
		<td>${dto.food3 }</td>
	</tr>

</table>

<p>
	<a href="list.jsp"><button>목록</button></a>
	<a href="delete.jsp?idx=${dto.idx }"><button>삭제</button></a>
</p>
</body>
</html>
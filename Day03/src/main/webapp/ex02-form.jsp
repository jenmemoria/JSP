<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02-from.jsp</title>
</head>
<body>

<h1>업다운 게임 입력</h1>
<hr>

<form action="ex02-action.jsp">
	<input type="number" name="user">
	<input type="submit">
	<a href="ex02-action.jsp?reset=true">다시</a>
</form>

<h3><%=request.getParameter("msg") %></h3>
</body>
</html>
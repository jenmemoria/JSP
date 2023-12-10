<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>add.jsp</title>
</head>
<body>

<h1>매장, 음식 추가</h1>
<hr>

<form action="add-action.jsp">
	<p><input type="text" name="store" placeholder="매장이름" required autofocus></p>
	<p><input type="text" name="food1" placeholder="음식1" required></p>
	<p><input type="text" name="food2" placeholder="음식2" required></p>
	<p><input type="text" name="food3" placeholder="음식3" required></p>
	<p><input type="submit"></p>
</form>
</body>
</html>
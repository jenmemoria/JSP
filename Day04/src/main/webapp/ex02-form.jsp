<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="ex02-error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02-form.jsp</title>
</head>
<body>

<h1>두 정수의 덧셈</h1>
<hr>

<form action="ex02-action.jsp">
	<p>
		<input type="number" name="n1" placeholder= "n1">
		+
		<input type="number" name="n2" placeholder= "n2">
		<button>=</button>
	</p>
</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addorder-form.jsp</title>
</head>
<body>

<h1>주문 추가로 입력하기</h1>
<hr>

<form action="addorder-action.jsp">
	<p><input type="text" name="size" placeholder="사이즈" required autofocus></p>
	<p><input type="number" name="price" placeholder="가격" required></p>
	<p>
		<input type="submit">
		<a href="orderlist.jsp"><input type="button" value="주문 목록"></a>
	</p>
</form>
</body>
</html>
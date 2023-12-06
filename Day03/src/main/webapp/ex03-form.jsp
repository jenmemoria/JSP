<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex03-from.jsp</title>
</head>
<body>
<!-- DAO(Model)와 Main(View)는 직접적으로 연결되어 있지는 않다. Handler(controller)를 통해서 -->
<h1>업다운 게임 입력</h1>
<hr>

<form action="ex03-action.jsp">
	<input type="number" name="user" required autofocus>
	<button>제출</button>
	<a href="ex03-action.jsp?reset=true">
		<input type="button" value="다시"></a>
</form>

<h3><%=request.getParameter("msg") %></h3>
</body>
</html>
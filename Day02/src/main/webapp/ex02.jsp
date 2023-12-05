<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02.jsp</title>
</head>
<body>

<h1>request.getParameter(String name)</h1>
<hr>

<h3>주소에 쿼리스트링 형태로 파라미터를 추가할 수 있다.</h3>
<a href="<%=request.getRequestURL()%>?guest=손님"><button>손님 링크</button></a>

<%
	String guest = request.getParameter("guest");
%>

<h3>form 태그에 입력한 값이 파라미터로 전송될 수 있다. 이 때 input의 name을 맞춰야 한다.</h3>

<form>
	<P><input type="text" name="guest" placeholder="직접입력"></P>
	<p><input type="submit"></p>
</form>

<h3>guest : <%=guest %></h3>

</body>
</html>
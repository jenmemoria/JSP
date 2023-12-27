<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02-form.jsp</title>
</head>
<body>

<h1>ex02-form</h1>
<hr>

<%
	String login = (String) session.getAttribute("login");

	if(login == null){
%>


<form method="POST" action="ex02-action.jsp">
	<p><input type="text" name="userid" placeholder="ID" required autofucus></p>
	<p><input type="password" name="userpw" placeholder="Password" required></p>
	<p><input type="submit" value="로그인"></p>
</form>
<%
	}
	else {
		long last = session.getLastAccessedTime() / 1000; // 자바에서 시간을 처리할 때는 전부 long으로 처리한다.
		long current = new java.util.Date().getTime() / 1000;
%>
<h3>현재 로그인 계정 : 			<%=login %></h3>
<h3>세션 최대 유효 시간 : 		<%=session.getMaxInactiveInterval() %></h3>
<h3>마지막으로 세션에 접근한 시간 : 	<%=session.getLastAccessedTime() %></h3>
<h3>현재 시간 : 				<%=new java.util.Date().getTime() %></h3> <%-- getTime()으로 하면 long 타입으로 바뀜. --%>
<h3>현재 시간 - 마지막 접근 시간 : 	<%=current - last %></h3>
<h3>현재 세션의 고유 ID : 		<%=session.getId() %></h3>
<h3>세션 최대 유효 시간은 요청을 보낼 때마다 새로 갱신되어 연장된다.</h3>
<a href="ex02-logout.jsp"><button>로그아웃</button></a>
<%
	}
%>
</body>
</html>
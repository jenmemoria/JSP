<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ex06.MemberDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex06.jsp</title>
</head>
<body>

<h1>ex06 대문 페이지</h1>
<hr>

<%
	MemberDTO login = (MemberDTO)session.getAttribute("login"); // 일단 로그인이 null이라면 친구.
	String welcome = String.format("안녕 ~ %s !!", login == null ? "친구" : login.getName());
%>
<div> <!-- 로그인이 null이 아니라면 이미지패스 -->
	<img src="<%=login != null ? login.getImgPath() : "image/default.png" %>" height="200">
	<h3><%=welcome %></h3>
</div>
<a href="ex06-form.jsp"><button>로그인</button></a>
</body>
</html>
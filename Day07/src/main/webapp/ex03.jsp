<%@page import="java.util.Properties"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex03.jsp</title>
</head>
<body>

<%
	pageContext.setAttribute("test", "짱구");
	request.setAttribute("test", "루피");
	session.setAttribute("test", "코난");
	application.setAttribute("test", "페이커");
	
	Properties pro1 = new Properties();
%>

<jsp:useBean id="pro" class="java.util.Properties" scope="page" />

<%-- EL 태그에서 내장 객체를 찾을 영역을 지정하고 싶으면 영역 뒤에scope. 을 붙이고 객체 이름을 적는다 --%>
<c:set var="test2" value="침착맨" scope="request"/>
<h3>\${test } : ${test }</h3>
<h3>\${pageScope.test } : ${pageScope.test }</h3>
<h3>\${requestScope.test } : ${requestScope.test }</h3>
<h3>\${sessionScope.test } : ${sessionScope.test }</h3>
<h3>\${applicationScope.test } : ${applicationScope.test }</h3>
</body>
</html>
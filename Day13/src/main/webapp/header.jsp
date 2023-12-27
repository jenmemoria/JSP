<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<c:set var="dao" value="${MemberDAO.getInstance() }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.box {
		border: 1px dashed black;
	}
</style>
</head>
<body>
<nav class="frame">
	<ul>
		<li><a href="${cpath }/list.jsp">전체</a></li>
	</ul>
</nav>
</body>
</html>
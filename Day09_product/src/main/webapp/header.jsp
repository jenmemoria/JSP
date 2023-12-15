<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<jsp:useBean id="dao" class="icecream.IcecreamDAO" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<nav class="frame">
	<ul>
		<li><a href="${cpath }/list.jsp">전체</a></li>
	</ul>
</nav>

</body>
</html>
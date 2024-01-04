<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ex03.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex03-action.jsp</title>
</head>
<body>

<%-- jsp:useBean 대신 fileUtil을 이용하여 dto를 생성한다. --%>
<c:set var="fileUtil" value="${FileUtil.getInstance() }" />
<c:set var="dto" value="${fileUtil.getDTO(pageContext.request) }" /> <%-- jsp:useBean 대신에 넣은 거! --%>

<%-- 생성된 dto를 dao.insert() 함수에 전달하면서 함수를 실행한다. --%>
<c:set var="reviewDAO" value="${ReviewDAO.getInstance() }" />
<c:set var="row" value="${reviewDAO.insert(dto) }" />

<script>
	const row = '${row}'
	alert('영향 받은 줄 수 : ' + row)	<%-- 자바스크립트도 문자열 덧셈이 됨 --%>
	location.href = '${cpath}/ex03-form.jsp'
</script>
</body>
</html>
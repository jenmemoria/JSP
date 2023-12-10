<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delete.jsp</title>
</head>
<body>

${dao.delete(param.idx) } <%-- param의 idx를 dao에게 전달해서 삭제한다. --%>

<%
	response.sendRedirect("list.jsp");	// 이동
%>
</body>
</html>
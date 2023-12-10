<%@page import="food.FoodDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>add-action.jsp</title>
</head>
<body>

<jsp:useBean id="dto" class="food.FoodDTO" scope="page" />
<jsp:setProperty property="*" name="dto"/>	<%-- 모든 세션을 dto에 넣어라 --%>

${dao.insert(dto) }
<%
	//response.sendRedirect("list.jsp");
	int lastIdx = FoodDTO.getSeq();
	response.sendRedirect("view.jsp?idx=" + lastIdx);
%>
</body>
</html>
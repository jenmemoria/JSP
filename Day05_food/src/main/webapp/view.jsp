<%@page import="food.FoodDTO"%>
<%@page import="food.FoodDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>view.jsp</title>
</head>
<body>

<h1>${dao.selectOne(param.idx).store }</h1>
<h2>
<%
	FoodDAO dao = (FoodDAO) application.getAttribute("dao");
	int idx = Integer.parseInt(request.getParameter("idx"));
	FoodDTO dto = dao.selectOne(idx);
	
	request.setAttribute("dto", dto);
	request.getRequestDispatcher("view-show.jsp").forward(request, response);
%>
</h2>
</body>
</html>
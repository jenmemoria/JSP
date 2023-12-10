<%@page import="order.OrderDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deleteorder.jsp</title>
</head>
<body>
	<%
		ArrayList<OrderDTO> orderList = (ArrayList<OrderDTO>)application.getAttribute("orderList");
		String name = request.getParameter("name");
		
		orderList.removeIf(dto -> dto.getSize().equals(name));
		response.sendRedirect("orderlist.jsp");
	%>
</body>
</html>
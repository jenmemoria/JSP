<%@page import="order.OrderDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>view.jsp</title>
</head>
<body>

<%
	ArrayList<OrderDTO> orderList = (ArrayList<OrderDTO>)application.getAttribute("orderList");

	OrderDTO data = null;
	String name = request.getParameter("name");
	
	for(OrderDTO dto : orderList){
		if(dto.getSize().equals(name)){
			data = dto;
			break;
		}
	}
	
	request.setAttribute("dto", data);
	request.getRequestDispatcher("view-show.jsp").forward(request, response);	// "forward의 대상은 view-show.jsp"
%>
</body>
</html>
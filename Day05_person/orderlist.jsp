<%@page import="order.OrderDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list.jsp</title>
</head>
<body>

<%
	// 전체 목록 보여주기
	// list를 attribute로 넣어두고, 대상을 참조하면서 프로그램 진행 및 데이터 저장
	List<OrderDTO> list = (List<OrderDTO>)application.getAttribute("orderList");

	if(list == null){
		list = new ArrayList<>();
		application.setAttribute("orderList", list);
	}
	
	request.setAttribute("list", list);	// 불러온 list를 request에 넣는다.
	request.getRequestDispatcher("orderlist-show.jsp").forward(request, response);
%>
</body>
</html>
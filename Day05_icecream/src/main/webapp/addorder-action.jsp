<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addorder-action.jsp</title>
</head>
<body>

<jsp:useBean id="paramDTO" class="order.OrderDTO" />
<jsp:setProperty property="*" name="paramDTO"/> <%-- param을 예약어로 썼기 때문에 param을 쓰면 안 된다. --%>

<%-- EL 태그가 못하는 건, Attribute 등록하는 거랑 제어문을 못 씀. --%>
${orderList.add(paramDTO) }

<%
	String name = URLEncoder.encode(paramDTO.getSize(), "UTF-8");
	response.sendRedirect("view.jsp?name=" + name);		// 사이즈로 고유식별 ... 가능하므로 .. 단일조회 이동 가능 ..
	// 단, 중복되는 사이즈가 없다는 가정하에 정상적으로 작동.
%>
</body>
</html>
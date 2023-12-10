<%@page import="order.OrderDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list-show.jsp</title>
<style>
	tr:hover {
		background-color: pink;
		cursor: pointer;
	}
	table a {
		display: block;
		text-decoration: none;
	}
</style>
</head>
<body>

<h1>order 목록</h1>
<hr>

<p>
	<a href="addorder-form.jsp">주문 추가하기</a>
</p>
<table border="1" cellpadding="0" width="500">
	<thead>
		<tr>
			<th>주문한 사이즈</th>
			<th>가격</th>
		</tr>
	</thead>
	<tbody>
	<%
		List<OrderDTO> list = (List<OrderDTO>)request.getAttribute("list");
	
		for(OrderDTO dto : list){ %>
			<tr><!-- a 태그를 쓰는 이유 : 이동할 때 사이즈 정보를 갖고 이동하기 위해서. -->
				<td><a href="view.jsp?name=<%=dto.getSize()%>"><%=dto.getSize() %></a></td> <%-- 절대로 띄워쓰기 xx => 아예 다른 링크가 됨. --%>
				<td><%=dto.getPrice() %></td>
			</tr>
		<%}
	%>
	</tbody>
</table>
</body>
</html>
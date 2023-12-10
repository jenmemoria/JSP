<%@page import="food.FoodDAO"%>
<%@page import="food.FoodDTO" %>
<%@page import="java.awt.print.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list.jsp</title>
</head>
<body>
<h1>매장, 음식 목록</h1>
<hr>

<p>
	<a href="add.jsp"><button>상점, 음식 순으로 추가</button></a>
</p>

<table border="1" cellpadding="10" cellspacing="0">
	<thead>
		<tr bgcolor="#dadada">
			<th>번호</th>
			<th>상점</th>
			<th>음식1</th>
			<th>음식2</th>
			<th>음식3</th>
		</tr>
	</thead>
	<tbody>
	
	<%
	// 처음에 실행했을 때 dao 값이 null이니까
	FoodDAO dao = (FoodDAO) application.getAttribute("dao");
	if(dao == null) {
		dao = new FoodDAO(); //일단 FoodDAO를 불러와서 dao를 생성한다.
		application.setAttribute("dao", dao);
	}
	for(FoodDTO dto : dao.selectList()) {
	%>
	<tr>
		<td><%=dto.getIdx() %></td>
		<td><a href="view.jsp?idx=<%=dto.getIdx()%>"><%=dto.getStore() %></a></td>
		<td><%=dto.getFood1() %></td>
		<td><%=dto.getFood2() %></td>
		<td><%=dto.getFood3() %></td>
	</tr>
	<% 
	}
	%>
	</tbody>
</table>
</body>
</html>
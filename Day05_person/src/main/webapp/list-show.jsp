<%@page import="person.PersonDTO"%>
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
		background-color: lightskyblue;
		cursor: pointer;
	}
	table a {
		display: block;
		text-decoration: none;
	}
</style>
</head>
<body>

<h1>person 목록</h1>
<hr>

<p>
	<a href="add-form.jsp"><button>추가</button></a>
</p>
<table border="1" cellpadding="10" cellspacing="0" width="500">
	<thead>
		<tr>
			<th>이름</th>
			<th>나이</th>
		</tr>
	</thead>
	<tbody>
<%
	List<PersonDTO> list = (List<PersonDTO>)request.getAttribute("list");

	for(PersonDTO dto : list){	%>
		<tr><!-- a 태그를 쓰는 이유는 이동할 때 이름의 정보를 갖고 이동하기 위해서. -->
			<td><a href="view.jsp?name=<%=dto.getName()%>"><%=dto.getName() %></a></td> <%-- 절대로 띄워쓰기 하지 말 것 => 전혀 다른 링크가 된댜 --%>
			<td><%=dto.getAge() %></td>
		</tr>
	<% }
%>
	</tbody>
</table>

</body>
</html>
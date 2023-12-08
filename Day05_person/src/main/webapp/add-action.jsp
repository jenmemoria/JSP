<%@page import="java.net.URLEncoder"%>
<%@page import="person.PersonDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>add-action.jsp</title>
</head>
<body>
<%--	add-action.jsp  --%>

<jsp:useBean id="paramDTO" class="person.PersonDTO" />
<jsp:setProperty property="*" name="paramDTO"/> <%-- param을 예약어로 썼기 때문에 param을 쓰면 안 된댜 --%>

<%-- EL 태그가 못하는 건, Attribute 등록하는 거랑 제어문을 못 쓴다. --%>
${personList.add(paramDTO) }

<%
// 	ArrayList<PersonDTO> personList = (ArrayList<PersonDTO>)application.getAttribute("personList");
// 	personList.add(param);
	
// 	response.sendRedirect("list.jsp"); 		// 각 객체를 고유식별할 값이 없으면 목록으로 이동
	String name = URLEncoder.encode(paramDTO.getName(), "UTF-8");
	response.sendRedirect("view.jsp?name=" + name);	// 이름으로 고유식별 가능하므로 단일조회로 이동가능
	// 단, 중복되는 이름이 없다는 가정하에 정상적으로 작동함.
	
%>
</body>
</html>
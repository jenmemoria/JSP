<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex05-action.jsp</title>
</head>
<body>

<%
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String adult = age >= 20 ? "성인" : "미성년자";
	
	String msg = String.format("%s님은 %d살이고, %s입니다.", name, age, adult);
	
	request.setAttribute("msg", msg);
// 	request.getRequestDispatcher("ex05-result.jsp").forward(request, response); // 자바 forward 쓰고 싶으면 이렇게 하기

%>

<jsp:forward page="ex05-result.jsp" />
</body>
</html>
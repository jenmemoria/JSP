<%@page import="ex06.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex07-show.jsp</title>
</head>
<body>

<h1>ex07-action에서 선택한 값 출력</h1>
<hr>

<img src="<%=((MemberDTO)request.getAttribute("dto")).getImgPath() %>">

<img src="${requestScope.dto.imgPath }"> <!-- 순서대로 pageContext -> request -> -->
<!-- 찾는 게 없으면 null로 출력되는 거 아니라 기본 참조값이 null이긴 한데,
EL 태그에서는 없으면 그냥 빈 문자열 전환 -->

<%-- EL 태그 --%>
<%-- 내장 객체에서 어트리뷰트의 값을 꺼내서 html 화면에 출력하고 싶을 때 ${} --%>

<img src="${dto.imgPath }" height="150"> <!-- 필드 이름을 바로 쓰면 get으로 자동 형변환 -->
</body>
</html>
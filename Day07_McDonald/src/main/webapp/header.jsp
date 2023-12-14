<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<jsp:useBean id="dao" class="mcdonald.McdonaldDAO" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Day07 - McDonald</title>
<style>
	a {
		text-decoration: none;
		color: inherit;
	}
	a:hover {
		text-decoration: none;
	}
	.frame {
		width: 900px;
		margin: 0 auto;
		border: 1px dashed red;
	}
	header {
		display: flex;
		justify-content: space-between;
	}
	nav > ul {
		display: flex;
		width: 300px;
		list-style: none;
		padding: 0;
	}
	nav > ul > li {
		flex: 1;
	}
	div.box {
		display: flex;
		flex-flow: wrap;
		margin: auto;
	}
	div.item {
		box-sizing: border-box;
		width: 200px;
		margin: 10px;
		padding: 10px;
		text-align: center;
	}
	div.detail {
		display: flex;
		flex-flow: column;
		justify-content: center;
		align-items: center;
		text-align: center; /*글자도 가운데로 하고 싶으면*/
	}
	div.sb {
		display: flex;
		justify-content: space-between;
		align-items: center;
	}
</style>
</head>
<body>

<header class="frame">
	<h1><a href="${cpath }">맥도날드</a></h1>
	<nav>
		<ul>
			<li><a href="${cpath }/list.jsp">전체</a></li> <!-- 서버에 배포했을 때는 이렇게 해야한댜. -->
			<li><a href="${cpath }/list.jsp?category=버거">버거</a></li>
			<li><a href="${cpath }/list.jsp?category=음료">음료</a></li>
		</ul>
	</nav>
</header>


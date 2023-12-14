<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<jsp:useBean id="dao" class="youtube.YoutubeDAO" /> <%-- 첫글자 대문자로 하면 객체로 생각하기 때문에 조심할 것 ! --%>

<style>
	a {
		text-decoration: none;
		color: inherit;
	}
	a:hover {
		text-decoration: none;
	}
	.frame {
		width: 1280px;
		margin: 0 auto;
		border: 1px dashed red;
	}
	header {
		display: flex;
		justify-content: space-between;
	}
	div.hamburger {
		width: 50px;
		margin-right: 0;
/* 		margin-left: 10px; */
	}
	header > input {
		margin-top: 25px;
		width: 1000px;
		height: 50px;
		border-radius: 20px 20px 20px 20px;
		justify-content: center;
		align-content: center;
	}
	nav > ul {
		justify-content: center;
		align-content: center;
		display: flex;
		width: 500px;
		list-style: none;
		padding: 0;
	}
	nav > ul > li {
		border: 1px solid grey;
		margin: 15px;
		padding: 0;
		width: auto;
		flex: 1;
		margin-top: 25px;
	}
	nav > ul > li > a {
		border: 1px solid grey;
 		width: auto;
		background-color: lightgrey;
		padding: 2px;
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
	.logo {
		display: flex;
	}
	div.logo > img {
		width: 10px;
 		margin: 10px; 
	}
	
</style>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<header class="frame">
	<div class="logo">
		<div class="hamburger"><h2>≡</h2></div>
		<h3>
			<a href="${cpath }">
			<img src="https://blog.kakaocdn.net/dn/c2yJ7I/btqwXeUM6jI/a3WrMGPo9vakaDzQWepkOK/img.jpg" height="60"></a>
		</h3>
	</div>
	<input type="text" placeholder="검색">
</header>
<nav class="frame">
		<ul>
			<li><a href="${cpath }/list.jsp">전체</a></li>
			<li><a href="${cpath }/list.jsp?category=음악">음악</a></li>
			<li><a href="${cpath }/list.jsp?category=요리 프로그램">요리 프로그램</a></li>
		</ul>
</nav>

</body>
</html>
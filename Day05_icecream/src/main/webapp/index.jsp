<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index.jsp</title>
<style>
	div.nav {
		width: 100%;
	}
	div.nav > ul {
		width: 900px;
		margin: auto;
		display: flex;
		justify-content: center;
		list-style: none;
		padding: 0;
	}
	div.nav > ul > li {
		text-align: center;
		flex: 1;
	}
	a {
		text-decoration: none;
		color: grey;
	}
	a:hover {
		color: black;
	}
	div.nav a {
		display: black;
	}
</style>
</head>
<body>

<h1>주문 페이지</h1>

<div class="nav">
	<ul>
		<li><a href="orderlist.jsp">주문하기</a></li>
	</ul>
</div>

<hr>

</body>
</html>
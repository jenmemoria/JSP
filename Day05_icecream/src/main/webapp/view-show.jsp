<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>view-show.jsp</title>
</head>
<body>

<h1>${dto.size } 주문 크게 보기</h1>
<hr>

<h3>${dto.size }는 ${dto.price }원 입니다.</h3>

<p>
	<a href="orderlist.jsp"><button>주문 목록</button></a>
	<a href="deleteorder.jsp?name${dto.size }"><button>주문 삭제</button></a>
	<!--  EL 태그를 쓰면 다운캐스팅 할 필요 없고, get으로 할 필요 없고 그대로 받으면 돼. -->
</p>
</body>
</html>
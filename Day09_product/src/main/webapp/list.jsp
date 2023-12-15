<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<section class="frame">
	<c:set var="list" value="${dao.selectList() }" />
	<div>
		<a href="${cpath }/add.jsp"><button>추가</button></a>
	</div>
	
	<div class="box">
		<c:forEach var="dto" items="${list }">

		<div class="name"><a href="${cpath }/view.jsp?idx=${dto.idx }">${dto.name }</a></div>
		<div class="price">${dto.price }원</div>
		</c:forEach>
	</div>
</section>
</body>
</html>
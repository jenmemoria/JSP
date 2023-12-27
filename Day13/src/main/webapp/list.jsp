<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<section class="frame">
	<c:set var="list" value="${dao.selectList() }" />
	<div>
		<a href="${cpath }/join.jsp"><bustton>회원가입</button></a>
	</div>
	
	<div class="box">
		<c:forEach var="dto" items="${list }">
		
		<div class="userid"><a href="${cpath }/login.jsp?idx=${dto.userid }">${dto.userid}</a></div>
		</c:forEach>
	</div>

</section>
</body>
</html>
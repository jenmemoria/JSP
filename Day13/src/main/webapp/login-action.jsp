<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<section>
	<c:set var="dto" value="${dao.selectOne(param.userid) }" />
	
	<div class="view">
	<h3>${dto.name }님의 id는 ${dto.userid }입니다.</h3>
	</div>
</section>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<c:set var="dto" value="${dao.selectOne(param.idx) }" />

<section class="frame">
	<form action="modify-action.jsp">
		<input type="hidden" name="idx" value="${dto.idx }">
		<p>
			<label><input type="radio" name="category" ${dto.category == '음악' ? 'checked' : ''} value="음악" required>음악</label>
			<label><input type="radio" name="category" ${dto.category == '요리 프로그램' ? 'checked' : ''} value="요리 프로그램" required>요리 프로그램</label>
		</p>
		<p><input type="text" name="title" placeholder="영상이름" value="${dto.title }" required></p>
		<p><input type="text" name="title" placeholder="채녈명" value="${dto.chname }" required></p>
		<p><input type="text" name="title" placeholder="썸네일" value="${dto.thumbnail }" required></p>
		<p><input type="text" name="title" placeholder="태그" value="${dto.tag }" required></p>
		<p><input type="submit"></p>
	</form>
</section>
</body>
</html>
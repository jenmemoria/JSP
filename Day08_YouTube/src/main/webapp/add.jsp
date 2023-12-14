<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<section class="frame">
	<h3></h3>
	
	<form action="add-action.jsp">
		<p>
			<label><input type="radio" name="category" value="음악" required>음악</label>
			<label><input type="radio" name="category" value="요리 프로그램" required>요리 프로그램</label>
		</p>
		<p><input type="text" name="title" placeholder="동영상 제목" required></p>
		<p><input type="text" name="chname" placeholder="채널명" required></p>
		<p><input type="text" name="thumbnail" placeholder="썸네일" required></p>
		<p><input type="text" name="tag" placeholder="태그" required></p>
		<p><input type="submit"></p>
	</form>
</section>
</body>
</html>
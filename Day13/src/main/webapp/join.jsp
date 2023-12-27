<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<section>
	<form action="join-action.jsp">
		<p><input type="text" name="userid" placeholder="아이디 입력"></p>
		<p><input type="password" name="userpw" placeholder="비밀번호 입력"></p>
		<p><input type="text" name="username" placeholder="이름"></p>
		<p>
			<label><input type="radio" name="gender" value="남성" required>남성</label>
			<label><input type="radio" name="gender" value="여성" required>여성</label>
		</p>
		<p><input type="text" name="email" placeholder="이메일 입력"></p>
		<p><input type="submit"></p>
	</form>
</section>
	
</body>
</html>
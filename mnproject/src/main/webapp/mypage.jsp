<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<main>
	<div class="gaundae">
		<div style="width: 80%;">
			<table style="text-align: center;
						  justify-content: center;
						  align-items: center;">
				<tr>
					<td>ID</td>
					<td>${login.userid }</td>
				</tr>
				<tr>
					<td>Password</td>
					<td><input type="password" name="userpw" value="${login.userpw }"></td>
				</tr>
				<tr>
					<td>Name</td>
					<td><input type="text" name="username" value="${login.username }"></td>
				</tr>
			</table>
		</div>
		<div class="myjb">
			<ul>
				<li><a href="${cpath }/logout.jsp"><button>로그아웃</button></a></li>
				<li><a href="${cpath }/withdraw.jsp">탈퇴하기</a></li>
			</ul>
		</div>
	</div>
</main>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02-action.jsp</title>
</head>
<body>

<%!
	String[] idArray = 		{"test", 	"admin", 	"itbank"};
	String[] pwArray = 		{"1234", 	"1", 		"it"};
	String[] nameArray = 	{"테스트",	"관리자",		"홍길동"};
	
	public String login(String userid, String userpw) {
		String name = null;
		for(int i = 0; i < 3; i++){
			if(idArray[i].equals(userid)) { // if안에 if은 중첩연산자 써도 ㄱㅊ
				if(pwArray[i].equals(userpw)){ // .앞에 nullpoint가 없는 거쪽으로 하면 nullpointexception 방지할 수 있댜.
					name = nameArray[i];
					break;
				}
			}
		}
		return name;
	}
%>

<%
	request.setCharacterEncoding("UTF-8");	// 메소드가 POST면 습관적으로 걸어놓기.
	
	String userid = request.getParameter("userid");
	String userpw = request.getParameter("userpw");
	
	String name = login(userid, userpw);
	
	if(name != null){
		session.setAttribute("login", name);		// 세션에 원하는 이름으로 객체를 저장한다.
		session.setMaxInactiveInterval(300);		// 세션의 최대 유효시간을 300초로 설정한다.
		
		response.sendRedirect("ex02-form.jsp");
	}
	
%>

<script>
	alert('일치하는 계정을 찾을 수 없습니다.')
	history.go(-1)	// history.back()
</script>
</body>
</html>
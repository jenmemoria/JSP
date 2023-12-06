<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02-action.jsp</title>
</head>
<body>
<!-- 여기서 주요 처리 -->
<h1>업다운 게임 처리</h1>
<hr>


<%! // 선언부 (미리 준비되어 있는 변수와 함수 유지된다.)
	Random ran = new Random();
	int cpu = ran.nextInt(100) + 1;
	int count = 0;
%>

<%
	if(request.getParameter("reset") != null){
		count = 0;
		cpu = ran.nextInt(100) + 1;
		response.sendRedirect("ex02-form.jsp");
		return;
		// 이후 코드를 수행하지 않는다.
	}

	// 입력받은 상태를 가정하고 코드를 진행할 수 있다.
	int user = Integer.parseInt(request.getParameter("user"));
	count++;
	String msg = "";
	
	if(user == cpu) {
		msg = String.format("정답. %d회만에 정답을 맞춤", count);
	}
	else if (user < cpu){
		msg = "UP (" + count + "회)";
	}
	else {
		msg = "DOWN (" + count + "회)";
	}
	
	String location = "ex02-form.jsp?msg=" + URLEncoder.encode(msg, "UTF-8");
	
	// 클릭하지 않아도 대상 페이지로 이동하도록 브라우저에게 명령하기
	// 화면에 출력할 내용이 있지만, 자바코드가 HTML보다 먼저 수행되기 때문에
	// 사용자는 HTML 태그를 볼 수 없다.
	// -> 처리를 전담하는 JSP는 사실 HTML 구문이 필요없다.
	response.sendRedirect(location);
%>
<%-- <a href="ex02-form.jsp?msg=<%=msg %>"> --%>
<!-- 	<button>입력으로 이동</button> -->
<!-- </a> -->
<!-- 여기서 a태그는 위에 response.send~때문에 필요없다. 여기서는 화면 구현을 안했자나 -->
</body>
</html>
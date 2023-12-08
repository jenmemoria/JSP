<%@page import="book.BookDTO"%>
<%@page import="book.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>view.jsp</title>
</head>
<body>

<h1>${dao.selectOne(param.idx).title }</h1>
<h2>
<%
	
	// "1" == 1 : true (자바스크립트에서는)
	// "1" == 1 : false (자바에서는 ㄴㄴ 래퍼런스랑 프리미티브 타입이잖어)
// 	((BookDAO)application.getAttribute("dao")).selectOne(
// 		Integer.parseInt(request.getParameter("idx"))		
// 	).getTitle()
	// application에 등록된 dao라는 이름의 객체를 불러온다.
	// Object 타입에서 BookDAO 타입으로 다운캐스팅 한다.
	// 불러온 dao의 selectOne을 호출한다.
	// 호출하면서 전달해야하는 인자는 파라미터에서 가져온다.
	// 불러온 dto의 title을 getter로 호출하여 화면에 출력한다.
	
	// 위에거 말고 다른 방법 (이때까지 배운 원래 하던대로)
	
	BookDAO dao = (BookDAO) application.getAttribute("dao");
    int idx = Integer.parseInt(request.getParameter("idx"));
    BookDTO dto = dao.selectOne(idx);

    request.setAttribute("dto", dto);
    request.getRequestDispatcher("view-show.jsp").forward(request, response);
%>
</h2>


</body>
</html>
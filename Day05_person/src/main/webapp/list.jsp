<%@page import="java.util.ArrayList"%>
<%@page import="person.PersonDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	/* list.jsp */
	// 전체 목록 보여주기
	// list를 attribute로 넣어두고, 대상을 참조하면서 프로그램 진행 및 데이터 저장
	List<PersonDTO> list = (List<PersonDTO>)application.getAttribute("personList");

	if(list == null){
		list = new ArrayList<>();
		application.setAttribute("personList", list);
	}
	
	request.setAttribute("list", list);	// 불러온 list를 request에 넣는다.
	request.getRequestDispatcher("list-show.jsp").forward(request, response);
%>

</body>
</html>
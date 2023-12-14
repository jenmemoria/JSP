<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%--
	update mcdonald
		set 
			name = ?,
			price = ?,
			imgName = ?,
			category = ?,
			memo = ?
		where
			idx = ?
 --%>
<jsp:useBean id="dto" class="youtube.YoutubeDTO" />
<jsp:setProperty property="*" name="dto"/>

<c:set var="row" value="${dao.update(dto) }" />
<h3>${row != 0 ? '수정 성공' : '수정 실패' }</h3>
<a href="${cpath }/view.jsp?idx=${dto.idx}"><button>상세페이지 보기</button></a>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<jsp:useBean id="dto" class="icecream.IcecreamDTO" />
<jsp:setProperty property="*" name="dto" />

<c:set var="row" value="${dao.update(dto) }" />
<h3>${row != 0 ? '수정 성공' : '수정 실패' }</h3>
<a href="${cpath }/view.jsp?idx=${dto.idx }"><button>상세페이지 보기</button></a>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<jsp:useBean id="dto" class="youtube.YoutubeDTO" />
<jsp:setProperty property="*" name="dto" />

<c:set var="row" value="${dao.insert(dto) }" />
<%-- c:set을 한 이유 : row값을 반환받으려고 --%>

<c:if test="${row != 0 }">
	<c:set var="idx" value="${dao.selectCurrSeq() }" />
	<c:redirect url="/view.jsp?idx=${idx }" />
</c:if>

<script>
	alert('추가 실패')
	history.back()
</script>

</body>
</html>
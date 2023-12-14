<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<section class="frame">
	<c:if test="${empty param.category }"> <%-- 파라미터의 자료형은 스트링 !!! --%>
		<c:set var="list" value="${dao.selectList() }"/>	
	</c:if>
	<c:if test="${not empty param.category }">
		<c:set var="list" value="${dao.selectListByCategory(param.category) }" />
	</c:if>
	
	<div>
		<a href="${cpath }/add.jsp"><button>추가</button></a>
	</div>
	
	<div class="box">
		<c:forEach var="dto" items="${list }">
		<div class="item">
			<div class="img">
			<!-- 여기서 씨패스 하는 이유는 내 컴퓨터에 저장된거에서 가져오는 거니까 -->
			<!-- 인터넷에서 주소 복사해서 가녀오면 그냥 바로 dto.~~ 박으면 돼 -->
			<a href="${cpath }/view.jsp?idx=${dto.idx }">
				<img src="${cpath }/image/${dto.imgName}" height="120"></a>
			</div>
			<div class="name">${dto.name }</div>
			<div class="price">${dto.price }원</div>
		</div>
		</c:forEach>
	</div>
</section>

</body>
</html>
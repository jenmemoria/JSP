<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<section class="frame">
	<c:set var="dto" value="${dao.selectOne(param.idx) }"/>
	
	<div class="detail">
		<div>${dto.tag }</div>
<%-- 		<div><img src="${dto.thumbnail }" height="300"></div> --%>
		<div><h3>${dto.title }</h3></div>
		<div><h4>${dto.chname }</h4></div>
	</div>
	
	<div class="sb">
		<div>
			<a href="${cpath }/list.jsp"><button>목록</button></a>
		</div>
		<div>
			<a href="${cpath }/modify.jsp?idx=${dto.idx }"><button>수정</button></a> <!-- 여기서는 dto말고 param으로 해도 된다. -->
			<a href="${cpath }/delete.jsp?idx=${dto.idx }"><button>삭제</button></a>
		</div>
	</div>

</section>

</body>
</html>
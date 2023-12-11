<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<h3>전체 목록</h3>
<c:set var="list" value="${dao.selectList() }" /> <%-- 지시자 include --%>
<table border="1" cellpadding="10" cellspacing="0">
	<thead bgcolor="#eee">
  		<tr>
    		<th>IDX</th>
    		<th>NAME</th>
    		<th>PNUM</th>
    		<th>AGE</th>
    		<th>FAVORIE</th>
  		</tr>
  	</thead>
  	<tbody>
  	<c:forEach var="dto" items="${list }">
  	<tr>
    	<td>${dto.idx }</td>
    	<td>${dto.name }</td>
    	<td>${dto.pnum }</td>
    	<td>${dto.age }</td>
    	<td>${dto.favorite }</td>
  	</tr>
  	</c:forEach>
  	</tbody>
  
</table>

</body> <!-- 하나의 파일로 나와서 여기서 닫을꺼니까 -->
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<h3>상세보기</h3>

<%-- <fieldset>
	<c:set var="dto" value="${boardDAO.selectOne(param.idx) }"/>
	<h4>${dto.title } | ${dto.writer } | ${dto.writeDate }</h4>
	<div><img src="${cpath }/reviewImage/${dto.image }"></div> <!-- reviewImage는 context 파일 새로운 변수에 경로로 c:upload로 지정되어 있으니까 -->
	<div><pre>${dto.content }</pre></div>
</fieldset>

<br>

<a href="${cpath }/board.jsp"><button>목록으로</button></a> --%>

<main>
   <c:set var="dto" value="${boardDAO.selectOne(param.idx) }"/>
   <table id="boardView">
      <tr>
         <td>${dto.idx} / ${dto.title } / ${dto.writer }</td>
      </tr>
      <tr>
         <td>조회수 : ${dto.viewCount }</td>
      </tr>
      <tr>
         <td>
            <c:if test="${not empty dto.image }">
               <img src="${cpath }/reviewImage/${dto.image}">
            </c:if>
            <pre>${dto.content }</pre>
         </td>
      </tr>
      <tr>
         <td>
            ${dto.ipaddr }에서 ${dto.writeDate }에 작성됨
         </td>
      </tr>
   </table>

   <div class="sb">
   
   </div>

</main>

</body>
</html>
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
	<details>
		<summary>이전 페이지 주소</summary>
		<h3>${header.referer }</h3>
	</details>
	<c:set var="row" value="${boardDAO.updateViewCount(param.idx) }" />
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
      		${dto.ipaddr }에서
      		<fmt:formatDate value="${dto.writeDate }" pattern="yyyy년 MM월 dd일 a hh시 mm분" />
      		에 작성됨.
      	</td>
      </tr>
   </table>

   <div class="sb">
   		<div>
   			<a href="${cpath }"><button>목록</button></a>
   		</div>
   		<div>
   			<c:if test="${dto.writer == login.userid }">
   				<a href="${cpath }/modify.jsp?idx=${dto.idx}"><button>수정</button></a>
   				<a class="deleteBtn"
				   idx="${dto.idx }"   					 
   				   href="${cpath }/delete.jsp?idx=${dto.idx}"><button>삭제</button></a>
   			</c:if>
   		</div>
   
   </div>

</main>

<script>
	// 문서 전체에서 a태그 중에서 클래스가 deleteBtn인 모든 요소를 nodeList 형태로 불러온다.
	const deleteBtnList = document.querySelectorAll('a.deleteBtn')
	
	// 이벤트 함수를 정의한다.
	const deleteHandler = function(event) {
		event.preventDefault()			// 이벤트 기본 작동을 막는다. (a의 기본작동 : 링크 페이지 이동)
		let target = event.target		// 이벤트 대상을 target에 저장한다. 값을 바꿔야하는 경우에만 let으로 한다.
		
		// 클릭된 요소의 클래스에 deleteBtn이 포함되어 있지 않다면 반복을 수행한다.
		while(target.classList.contains('deleteBtn') == false){ // if라고 봐도 된다.
			target = target.parentNode		// 현재 target의 상위 요소 (부모 노드)를 target에 저장한다.
		}
									
		const idx = target.getAttribute('idx')		// target의 idx를 저장한다. 문자열 형식으로 들고온다.
		const url = target.href						// target의 href를 저장한다.
		const flag = confirm(idx + '번 게시글을 삭제하시겠습니까?')		// 사용자에게 확인 / 취소 불가
		if(flag) {						// 만약, 확인을 클릭했으면
			location.href = url			// 브라우저의 주소창을 <a href="">의 값으로 변경한다. (페이지 이동)
		}	
	}
	
	// 3) deleteBtnList의 모든 요소를 element라고 할 때, element를 클릭하면 deleteHandler가 실행되도록 연결한다.
	deleteBtnList.forEach(element => element.onclick = deleteHandler)
	
	// HTML 하나하나는 객체다. 
	// 스크립트는 함수를 필드를 저장할 수 있다.
</script>

</body>
</html>
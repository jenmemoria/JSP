<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<div class="introBanner">
    <h2>BAEKPERCENT</h2>
    <h4>BAEKPERCENT INTRODUCTION</h4>
</div>
<section class="frame">
    <div>
         <div class="subNav">
             <ul>
                 <li><a href="">백퍼센트 소식</a></li>
                 <li style="background-color: #907054;"><a href="" style="color: white;">고객의 소리</a></li>
                 <li><a href="">이벤트</a></li>
             </ul>
         </div>
         <p class="nmeh3 idfont1">
         고객의 소리
         </p>
         <div class="sb52">
         	<p>
         	백퍼센트커피는 고객님들의 행복하고 가치있는 경험을 위해 정성을 다하고 있습니다.<br>
         	이용하시면서 불편하시거나 개선이 필요한 점을 알려주시면 더 좋은 서비스로 보답해드릴 수 있도록 하겠습니다.
         	</p>
         	<form method="POST" action="soc-action.jsp" enctype="multipart/form-data">
         		<div class="hpage">
         			<input type="text" name="title" placeholder="제목">
         		</div>
         		<div class="spage">
         			<textarea id="story" name="content" placeholder="내용"></textarea>
         		</div>
         		<div class="sbfind">
         			<input type="file" name="uploadFile" accept="image/png, image/jpeg">
         		</div>
         		<div class="persn">
         			<p class="psp52">개인정보처리방침</p>
         			<textarea readonly style="height: 80px; color: #999; font-size:14px;"
         						class="personal">
수집하는 개인정보 항목
상담, 서비스 신청 등을 위해 아래와 같은 개인정보를 수집하고 있습니다.
수집항목 : 이름, 연락처, 상담내용, 첨부파일
개인정보 수집방법 : 홈페이지(온라인 상담신청
개인정보의 수집 및 이용목적은 수집한 개인정보를 다음의 목적을 위해 활용합니다.
회원 관리
서비스 이용에 따른 본인확인 , 개인 식별 , 고지사항 전달, 불량회원의 부정 이용
방지와 비인가 사용 방지
개인정보의 보유 및 이용기간
개인정보는 수집 및 이용에 관한 동의일로부터 위 이용목적을 위하여 최대 3년간 보유,
이용됩니다.
동의하지 않는 경우의 처리
고객은 개인정보제공에 동의하지 않을 권리가 있습니다. 다만 필수정보의 수집 , 이용에
동의하지 않는 경우 상담에 제한이 있을 수 있습니다.
개인정보에 관한 민원서비스
회사는 고객의 개인정보를 보호하고 개인정보와 관련한 불만을 처리하기 위하여 아래와
같이 개인정보관리 책임자를 지정하고 있습니다.
신속하게 충분한 답변을 드리겠습니다.
            
         			</textarea>
         				<div class="checkbox">
         					<input type="checkbox" value="1" name="agree" id="agree" style="width:20px;" required>
         					&nbsp;
         					<label style="font-size : 14px; color: #999;">개인정보처리방침을 읽었으며 내용에 동의합니다.</label>
         				</div>
         			</div>
         			<p style="margin-top: 20px;
         					  font-size: 14px;
         					  color: #999;">
         			보내주신 의견은 담당자가 확인 후 답변을 드리겠습니다.
         			</p>
         			<div class="s61_c3">
         				<p><input type="submit" value="작성완료"></p>
         			</div>
         		<input type="hidden" name="writer" value="${login.userid }">
         	</form>
         </div>
         
         <h3>내가 쓴 글</h3>
		<table id="boardList">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>조회수</th>
					<th>날짜</th>
				</tr>
			</thead>
			<c:set var="list" value="${boardDAO.selectListByWriter(login.userid) }" />	
			<c:forEach var="dto" items="${list }">
				<tr>
					<td>${dto.idx }</td>
					<td>
						<a href="${cpath }/view.jsp?idx=${dto.idx}">
						${dto.title }
						${not empty dto.image ? '💾': '' }
						</a>
					</td>
					<td>${dto.writer }</td>
					<td>${dto.viewCount }</td>
					<td>${dto.writeDate }</td>
				</tr>		
			</c:forEach>
		</table>
    </div>
</section>


























</body>
</html>
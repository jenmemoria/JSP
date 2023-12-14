<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01.jsp</title>
</head>
<body>

<h1>EL Tag 연산자</h1>
<hr>

<h3>EL Tag에서는 + 연산이 오직 숫자형태로만 처리된다 (문자열 더하기 불가능)</h3>
<h3>EL Tag에서는 값이 null이면 출력하지 않는다</h3>
<h3>EL Tag에서는 null 여부를 체크하기 위해 empty 연산을 이용한다</h3>
<%--value에 문자 넣으면 오류남! --%>

<c:set var="s1" value="123" />
<c:set var="s2" value="11" />
<%=pageContext.getAttribute("s1").getClass().getSimpleName() %>

<c:set var="s3" value="Hello"/>
<c:set var="s4" value="world"/>
<p>${s3 }${s4 }</p>

<table border="1" cellpadding="10" cellspacing="0">
   <tr>
      <th colspan="2">산술 연산</th>
   </tr>
   <tr>
      <td>\${s1 + s2 }</td>
      <td>${s1 + s2 }</td>
   </tr>
   <tr>
      <td>\${s1 - s2 }</td>
      <td>${s1 - s2 }</td>
   </tr>
   <tr>
      <td>\${s1 * s2 }</td>
      <td>${s1 * s2 }</td>
   </tr>
   <tr>
      <td>\${s1 / s2 }</td>
      <td>
         ${s1 / s2 }<br>
         ${Integer.valueOf(s1 / s2) }
      </td>
   </tr>
   <tr>
      <td>\${s1 % s2 }</td>
      <td>
         ${s1 % s2 }<br>
         ${s1 mod s2 } <!-- mod 연산자가 여기서 있댱 -->
      </td>
   </tr>
   <tr>
      <th colspan="2">비교 연산</th>
   </tr>
   <tr>
      <td>
         \${s1 > s2 }<br>
         \${s1 gt s2 }
         <!--  greater than -->
         <!-- gt, ge는 예약어 -->
      </td>
      <td>
         ${s1 > s2 }<br>
         ${s1 gt s2 }
      </td>
   </tr> 
   <tr>
      <td>
         \${s1 >= s2 }<br>
         \${s1 ge s2 }
         <!-- greater equal -->
      </td>
      <td>
         ${s1 >= s2 }<br>
         ${s1 ge s2 }
      </td>
   </tr> 
   <tr>
      <td>
         \${s1 < s2 }<br>
         \${s1 lt s2 }
         <!-- less than -->
      </td>
      <td>
         ${s1 < s2 }<br>
         ${s1 lt s2 }
      </td>
   </tr> 
   <tr>
      <td>
         \${s1 <= s2 }<br>
         \${s1 le s2 }
         <!-- less equal -->
      </td>
      <td>
         ${s1 <= s2 }<br>
         ${s1 le s2 }
      </td>
   </tr> 
   <tr>
      <td>
         \${s1 == s2 }<br>
         \${s1 eq s2 }
      </td>
      <td>
         ${s1 == s2 }<br>
         ${s1 eq s2 }
      </td>
   </tr> 
   <tr>
      <td>
         \${s1 != s2 }<br>
         \${s1 ne s2 }
      </td>
      <td>
         ${s1 != s2 }<br>
         ${s1 ne s2 }
      </td>
   </tr> 
   <tr>
   	<th colspan="2">논리 연산</th>
   </tr>
   <tr>
      <td>
         \${true and true }<br>
         \${true && true }
      </td>
      <td>
         ${true and true }<br>
         ${true && true }
      </td>
   </tr> 
   <tr>
      <td>
         \${true or true }<br>
         \${true || true }
      </td>
      <td>
         ${true or true }<br>
         ${true || true }
      </td>
   </tr>
   <tr>
      <td>
         \${not true }<br>
         \${!true }
      </td>
      <td>
         ${not true }<br>
         ${!true }
      </td>
   </tr>
   <tr>
   	<th colspan="2">null 체크</th>
   </tr>
   <tr>
   		<td>
   			\${empty param.name }<br>
   			\${not empty param.name }
   		</td>
   		<td>
   			${empty param.name }<br>
   			${not empty param.name }
   		</td>
   </tr>
   <tr>
   	<th colspan="2">삼항 연산자</th>
   </tr>
   <tr>
		<td>
			\${empty sessionScope.login ? "로그인" : "로그아웃" }
		</td>
   		<td>
   			<button>${empty sessionScope.login ? "로그인" : "로그아웃" }</button>
   			<!-- EL 태그는 항상 출력용이다. -->
   		</td>
   </tr>
</table>

<h4>${not empty s1 and s1 >= 20 }</h4>
<br>

<h4><%=request.getParameter("test") %></h4>
<h4>EL Tag : ${param.test }</h4> <!-- EL Tag는 Null을 출력하지 않는다. -->
<!-- getAttribute의 반환형은 객체. null 출력을 안한다. -->

<h4>\${test2.hello() } : ${test2.hello() }</h4> <!-- 원래 자바였다면 .앞에 null이 올 수 없다. 
원래 자바였다면 nullpointexception이 터짐. 근데 여기서는 예외가 터지지 않는다. 제일 조심 -->
</body>
</html>
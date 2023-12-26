<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02.jsp</title>
<style>
	.white{
		background: white;
		color: black;
	}
	.black {
		background-color: black;
		color: #dadada;
	}
	.lime {
		background-color: black;
		color: #00FF00;
	}
	.aqua {
		background-color: black;
		color: #00FFFF;
	}
	.orange {
		background-color: black;
		color: orange;
	}
	pre {
		font-size: 16px;
	}
</style>
</head>
<body class="${cookie.theme.value }">

<h1>쿠키를 활용한 색상 테마 설정</h1>
<form action="ex02-action.jsp">
	<select name="theme">
		<option>white</option>
		<option ${cookie.theme.value == 'black' ? 'selected' : '' }>black</option>
		<option ${cookie.theme.value == 'lime' ? 'selected' : '' }>lime</option>
		<option ${cookie.theme.value == 'aqua' ? 'selected' : '' }>aqua</option>
		<option ${cookie.theme.value == 'orange' ? 'selected' : '' }>orange</option>
	</select>
	<input type="submit">
</form>

<fieldset>
	<legend>lorem</legend>
	<pre>
	연말 극장가를 달구고 있는 주인공 '노량: 죽음의 바다'를 연출한 김한민 감독이 26일 밤 12시 10분 SBS '나이트라인'에 출정한다. 
	'명량', '한산: 용의 출현', '노량: 죽음의 바다'에 이르기까지 지난 10년 간의 여정을 근성으로 마무리한 김한민 감독의 열정에 대해, 
	뉴스에서 이야기를 나눌 예정이다.
	특히 한국 영화 사상 전례 없는 도전이었던 대형 해전의 가능성을 보여준 '명량', 
	물 없이 배를 띄우는 VFX 기술에 성공한 '한산: 용의 출현', 
	동아시아 해전 역사간 손에 꼽히는 큰 규모의 해전이었던 노량해전을 그린 '노량: 죽음의 바다'까지 
	오직 이순신만을 생각한 김한민 감독의 지난 세월에 대해 솔직한 인터뷰로 시청자들과 만날 계획. 
	관객들의 뜨거운 반응이 일고 있는 개봉 2주차 뉴스 출연이라, 더욱 풍부한 이야기를 나눌 수 있을 것으로 보인다.
	</pre>
	
</fieldset>

<div>
	<button id="checkCookie">쿠키 확인</button>
</div>

<script>
	checkCookie.onclick = function() {
		alert(document.cookie)
	}
</script>

</body>
</html>
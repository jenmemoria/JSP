<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.*, board.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<c:set var="memberDAO" value="${MemberDAO.getInstance() }" />

<%	request.setCharacterEncoding("UTF-8"); %>
<%	response.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#header {
		border-bottom: 1px solid rgba(160, 160, 160, 0.2);
	}
	body {
		margin: 0;
		padding: 0;
	}
	.frame {
		width: 1200px;
		margin: 0 auto;
	}
	.sb {
		display: flex;
		justify-content: space-between;
	}
	.center {
		display: flex;
		justify-content: center;
		align-items: center;
	}
	a {
		text-decoration: none;
		color: inherit;
	}
	div.top {
		border: 2px dashed green;
		display: flex;
		max-width: 900px;
		justify-content: center;
	}
	div.top > ul {
		padding: 0;
		margin: 0;
		list-style: none;
		flex: 7;
		font-fmaily: 'KoreanBR5-B';
		font-weight: 500;
	}
	div.top > ul.sb > li {
		position: relative;
		padding-top: 10px;
		padding-bottom: 20px;
	}
	div.top > ul.sb > li > ol {
		position: absolute;
		top: 110px;
		left: -10px;
		width: 150px;
		list-style: none;
		padding: 0;
		padding-top: 20px;
		/*padding-left: 10px;*/
		border: 1px solid blue;
		background-color: #fafafa;
		z-index: 2;
		display: none;
		
		padding-bottom: 20px;
		/* border-bottom: 2px solid black; */
	}
	div.top > ul.sb > li > ol {
		
	}
	div.top > ul.sb > li:hover > ol {
		display: block;
	}
	div.top > ul.sb > li > ol > li {
		padding: 8px;
		text-align: center;
		justify-content: center;
		align-items: center;
	}
	div.marker {
		/* background-color: #dadada;
		border-top: 1px solid green;
		border-bottom: 1px solid lightgreen; */
		width: 30px;
		height: 10px;
		position: absolute;
		top: 40px;
		left: 25px;
		transform: rotateY(45deg) retate(45deg);
	}
	div.banner {
		height: 660px;
		width: 100%;
		margin: 0 auto;
		background-image: url('http://www.tenpercentcoffee.com/images/visual2.png');
		background-size: cover;
		background-repeat: no-repeat;
		display: inline-block;
		position: relative;
	}
	p {
		margin: 0;
		padding: 0;
		word-break: break-all;
	}
	p.youp {
		margin: 0;
		position: absolute;
		top: 50%;
		left: 50%;
		transform: translate(-80%, -130%);
		font-size: 50px;
	}
	.idfont1 {
		font-family: 'KoreanBRS-B';
	}
	ul.gnb > a {
		padding: 25px 20px;
		margin: 0 10px;
	}
/* 	div.bansajin > img { */
/* 		width: 100%; */
/* 	} */
	/* div.visual > img{
		position: absolute;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
		margin: 0;
	}
	img {
		vertical-align: middle;
		font-size: 1em;
	} */
	div.gaundae {
		text-align: center;
		align-items: center;
		justify-content: center;
	}
	div.myjb > ul {
		list-style: none;
	}
	div.myjb > ul > li > a {
		text-decoration: none;
	}
	
	.home {
		background-image: url('http://www.tenpercentcoffee.com/images/background.png');
		height: auto;
		background-size: 100% 100%;
		background-repeat: no-repeat;
		background-position: center;
		
	}
	.sect_wrap {
		width: 1200px;
		margin: auto;
		display: flex;
	}
	.svcal1 {
		padding-left: 10px;
		padding-top: 250px;
	}
	.svcal1 p.big {
		font-weight: bold;
		font-size: 45px;
		line-height: 60px;
		/* position: relative; */
	}
	.svcal1 p.sma {
		font-size: 18px;
		margin-top: 120px;
		color: #555;
	}
	.svcal1 .mbtn {
		width: 120px;
		height: 50px;
		font-size: 16px;
		background-color: inherit;
		color: #917056;
		line-height: 50px;
		text-align: center;
		display: block;
		border: 2px solid #917056;
		margin-top: 40px;
		border-radius: 5px;
	}
	div.svcal2 {
		position: relative;
		padding-left: 100px;
		padding-top: 200px;
	}
	div.salted {
		position: absolute;
		top: 50%;
		left: 20%;
		
	}
	div.salted > img {
		width: 154px;
	}
	div.milk {
		position: absolute;
		top: 50%;
		left: 50%;
	}
	.milk h3 {
		font-size: 30px;
		font-weight: 600;
		color: #fff;
		margin-bottom: 25px;
	}
	.milk p {
		font-size: 14px;
		color: #eee;
		margin-bottom: 50px;
		line-height: 22px;
	}
	.milk span {
		width: 100px;
		height: 45px;
		line-height: 45px;
		background-color: inherit;
		border: 1px solid #fff;
		text-align: center;
		border-radius: 5px;
		color: #fff;
		display: block;
		margin-top: 20px;
	}
	/* 배너 서브네비 끝*/
	.infoText1 {
            margin: 0 0 50px 0;
            text-align: left;
            font-size: 50px;
            color: #907054;
            font-weight: bold;
        }
       .infoText2 {
           text-align: left;
           font-style: 16px;
           color: #555555;
           font-weight: bold;
           margin: 0;
       }
       div.introBanner {
           height: 600px;
           margin-bottom: 0;
           width: 100%;
           background-image: url(http://www.tenpercentcoffee.com/images/sub-banner01.png);
           background-repeat: no-repeat;
           text-align: center;
           background-size: cover;
       }
       div.subTitle {
           text-align: center;
           align-items: center;
       }
       div.introBanner > h2 {
           font-size: 48px;
           color: white;
           margin: 0px;
           padding-top: 250px;
          
       }
       div.introBanner > h4 {
           margin: 0px;
           font-size: 30px;
           color: #D4B886;
       } 

       div.subNav {
           text-align: center;
           margin-top: 0px;
       }
       div.subNav > ul {
           display: flex;
           list-style: none;
           align-items: center;
           margin: 0 26% 100px 26%; /* 좌우조정 */
       }
       div.subNav > ul > li > a {
           text-decoration: none;
           color: #555555;
       }
       div.subNav > ul > li {
           padding: 15px 30px;
           font-size: 18px;
           font-weight: bold;
       }
       div.subNav > ul > li:hover {
           border-bottom: 4px solid #907054;
           height: 20px;
       }
 /* 배너 서브네비 끝*/
 		.nmeh3 {
 			font-size: 30px;
 			text-align: center;
 			margin-top: 150px;
 			margin-bottom: 25px;
 		}
		.nmeh3::after {
			content:'';
			display: block;
			width: 2px;
			height: 100px;
			background-color: #907054;
			margin: auto;
			margin-top: 50px;
		}
		.sb52 p:first-child {
			font-size: 16px;
			text-align: center;
			color: #555;
			margin-top: 50px;
		}
		.selc52 {
			margin-top: 50px;
		}
		.selc52 div {
			margin-right: 20px;
			float: left;
		}
		.selc52 div select {
			height: 40px;
			border-radius: 10px;
			border: 1px solid #ccc;
			line-height: 40px;
		}
		select {
			margin: 0;
		}
		.hpage {
			margin-top: 20px;
		}
		.hpage input {
			height: 40px;
			width: 100%;
			border-radius: 10px;
			border: 1px solid #ccc;
			padding-left: 20px;
		}
		.spage {
		margin-top: 20px;
		}
		.spage textarea {
			height: 150px;
			width: 100%;
			border-radius: 10px;
			border: 1px solid #ccc;
			padding: 20px;
		}
		.sbfind {
			margin-top: 20px;
		}
		.sbfind input {
			height: 40px;
			width: 100%;
			border-radius: 10px;
			border: 1px solid #ccc;
			line-height: 40px;
			padding-left: 20px;
		}
		.persn p.psp52 {
			margin-top: 20px !important;
			margin-bottom: 20px;
			color: #555 !important;
			font-size: 14px !important;
			text-align: left !important;
		}
		.personal {
			width: 50%;
		}
		.s61_c3 p input {
			border-radius: 10px;
			color: #fff !important;
			width: 150px;
			height: 50px;
			line-height: 50px;
			font-weight: bold;
			background-color: #907054;
			margin: 0 auto;
			margin-bottom: 70px;
		}
		
</style>
</head>
<body>

<header id="header">
	<div class="top frame sb">
		<ul class="sb gnb">
			<li class="center">
				<a href="">BAEKPERCENT</a>
				<ol>
					<div class="marker"></div>
					<li><a href="">백퍼센트커피 소개</a></li>
					<li><a href="">백퍼센트커피 BI</a></li>
					<li><a href="">찾아오시는길</a></li>
				</ol>
			</li>
			<li class="center">
				<a href="">MENU</a>
				<ol>
					<div class="marker"></div>
					<li><a href="">신메뉴</a></li>
					<li><a href="">커피</a></li>
					<li><a href="">음료/티</a></li>
					<li><a href="">디저트</a></li>
					<li><a href="">MD</a></li>
				</ol>
			</li>
			<li class="center">
				<a href="">FRANCHISE</a>
				<ol>
					<div class="marker"></div>
					<li><a href="">백퍼센트 경쟁력</a></li>
					<li><a href="">가맹점 상담신청</a></li>
					<li><a href="">가맹점 개설절차</a></li>
					<li><a href="">가맹점 개설비용</a></li>
					<li><a href="">가맹문의 Q&A</a></li>
				</ol>
			</li>
			<li class="center">
				<a href="${cpath }"><img src="http://www.tenpercentcoffee.com/images/logo.png"></a>
			</li>
			<li class="center">
				<a href="">NEWS</a>
				<ol>
					<div class="marker"></div>
					<li><a href="">백퍼센트 소식</a></li>
					<li><a href="">이벤트</a></li>
				</ol>
			</li>
			<li class="center">
				<a href="">CUSTOMER</a>
				<ol>
					<div class="marker"></div>
					<c:if test="${empty login }">
						<li><a href="${cpath }/login.jsp">고객의 소리</a></li>
					</c:if>
					<c:if test="${not empty login }">
						<li><a href="${cpath }/soc.jsp">고객의 소리</a></li>
					</c:if>
					
				</ol>
			</li>
			<li class="center">
				<c:if test="${empty login }">
					<a href="${cpath }/login.jsp">LOGIN</a>			
				</c:if>
				<c:if test="${not empty login }">
					<a href="${cpath }/mypage.jsp">MYPAGE</a>
				</c:if>
			</li>
		</ul>
		
	</div>
</header>

</body>
</html>
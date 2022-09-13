<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="../css/main.css">
 <!-- 햄버거 아이콘 -->
<script src="https://kit.fontawesome.com/017b0b67ba.js" crossorigin="anonymous"></script>
<!-- 헤더 js파일 햄버거바작동 -->
 <script src="../main/main.js" defer></script> 
<!-- 구글 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
</head>
<body>
<div id="wrap">
<!-- 헤더가 들어가는 곳 -->
	<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더가 들어가는 곳 -->

	<h1>오시는길</h1>
	<div class="grid-come">
<!-- 오는길 지도 -->
		<div class="map">
			<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3264.246405717324!2d129.01432361560128!3d35.100557569204476!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3568e9bb77a713f7%3A0x4b474cf3e5bd5632!2z67aA7IKw6rSR7Jet7IucIOyEnOq1rCDtlbTrj4vsnbTroZwgMjcy!5e0!3m2!1sko!2skr!4v1657801573325!5m2!1sko!2skr" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
		</div>
 
	
		<div class="map"> 주소 : 부산광역시 서구 해돋이로 272<br>
		<b>1호선 토성역 6번 출구에서 300m</b> </div>
		
     


	</div> 
<!-- 내용 -->
<!-- 본문 들어가는 곳 -->

<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터 들어가는 곳 -->
</div>
</body>
</html>



    
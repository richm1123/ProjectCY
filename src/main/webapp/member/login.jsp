<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
  <meta charset="UTF-8">
   <title>login</title>
	<script src="../main/main.js" defer></script> <!-- 헤더 js파일 -->
    <link rel="stylesheet" href="../css/main.css"> <!-- 메인 css 파일 -->
   <link rel="stylesheet" href="../css/join.css"> <!-- 회원가입 css파일 --> 
    <link rel="stylesheet" href="../css/login.css"> <!-- 보드 css파일 -->
<!--    <link rel="stylesheet" href="../css/board.css"> 보드 css파일 -->
    <script src="https://kit.fontawesome.com/017b0b67ba.js" crossorigin="anonymous"></script><!-- 햄버거 아이콘 -->
<!-- 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jua&family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

 </head>
 <body>
  <div id="wrap">
<!-- 헤더들어가는 곳 -->
	<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더들어가는 곳 -->
<!-- 본문내용 -->
  <div class="lmain-container">
	<h1>Login</h1>
	 <form action="loginPro.jsp" id="join" method="post">

		<label>사용자 ID</label>
	 		<input type="text" name="id"><br>
		<label>비밀번호</label>
	  		<input type="password" name="pass"><br>


		<div id="buttons">
			<input type="submit" value="로그인" class="submit">
			<input type="reset" value="취소" class="cancel">
		</div>
	</form>
  </div>
<!-- 푸터들어가는 곳 -->
<footer>
<jsp:include page="../inc/bottom.jsp"></jsp:include>
</footer>
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>
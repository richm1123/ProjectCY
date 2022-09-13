<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>gwrite</title>
<link rel="stylesheet" href="../css/main.css">
<link rel="stylesheet" href="../css/write.css">
<!-- <link rel="stylesheet" href="../css/board.css"> -->
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
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 메인이미지 -->
<div id="sub_img_center"></div>
<!-- 메인이미지 -->

<!-- 왼쪽메뉴 -->

<%
String id=(String)session.getAttribute("id");
// 세션값이 없으면 login.jsp 이동
if(id==null){
	response.sendRedirect("../member/login.jsp");
}
%>

	<h1>명리학 이야기</h1>
	<div class="contain-board">
		<form action="gwritePro.jsp" method="post" enctype="multipart/form-data">
		<input type="hidden" name="pass" value="1234">
			<table id="notice">
				<tr><td>글쓴이</td><td><input type="text" name="name" value="<%=id %>" readonly></td></tr>
				<tr><td>제목</td><td><input type="text" name="subject"></td></tr>
				<tr><td>파일</td><td><input type="file" name="file"></td></tr>
				<tr><td>내용</td><td><textarea name="content" rows="10" cols="20"></textarea></td></tr>
			</table>
	
		<div id="table_search">
		<input type="button" value="글목록" class="btn" style="cursor: pointer"
 		 onclick="location.href='gnotice.jsp'">
 		 <input type="submit" value="글쓰기" class="btn" style="cursor: pointer">
		</div>
		</form>
	</div>

<!-- 게시판 -->
<!-- 본문들어가는 곳 -->

<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>
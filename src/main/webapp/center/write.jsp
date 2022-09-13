<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>center/write.jsp</title>
<link rel="stylesheet" href="../css/write.css">

</head>
<body>
	<div id="wrap">
<!-- 헤더들어가는 곳 -->
		<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->


<%
String id=(String)session.getAttribute("id");
// 세션값이 없으면 login.jsp 이동
if(id==null){
	response.sendRedirect("../member/login.jsp");
}
%>

	<h1>글쓰기</h1>
	<div class="contain-board">
	  <form action="wirtePro.jsp" method="post">
		<input type="hidden" name="pass" value="1234">
		<table id="notice">
			<tr><td>글쓴이</td><td><input type="text" name="name" value="<%=id %>" readonly></td></tr>

			<tr><td>제목</td><td><input type="text" name="subject"></td></tr>
			<tr><td>내용</td><td><textarea name="content" rows="10" cols="20"></textarea></td></tr>
		</table>

		<div id="table_search">
			<input type="button" value="글목록" class="btn" style="cursor: pointer"
  				onclick="location.href='notice.jsp'">
  			<input type="submit" value="글쓰기" class="btn" style="cursor: pointer">
		</div>
	  </form>
	</div>






<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>
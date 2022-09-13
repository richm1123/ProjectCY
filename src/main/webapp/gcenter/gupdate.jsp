<%@page import="board.gBoardDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>center/write.jsp</title>
<link rel="stylesheet" href="../css/main.css">
<link rel="stylesheet" href="../css/write.css">
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더들어가는 곳 -->

<%
String id=(String)session.getAttribute("id");
// 세션값이 없으면 login.jsp 이동
if(id==null){
	response.sendRedirect("../member/login.jsp");
}
int num=Integer.parseInt(request.getParameter("num"));
// BoardDAO 객체 생성
gBoardDAO boardDAO=new gBoardDAO();
// getboard
BoardDTO boardDTO=boardDAO.getboard(num);

%>

<h1>글수정</h1>
<div class="contain-board">
<form action="gupdatePro.jsp" method="post">
<input type="hidden" name="num" value="<%=boardDTO.getNum()%>">
<table id="notice">
<tr><td>글쓴이</td><td><input type="text" name="name" value="<%=id %>" readonly></td></tr>
<tr><td>제목</td><td><input type="text" name="subject" value="<%=boardDTO.getSubject()%>"></td></tr>
<tr><td>내용</td><td><textarea name="content" rows="10" cols="20"><%=boardDTO.getContent() %></textarea></td></tr>

</table>

<div id="table_search">
 <input type="submit" value="글수정" class="btn" style="cursor: pointer" >
<input type="button" value="글목록" class="btn" style="cursor: pointer"
  onclick="location.href='gnotice.jsp'">

</div>
</form>


<div class="clear"></div>
<div id="page_control">

</div>
</div>
<!-- 게시판 -->

<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터들어가는 곳 -->
</div>

</body>
</html>
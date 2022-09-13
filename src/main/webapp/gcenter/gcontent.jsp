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
<title>gcontent</title>
<script src="join.js" defer></script> <!-- 회원가입 js파일 -->
   <script src="../main/main.js" defer></script> <!-- 헤더 js파일 -->
   <link rel="stylesheet" href="../css/main.css"> <!-- 메인 css 파일 -->
<!--    <link rel="stylesheet" href="../css/join.css"> 회원가입 css파일   -->
   <link rel="stylesheet" href="../css/cont.css"> <!-- content css파일   -->
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
<!-- 본문들어가는 곳 -->
<!-- 게시판 -->

<%
// int num파라미터 가져오기
int num=Integer.parseInt(request.getParameter("num"));
// BoardDAO객체 생성
gBoardDAO boardDAO = new gBoardDAO();


// BoardDTO boardDTO = getBoard(num)메서드 호출
// 파일추가
BoardDTO boardDTO=boardDAO.getboard(num);

//조회수 1증가
boardDAO.updateReadcount(num);
%>
		<div class="main-cont">
			<h1>명리학 이야기</h1>
			<table id="notice">
				<tr><td>글번호</td><td><%=boardDTO.getNum() %>  </td><td>글쓴날짜</td><td><%=boardDTO.getDate() %>  </td></tr>
				<tr><td>글쓴이</td><td><%=boardDTO.getName() %>  </td><td>조회수</td><td><%=boardDTO.getReadcount() %>  </td></tr>
				<tr><td>제목</td><td colspan="3"><%=boardDTO.getSubject() %></td></tr>
				<tr><td>파일</td><td colspan="3"><a href="../upload/<%=boardDTO.getFile() %>" download><%=boardDTO.getFile() %></a>
				<img src="../upload/<%=boardDTO.getFile()%>" width="300" height="300">
				</td></tr>
				<tr><td>내용</td><td colspan="3" class="cont"><%=boardDTO.getContent() %>
				
				</td></tr>
			</table>

			<div id="table_search">
				<%
					// 글수정 글삭제  => 로그인(세션값) , 글쓴이 일치하면 글수정, 글삭제 버튼이 보이게
					String id=(String)session.getAttribute("id");
					if(id!=null){
						if(id.equals("root")){
				%>
				<input type="button" value="글수정" class="btnn" 
  					onclick="location.href='gupdate.jsp?num=<%=boardDTO.getNum()%>'">
				<input type="button" value="글삭제" class="btnn" 
					onclick="next()">  
<%-- 		onclick="location.href='delete.jsp?num=<%=boardDTO.getNum()%>'">   --%>
			
				<%
						}
					}
				%>
				<script>
					function next(){
 						if(confirm("삭제하시겠습니까?"))
 						{
  							location.href="gdelete.jsp?num=<%=boardDTO.getNum()%>";
 						}
					}
				</script>
					<input type="button" value="글목록" class="btnn" 
 					 onclick="location.href='gnotice.jsp'">
			</div>
		</div>

<!-- 푸터들어가는 곳 -->
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터들어가는 곳 -->
	</div>
</body>
</html>
<%@page import="board.fBoardDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
  <meta charset="UTF-8">
  <title>reservation</title>
   <script src="join.js" defer></script> <!-- 회원가입 js파일 -->
   <script src="../main/main.js" defer></script> <!-- 헤더 js파일 -->
   <link rel="stylesheet" href="../css/main.css"> <!-- 메인 css 파일 -->
<!--    <link rel="stylesheet" href="../css/join.css"> 회원가입 css파일 -->
   <link rel="stylesheet" href="../css/board.css"> <!-- 보드 css파일 -->
   <script src="https://kit.fontawesome.com/017b0b67ba.js" crossorigin="anonymous"></script><!-- 햄버거 아이콘 -->
<!-- 폰트 -->
   <link rel="preconnect" href="https://fonts.googleapis.com">
   <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
   <link href="https://fonts.googleapis.com/css2?family=Jua&family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
   
   <script type="text/javascript">
 function fun() {
	 alert("권한이 없습니다.");
 } 
//  본인 글이 아닌 글을 읽을 경우 경고창
</script>
 </head>
 <body>
  <div id="wrap">
<!-- 헤더들어가는 곳 -->
  <jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더들어가는 곳 -->

<!-- 게시판 -->
  <%
// 패키지 board 파일이름 BoardDTO   멤버변수정의 set() get()
// 패키지 board 파일이름 BoardDAO   getBoardList()메서드 정의
// BoardDAO 객체생성
	fBoardDAO boardDAO = new fBoardDAO();
// 한페이지에 보여줄(가져올) 글개수 설정
	int pageSize=10;
// 페이지번호 가져오기
// http://localhost:8080/FunWeb1/center/notice.jsp
// http://localhost:8080/FunWeb1/center/notice.jsp?pageNum=2


	String pageNum = request.getParameter("pageNum");
	if(pageNum==null){
		pageNum="1";
	}
// 페이지번호 => 정수형 변경
	int currentPage=Integer.parseInt(pageNum);
// 시작하는 행부터10개(Mysql limit 1, 10),시직하는 행~끝나는행(oracle 11~20) 
// pageNum, pagesize => startRow 						endRow
//  1			10    =>    (1-1)*10+1 =>1					10
//  2			10	  =>   (2*1)*10+1=>11					20
//	3			10	  =>   (3-1)2*10+1=>21					30
	int startRow  = (currentPage-1)*pageSize+1;
// 끝나는 행
// startRow pageSize -> endRow
//	1		 10			1+10-1=>10
//	1		 10			11+10-1=>20
//	12		 10			21+10-1=>30
	int endRow=startRow+pageSize-1;
// 시작하는 행부터10개(Mysql limit 1,10)
// String sql="select * from board order by num desc limit 1,10";

// List boardList = getBoardList()메서드 호출
	List boardList = boardDAO.getBoardList(startRow,pageSize);
  %>


  <article style="overflow-x: auto;">
	<h1>명리학 수강신청</h1>
	<table id="notice">
	<tr><th class="tno">No.</th>
    	<th class="ttitle">제목</th>
    	<th class="twrite">글쓴이</th>
    	<th class="tdate">날짜</th>
    	<th class="tread">조회수</th></tr>
    	
   <%
   // 날짜=> 문자열 모양변경
  	 SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy.MM.dd");
   	String id=(String)session.getAttribute("id");
   
   for(int i = 0; i < boardList.size(); i++){
	   BoardDTO boardDTO = (BoardDTO)boardList.get(i);
	 if(id!=null){  // 아이디 널값이 아닐경우 아이디값을 비교 
	   if(id.equals(boardDTO.getName())||id.equals("root")){ //일치하면 본인글 읽을수있음, 관리자 아이디랑 일치하면 읽을수있음
	%>
	   <tr onclick="location.href='fcontent.jsp?num=<%=boardDTO.getNum()%>'">
	<% }else if(!id.equals((boardDTO.getName()))) { // 게시글 아이디와 일치하지 않으면 경고창 %>
		<tr onclick="fun()">
	<% }
	 
	 } // 아이디 널값확인  %>
	<td id="tnum"><%=boardDTO.getNum() %></td>
	<td id="tsub" class="left"><%=boardDTO.getSubject() %></td>
    <td id="tname"><%=boardDTO.getName() %></td>
    <td id="tdate"><%=boardDTO.getDate() %></td>
    <td id="tcount"><%=boardDTO.getReadcount() %></td></tr>	   
	   <%
   } // 게시판 뿌려주는 for문
   %> 
  </table>
  <div id="table_search">
   <form method="post" name="search" action="fsearchBbs.jsp"> 
<!--    searchBbs.jsp로 이동 -->
	 <select name="keyWord">
	  <option value="Title">제목</option>
	  <option value="Content">내용</option>
	  <option value="name">아이디</option>
	 </select>
		<input type="text" name="searchText" class="input_box">
		<input type="submit" value="검색" class="btn" >
   </form>
  </div>
  <div id="table_search">
	<%
// 세션값 가져오기
// 		String id=(String)session.getAttribute("id");
// 세션값이 있으면 글쓰기 버튼 보이기
		if(id!=null){
	%>
		<input type="button" value="글쓰기" id="btn" class="btn" 
  		onclick="location.href='fwrite.jsp'">
	<%
		}
	%>

  </div>
  <div class="clear"></div>
	<%
// 한페이지에 보여줄 페이지개수 설정
		int pageBlock=10;
// 시작하는 페이지 번호 구하기
// curentPage pageBlock => startPage
// 	1~10		10		=> (1~9)/10*10+1 =>(0)*10+1 =>  1
// 	11~20		10		=> (10~19)/10*10+1 =>(1)*10+1 =>  11
// 	21~30		10		=> (20~29)/10*10+1 =>(2)*10+1 =>  21
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
// 끝나는 페이지 번호 구하기
//startPage  pageBlock => endPage
// 	1			10	   =>	10
// 	11			10	   =>   20
// 	21			10	   =>   30 		
		int endPage=startPage+pageBlock-1;
// 전체 글개수 count => select count(*) from board
		int count=boardDAO.getBoardCount();

// 전체 페이지 개수 구하기
//전체글개수 / 한화면에 보여줄 글개수 + 나머지글 없으면 0, 있으면+1;
// 50/10 => 5페이지 +0페이지
// 55/10 => 5페이지 +1페이지
		int pageCount=count / pageSize + (count/pageSize == 0 ? 0 : 1);


// 페이지 10페이지가 안될 경우
		if(endPage > pageCount){
			endPage=pageCount;
		}


	%>

  <div id="page_control">
	<%
		if(startPage > pageBlock) {
	%>
		<a href="fnotice.jsp?pageNum=<%=startPage-pageBlock%>">Prev</a>
	<%
		}
		for(int i = startPage; i <= endPage; i++){
	%>
		<a href="fnotice.jsp?pageNum=<%=i%>"><%=i %></a>
	
	<%
		}
		if(endPage < pageCount){
	%>
		<a href="fnotice.jsp?pageNum=<%=startPage+pageBlock%>">Next</a>
	<%
		}
	%>


  </div>
 </article>
<!-- 게시판 -->
<!-- 본문들어가는 곳 -->
  <div class="clear"></div>
<!-- 푸터들어가는 곳 -->
   <jsp:include page="../inc/bottom.jsp"></jsp:include>
<!-- 푸터들어가는 곳 -->
  </div>
 </body>
</html>
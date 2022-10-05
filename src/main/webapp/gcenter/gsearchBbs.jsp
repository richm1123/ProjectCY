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
   
 </head>
 <body>
  <div id="wrap">
<!-- 헤더들어가는 곳 -->
  <jsp:include page="../inc/top.jsp"></jsp:include>
<!-- 헤더들어가는 곳 -->

<!-- 게시판 -->
  <%
  request.setCharacterEncoding("utf-8");
  String search = request.getParameter("searchText");
  String keyWord = request.getParameter("keyWord");
// 검색 값 갖고오기  
// BoardDAO 객체생성
	gBoardDAO boardDAO = new gBoardDAO();
// 한페이지에 보여줄(가져올) 글개수 설정
	int pageSize=12;
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
	List boardList = boardDAO.getBoardList1(keyWord, search,startRow,pageSize);
  %>


  <article style="overflow-x: auto;">
	<h1>명리학 이야기</h1>
	<table id="notice">
<!-- 	<tr><th class="tno">No.</th> -->
<!--     	<th class="ttitle">제목</th> -->
<!--     	<th class="twrite">글쓴이</th> -->
<!--     	<th class="tdate">날짜</th> -->
<!--     	<th class="tread">조회수</th></tr> -->
    <tr><th colspan=4> 겔러리 게시판</th></tr>	
    	
    	
    <tr> 	
   <%
   // 날짜=> 문자열 모양변경
  	 SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy.MM.dd");
   	String id=(String)session.getAttribute("id");
   
   for(int i = 0; i < boardList.size(); i++){
	   BoardDTO boardDTO = (BoardDTO)boardList.get(i);
	 %>
	<td>
	<%=i+1 %><br>
	<a href="gcontent.jsp?num=<%=boardDTO.getNum()%>" style="width:100px; height:250px;">
	<img src="../upload/<%=boardDTO.getFile()%>" style="width:250px; height:250px;"></a>
	<br>
	<%=boardDTO.getSubject() %><br>
    <%=boardDTO.getName() %><br>
    <%=dateFormat.format(boardDTO.getDate()) %>
    </td>
	   <%
	   		if((i+1)%4==0){
	   		%> </tr><tr><%
	   		}
   } // 게시판 뿌려주는 for문
   %> 
   </tr>
  </table>
  <div id="table_search">
   <form method="post" name="search" action="gsearchBbs.jsp"> 
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
		if(id=="admin"){
	%>
		<input type="button" value="글쓰기" id="btn" class="btn" 
  		onclick="location.href='gwrite.jsp'">
	<%
		}
	%>

  </div>
  <div class="clear"></div>
	<%
// 한페이지에 보여줄 페이지개수 설정
		int pageBlock=12;
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
		<a href="gnotice.jsp?pageNum=<%=startPage-pageBlock%>&searchText=<%=search%>&keyWord=<%=keyWord%>">Prev</a>
	<%
		}
		for(int i = startPage; i <= endPage; i++){
	%>
		<a href="gnotice.jsp?pageNum=<%=i%>&searchText=<%=search%>&keyWord=<%=keyWord%>"><%=i %></a>
	
	<%
		}
		if(endPage < pageCount){
	%>
		<a href="gnotice.jsp?pageNum=<%=startPage+pageBlock%>&searchText=<%=search%>&keyWord=<%=keyWord%>">Next</a>
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